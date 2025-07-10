import os, sys
import re
from optparse import OptionParser
import ROOT
import pandas as pd
import glob
import pickle
import json
from collections import OrderedDict as od

import mplhep as hep

import matplotlib.pyplot as plt
plt.style.use(hep.style.CMS)

from usefulStyle import setCanvas, drawCMS, drawEnPu, drawEnYear, formatHisto
from shanePalette import set_color_palette

def get_options():
    parser = OptionParser()
    parser.add_option("--inputSeffJsonSM", dest="inputSeffJsonSM", default='jsons_test/catsSeff_sospbfa3_ggH_CMS_hgg_mass.json', help="")
    parser.add_option("--inputSeffBSMJsonSM", dest="inputSeffBSMJsonSM", default='jsons_test/catsSeff_sospbfa3_ggH_bsm_CMS_hgg_mass.json', help="")
    parser.add_option("--inputBeffJsonSM", dest="inputBeffJsonSM", default='jsons_test/catsBeff_sospbfa3_ggH_CMS_hgg_mass.json', help="")
    parser.add_option("--inputSeffJsonBSM", dest="inputSeffJsonBSM", default='jsons_test/catsSeff_sospbfa3_ggH_bsm_CMS_hgg_mass.json', help="Group of cats")
    parser.add_option("--inputJsondataratio", dest="inputJsondataratio", default='jsons_test/catsDataRatioWeighteff_sospbfa3_ggH_CMS_hgg_mass.json', help="Extension for saving")
    parser.add_option("--inputJsonDataErrRatio", dest="inputJsonDataErrRatio", default='jsons_test/catsDataRatioWeightErr_sospbfa3_ggH_CMS_hgg_mass.json', help="Extension for saving")
    parser.add_option("--inputJsondata", dest="inputJsondata", default='jsons_test/catsDataeff_sospbfa3_ggH_CMS_hgg_mass.json', help="Extension for saving")
    parser.add_option("--inputJsonweight", dest="inputJsonweight", default='jsons_test/catsWeights_sospbfa3_ggH_CMS_hgg_mass.json', help="Extension for saving")
    parser.add_option("--inputJsonbsmweight", dest="inputJsonbsmweight", default='jsons_test/catsWeights_sospbfa3_ggH_bsm_CMS_hgg_mass.json', help="Extension for saving")
    parser.add_option("--cats", dest="cats", default='all', help="cats")
    parser.add_option("--translateCats", dest="translateCats", default='cats.json', help="JSON to store cat translations")
    parser.add_option("--out", dest="out", default='DCP', help="type of cat")
    return parser.parse_args()

(opt,args) = get_options()

import json
import numpy as np
import matplotlib.pyplot as plt

#------------------------------------------------------------------------------
# 1) Load JSON files
#------------------------------------------------------------------------------
with open(opt.inputSeffJsonSM) as f:
    S = json.load(f)     # Signal SM
with open(opt.inputSeffBSMJsonSM) as f:
    SBSM = json.load(f)  # Signal BSM
with open(opt.inputBeffJsonSM) as f:
    B = json.load(f)     # Background
with open(opt.inputJsondataratio) as f:
    D = json.load(f)     # Data ratio
with open(opt.inputJsonDataErrRatio) as f:
    D_err = json.load(f) # Data ratio error
with open(opt.inputJsondata) as f:
    D_tot = json.load(f) # Data total
with open(opt.inputJsonweight) as f:
    W = json.load(f)     # Weights
with open(opt.inputJsonbsmweight) as f:
    w = json.load(f)     # Weights BSM 
with open(opt.translateCats) as f:
    cats_latex = json.load(f)

#------------------------------------------------------------------------------
# 2) Determine categories
#------------------------------------------------------------------------------

# Determine the list of categories to be used
if opt.cats == 'all':
    categories = list(S.keys())
else:
    categories = opt.cats.split(',')

#--------------------------------------------------------------------------
# 3) Compute the per-category weighted values
#    (The weight is applied first, then we will merge the groups)
#--------------------------------------------------------------------------
signal_weighted    = [S[cat]   * W[cat] for cat in categories]
signal_bsm_weighted= [SBSM[cat]* w[cat] for cat in categories]

# Renormalize BSM yields: scale BSM to match the overall SM yield
weight2 = sum(signal_weighted) / sum(signal_bsm_weighted)
signal_bsm_weighted = [SBSM[cat]* w[cat]* weight2 for cat in categories]

data_points       = [D[cat]   for cat in categories]
data_err          = [D_err[cat] for cat in categories]
#cats_latex_labels = [cats_latex.get(cat, cat) for cat in categories]

#--------------------------------------------------------------------------
# 4) Identify and merge categories into two groups:
#       Group 1: AC_Bin0 to AC_Bin15
#       Group 2: AC_Bin16 to AC_Bin29
#--------------------------------------------------------------------------
group1_indices = []
group2_indices = []
for i, cat in enumerate(categories):
    if cat.startswith("AC_Bin"):
        bin_index = int(cat.split("AC_Bin")[1])
        if 0 <= bin_index <= 14:
            group1_indices.append(i)
        elif 15 <= bin_index <= 29:
            group2_indices.append(i)
    # For categories not starting with "AC_Bin", you can decide if they should be merged separately.

# Accumulate weighted sums for each group
g1_signal_weighted     = sum(signal_weighted[i] for i in group1_indices)
g1_signal_bsm_weighted = sum(signal_bsm_weighted[i] for i in group1_indices)
g1_data_points         = sum(data_points[i]     for i in group1_indices)
g1_data_err_sq         = sum((data_err[i])**2   for i in group1_indices)  # sum in quadrature

g2_signal_weighted     = sum(signal_weighted[i] for i in group2_indices)
g2_signal_bsm_weighted = sum(signal_bsm_weighted[i] for i in group2_indices)
g2_data_points         = sum(data_points[i]     for i in group2_indices)
g2_data_err_sq         = sum((data_err[i])**2   for i in group2_indices)

g1_data_err = np.sqrt(g1_data_err_sq)
g2_data_err = np.sqrt(g2_data_err_sq)

# Build merged arrays with 2 bins (one per group)
merged_signal_weighted     = [g1_signal_weighted, g2_signal_weighted]
merged_signal_bsm_weighted = [g1_signal_bsm_weighted, g2_signal_bsm_weighted]
merged_data_points         = [g1_data_points, g2_data_points]
merged_data_err            = [g1_data_err, g2_data_err]
merged_labels              = ["Bin0 (-1,0)","Bin1 (0,-1)"]

# Optionally, re-normalize merged BSM to match merged SM
#sum_sm  = sum(merged_signal_weighted)
#sum_bsm = sum(merged_signal_bsm_weighted)
#if sum_bsm != 0:
#    norm_factor = sum_sm / sum_bsm
#    merged_signal_bsm_weighted = [val * norm_factor for val in merged_signal_bsm_weighted]


###############################################################################
# STEP 4: Plot
###############################################################################
#fig = plt.figure(constrained_layout=True)
fig = plt.figure()
gs = fig.add_gridspec(2, 1, height_ratios=[3, 1], hspace=0)
ax = plt.subplot(gs[0])
#hep.cms.label(data=True, lumi=137.6, ax=ax, loc=0, label="Work in Progress")
hep.cms.label(data=True, lumi=137, ax=ax, loc=0)

# Plot SM (f_{a3} = 0)
ax.bar(range(len(merged_signal_weighted)), merged_signal_weighted, width=1, linewidth=1.5,
       align='center', label=r"$f_{a3}^{ggH}=0$,$f_{a3}=0$")

# Plot BSM (f_{a3} = 1) as an overlaid orange bar with transparency and thick outline
ax.bar(range(len(merged_signal_bsm_weighted)), merged_signal_bsm_weighted, width=1, linewidth=1.5,
       align='center', alpha=0.2, edgecolor='orange', color='orange')
ax.bar(range(len(merged_signal_bsm_weighted)), merged_signal_bsm_weighted, width=1, linewidth=6,
       align='center', label=r"$f_{a3}^{ggH}=1$,$f_{a3}=1$", edgecolor='orange', color='orange', facecolor='none')

# Data points with error bars
ax.scatter(range(len(merged_data_points)), merged_data_points, color='black', label="Data", zorder=3)
ax.errorbar(range(len(merged_data_points)), merged_data_points, yerr=merged_data_err, xerr=0.5,
            fmt='none', ecolor='black', capsize=5, zorder=2)

ax.set_xticks(range(len(merged_signal_weighted)))
ax.set_xticklabels([])
plt.setp(ax.get_xticklabels(), visible=False)
ax.set_ylim(0, 400)
ax.set_ylabel("Entries/Bin")
ax.legend(fontsize=15)
ax.grid(axis="y", linestyle="--", alpha=0.7)

# Ratio plot
ax_ratio = plt.subplot(gs[1], sharex=ax)
ratio_fa3_0 = np.array(merged_data_points) / np.array(merged_signal_weighted, dtype=float)
ratio_fa3_1 = np.array(merged_data_points) / np.array(merged_signal_bsm_weighted, dtype=float)
ratio_fa3_0_err = np.array(merged_data_err) / np.array(merged_signal_weighted, dtype=float)
ratio_fa3_1_err = np.array(merged_data_err) / np.array(merged_signal_bsm_weighted, dtype=float)

ax_ratio.scatter(range(len(ratio_fa3_0)), ratio_fa3_0, color='#5790fc', zorder=3)
ax_ratio.scatter(range(len(ratio_fa3_1)), ratio_fa3_1, color='#f89c20', zorder=3)
ax_ratio.errorbar(range(len(ratio_fa3_0)), ratio_fa3_0, yerr=ratio_fa3_0_err, fmt='none',
                  c='#5790fc', capsize=5, zorder=2, xerr=0.5)
ax_ratio.errorbar(range(len(ratio_fa3_1)), ratio_fa3_1, yerr=ratio_fa3_1_err, fmt='none',
                  c='#f89c20', capsize=5, zorder=2, xerr=0.5)

ax_ratio.axhline(1, color="black", linestyle="--", linewidth=1.5)
ax_ratio.set_ylabel("Data/MC")
ax_ratio.set_xlabel("$D_{CP}^{ggH}$")
ax_ratio.grid(axis="y", linestyle="--", alpha=0.7)
ax_ratio.set_xticks(range(len(merged_labels)))
#ax_ratio.set_ylim(-0.5, 1.5)
ax_ratio.set_xticklabels(merged_labels, rotation=0, fontsize=15)

plt.savefig('plots/fa3_%s_D_CP_fa3.png' % opt.out)
plt.show()

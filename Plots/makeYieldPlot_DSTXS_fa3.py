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
# 4) Identify and merge categories into three groups for D_STXS:
#       Group Bin0: categories with bin numbers 0-4 and 15-19
#       Group Bin1: categories with bin numbers 5-9 and 20-24
#       Group Bin2: categories with bin numbers 10-14 and 25-29
#--------------------------------------------------------------------------
bin0_indices = []
bin1_indices = []
bin2_indices = []
for i, cat in enumerate(categories):
    if cat.startswith("AC_Bin"):
        try:
            bin_index = int(cat.split("AC_Bin")[1])
        except:
            continue
        if (0 <= bin_index <= 4) or (15 <= bin_index <= 19):
            bin0_indices.append(i)
        elif (5 <= bin_index <= 9) or (20 <= bin_index <= 24):
            bin1_indices.append(i)
        elif (10 <= bin_index <= 14) or (25 <= bin_index <= 29):
            bin2_indices.append(i)
    # You can add conditions if your category names differ

# Accumulate the weighted sums for each group
b0_signal_weighted     = sum(signal_weighted[i] for i in bin0_indices)
b0_signal_bsm_weighted = sum(signal_bsm_weighted[i] for i in bin0_indices)
b0_data_points         = sum(data_points[i] for i in bin0_indices)
b0_data_err_sq         = sum((data_err[i])**2 for i in bin0_indices)

b1_signal_weighted     = sum(signal_weighted[i] for i in bin1_indices)
b1_signal_bsm_weighted = sum(signal_bsm_weighted[i] for i in bin1_indices)
b1_data_points         = sum(data_points[i] for i in bin1_indices)
b1_data_err_sq         = sum((data_err[i])**2 for i in bin1_indices)

b2_signal_weighted     = sum(signal_weighted[i] for i in bin2_indices)
b2_signal_bsm_weighted = sum(signal_bsm_weighted[i] for i in bin2_indices)
b2_data_points         = sum(data_points[i] for i in bin2_indices)
b2_data_err_sq         = sum((data_err[i])**2 for i in bin2_indices)

b0_data_err = np.sqrt(b0_data_err_sq)
b1_data_err = np.sqrt(b1_data_err_sq)
b2_data_err = np.sqrt(b2_data_err_sq)

merged_signal_weighted     = [b0_signal_weighted, b1_signal_weighted, b2_signal_weighted]
merged_signal_bsm_weighted = [b0_signal_bsm_weighted, b1_signal_bsm_weighted, b2_signal_bsm_weighted]
merged_data_points         = [b0_data_points, b1_data_points, b2_data_points]
merged_data_err            = [b0_data_err, b1_data_err, b2_data_err]
merged_labels              = ["Bin0 (0.75-0.90)", "Bin1 (0.90-0.975)", "Bin2 (0.975-1.0)"]

# Optionally, re-normalize merged BSM to match merged SM if needed
# sum_sm  = sum(merged_signal_weighted)
# sum_bsm = sum(merged_signal_bsm_weighted)
# if sum_bsm != 0:
#     norm_factor = sum_sm / sum_bsm
#     merged_signal_bsm_weighted = [val * norm_factor for val in merged_signal_bsm_weighted]



#--------------------------------------------------------------------------
# 5) Plotting
#--------------------------------------------------------------------------
fig = plt.figure()
gs = fig.add_gridspec(2, 1, height_ratios=[3, 1], hspace=0)
ax = plt.subplot(gs[0])
hep.cms.label(data=True, lumi=137, ax=ax, loc=0)

# Plot the SM yield (f_{a3}^{ggH}=0, f_{a3}=0)
ax.bar(range(len(merged_signal_weighted)), merged_signal_weighted, width=1, linewidth=1.5,
       align='center', label=r"$f_{a3}^{ggH}=0$, $f_{a3}=0$")

# Plot the BSM yield (f_{a3}^{ggH}=1, f_{a3}=0) as an overlaid orange bar
ax.bar(range(len(merged_signal_bsm_weighted)), merged_signal_bsm_weighted, width=1, linewidth=1.5,
       align='center', alpha=0.2, edgecolor='orange', color='orange')
ax.bar(range(len(merged_signal_bsm_weighted)), merged_signal_bsm_weighted, width=1, linewidth=6,
       align='center', label=r"$f_{a3}^{ggH}=1$, $f_{a3}=1$", edgecolor='orange', color='orange', facecolor='none')

# Plot data points with error bars
ax.scatter(range(len(merged_data_points)), merged_data_points, color='black', label="Data", zorder=3)
ax.errorbar(range(len(merged_data_points)), merged_data_points, yerr=merged_data_err, xerr=0.5,
            fmt='none', ecolor='black', capsize=5, zorder=2)

ax.set_xticks(range(len(merged_signal_weighted)))
ax.set_xticklabels([])
plt.setp(ax.get_xticklabels(), visible=False)
#ax.set_ylim(0, 400)
ax.set_ylabel("Entries/Bin")
ax.legend(fontsize=15)
ax.grid(axis="y", linestyle="--", alpha=0.7)

# Ratio plot: Data/MC
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
ax_ratio.set_xlabel("$D_{STXS}^{ggH}$")
ax_ratio.grid(axis="y", linestyle="--", alpha=0.7)
ax_ratio.set_xticks(range(len(merged_labels)))
ax_ratio.set_xticklabels(merged_labels, rotation=0, fontsize=15)
#ax_ratio.set_ylim(-0.5, 1.5)

plt.savefig('plots/fa3_%s_D_STXS_fa3.png' % opt.out)
plt.show()

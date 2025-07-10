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
    parser.add_option("--inputSeffJsonSM", dest="inputSeffJsonSM", default='jsons/catsSeff_sospbfa3_ggH_CMS_hgg_mass.json', help="")
    parser.add_option("--inputSeffBSMJsonSM", dest="inputSeffBSMJsonSM", default='jsons/catsSeff_sospbfa3_ggH_bsm_CMS_hgg_mass.json', help="")
    parser.add_option("--inputBeffJsonSM", dest="inputBeffJsonSM", default='jsons/catsBeff_sospbfa3_ggH_CMS_hgg_mass.json', help="")
    parser.add_option("--inputSeffJsonBSM", dest="inputSeffJsonBSM", default='jsons/catsSeff_sospbfa3_ggH_bsm_CMS_hgg_mass.json', help="Group of cats")
    parser.add_option("--inputJsondataratio", dest="inputJsondataratio", default='jsons/catsDataRatioWeighteff_sospbfa3_ggH_CMS_hgg_mass.json', help="Extension for saving")
    parser.add_option("--inputJsonDataErrRatio", dest="inputJsonDataErrRatio", default='jsons/catsDataRatioWeightErr_sospbfa3_ggH_CMS_hgg_mass.json', help="Extension for saving")
    parser.add_option("--inputJsondata", dest="inputJsondata", default='jsons/catsDataeff_sospbfa3_ggH_CMS_hgg_mass.json', help="Extension for saving")
    parser.add_option("--inputJsonweight", dest="inputJsonweight", default='jsons/catsWeights_sospbfa3_ggH_CMS_hgg_mass.json', help="Extension for saving")
    parser.add_option("--inputJsonbsmweight", dest="inputJsonbsmweight", default='jsons/catsWeights_sospbfa3_ggH_bsm_CMS_hgg_mass.json', help="Extension for saving")
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

if opt.cats == 'all':
    all_cats = list(S.keys())
else:
    all_cats = opt.cats.split(',')

#------------------------------------------------------------------------------
# 3) Define two groups to merge:
#       Group 1 = AC_Bin0..AC_Bin15
#       Group 2 = AC_Bin16..AC_Bin29
#------------------------------------------------------------------------------
group1 = []
group2 = []
for cat in all_cats:
    if cat.startswith("AC_Bin"):
        bin_index = int(cat.split("AC_Bin")[1])
        if 0 <= bin_index <= 14:
            group1.append(cat)
        elif 15 <= bin_index <= 29:
            group2.append(cat)
    else:
        # If you have other categories that you do not want to merge,
        # handle them here or ignore them.
        pass

#------------------------------------------------------------------------------
# 4) Helper functions
#------------------------------------------------------------------------------
def sum_group_weighted(signal_dict, weight_dict, group):
    """
    For each category in 'group', multiply signal_dict[cat] by weight_dict[cat]
    and sum the result. This effectively "weights first, then merges".
    """
    total = 0.0
    for cat in group:
        if cat in signal_dict and cat in weight_dict:
            total += signal_dict[cat] * weight_dict[cat]
    return total

def sum_group_errors(data_err_dict, weight_dict, group):
    """
    If you also want to weight the data errors individually, do so here.
    For example, combining them in quadrature after weighting each category:
      Weighted error for each cat = data_err_dict[cat]*weight_dict[cat]
      Then sum in quadrature over all cats in the group.
    """
    err2 = 0.0
    for cat in group:
        if cat in data_err_dict and cat in weight_dict:
            # Weighted error for this cat
            w_err = data_err_dict[cat] * weight_dict[cat]
            err2 += w_err**2
    return np.sqrt(err2)

def sum_group_data(data_dict, weight_dict, group, do_weight=False):
    """
    If you want to weight data as well, set do_weight=True.
    Otherwise, you can keep data unweighted.
    """
    total = 0.0
    for cat in group:
        if cat in data_dict:
            if do_weight and cat in weight_dict:
                total += data_dict[cat] * weight_dict[cat]
            else:
                total += data_dict[cat]
    return total


#------------------------------------------------------------------------------
# 5) Merge the two groups AFTER weighting each category
#------------------------------------------------------------------------------
S_merged = []
SBSM_merged = []
B_merged = []
D_merged = []
D_err_merged = []
W_merged = []  # If you need a "merged weight" at all
D_tot_merged = []

# Group 1 sums
g1_signal_weighted     = sum_group_weighted(S,    W, group1)
g1_signal_bsm_weighted = sum_group_weighted(SBSM, w, group1)
g1_bkg_weighted        = sum_group_weighted(B,    W, group1)
g1_data                = sum_group_data(D,        W, group1, do_weight=False)
g1_data_err            = sum_group_errors(D_err,  W, group1)  # Weighted error if needed
g1_data_tot            = sum_group_data(D_tot,    W, group1, do_weight=False)

# For demonstration, we define a "merged weight" for group1
# (though typically you'd just store the sum of weights or average, etc.)
g1_weight = sum(W[cat] for cat in group1 if cat in W)

S_merged.append(g1_signal_weighted)
SBSM_merged.append(g1_signal_bsm_weighted)
B_merged.append(g1_bkg_weighted)
D_merged.append(g1_data)
D_err_merged.append(g1_data_err)
D_tot_merged.append(g1_data_tot)
W_merged.append(g1_weight)

# Group 2 sums
g2_signal_weighted     = sum_group_weighted(S,    W, group2)
g2_signal_bsm_weighted = sum_group_weighted(SBSM, w, group2)
g2_bkg_weighted        = sum_group_weighted(B,    W, group2)
g2_data                = sum_group_data(D,        W, group2, do_weight=False)
g2_data_err            = sum_group_errors(D_err,  W, group2)
g2_data_tot            = sum_group_data(D_tot,    W, group2, do_weight=False)
g2_weight = sum(W[cat] for cat in group2 if cat in W)

S_merged.append(g2_signal_weighted)
SBSM_merged.append(g2_signal_bsm_weighted)
B_merged.append(g2_bkg_weighted)
D_merged.append(g2_data)
D_err_merged.append(g2_data_err)
D_tot_merged.append(g2_data_tot)
W_merged.append(g2_weight)

# Labels for the 2 merged bins
#cats_merged_latex.append(r'$D_{CP}^{ggH}{}{\mathrm{(0 to -1)}}$')

cats_merged_latex = [r"AC\_Bin0--15", r"AC\_Bin16--29"]

#------------------------------------------------------------------------------
# 6) Optionally re-normalize fa3=1 to match total integral of fa3=0
#------------------------------------------------------------------------------
signal_weighted = list(S_merged)
signal_bsm_weighted = list(SBSM_merged)

# The factor that scales the total BSM to match the total SM
if sum(signal_bsm_weighted) != 0.0:
    weight2 = sum(signal_weighted) / sum(signal_bsm_weighted)
else:
    weight2 = 1.0

signal_bsm_weighted = [val * weight2 for val in signal_bsm_weighted]

# Data
data_points = list(D_merged)
data_err = list(D_err_merged)


###############################################################################
# STEP 4: Plot
###############################################################################
#fig = plt.figure(constrained_layout=True)
fig = plt.figure()
gs = fig.add_gridspec(2, 1, height_ratios=[3, 1], hspace=0)
ax = plt.subplot(gs[0])
#hep.cms.label(data=True, lumi=137.6, ax=ax, loc=0, label="Work in Progress")
hep.cms.label(data=True, lumi=137, ax=ax, loc=0)

# Bar for f_{a3} = 0
ax.bar(
    range(len(signal_weighted)),
    signal_weighted,
    width=1.0,
    linewidth=1.5,
    align='center',
    label=r"$f_{a3}^{ggH}=0$"
)

# Bar for f_{a3} = 1 (with alpha=0.2 fill, thick orange outline)
ax.bar(
    range(len(signal_bsm_weighted)),
    signal_bsm_weighted,
    width=1.0,
    linewidth=1.5,
    align='center',
    alpha=0.2,
    edgecolor='orange',
    color='orange'
)

ax.bar(
    range(len(signal_bsm_weighted)),
    signal_bsm_weighted,
    width=1.0,
    linewidth=6,
    align='center',
    label=r"$f_{a3}^{ggH}=1$",
    edgecolor='orange',
    color='orange',
    facecolor='none'
)

# Data points
ax.scatter(
    range(len(data_points)),
    data_points,
    color='black',
    label="Data",
    zorder=3
)
ax.errorbar(
    range(len(data_points)),
    data_points,
    yerr=data_err,
    xerr=0.5,
    fmt='none',
    ecolor='black',
    capsize=5,
    zorder=2
)

ax.set_xticks(range(len(signal_weighted)))
ax.set_xticklabels([])
plt.setp(ax.get_xticklabels(), visible=False)
#ax.set_yscale('log')
#ax.set_ylim(1, 1e5)
ax.set_ylabel("Entries/Bin")
ax.legend(fontsize=15)
ax.grid(axis="y", linestyle="--", alpha=0.7)

# Ratio plot
ax_ratio = plt.subplot(gs[1], sharex=ax)
ratio_fa3_0 = np.array(data_points) / np.array(signal_weighted)
ratio_fa3_1 = np.array(data_points) / np.array(signal_bsm_weighted)
ratio_fa3_0_err = np.array(data_err) / np.array(signal_weighted)
ratio_fa3_1_err = np.array(data_err) / np.array(signal_bsm_weighted)

ax_ratio.scatter(range(len(ratio_fa3_0)), ratio_fa3_0, color='#5790fc', zorder=3)
ax_ratio.scatter(range(len(ratio_fa3_1)), ratio_fa3_1, color='#f89c20', zorder=3)
ax_ratio.errorbar(range(len(ratio_fa3_0)), ratio_fa3_0, yerr=ratio_fa3_0_err, fmt='none', c='#5790fc', capsize=5, zorder=2, xerr=0.5)
ax_ratio.errorbar(range(len(ratio_fa3_1)), ratio_fa3_1, yerr=ratio_fa3_1_err, fmt='none', c='#f89c20', capsize=5, zorder=2, xerr=0.5)


ax_ratio.axhline(1.0, color="black", linestyle="--", linewidth=1.5)
#ax_ratio.set_ylim(0, 1)
ax_ratio.set_ylabel("Data/MC")
ax_ratio.set_xlabel(r'$D_{CP}^{ggH}$')
ax_ratio.grid(axis="y", linestyle="--", alpha=0.7)

ax_ratio.set_xticks(range(len(cats_merged_latex)))
ax_ratio.set_xticklabels(cats_merged_latex, rotation=0, fontsize=15)

plt.savefig('plots/fa3_%s_D_CP.png' % opt.out)
plt.show()

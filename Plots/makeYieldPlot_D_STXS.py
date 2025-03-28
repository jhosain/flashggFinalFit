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
    parser.add_option("--inputSeffBSMJsonSM", dest="inputSeffBSMJsonSM", default='jsons/catsSeff_sospbfa3_ggH_1_CMS_hgg_mass.json', help="")
    parser.add_option("--inputBeffJsonSM", dest="inputBeffJsonSM", default='jsons/catsBeff_sospbfa3_ggH_CMS_hgg_mass.json', help="")
    parser.add_option("--inputSeffJsonBSM", dest="inputSeffJsonBSM", default='jsons/catsSeff_sospbfa3_ggH_1_CMS_hgg_mass.json', help="Group of cats")
    parser.add_option("--inputJsondataratio", dest="inputJsondataratio", default='jsons/catsDataRatioWeighteff_sospbfa3_ggH_CMS_hgg_mass.json', help="Extension for saving")
    parser.add_option("--inputJsonDataErrRatio", dest="inputJsonDataErrRatio", default='jsons/catsDataRatioWeightErr_sospbfa3_ggH_CMS_hgg_mass.json', help="Extension for saving")
    parser.add_option("--inputJsondata", dest="inputJsondata", default='jsons/catsDataeff_sospbfa3_ggH_CMS_hgg_mass.json', help="Extension for saving")
    parser.add_option("--inputJsonweight", dest="inputJsonweight", default='jsons/catsWeights_sospbfa3_ggH_CMS_hgg_mass.json', help="Extension for saving")
    parser.add_option("--cats", dest="cats", default='all', help="cats")
    parser.add_option("--translateCats", dest="translateCats", default='cats.json', help="JSON to store cat translations")
    parser.add_option("--out", dest="out", default='VBF', help="type of cat")
    return parser.parse_args()

(opt,args) = get_options()

import json
import numpy as np
import matplotlib.pyplot as plt

# Load the JSON files
with open(opt.inputSeffJsonSM) as f:
    S = json.load(f)

with open(opt.inputSeffBSMJsonSM) as f:
    SBSM = json.load(f)

with open(opt.inputBeffJsonSM) as f:
    B = json.load(f)

with open(opt.inputJsondataratio) as f:
    D = json.load(f)

with open(opt.inputJsonDataErrRatio) as f:
    D_err = json.load(f)

with open(opt.inputJsondata) as f:
    D_tot = json.load(f)

with open(opt.inputJsonweight) as f:
    W = json.load(f)

with open(opt.translateCats) as f:
    cats_latex = json.load(f)

# If user hasn't specified categories, use all
if opt.cats == 'all':
    all_cats = list(S.keys())
else:
    all_cats = opt.cats.split(',')

###############################################################################
# STEP 1: Define the three groups we want to merge
#    Bin0: (0-4, 15-19)
#    Bin1: (5-9, 20-24)
#    Bin2: (10-14, 25-29)
###############################################################################
group0 = []
group1 = []
group2 = []

for cat in all_cats:
    if cat.startswith("AC_Bin"):
        bin_index = int(cat.split("AC_Bin")[1])
        # Bin0
        if (0 <= bin_index <= 4) or (15 <= bin_index <= 19):
            group0.append(cat)
        # Bin1
    elif (5 <= bin_index <= 9) or (20 <= bin_index <= 24):
            group1.append(cat)
        # Bin2
    elif (10 <= bin_index <= 14) or (25 <= bin_index <= 29):
            group2.append(cat)
    else:
        # If there are non-AC_Bin categories you want to handle differently, do so here
        pass


###############################################################################
# STEP 2: Sum up the relevant quantities in each group
###############################################################################
def sum_group(dictionary, group):
    """Utility function to sum dictionary values over a list of keys (group)."""
    return sum(dictionary[g] for g in group if g in dictionary)

def sum_errors_in_quadrature(err_dict, group):
    """Sum errors in quadrature across categories in the group."""
    return np.sqrt(sum((err_dict[g])**2 for g in group if g in err_dict))

# We'll create arrays of length 3, one entry per merged bin
S_merged     = []
SBSM_merged  = []
B_merged     = []
D_merged     = []
D_err_merged = []
W_merged     = []
D_tot_merged = []

# Merge group0
S_merged.append( sum_group(S, group0) )
SBSM_merged.append( sum_group(SBSM, group0) )
B_merged.append( sum_group(B, group0) )
D_merged.append( sum_group(D, group0) )
D_err_merged.append( sum_errors_in_quadrature(D_err, group0) )
W_merged.append( sum_group(W, group0) )
D_tot_merged.append( sum_group(D_tot, group0) )

# Merge group1
S_merged.append( sum_group(S, group1) )
SBSM_merged.append( sum_group(SBSM, group1) )
B_merged.append( sum_group(B, group1) )
D_merged.append( sum_group(D, group1) )
D_err_merged.append( sum_errors_in_quadrature(D_err, group1) )
W_merged.append( sum_group(W, group1) )
D_tot_merged.append( sum_group(D_tot, group1) )

# Merge group2
S_merged.append( sum_group(S, group2) )
SBSM_merged.append( sum_group(SBSM, group2) )
B_merged.append( sum_group(B, group2) )
D_merged.append( sum_group(D, group2) )
D_err_merged.append( sum_errors_in_quadrature(D_err, group2) )
W_merged.append( sum_group(W, group2) )
D_tot_merged.append( sum_group(D_tot, group2) )


###############################################################################
# STEP 3: Create labels for the merged categories
###############################################################################
cats_merged_latex = [
    r"D\_STXS Bin0 (0-4,15-19)",
    r"D\_STXS Bin1 (5-9,20-24)",
    r"D\_STXS Bin2 (10-14,25-29)"
]

###############################################################################
# STEP 4: Compute weighted signal and BSM, plus data/MC ratios
###############################################################################
# Weighted signals
signal_weighted = [S_merged[i] * W_merged[i] for i in range(len(S_merged))]
signal_bsm_weighted = [SBSM_merged[i] * W_merged[i] for i in range(len(SBSM_merged))]

# Optional: normalize f_{a3}=1 to have the same total as f_{a3}=0
weight2 = sum(signal_weighted) / sum(signal_bsm_weighted) if sum(signal_bsm_weighted)!=0 else 1.0
signal_bsm_weighted = [x * weight2 for x in signal_bsm_weighted]

# Data
data_points = [D_merged[i] for i in range(len(D_merged))]
data_err = [D_err_merged[i] for i in range(len(D_err_merged))]


###############################################################################
# STEP 5: Plot
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
ax.set_yscale('log')
ax.set_ylim(1, 1e5)
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

#ax_ratio.axhline(0.5, color="black", linestyle="--", linewidth=1.5)
ax_ratio.axhline(0, color="black", linestyle="--", linewidth=1.5)
ax_ratio.set_ylim(-0.5, 0.5)
ax_ratio.set_ylabel("Data/MC")
ax_ratio.set_xlabel(r'$D_{CP}^{ggH}$')
ax_ratio.grid(axis="y", linestyle="--", alpha=0.7)

ax_ratio.set_xticks(range(len(cats_merged_latex)))
ax_ratio.set_xticklabels(cats_merged_latex, rotation=0, fontsize=15)

plt.savefig('plots/fa3_%s_D_STXS.png' % opt.out)
plt.show()

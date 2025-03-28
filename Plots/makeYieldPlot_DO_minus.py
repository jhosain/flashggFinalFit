import os, sys, re
from optparse import OptionParser
import ROOT
import pandas as pd
import glob
import pickle
import json
from collections import OrderedDict as od

import mplhep as hep
import matplotlib.pyplot as plt
import numpy as np

# Use CMS style for plots
plt.style.use(hep.style.CMS)

from usefulStyle import setCanvas, drawCMS, drawEnPu, drawEnYear, formatHisto
from shanePalette import set_color_palette

def get_options():
    parser = OptionParser()
    parser.add_option("--inputSeffJsonSM", dest="inputSeffJsonSM", 
                      default='jsons/catsSeff_sospbfa3_ggH_CMS_hgg_mass.json', help="")
    parser.add_option("--inputSeffBSMJsonSM", dest="inputSeffBSMJsonSM", 
                      default='jsons/catsSeff_sospbfa3_ggH_bsm_CMS_hgg_mass.json', help="")
    parser.add_option("--inputSeffBSMMIXJsonSM", dest="inputSeffBSMMIXJsonSM", default='jsons/catsSeff_sospbfa3_ggH_bsmmix_CMS_hgg_mass.json', help="")
    parser.add_option("--inputBeffJsonSM", dest="inputBeffJsonSM", 
                      default='jsons/catsBeff_sospbfa3_ggH_CMS_hgg_mass.json', help="")
    parser.add_option("--inputSeffJsonBSM", dest="inputSeffJsonBSM", 
                      default='jsons/catsSeff_sospbfa3_ggH_bsm_CMS_hgg_mass.json', help="Group of cats")
    parser.add_option("--inputJsondataratio", dest="inputJsondataratio", 
                      default='jsons/catsDataRatioWeighteff_sospbfa3_ggH_CMS_hgg_mass.json', help="Extension for saving")
    parser.add_option("--inputJsonDataErrRatio", dest="inputJsonDataErrRatio", 
                      default='jsons/catsDataRatioWeightErr_sospbfa3_ggH_CMS_hgg_mass.json', help="Extension for saving")
    parser.add_option("--inputJsondata", dest="inputJsondata", 
                      default='jsons/catsDataeff_sospbfa3_ggH_CMS_hgg_mass.json', help="Extension for saving")
    parser.add_option("--inputJsonweight", dest="inputJsonweight", 
                      default='jsons/catsWeights_sospbfa3_ggH_CMS_hgg_mass.json', help="Extension for saving")
    parser.add_option("--inputJsonbsmweight", dest="inputJsonbsmweight", 
                      default='jsons/catsWeights_sospbfa3_ggH_bsm_CMS_hgg_mass.json', help="Extension for saving")
    parser.add_option("--cats", dest="cats", default='all', help="cats")
    parser.add_option("--translateCats", dest="translateCats", 
                      default='cats.json', help="JSON to store cat translations")
    parser.add_option("--out", dest="out", default='D0', help="type of cat")
    return parser.parse_args()

(opt, args) = get_options()

#------------------------------------------------------------------------------
# 1) Load JSON files
#------------------------------------------------------------------------------
with open(opt.inputSeffJsonSM) as f:
    S = json.load(f)     # Signal SM
with open(opt.inputSeffBSMJsonSM) as f:
    SBSM = json.load(f)  # Signal BSM
with open(opt.inputSeffBSMMIXJsonSM) as f:
    SBSMMIX = json.load(f)  # Signal MIX
with open(opt.inputBeffJsonSM) as f:
    B = json.load(f)     # Background
with open(opt.inputJsondataratio) as f:
    D = json.load(f)     # Data ratio
with open(opt.inputJsonDataErrRatio) as f:
    D_err = json.load(f) # Data ratio error
with open(opt.inputJsondata) as f:
    D_tot = json.load(f) # Data total
with open(opt.inputJsonweight) as f:
    W = json.load(f)     # Weights for SM
with open(opt.inputJsonbsmweight) as f:
    w = json.load(f)     # Weights for BSM 
with open(opt.translateCats) as f:
    cats_latex = json.load(f)

#------------------------------------------------------------------------------
# 2) Determine categories
#------------------------------------------------------------------------------
if opt.cats == 'all':
    categories = list(S.keys())
else:
    categories = opt.cats.split(',')

#--------------------------------------------------------------------------
# 3) Compute the per-category weighted values
#    (Apply the weights first, then we will merge the groups)
#--------------------------------------------------------------------------
signal_weighted    = [S[cat] * W[cat] for cat in categories]
signal_bsm_weighted= [SBSM[cat] * W[cat] for cat in categories]
signal_bsmmix_weighted= [SBSMMIX[cat]* W[cat] for cat in categories]
# Renormalize BSM: scale BSM yields so that the overall sum matches the SM yield
weight2 = sum(signal_weighted) / sum(signal_bsm_weighted)
signal_bsm_weighted = [SBSM[cat] * W[cat] * weight2 for cat in categories]
signal_bsmmix_weighted = [SBSMMIX[cat]* W[cat]* weight2 for cat in categories]

data_points = [D[cat] for cat in categories]
data_err    = [D_err[cat] for cat in categories]

#--------------------------------------------------------------------------
# 4) Identify and merge categories into five bins for D_0:
#       Bin0: categories with indices 0,5,10,15,20,25
#       Bin1: categories with indices 1,6,11,16,21,26
#       Bin2: categories with indices 2,7,12,17,22,27
#       Bin3: categories with indices 3,8,13,18,23,28
#       Bin4: categories with indices 4,9,14,19,24,29
#--------------------------------------------------------------------------

# Create five lists for indices
bin0_indices = []
bin1_indices = []
bin2_indices = []
bin3_indices = []
bin4_indices = []

for i, cat in enumerate(categories):
    if cat.startswith("AC_Bin"):
        try:
            bin_index = int(cat.split("AC_Bin")[1])
        except:
            continue
        mod_val = bin_index % 5
        if mod_val == 0:
            bin0_indices.append(i)
        elif mod_val == 1:
            bin1_indices.append(i)
        elif mod_val == 2:
            bin2_indices.append(i)
        elif mod_val == 3:
            bin3_indices.append(i)
        elif mod_val == 4:
            bin4_indices.append(i)
    # If your category names differ, adjust accordingly.

# Accumulate the weighted sums for each bin
b0_signal_weighted     = sum(signal_weighted[i] for i in bin0_indices)
b0_signal_bsm_weighted = sum(signal_bsm_weighted[i] for i in bin0_indices)
b0_signal_bsmmix_weighted = sum(signal_bsmmix_weighted[i] for i in bin0_indices)
b0_data_points         = sum(data_points[i] for i in bin0_indices)
b0_data_err_sq         = sum((data_err[i])**2 for i in bin0_indices)

b1_signal_weighted     = sum(signal_weighted[i] for i in bin1_indices)
b1_signal_bsm_weighted = sum(signal_bsm_weighted[i] for i in bin1_indices)
b1_signal_bsmmix_weighted = sum(signal_bsmmix_weighted[i] for i in bin1_indices)
b1_data_points         = sum(data_points[i] for i in bin1_indices)
b1_data_err_sq         = sum((data_err[i])**2 for i in bin1_indices)

b2_signal_weighted     = sum(signal_weighted[i] for i in bin2_indices)
b2_signal_bsm_weighted = sum(signal_bsm_weighted[i] for i in bin2_indices)
b2_signal_bsmmix_weighted = sum(signal_bsmmix_weighted[i] for i in bin2_indices)
b2_data_points         = sum(data_points[i] for i in bin2_indices)
b2_data_err_sq         = sum((data_err[i])**2 for i in bin2_indices)

b3_signal_weighted     = sum(signal_weighted[i] for i in bin3_indices)
b3_signal_bsm_weighted = sum(signal_bsm_weighted[i] for i in bin3_indices)
b3_signal_bsmmix_weighted = sum(signal_bsmmix_weighted[i] for i in bin3_indices)
b3_data_points         = sum(data_points[i] for i in bin3_indices)
b3_data_err_sq         = sum((data_err[i])**2 for i in bin3_indices)

b4_signal_weighted     = sum(signal_weighted[i] for i in bin4_indices)
b4_signal_bsm_weighted = sum(signal_bsm_weighted[i] for i in bin4_indices)
b4_signal_bsmmix_weighted = sum(signal_bsmmix_weighted[i] for i in bin4_indices)
b4_data_points         = sum(data_points[i] for i in bin4_indices)
b4_data_err_sq         = sum((data_err[i])**2 for i in bin4_indices)

b0_data_err = np.sqrt(b0_data_err_sq)
b1_data_err = np.sqrt(b1_data_err_sq)
b2_data_err = np.sqrt(b2_data_err_sq)
b3_data_err = np.sqrt(b3_data_err_sq)
b4_data_err = np.sqrt(b4_data_err_sq)

merged_signal_weighted     = [b0_signal_weighted, b1_signal_weighted, b2_signal_weighted, b3_signal_weighted, b4_signal_weighted]
merged_signal_bsm_weighted = [b0_signal_bsm_weighted, b1_signal_bsm_weighted, b2_signal_bsm_weighted, b3_signal_bsm_weighted, b4_signal_bsm_weighted]
merged_signal_bsmmix_weighted = [b0_signal_bsmmix_weighted,b1_signal_bsmmix_weighted, b2_signal_bsmmix_weighted, b3_signal_bsmmix_weighted,b4_signal_bsmmix_weighted] 
merged_data_points         = [b0_data_points, b1_data_points, b2_data_points, b3_data_points, b4_data_points]
merged_data_err            = [b0_data_err, b1_data_err, b2_data_err, b3_data_err, b4_data_err]
merged_labels              = ["Bin0 (0.0-0.20)", 
                              "Bin1 (0.20-0.35)",
                              "Bin2 (0.35-0.65)",
                              "Bin3 (0.65-0.80)",
                              "Bin4 (0.80-1.0)"]

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

# Plot SM (f_{a3}^{ggH}=0, f_{a3}=0)
ax.bar(range(len(merged_signal_weighted)), merged_signal_weighted, width=1, linewidth=1.5,
       align='center', label=r"$f_{a3}^{ggH}=0$, $f_{a3}=0$")
# Plot BSM (f_{a3} = 1) as an overlaid orange bar with transparency and thick outline                                                         
#ax.bar(range(len(merged_signal_bsm_weighted)), merged_signal_bsm_weighted, width=1, linewidth=1.0,
       #align='center', alpha=0.2, edgecolor='orange', color='orange')
ax.bar(range(len(merged_signal_bsmmix_weighted)), merged_signal_bsmmix_weighted, width=1, linewidth=3.0,
       align='center', label=r"$f_{a3}^{ggH}=0.5$,$f_{a3}=0$", edgecolor='red', color='red', facecolor='none')

# Plot BSM (f_{a3}^{ggH}=1, f_{a3}=0) as an overlaid orange bar
ax.bar(range(len(merged_signal_bsm_weighted)), merged_signal_bsm_weighted, width=1, linewidth=3,
       align='center', label=r"$f_{a3}^{ggH}=1$, $f_{a3}=0$", edgecolor='orange', color='orange', facecolor='none')

# Plot data points with error bars
ax.scatter(range(len(merged_data_points)), merged_data_points, color='black', label="Data", zorder=3)
ax.errorbar(range(len(merged_data_points)), merged_data_points, yerr=merged_data_err, xerr=0.5,
            fmt='none', ecolor='black', capsize=5, zorder=2)

ax.set_xticks(range(len(merged_signal_weighted)))
ax.set_xticklabels([])
plt.setp(ax.get_xticklabels(), visible=False)
#ax.set_ylim(0, 400)
ax.set_ylabel("S/(S+B) Weighted Events/Bin",fontsize=18)
ax.legend(fontsize=15)
ax.grid(axis="y", linestyle="--", alpha=0.7)

# Ratio plot: Data/MC
ax_ratio = plt.subplot(gs[1], sharex=ax)
ratio_fa3_0 = np.array(merged_data_points) / np.array(merged_signal_weighted, dtype=float)  # Data/SM
#ratio_fa3_1 = np.array(merged_data_points) / np.array(merged_signal_bsm_weighted, dtype=float) #Data/BSM
ratio_fa3_1 = np.array(merged_signal_bsm_weighted) / np.array(merged_signal_weighted, dtype=float) #SM/BSM
#ratio_fa3_2 = np.array(merged_data_points) / np.array(merged_signal_bsmmix_weighted, dtype=float) #Data/BSM_Mix
ratio_fa3_2 = np.array(merged_signal_bsmmix_weighted) / np.array(merged_signal_weighted, dtype=float) #SM/BSM_Mix

ratio_fa3_0_err = np.array(merged_data_err) / np.array(merged_signal_weighted, dtype=float)
#ratio_fa3_1_err = np.array(merged_data_err) / np.array(merged_signal_bsm_weighted, dtype=float)
#ratio_fa3_2_err = np.array(merged_data_err) / np.array(merged_signal_bsmmix_weighted, dtype=float)


ax_ratio.scatter(range(len(ratio_fa3_0)), ratio_fa3_0, color='black', zorder=3)
ax_ratio.scatter(range(len(ratio_fa3_1)), ratio_fa3_1, color='#f89c20', zorder=3)
ax_ratio.scatter(range(len(ratio_fa3_2)), ratio_fa3_2, color='#d62728', zorder=3)

ax_ratio.errorbar(range(len(ratio_fa3_0)), ratio_fa3_0, yerr=ratio_fa3_0_err, fmt='none',
                  c='black', capsize=5, zorder=2, xerr=0.5)
#ax_ratio.errorbar(range(len(ratio_fa3_1)), ratio_fa3_1, yerr=ratio_fa3_1_err, fmt='none',
                  #c='#f89c20', capsize=5, zorder=2, xerr=0.5)
#ax_ratio.errorbar(range(len(ratio_fa3_2)), ratio_fa3_2, yerr=ratio_fa3_2_err, fmt='none',
                  #c='#d62728', capsize=5, zorder=2, xerr=0.5)

ax_ratio.axhline(1, color="black", linestyle="--", linewidth=1.5)
ax_ratio.set_ylabel("(Data or MC)/SM",fontsize=18)
ax_ratio.set_xlabel("$D_{0^{-}}^{ggH}$",fontsize=18)
ax_ratio.grid(axis="y", linestyle="--", alpha=0.7)
ax_ratio.set_xticks(range(len(merged_labels)))
ax_ratio.set_xticklabels(merged_labels, rotation=0, fontsize=12)
#ax_ratio.set_ylim(-0.5, 1.5)

plt.savefig('plots_stage03/fa3_%s_D0_minus.png' % opt.out)
plt.show()

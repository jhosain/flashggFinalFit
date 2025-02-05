#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <cmath>
#include <TString.h>
#include <TROOT.h>

void CalculateTotals(const char* year) {
    // Construct the file name
    std::string fileName = std::string("bin_table_") + year + ".txt";

    // Open the input file
    std::ifstream inputFile(fileName.c_str());
    if (!inputFile.is_open()) {
        std::cerr << "Error: Unable to open file: " << fileName << std::endl;
        return;
    }

    // Open the output file
    std::ofstream outputFile("output_table_" + std::string(year) + ".tex");
    if (!outputFile.is_open()) {
        std::cerr << "Error: Unable to create output file." << std::endl;
        return;
    }

    // Write the LaTeX table header
    outputFile << "\\begin{tabular}{|c|c|c|c|c|c|c|}\\hline" << std::endl;
    outputFile << "Bin & ggH SM Yield & ggH MIX Yield & ggH BSM Yield & VBF SM Yield & VBF MIX Yield & VBF BSM Yield \\\\ \\hline" << std::endl;

    // Variables to store totals and errors
    double ggH_SM_Total = 0.0, ggH_SM_Error = 0.0;
    double ggH_MIX_Total = 0.0, ggH_MIX_Error = 0.0;
    double ggH_BSM_Total = 0.0, ggH_BSM_Error = 0.0;
    double VBF_SM_Total = 0.0, VBF_SM_Error = 0.0;
    double VBF_MIX_Total = 0.0, VBF_MIX_Error = 0.0;
    double VBF_BSM_Total = 0.0, VBF_BSM_Error = 0.0;

    // Read the data line by line
    std::string line;
    while (std::getline(inputFile, line)) {
        std::istringstream ss(line);
        std::string bin;
        std::string ggH_SM, ggH_MIX, ggH_BSM, VBF_SM, VBF_MIX, VBF_BSM;

        // Read each column
        ss >> bin >> ggH_SM >> ggH_MIX >> ggH_BSM >> VBF_SM >> VBF_MIX >> VBF_BSM;

        auto parseValueAndError = [](const std::string& entry, double& value, double& error) {
            size_t pos = entry.find("\u00b1");
            if (pos != std::string::npos) {
                try {
                    value = std::stod(entry.substr(0, pos));
                    error = std::stod(entry.substr(pos + 2));
                } catch (const std::exception& e) {
                    std::cerr << "Error parsing entry: " << entry << " - " << e.what() << std::endl;
                    value = 0.0;
                    error = 0.0;
                }
            } else {
                std::cerr << "Missing \u00b1 delimiter in entry: " << entry << std::endl;
                value = 0.0;
                error = 0.0;
            }
        };

        double ggH_SM_Value = 0.0, ggH_SM_Err = 0.0;
        double ggH_MIX_Value = 0.0, ggH_MIX_Err = 0.0;
        double ggH_BSM_Value = 0.0, ggH_BSM_Err = 0.0;
        double VBF_SM_Value = 0.0, VBF_SM_Err = 0.0;
        double VBF_MIX_Value = 0.0, VBF_MIX_Err = 0.0;
        double VBF_BSM_Value = 0.0, VBF_BSM_Err = 0.0;

        // Extract values and errors
        parseValueAndError(ggH_SM, ggH_SM_Value, ggH_SM_Err);
        parseValueAndError(ggH_MIX, ggH_MIX_Value, ggH_MIX_Err);
        parseValueAndError(ggH_BSM, ggH_BSM_Value, ggH_BSM_Err);
        parseValueAndError(VBF_SM, VBF_SM_Value, VBF_SM_Err);
        parseValueAndError(VBF_MIX, VBF_MIX_Value, VBF_MIX_Err);
        parseValueAndError(VBF_BSM, VBF_BSM_Value, VBF_BSM_Err);

        // Update totals
        ggH_SM_Total += ggH_SM_Value;
        ggH_SM_Error = std::sqrt(ggH_SM_Error * ggH_SM_Error + ggH_SM_Err * ggH_SM_Err);
        ggH_MIX_Total += ggH_MIX_Value;
        ggH_MIX_Error = std::sqrt(ggH_MIX_Error * ggH_MIX_Error + ggH_MIX_Err * ggH_MIX_Err);
        ggH_BSM_Total += ggH_BSM_Value;
        ggH_BSM_Error = std::sqrt(ggH_BSM_Error * ggH_BSM_Error + ggH_BSM_Err * ggH_BSM_Err);
        VBF_SM_Total += VBF_SM_Value;
        VBF_SM_Error = std::sqrt(VBF_SM_Error * VBF_SM_Error + VBF_SM_Err * VBF_SM_Err);
        VBF_MIX_Total += VBF_MIX_Value;
        VBF_MIX_Error = std::sqrt(VBF_MIX_Error * VBF_MIX_Error + VBF_MIX_Err * VBF_MIX_Err);
        VBF_BSM_Total += VBF_BSM_Value;
        VBF_BSM_Error = std::sqrt(VBF_BSM_Error * VBF_BSM_Error + VBF_BSM_Err * VBF_BSM_Err);

        // Write the current row to the LaTeX table
        outputFile << bin << " & " << ggH_SM << " & " << ggH_MIX << " & " << ggH_BSM
                   << " & " << VBF_SM << " & " << VBF_MIX << " & " << VBF_BSM << " \\\\ \\hline" << std::endl;
    }

    // Write the totals row to the LaTeX table
    outputFile << "Total & " << ggH_SM_Total << " ± " << ggH_SM_Error
               << " & " << ggH_MIX_Total << " ± " << ggH_MIX_Error
               << " & " << ggH_BSM_Total << " ± " << ggH_BSM_Error
               << " & " << VBF_SM_Total << " ± " << VBF_SM_Error
               << " & " << VBF_MIX_Total << " ± " << VBF_MIX_Error
               << " & " << VBF_BSM_Total << " ± " << VBF_BSM_Error << " \\\\ \\hline" << std::endl;

    // Write the LaTeX table footer
    outputFile << "\\end{tabular}" << std::endl;

    // Close the files
    inputFile.close();
    outputFile.close();

    std::cout << "Output written to output_table_" << year << ".tex" << std::endl;
}

//root -l -q 'CalculateTotals.C("2018")'


# MIC
# Language: R
# Input: CSV (abundances)
# Output: CSV (correlations)
# Tested with: PluMA 1.0, R 3.2.5

PluMA plugin to compute the Maximal Information Coefficient (or MIC, (Reshef, 2011)), which measures
linear and nonlinear correlations between datasets.  In this case the plugin expects
input in CSV format where rows are samples and columns correspond to members of a community,
and entry (i, j) represents the abundance of member j in sample i.

The plugin then computes the MIC between all pairs of members, producing as output a 
CSV file where rows and columns represent members and entry (i, j) is the MIC between
member i and member j.


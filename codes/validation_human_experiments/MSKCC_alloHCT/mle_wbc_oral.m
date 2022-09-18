clear all;
clc;

data = readtable('logistic_regression_wbc_table_100.csv', 'Format', '%s %s %f %f %f %f %f %f %f %f %f %d %d %d');
data.PatientID = categorical(data.PatientID);
data.TransplantType = categorical(data.TransplantType);
data.filgrastim = categorical(data.filgrastim);
data.mm = categorical(data.mm);
data.cetirizine = categorical(data.cetirizine);

% result
lme = fitlme(data,'dlogW_WBCtotal~TransplantType+filgrastim+mm+cetirizine+OralAbundance+gMean_WBCtotal+(1|PatientID)');
lme.Coefficients

lme = fitlme(data,'dlogW_Neutrophils~TransplantType+filgrastim+mm+cetirizine+OralAbundance+gMean_Neutrophils+(1|PatientID)');
lme.Coefficients

lme = fitlme(data,'dlogW_Lymphocytes~TransplantType+filgrastim+mm+cetirizine+OralAbundance+gMean_Lymphocytes+(1|PatientID)');
lme.Coefficients

lme = fitlme(data,'dlogW_Monocytes~TransplantType+filgrastim+mm+cetirizine+OralAbundance+gMean_Monocytes+(1|PatientID)');
lme.Coefficients
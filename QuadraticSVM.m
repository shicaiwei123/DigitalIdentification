function [trainedClassifier, validationAccuracy] = QuadraticSVM(datasetTable)
% Extract predictors and response
predictorNames = {'trainFeatures1', 'trainFeatures2', 'trainFeatures3', 'trainFeatures4', 'trainFeatures5', 'trainFeatures6', 'trainFeatures7', 'trainFeatures8', 'trainFeatures9', 'trainFeatures10', 'trainFeatures11', 'trainFeatures12', 'trainFeatures13', 'trainFeatures14', 'trainFeatures15', 'trainFeatures16', 'trainFeatures17', 'trainFeatures18', 'trainFeatures19', 'trainFeatures20', 'trainFeatures21', 'trainFeatures22', 'trainFeatures23', 'trainFeatures24', 'trainFeatures25', 'trainFeatures26', 'trainFeatures27', 'trainFeatures28', 'trainFeatures29', 'trainFeatures30', 'trainFeatures31', 'trainFeatures32', 'trainFeatures33', 'trainFeatures34', 'trainFeatures35', 'trainFeatures36', 'trainFeatures37', 'trainFeatures38', 'trainFeatures39', 'trainFeatures40', 'trainFeatures41', 'trainFeatures42', 'trainFeatures43', 'trainFeatures44', 'trainFeatures45', 'trainFeatures46', 'trainFeatures47', 'trainFeatures48', 'trainFeatures49'};
predictors = datasetTable(:,predictorNames);
predictors = table2array(varfun(@double, predictors));
response = datasetTable.number;
% Train a classifier
template = templateSVM('KernelFunction', 'polynomial', 'PolynomialOrder', 2, 'KernelScale', 'auto', 'BoxConstraint', 1, 'Standardize', 1);
trainedClassifier = fitcecoc(predictors, response, 'Learners', template, 'Coding', 'onevsone', 'PredictorNames', {'trainFeatures1' 'trainFeatures2' 'trainFeatures3' 'trainFeatures4' 'trainFeatures5' 'trainFeatures6' 'trainFeatures7' 'trainFeatures8' 'trainFeatures9' 'trainFeatures10' 'trainFeatures11' 'trainFeatures12' 'trainFeatures13' 'trainFeatures14' 'trainFeatures15' 'trainFeatures16' 'trainFeatures17' 'trainFeatures18' 'trainFeatures19' 'trainFeatures20' 'trainFeatures21' 'trainFeatures22' 'trainFeatures23' 'trainFeatures24' 'trainFeatures25' 'trainFeatures26' 'trainFeatures27' 'trainFeatures28' 'trainFeatures29' 'trainFeatures30' 'trainFeatures31' 'trainFeatures32' 'trainFeatures33' 'trainFeatures34' 'trainFeatures35' 'trainFeatures36' 'trainFeatures37' 'trainFeatures38' 'trainFeatures39' 'trainFeatures40' 'trainFeatures41' 'trainFeatures42' 'trainFeatures43' 'trainFeatures44' 'trainFeatures45' 'trainFeatures46' 'trainFeatures47' 'trainFeatures48' 'trainFeatures49'}, 'ResponseName', 'number', 'ClassNames', {'0' '1' '2' '3' '4' '5' '6' '7' '8' '9'});

% Set up holdout validation
cvp = cvpartition(response, 'Holdout', 0.25);
trainingPredictors = predictors(cvp.training,:);
trainingResponse = response(cvp.training,:);

% Train a classifier
template = templateSVM('KernelFunction', 'polynomial', 'PolynomialOrder', 2, 'KernelScale', 'auto', 'BoxConstraint', 1, 'Standardize', 1);
validationModel = fitcecoc(trainingPredictors, trainingResponse, 'Learners', template, 'Coding', 'onevsone', 'PredictorNames', {'trainFeatures1' 'trainFeatures2' 'trainFeatures3' 'trainFeatures4' 'trainFeatures5' 'trainFeatures6' 'trainFeatures7' 'trainFeatures8' 'trainFeatures9' 'trainFeatures10' 'trainFeatures11' 'trainFeatures12' 'trainFeatures13' 'trainFeatures14' 'trainFeatures15' 'trainFeatures16' 'trainFeatures17' 'trainFeatures18' 'trainFeatures19' 'trainFeatures20' 'trainFeatures21' 'trainFeatures22' 'trainFeatures23' 'trainFeatures24' 'trainFeatures25' 'trainFeatures26' 'trainFeatures27' 'trainFeatures28' 'trainFeatures29' 'trainFeatures30' 'trainFeatures31' 'trainFeatures32' 'trainFeatures33' 'trainFeatures34' 'trainFeatures35' 'trainFeatures36' 'trainFeatures37' 'trainFeatures38' 'trainFeatures39' 'trainFeatures40' 'trainFeatures41' 'trainFeatures42' 'trainFeatures43' 'trainFeatures44' 'trainFeatures45' 'trainFeatures46' 'trainFeatures47' 'trainFeatures48' 'trainFeatures49'}, 'ResponseName', 'number', 'ClassNames', {'0' '1' '2' '3' '4' '5' '6' '7' '8' '9'});

% Compute validation accuracy
validationPredictors = predictors(cvp.test,:);
validationResponse = response(cvp.test,:);
validationAccuracy = 1 - loss(validationModel, validationPredictors, validationResponse, 'LossFun', 'ClassifError');


%% Uncomment this section to compute validation predictions and scores:
% % Compute validation predictions and scores
% [validationPredictions, validationScores] = predict(validationModel, validationPredictors);
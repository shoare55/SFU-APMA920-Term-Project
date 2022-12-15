% Sophie Hoare
% APMA 920 Fall 2022
% Term Project
%
% Data from Professor Wakeling, School of Kinesiology, 
%       Simon Fraser University, Burnaby, British Columbia, Canada
%
% Journal Publication: Neuromechanics of Muscle Synergies During Cycling
%               James M. Wakeling and Tamara Horn

close all; clear all; clc;
% 

%figure properties
% Defaults for figures
width = 5.6;     % Width in inches
height = 4.2;    % Height in inches
alw = 1.5;    % AxesLineWidth
fsz = 12;      % Fontsize
lw = 1.2;      % LineWidth
msz = 8;       % MarkerSize


% Load all of the required matrices
global_matrices = load_matrices();
 

% Display average over all cyclists at all conditions
[indexes,RF_vectors, VM_VL_vectors] = create_train_set(global_matrices,10,1,true); 

% Cross-Correlation vectors for time variances at each condition
[correlation_norms, Cross_Cor_Matrix] = cross_cor(RF_vectors, VM_VL_vectors,true);


%Perform 3 Separate Tests over 100 tests and plot the accuracy results

training_perc = 0.95; %Set the percentage of data to training on

trials = 1;
x= 1:trials;
test_1_A = zeros(trials,1);
test_1_B = zeros(trials,1);
test_2_A = zeros(trials,1);
test_2_B = zeros(trials,1);
test_3_A = zeros(trials,1);
test_3_B = zeros(trials,1);
subject_removed = zeros(trials,1);

cross_cor_mapping = {1,2,3,4,5,6,7,8,9};
cross_cor_mapping_2 = {1,1,2,2,2,1,3,3,3};
cross_cor_mapping_3 = {1,2,3};

for i=1:trials
    
    % Create train set which contributes to the mean for the
    % cross_validation vectors
    subject_to_remove = randperm(9,1);
    %i,subject_to_remove
    subject_removed(i)=subject_to_remove;
    [training_indices,RF_vectors, VM_VL_vectors] = create_train_set(global_matrices,subject_to_remove,training_perc, false); 

    % Gather test data
    [Test_A, Test_A_results, Test_A_results_2, Test_B, Test_B_results, Test_B_results_2] = create_test_set(global_matrices,training_indices,subject_to_remove);
    
    % Create Cross Validation Vectors for the Given Set
    [correlation_norms,C] = cross_cor(RF_vectors, VM_VL_vectors,false);

    % Perform Trial 1 
    test_1_A_predictions=make_predictions(Test_A, correlation_norms,cross_cor_mapping);
    difference = (test_1_A_predictions-Test_A_results);
    test_1_A(i) = sum(difference(:)==0);

    test_1_B_predictions=make_predictions(Test_B, correlation_norms,cross_cor_mapping);
    difference = (test_1_B_predictions-Test_B_results);
    test_1_B(i) = sum(difference(:)==0);

    % Perform Trial 2 
    test_2_A_predictions=make_predictions(Test_A, correlation_norms,cross_cor_mapping_2);
    difference = (test_2_A_predictions-Test_A_results_2);
    test_2_A(i) = sum(difference(:)==0);

    test_2_B_predictions=make_predictions(Test_B, correlation_norms,cross_cor_mapping_2);
    difference = (test_2_B_predictions-Test_B_results_2);
    test_2_B(i) = sum(difference(:)==0);

    % Perform Trial 3 
    group1 = [correlation_norms{1};correlation_norms{2};correlation_norms{6}];
    group2 = [correlation_norms{2}; correlation_norms{3};correlation_norms{4};correlation_norms{5}];
    group3 = [correlation_norms{7};correlation_norms{8};correlation_norms{9}];
    correlation_norms_2 = {mean(group1),mean(group2),mean(group3)};

    test_3_A_predictions=make_predictions(Test_A, correlation_norms_2,cross_cor_mapping_3);
    difference = (test_3_A_predictions-Test_A_results_2);
    test_3_A(i) = sum(difference(:)==0);

    test_3_B_predictions=make_predictions(Test_B, correlation_norms_2,cross_cor_mapping_3);
    difference = (test_3_B_predictions-Test_B_results_2);
    test_3_B(i) = sum(difference(:)==0);

end

test_1_A_accuracy = test_1_A./length(test_1_A_predictions);
test_1_B_accuracy = test_1_B./length(test_1_B_predictions);
test_2_A_accuracy = test_2_A./length(test_2_A_predictions);
test_2_B_accuracy = test_2_B./length(test_2_B_predictions);
test_3_A_accuracy = test_3_A./length(test_3_A_predictions);
test_3_B_accuracy = test_3_B./length(test_3_B_predictions);

mean(test_1_A_accuracy)
mean(test_1_B_accuracy) 
mean(test_2_A_accuracy)
mean(test_2_B_accuracy) 
mean(test_3_A_accuracy) 
mean(test_3_B_accuracy) 

figure()
plot(x, test_1_A_accuracy,'LineWidth',lw,'MarkerSize',msz)
hold on
plot(x,ones(trials,1)*mean(test_1_A_accuracy),'LineWidth',lw,'MarkerSize',msz)
plot(x,test_2_A_accuracy,'LineWidth',lw,'MarkerSize',msz)
plot(x,ones(trials,1)*mean(test_2_A_accuracy),'LineWidth',lw,'MarkerSize',msz)
plot(x,test_3_A_accuracy,'LineWidth',lw,'MarkerSize',msz)
plot(x,ones(trials,1)*mean(test_3_A_accuracy),'LineWidth',lw,'MarkerSize',msz)
hold off
xlabel('Trial Number', 'FontSize', fsz)
ylabel("Accuracy", 'FontSize', fsz)
legend('Experiment 1', 'Avg Exp 1', 'Experiment 2','Avg Exp 2', 'Experiment 3','Avg Exp 3')
title(['Experiment Accuracy for Test Data Set A over 3 different experiments',10, 'using ', num2str(trials),' trials using ', num2str(training_perc*100), ' % of data for training'])

figure()
plot(x, test_1_B_accuracy,'LineWidth',lw,'MarkerSize',msz)
hold on
plot(x,ones(trials,1)*mean(test_1_B_accuracy),'LineWidth',lw,'MarkerSize',msz)
plot(x,test_2_B_accuracy,'LineWidth',lw,'MarkerSize',msz)
plot(x,ones(trials,1)*mean(test_2_B_accuracy),'LineWidth',lw,'MarkerSize',msz)
plot(x,test_3_B_accuracy,'LineWidth',lw,'MarkerSize',msz)
plot(x,ones(trials,1)*mean(test_3_B_accuracy),'LineWidth',lw,'MarkerSize',msz)
hold off
xlabel('Trial Number', 'FontSize', fsz)
ylabel("Accuracy", 'FontSize', fsz)
legend('Experiment 1', 'Avg Exp 1', 'Experiment 2','Avg Exp 2', 'Experiment 3','Avg Exp 3')
title(['Experiment Accuracy for Test Data Set B over 3 different experiments',10, 'using ', num2str(trials),' trials using ', num2str(training_perc*100), ' % of data for training'])

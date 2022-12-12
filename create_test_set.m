% Sophie Hoare
% APMA 920 Fall 2022
% Term Project

% Code for creating matricies holding all of the test data

% First matrix will hold test lines from subjects included in the means 

% Second matrix will hold test data from Subject F whom was excluded from
% the means

function [Test_A, Test_A_results, Test_A_results_2, Test_B, Test_B_results, Test_B_results_2] = create_test_set(global_matrices,training_indices,subject_to_remove)

    if subject_to_remove == 10
         standard = 1:756;
    else
         standard = 1:672;
    end
   
    
    cond1range2 = setdiff(standard, training_indices{1});
    cond2range2 = setdiff(standard, training_indices{2});
    cond3range2 = setdiff(standard, training_indices{3});
    cond4range2 = setdiff(standard, training_indices{4});
    cond5range2 = setdiff(standard, training_indices{5});
    cond6range2 = setdiff(standard, training_indices{6});
    cond7range2 = setdiff(standard, training_indices{7});
    cond8range2 = setdiff(standard, training_indices{8});
    cond9range2 = setdiff(standard, training_indices{9});
    
    Sixty_thirtyFive = global_matrices{1};
    Sixty_thirtyFive = [Sixty_thirtyFive(1:84*(subject_to_remove-1),:); Sixty_thirtyFive(84*(subject_to_remove)+1:756,:)];
    Sixty_ninety = global_matrices{2};
    Sixty_ninety = [Sixty_ninety(1:84*(subject_to_remove-1),:); Sixty_ninety(84*(subject_to_remove)+1:756,:)];
    Sixty_oneSevenFive = global_matrices{3};
    Sixty_oneSevenFive = [Sixty_oneSevenFive(1:84*(subject_to_remove-1),:); Sixty_oneSevenFive(84*(subject_to_remove)+1:756,:)];
    Sixty_twoTen = global_matrices{4};
    Sixty_twoTen = [Sixty_twoTen(1:84*(subject_to_remove-1),:); Sixty_twoTen(84*(subject_to_remove)+1:756,:)];
    Sixty_twoSixty = global_matrices{5};
    Sixty_twoSixty = [Sixty_twoSixty(1:84*(subject_to_remove-1),:); Sixty_twoSixty(84*(subject_to_remove)+1:756,:)];
    Eighty_sixty = global_matrices{6};
    Eighty_sixty = [Eighty_sixty(1:84*(subject_to_remove-1),:); Eighty_sixty(84*(subject_to_remove)+1:756,:)];
    oneHund_eighty = global_matrices{7};
    oneHund_eighty = [oneHund_eighty(1:84*(subject_to_remove-1),:); oneHund_eighty(84*(subject_to_remove)+1:756,:)];
    OneTwenty_oneHund = global_matrices{8};
    OneTwenty_oneHund = [OneTwenty_oneHund(1:84*(subject_to_remove-1),:); OneTwenty_oneHund(84*(subject_to_remove)+1:756,:)];
    oneForty_oneForty = global_matrices{9};
    oneForty_oneForty = [oneForty_oneForty(1:84*(subject_to_remove-1),:); oneForty_oneForty(84*(subject_to_remove)+1:756,:)];
    

    Test_A = [Sixty_thirtyFive(cond1range2, :);  
        Sixty_ninety(cond2range2, :);
        Sixty_oneSevenFive(cond3range2, :);
        Sixty_twoTen(cond4range2, :); 
        Sixty_twoSixty(cond5range2, :); 
        Eighty_sixty(cond6range2, :); 
        oneHund_eighty(cond7range2, :);
        OneTwenty_oneHund(cond8range2, :); 
        oneForty_oneForty(cond9range2, :)];
    
    % 1-224 = condition 1
    % 225-448 = condition 2
    % 449-672 = condition 3
    % 673-896 = condition 4
    % 897-1120 = condition 5
    % 1121-1344 = condition 6
    % 1345-1568 = condition 7
    % 1569-1792 = condition 8
    % 1793-2016 = condition 9
    
    Test_A_results = [ones(length(cond1range2),1); 2*ones(length(cond2range2),1); 3*ones(length(cond3range2),1); 
        4*ones(length(cond4range2),1); 5*ones(length(cond5range2),1); 6*ones(length(cond6range2),1); 7*ones(length(cond7range2),1); 
        8*ones(length(cond8range2),1); 9*ones(length(cond9range2),1)];
    
    permute = randperm(size(Test_A,1),size(Test_A,1));
    Test_A = Test_A(permute,:);
    Test_A_results = Test_A_results(permute,:);
    
    Sixty_thirtyFive1 = global_matrices{1};
    Sixty_ninety1 = global_matrices{2};
    Sixty_oneSevenFive1 = global_matrices{3};
    Sixty_twoTen1 = global_matrices{4};
    Sixty_twoSixty1 = global_matrices{5};
    Eighty_sixty1 = global_matrices{6};
    oneHund_eighty1 = global_matrices{7};
    OneTwenty_oneHund1 = global_matrices{8};
    oneForty_oneForty1 = global_matrices{9};
    
    Test_B = [Sixty_thirtyFive1(84*(subject_to_remove-1)+1:84*subject_to_remove,:);
        Sixty_ninety1(84*(subject_to_remove-1)+1:84*subject_to_remove,:);
        Sixty_oneSevenFive1(84*(subject_to_remove-1)+1:84*subject_to_remove,:);
        Sixty_twoTen1(84*(subject_to_remove-1)+1:84*subject_to_remove,:);
        Sixty_twoSixty1(84*(subject_to_remove-1)+1:84*subject_to_remove,:);
        Eighty_sixty1(84*(subject_to_remove-1)+1:84*subject_to_remove,:);
        oneHund_eighty1(84*(subject_to_remove-1)+1:84*subject_to_remove,:);
        OneTwenty_oneHund1(84*(subject_to_remove-1)+1:84*subject_to_remove,:);
        oneForty_oneForty1(84*(subject_to_remove-1)+1:84*subject_to_remove,:)];
    
    Test_B_results = [ones(84,1); 2*ones(84,1); 3*ones(84,1); 
        4*ones(84,1); 5*ones(84,1); 6*ones(84,1); 7*ones(84,1); 
        8*ones(84,1); 9*ones(84,1)];
    
    permute2 = randperm(756,756);
    Test_B = Test_B(permute2,:);
    Test_B_results = Test_B_results(permute2,:);
    
 
    % Group Conditions relative to like conditions:
    %
    % Group 1: 60-35, 60-90, 80-60
    % Group 2: 60-175, 60-210, 60-260
    % Group 3: 100-80, 120-100, 140-140
    
    % 1-224 = condition 1
    % 225-448 = condition 1
    % 449-672 = condition 2
    % 673-896 = condition 2
    % 897-1120 = condition 2
    % 1121-1344 = condition 1
    % 1345-1568 = condition 3
    % 1569-1792 = condition 3
    % 1793-2016 = condition 3
    
    Test_A_results_2 = [ones(length(cond1range2),1); ones(length(cond2range2),1); 2*ones(length(cond3range2),1); 
        2*ones(length(cond4range2),1); 2*ones(length(cond5range2),1); ones(length(cond6range2),1); 3*ones(length(cond7range2),1); 
        3*ones(length(cond8range2),1); 3*ones(length(cond9range2),1)];
    Test_A_results_2 = Test_A_results_2(permute,:);
    
    Test_B_results_2 = [ones(84,1); ones(84,1); 2*ones(84,1); 
        2*ones(84,1); 2*ones(84,1); ones(84,1); 3*ones(84,1); 
        3*ones(84,1); 3*ones(84,1)];
    Test_B_results_2 = Test_B_results_2(permute2,:);

end
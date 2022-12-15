% Sophie Hoare
% APMA 920 Fall 2022
% Term Project

% Code for displaying mean RF vs mean (VL+VM)/2 for 9 different 
% conditions averaged over all cyclists 


function [indexes,RF_vectors, VM_VL_vectors] = create_train_set(global_matrices,subject_to_remove,training_perc,plot_case)

    
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
    
    if subject_to_remove == 10
        range = 756;
        num_of_entries = round(training_perc*range,0); %This should be equal to the percentage of entries for training*range
    else
        range = 672;
        num_of_entries = round(training_perc*range,0); %This should be equal to the percentage of entries for training*range
    end

    % Split the three muscles and average for condition 60-35
    cond1range = randperm(range,num_of_entries);
    VM = Sixty_thirtyFive(cond1range, 1:100);
    RF1 = mean(Sixty_thirtyFive(cond1range, 101:200));
    VL = Sixty_thirtyFive(cond1range, 201:300);  
    VM_VL1 = mean((VM+VL)/2);
     
    % Split the three muscles and average for condition 60-90
    cond2range = randperm(range,num_of_entries); 
    VM = Sixty_ninety(cond2range, 1:100);
    RF2 = mean(Sixty_ninety(cond2range, 101:200));
    VL = Sixty_ninety(cond2range, 201:300);   
    VM_VL2 = mean((VM+VL)/2);
 
    % Split the three muscles and average for condition 60-175 
    cond3range = randperm(range,num_of_entries);
    VM = Sixty_oneSevenFive(cond3range, 1:100);
    RF3 = mean(Sixty_oneSevenFive(cond3range, 101:200));
    VL = Sixty_oneSevenFive(cond3range, 201:300); 
    VM_VL3 = mean((VM+VL)/2);
    
    % Split the three muscles and average for condition 60-210   
    cond4range = randperm(range,num_of_entries);
    VM = Sixty_twoTen(cond4range, 1:100);
    RF4 = mean(Sixty_twoTen(cond4range, 101:200));
    VL = Sixty_twoTen(cond4range, 201:300);  
    VM_VL4 = mean((VM+VL)/2);
   
    % Split the three muscles and average for condition 60-260  
    cond5range = randperm(range,num_of_entries);
    VM = Sixty_twoSixty(cond5range, 1:100);
    RF5 = mean(Sixty_twoSixty(cond5range, 101:200));
    VL = Sixty_twoSixty(cond5range, 201:300); 
    VM_VL5 = mean((VM+VL)/2);
     
    % Split the three muscles and average for condition 80-60
    cond6range = randperm(range,num_of_entries);
    VM = Eighty_sixty(cond6range, 1:100);
    RF6 = mean(Eighty_sixty(cond6range, 101:200));
    VL = Eighty_sixty(cond6range, 201:300);
    VM_VL6 = mean((VM+VL)/2);
    
    % Split the three muscles and average for condition 100-80
    cond7range = randperm(range,num_of_entries);
    VM = oneHund_eighty(cond7range, 1:100);
    RF7 = mean(oneHund_eighty(cond7range, 101:200));
    VL = oneHund_eighty(cond7range, 201:300);
    VM_VL7 = mean((VM+VL)/2);
       
    % Split the three muscles and average for condition 120-100
    cond8range = randperm(range,num_of_entries);
    VM = OneTwenty_oneHund(cond8range, 1:100);
    RF8 = mean(OneTwenty_oneHund(cond8range, 101:200));
    VL = OneTwenty_oneHund(cond8range, 201:300);
    VM_VL8 = mean((VM+VL)/2);
         
    % Split the three muscles and average for condition 140-140
    cond9range = randperm(range,num_of_entries);
    VM = oneForty_oneForty(cond9range, 1:100);
    RF9 = mean(oneForty_oneForty(cond9range, 101:200));
    VL = oneForty_oneForty(cond9range, 201:300);
    VM_VL9 = mean((VM+VL)/2);
    

    indexes = {cond1range, cond2range, cond3range, cond4range,cond5range, cond6range,cond7range, cond8range,cond9range};
    RF_vectors = {RF1,RF2,RF3,RF4,RF5,RF6,RF7,RF8,RF9};
    VM_VL_vectors = {VM_VL1,VM_VL2,VM_VL3,VM_VL4,VM_VL5,VM_VL6,VM_VL7,VM_VL8,VM_VL9};


    if plot_case
    
        figure('Name', 'Mean RF vs Mean VM & VL');
    
        subplot(5,2,1);
        plot(1:100, RF1, '-r', 'LineWidth', 2);
        hold on;
        plot(1:100, VM_VL1, '-k', 'LineWidth', 2);
        hold off;
        subtitle("Condition 60 RPM 6.5 N m", 'FontSize', 10);
    
        subplot(5,2,2);
        plot(1:100, RF1, '-r', 'LineWidth', 2);
        hold on;
        plot(1:100, VM_VL1, '-k', 'LineWidth', 2);
        hold off;
        subtitle("Condition 60 RPM 6.5 N m", 'FontSize', 10);
        
        subplot(5,2,3);
        plot(1:100, RF2, '-r', 'LineWidth', 2);
        hold on;
        plot(1:100, VM_VL2, '-k', 'LineWidth', 2);
        hold off;
        hold off;
        subtitle("Condition 60 RPM 12.9 N m", 'FontSize', 10);
        
        subplot(5,2,5);
        plot(1:100, RF3, '-r', 'LineWidth', 2);
        hold on;
        plot(1:100, VM_VL3, '-k', 'LineWidth', 2);
        hold off;
        hold off;
        subtitle("Condition 60 RPM 25.1 N m", 'FontSize', 10);
        
        subplot(5,2,7);
        plot(1:100, RF4, '-r', 'LineWidth', 2);
        hold on;
        plot(1:100, VM_VL4, '-k', 'LineWidth', 2);
        hold off;
        subtitle("Condition 60 RPM 32.4 N m", 'FontSize', 10);
    
        subplot(5,2,9);
        plot(1:100, RF5, '-r', 'LineWidth', 2);
        hold on;
        plot(1:100, VM_VL5, '-k', 'LineWidth', 2);
        hold off;
        subtitle("Condition 60 RPM 39.9 N m", 'FontSize', 10);
        
        subplot(5,2,4);
        plot(1:100, RF6, '-r', 'LineWidth', 2);
        hold on;
        plot(1:100, VM_VL6, '-k', 'LineWidth', 2);
        hold off;
        subtitle("Condition 80 RPM 6.5 N m", 'FontSize', 10);
        
        subplot(5,2,6);
        plot(1:100, RF7, '-r', 'LineWidth', 2);
        hold on;
        plot(1:100, VM_VL7, '-k', 'LineWidth', 2);
        hold off;
        subtitle("Condition 100 RPM 6.5 N m", 'FontSize', 10);
        
        subplot(5,2,8);
        plot(1:100, RF8, '-r', 'LineWidth', 2);
        hold on;
        plot(1:100, VM_VL8, '-k', 'LineWidth', 2);
        hold off;
        subtitle("Condition 120 RPM 6.5 N m", 'FontSize', 10);
    
        subplot(5,2,10);
        plot(1:100, RF9, '-r', 'LineWidth', 2);
        hold on;
        plot(1:100, VM_VL9, '-k', 'LineWidth', 2);
        hold off;
        subtitle("Condition 140 RPM 6.5 N m", 'FontSize', 10);
        sgtitle("Mean RF vs Mean VM & VL values across all 9 conditions and all 9 test subjects.")
        legend('RF', 'VM & VL','Location','south', 'Orientation', 'horizontal', 'FontSize', 10);
    end
end
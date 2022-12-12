% Sophie Hoare
% APMA 920 Fall 2022
% Term Project

% Code for computing the cross-correlation of the mean RF vs mean 
% (VL+VM)/2 for 9 different conditions averaged over 8 cyclists 

function [correlation_norms,Cross_Cor_Matrix] = cross_cor(RF_vectors, VM_VL_vectors, plot_case)

    %lw for plots
    lw = 2;

    % Condition 60-35
    Sixty_thirtyFive_norm = xcorr(RF_vectors{1}, VM_VL_vectors{1})/sqrt(sum(abs(RF_vectors{1}).^2)*sum(abs(VM_VL_vectors{1}).^2));
    
    % Condition 60-90
    Sixty_ninety_norm = xcorr(RF_vectors{2}, VM_VL_vectors{2})/sqrt(sum(abs(RF_vectors{2}).^2)*sum(abs(VM_VL_vectors{2}).^2));
    
    % Condition 60-175
    Sixty_oneSevenFive_norm = xcorr(RF_vectors{3}, VM_VL_vectors{3})/sqrt(sum(abs(RF_vectors{3}).^2)*sum(abs(VM_VL_vectors{3}).^2));
    
    % Condition 60-210
    Sixty_twoTen_norm = xcorr(RF_vectors{4}, VM_VL_vectors{4})/sqrt(sum(abs(RF_vectors{4}).^2)*sum(abs(VM_VL_vectors{4}).^2));
    
    % Condition 60-260
    Sixty_twoSixty_norm = xcorr(RF_vectors{5}, VM_VL_vectors{5})/sqrt(sum(abs(RF_vectors{5}).^2)*sum(abs(VM_VL_vectors{5}).^2));
    
    % Condition 80-60
    Eighty_sixty_norm = xcorr(RF_vectors{6}, VM_VL_vectors{6})/sqrt(sum(abs(RF_vectors{6}).^2)*sum(abs(VM_VL_vectors{6}).^2));
    
    % Condition 100-80
    oneHund_eighty_norm = xcorr(RF_vectors{7}, VM_VL_vectors{7})/sqrt(sum(abs(RF_vectors{7}).^2)*sum(abs(VM_VL_vectors{7}).^2));
    
    % Condition 120-100
    OneTwenty_oneHund_norm = xcorr(RF_vectors{8}, VM_VL_vectors{8})/sqrt(sum(abs(RF_vectors{8}).^2)*sum(abs(VM_VL_vectors{8}).^2));
    
    % Condition 120-100
    oneForty_oneForty_norm = xcorr(RF_vectors{9}, VM_VL_vectors{9})/sqrt(sum(abs(RF_vectors{9}).^2)*sum(abs(VM_VL_vectors{9}).^2));
    
    correlation_norms = {Sixty_thirtyFive_norm, Sixty_ninety_norm, Sixty_oneSevenFive_norm,Sixty_twoTen_norm, Sixty_twoSixty_norm, Eighty_sixty_norm, oneHund_eighty_norm, OneTwenty_oneHund_norm, oneForty_oneForty_norm};

    if plot_case
    
        % This block of code creates a correlation matrix of all 9 conditions to
        % group the data with conditions that have similar cross correlations between
        % the RF and and the average of the VM and VL
        
        Cross_Cor_Matrix = zeros(9,9);
        
        for i=1:9
            corr_1 = correlation_norms{i};
            for j=1:9
                corr_2 = correlation_norms{j};
                corr_coeff = corrcoef(corr_1,corr_2);
                Cross_Cor_Matrix(i,j) = corr_coeff(1,2);
            end
        end
        
        
        figure('Name', 'Cross-Correlation RF vs Mean VM & VL');
        
        subplot(3,3,1)
        plot(-99:99, Sixty_thirtyFive_norm,'LineWidth',lw);
        subtitle("Condition 60 RPM 35 Hz", 'FontSize', 10);
        
        subplot(3,3,2)
        plot(-99:99, Sixty_ninety_norm,'LineWidth',lw);
        subtitle("Condition 60 RPM 90 Hz", 'FontSize', 10);
        
        subplot(3,3,3)
        plot(-99:99, Sixty_oneSevenFive_norm,'LineWidth',lw);
        subtitle("Condition 60 RPM 175 Hz", 'FontSize', 10);
        
        subplot(3,3,4)
        plot(-99:99, Sixty_twoTen_norm,'LineWidth',lw);
        subtitle("Condition 60 RPM 210 Hz", 'FontSize', 10);
        
        subplot(3,3,5)
        plot(-99:99, Sixty_twoSixty_norm,'LineWidth',lw);
        subtitle("Condition 60 RPM 260 Hz", 'FontSize', 10);
        
        subplot(3,3,6)
        plot(-99:99, Eighty_sixty_norm,'LineWidth',lw);
        subtitle("Condition 80 RPM 60 Hz", 'FontSize', 10);
        
        subplot(3,3,7)
        plot(-99:99, oneHund_eighty_norm,'LineWidth',lw);
        subtitle("Condition 100 RPM 80 Hz", 'FontSize', 10);
        
        subplot(3,3,8)
        plot(-99:99, OneTwenty_oneHund_norm,'LineWidth',lw);
        subtitle("Condition 120 RPM 100 Hz", 'FontSize', 10);
        
        subplot(3,3,9)
        plot(-99:99, oneForty_oneForty_norm,'LineWidth',lw);
        subtitle("Condition 140 RPM 140 Hz", 'FontSize', 10);
        sgtitle("Cross-Correlation Vector for RF muscle vs Mean VM & VL across all 9 conditions all 9 test subjects.")
    else
        Cross_Cor_Matrix = [];
    end
end
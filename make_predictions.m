% Sophie Hoare
% APMA 920 Fall 2022
% Term Project

% Function for predicting condition based on Mean Correlation vectors

function predicted = make_predictions(test_data, cross_cor,cross_cor_mapping)

    [m,~] = size(test_data);
    Test_VM = test_data(:, 1:100);
    Test_RF = test_data(:,101:200);
    Test_VL = test_data(:, 201:300);
    Test_VL_VM = (Test_VM + Test_VL)/2;


    predicted = zeros(m,1);
    n = length(cross_cor);

    

    for j = 1:m
          
        max_vals = [0,0];
        Test_cor = xcorr(Test_RF(j,:), Test_VL_VM(j,:))/sqrt(sum(abs(Test_RF(j,:)).^2)*sum(abs(Test_VL_VM(j,:)).^2));

        for k=1:n
            cross_cor_sample = cross_cor{k};
            correlation = corrcoef(Test_cor,cross_cor_sample);
            corr_val = abs(correlation(1,2));

            if corr_val>max_vals(2)
                max_vals = [cross_cor_mapping{k},corr_val];
            end
            
        end

        predicted(j) = max_vals(1);

    end

end
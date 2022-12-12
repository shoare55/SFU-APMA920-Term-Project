% Sophie Hoare
% APMA 920 Fall 2022
% Term Project

% Code for loading matrices and extracting key 3 muscles and 9 different 
% conditions

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Layout of Codes table:
% File Extension | block number | subject code | pedal cycle |
% desired rpm | desired power (torque x angle velocity) watts | true rpm | 
% true power | Heart Rate | Tibialis anterior |
% Medial gastrocnemius | Lateral gastrocnemius | Soleus | 
% Vastus medialis | Rectus femoris | Vastus lateralis | 
% Biceps femoris | Semitendinosus |Gluteus maximum 

%NOTE:muscle codes are their normalization values in codes table

% We are wanting to look at the Vastus medialis 400:499, Rectus femoris 
% 500:599 and Vastus lateralis 600:699 | 3 muscles -> 400:699 


%Normalized value matrix dimensions per subject = 756 x 1000 

% 756 = 28 pedal cycles per trial x 9 conditions x 3 blocks

% 1000 = 100 time windows per pedal cycle x 10 muscles (grouped per 100 rows) 

function global_matrices = load_matrices()

%SubB_Codes = readmatrix('SubB_CodesIntMatrix.txt');
SubB_NormIntMatrix = readmatrix("SubB_NormIntMatrix.txt");

%SubC_Codes = readmatrix('SubC_CodesIntMatrix.txt');
SubC_NormIntMatrix = readmatrix("SubC_NormIntMatrix.txt");

%SubD_Codes = readmatrix('SubD_CodesIntMatrix.txt');
SubD_NormIntMatrix = readmatrix("SubD_NormIntMatrix.txt");

%SubE_Codes = readmatrix('SubE_CodesIntMatrix.txt');
SubE_NormIntMatrix = readmatrix("SubE_NormIntMatrix.txt");

%SubF_Codes = readmatrix('SubF_CodesIntMatrix.txt');
SubF_NormIntMatrix = readmatrix("SubF_NormIntMatrix.txt");

%SubG_Codes = readmatrix('SubG_CodesIntMatrix.txt');
SubG_NormIntMatrix = readmatrix("SubG_NormIntMatrix.txt");

%SubH_Codes = readmatrix('SubH_CodesIntMatrix.txt');
SubH_NormIntMatrix = readmatrix("SubH_NormIntMatrix.txt");

%SubI_Codes = readmatrix('SubI_CodesIntMatrix.txt');
SubI_NormIntMatrix = readmatrix("SubI_NormIntMatrix.txt");

%SubJ_Codes = readmatrix('SubJ_CodesIntMatrix.txt');
SubJ_NormIntMatrix = readmatrix("SubJ_NormIntMatrix.txt");


% Create separate matricies of all 9 different conditions and each
% different muscle combining the 9 subjects - include all 28 revolutions
% Size = 756 x 100

% 756 = 28 pedal cycles per trial x 1 conditions x 3 blocks x 9 subjects
% 100 = 100 time windows per pedal cycle

% Nameing conventions = [RPM]_[Power]_[Muscle]

% RPM 60 , Power 35
Sixty_thirtyFive_B =  [SubB_NormIntMatrix(141:168,400:699); SubB_NormIntMatrix(365:392, 400:699); SubB_NormIntMatrix(645:672,400:699)];
Sixty_thirtyFive_C =  [SubC_NormIntMatrix(29:56,400:699); SubC_NormIntMatrix(421:448, 400:699); SubC_NormIntMatrix(701:728,400:699)];
Sixty_thirtyFive_D =  [SubD_NormIntMatrix(1:28,400:699); SubD_NormIntMatrix(281:308, 400:699); SubD_NormIntMatrix(533:560,400:699)];
Sixty_thirtyFive_E =  [SubE_NormIntMatrix(57:84,400:699); SubE_NormIntMatrix(365:392, 400:699); SubE_NormIntMatrix(505:532,400:699)];
Sixty_thirtyFive_F =  [SubF_NormIntMatrix(57:84,400:699); SubF_NormIntMatrix(309:336, 400:699); SubF_NormIntMatrix(701:728,400:699)];
Sixty_thirtyFive_G =  [SubG_NormIntMatrix(113:140,400:699); SubG_NormIntMatrix(309:336, 400:699); SubG_NormIntMatrix(729:756,400:699)];
Sixty_thirtyFive_H =  [SubH_NormIntMatrix(169:196,400:699); SubH_NormIntMatrix(253:280, 400:699); SubH_NormIntMatrix(589:616,400:699)];
Sixty_thirtyFive_I =  [SubI_NormIntMatrix(29:56,400:699); SubI_NormIntMatrix(337:364, 400:699); SubI_NormIntMatrix(645:672,400:699)];
Sixty_thirtyFive_J =  [SubJ_NormIntMatrix(1:28,400:699); SubJ_NormIntMatrix(253:280, 400:699); SubJ_NormIntMatrix(645:672,400:699)];

Sixty_thirtyFive = [Sixty_thirtyFive_B; Sixty_thirtyFive_C;
    Sixty_thirtyFive_D; Sixty_thirtyFive_E; Sixty_thirtyFive_F;
    Sixty_thirtyFive_G; Sixty_thirtyFive_H; Sixty_thirtyFive_I;
    Sixty_thirtyFive_J];


% RPM 60 , Power 90
Sixty_ninety_B =  [SubB_NormIntMatrix(85:112,400:699); SubB_NormIntMatrix(253:280, 400:699); SubB_NormIntMatrix(729:756,400:699)];
Sixty_ninety_C =  [SubC_NormIntMatrix(197:224,400:699); SubC_NormIntMatrix(309:336, 400:699); SubC_NormIntMatrix(505:532,400:699)];
Sixty_ninety_D =  [SubD_NormIntMatrix(225:252,400:699); SubD_NormIntMatrix(365:392, 400:699); SubD_NormIntMatrix(589:616,400:699)];
Sixty_ninety_E =  [SubE_NormIntMatrix(169:196,400:699); SubE_NormIntMatrix(309:336, 400:699); SubE_NormIntMatrix(701:728,400:699)];
Sixty_ninety_F =  [SubF_NormIntMatrix(197:224,400:699); SubF_NormIntMatrix(393:420, 400:699); SubF_NormIntMatrix(589:616,400:699)];
Sixty_ninety_G =  [SubG_NormIntMatrix(29:56,400:699); SubG_NormIntMatrix(477:504, 400:699); SubG_NormIntMatrix(645:672,400:699)];
Sixty_ninety_H =  [SubH_NormIntMatrix(1:28,400:699); SubH_NormIntMatrix(421:448, 400:699); SubH_NormIntMatrix(533:560,400:699)];
Sixty_ninety_I =  [SubI_NormIntMatrix(169:196,400:699); SubI_NormIntMatrix(281:308, 400:699); SubI_NormIntMatrix(589:616,400:699)];
Sixty_ninety_J =  [SubJ_NormIntMatrix(113:140,400:699); SubJ_NormIntMatrix(309:336, 400:699); SubJ_NormIntMatrix(673:700,400:699)];

Sixty_ninety= [Sixty_ninety_B; Sixty_ninety_C;
    Sixty_ninety_D; Sixty_ninety_E; Sixty_ninety_F;
    Sixty_ninety_G; Sixty_ninety_H; Sixty_ninety_I;
    Sixty_ninety_J];


% RPM 60 , Power 175
Sixty_oneSevenFive_B =  [SubB_NormIntMatrix(57:84,400:699); SubB_NormIntMatrix(337:364, 400:699); SubB_NormIntMatrix(589:616,400:699)];
Sixty_oneSevenFive_C =  [SubC_NormIntMatrix(85:112,400:699); SubC_NormIntMatrix(281:308, 400:699); SubC_NormIntMatrix(617:644,400:699)];
Sixty_oneSevenFive_D =  [SubD_NormIntMatrix(169:196,400:699); SubD_NormIntMatrix(477:504, 400:699); SubD_NormIntMatrix(505:532,400:699)];
Sixty_oneSevenFive_E =  [SubE_NormIntMatrix(1:28,400:699); SubE_NormIntMatrix(393:420, 400:699); SubE_NormIntMatrix(561:588,400:699)];
Sixty_oneSevenFive_F =  [SubF_NormIntMatrix(29:56,400:699); SubF_NormIntMatrix(365:392, 400:699); SubF_NormIntMatrix(561:588,400:699)];
Sixty_oneSevenFive_G =  [SubG_NormIntMatrix(57:84,400:699); SubG_NormIntMatrix(365:392, 400:699); SubG_NormIntMatrix(673:700,400:699)];
Sixty_oneSevenFive_H =  [SubH_NormIntMatrix(225:252,400:699); SubH_NormIntMatrix(393:420, 400:699); SubH_NormIntMatrix(729:756,400:699)];
Sixty_oneSevenFive_I =  [SubI_NormIntMatrix(57:84,400:699); SubI_NormIntMatrix(365:392, 400:699); SubI_NormIntMatrix(701:728,400:699)];
Sixty_oneSevenFive_J =  [SubJ_NormIntMatrix(57:84,400:699); SubJ_NormIntMatrix(477:504, 400:699); SubJ_NormIntMatrix(589:616,400:699)];

Sixty_oneSevenFive = [Sixty_oneSevenFive_B; Sixty_oneSevenFive_C;
    Sixty_oneSevenFive_D; Sixty_oneSevenFive_E; Sixty_oneSevenFive_F;
    Sixty_oneSevenFive_G; Sixty_oneSevenFive_H; Sixty_oneSevenFive_I;
    Sixty_oneSevenFive_J];


% RPM 60 , Power 210
Sixty_twoTen_B =  [SubB_NormIntMatrix(225:252,400:699); SubB_NormIntMatrix(309:336, 400:699); SubB_NormIntMatrix(533:560,400:699)];
Sixty_twoTen_C =  [SubC_NormIntMatrix(113:140,400:699); SubC_NormIntMatrix(337:364, 400:699); SubC_NormIntMatrix(533:560,400:699)];
Sixty_twoTen_D =  [SubD_NormIntMatrix(29:56,400:699); SubD_NormIntMatrix(253:280, 400:699); SubD_NormIntMatrix(729:756,400:699)];
Sixty_twoTen_E =  [SubE_NormIntMatrix(141:168,400:699); SubE_NormIntMatrix(253:280, 400:699); SubE_NormIntMatrix(589:616,400:699)];
Sixty_twoTen_F =  [SubF_NormIntMatrix(1:28,400:699); SubF_NormIntMatrix(281:308, 400:699); SubF_NormIntMatrix(729:756,400:699)];
Sixty_twoTen_G =  [SubG_NormIntMatrix(85:112,400:699); SubG_NormIntMatrix(393:420, 400:699); SubG_NormIntMatrix(701:728,400:699)];
Sixty_twoTen_H =  [SubH_NormIntMatrix(141:168,400:699); SubH_NormIntMatrix(281:308, 400:699); SubH_NormIntMatrix(701:728,400:699)];
Sixty_twoTen_I =  [SubI_NormIntMatrix(197:224,400:699); SubI_NormIntMatrix(253:280, 400:699); SubI_NormIntMatrix(673:700,400:699)];
Sixty_twoTen_J =  [SubJ_NormIntMatrix(225:252,400:699); SubJ_NormIntMatrix(281:308, 400:699); SubJ_NormIntMatrix(617:644,400:699)];

Sixty_twoTen = [Sixty_twoTen_B; Sixty_twoTen_C;
    Sixty_twoTen_D; Sixty_twoTen_E; Sixty_twoTen_F;
    Sixty_twoTen_G; Sixty_twoTen_H; Sixty_twoTen_I;
    Sixty_twoTen_J];



% RPM 60 , Power 260 
Sixty_twoSixty_B =  [SubB_NormIntMatrix(1:28,400:699); SubB_NormIntMatrix(393:420, 400:699); SubB_NormIntMatrix(701:728,400:699)];
Sixty_twoSixty_C =  [SubC_NormIntMatrix(169:196,400:699); SubC_NormIntMatrix(449:476, 400:699); SubC_NormIntMatrix(729:756,400:699)];
Sixty_twoSixty_D =  [SubD_NormIntMatrix(85:112,400:699); SubD_NormIntMatrix(309:336, 400:699); SubD_NormIntMatrix(617:644,400:699)];
Sixty_twoSixty_E =  [SubE_NormIntMatrix(113:140,400:699); SubE_NormIntMatrix(337:364, 400:699); SubE_NormIntMatrix(673:700,400:699)];
Sixty_twoSixty_F =  [SubF_NormIntMatrix(85:112,400:699); SubF_NormIntMatrix(253:280, 400:699); SubF_NormIntMatrix(645:672,400:699)];
Sixty_twoSixty_G =  [SubG_NormIntMatrix(197:224,400:699); SubG_NormIntMatrix(421:448, 400:699); SubG_NormIntMatrix(617:644,400:699)];
Sixty_twoSixty_H =  [SubH_NormIntMatrix(197:224,400:699); SubH_NormIntMatrix(337:364, 400:699); SubH_NormIntMatrix(561:588,400:699)];
Sixty_twoSixty_I =  [SubI_NormIntMatrix(225:252,400:699); SubI_NormIntMatrix(421:448, 400:699); SubI_NormIntMatrix(729:756,400:699)];
Sixty_twoSixty_J =  [SubJ_NormIntMatrix(29:56,400:699); SubJ_NormIntMatrix(365:392, 400:699); SubJ_NormIntMatrix(701:728,400:699)];

Sixty_twoSixty = [Sixty_twoSixty_B; Sixty_twoSixty_C;
    Sixty_twoSixty_D; Sixty_twoSixty_E; Sixty_twoSixty_F;
    Sixty_twoSixty_G; Sixty_twoSixty_H; Sixty_twoSixty_I;
    Sixty_twoSixty_J];


% RPM 80 , Power 60
Eighty_sixty_B =  [SubB_NormIntMatrix(169:196,400:699); SubB_NormIntMatrix(449:476, 400:699); SubB_NormIntMatrix(617:644,400:699)];
Eighty_sixty_C =  [SubC_NormIntMatrix(141:168,400:699); SubC_NormIntMatrix(477:504, 400:699); SubC_NormIntMatrix(589:616,400:699)];
Eighty_sixty_D =  [SubD_NormIntMatrix(113:140,400:699); SubD_NormIntMatrix(449:476, 400:699); SubD_NormIntMatrix(673:700,400:699)];
Eighty_sixty_E =  [SubE_NormIntMatrix(281:308,400:699); SubE_NormIntMatrix(337:364, 400:699); SubE_NormIntMatrix(533:560,400:699)];
Eighty_sixty_F =  [SubF_NormIntMatrix(29:56,400:699); SubF_NormIntMatrix(225:252, 400:699); SubF_NormIntMatrix(505:532,400:699)];
Eighty_sixty_G =  [SubG_NormIntMatrix(169:196,400:699); SubG_NormIntMatrix(449:476, 400:699); SubG_NormIntMatrix(533:560,400:699)];
Eighty_sixty_H =  [SubH_NormIntMatrix(57:84,400:699); SubH_NormIntMatrix(365:392, 400:699); SubH_NormIntMatrix(505:532,400:699)];
Eighty_sixty_I =  [SubI_NormIntMatrix(113:140,400:699); SubI_NormIntMatrix(449:476, 400:699); SubI_NormIntMatrix(505:532,400:699)];
Eighty_sixty_J =  [SubJ_NormIntMatrix(85:112,400:699); SubJ_NormIntMatrix(421:448, 400:699); SubJ_NormIntMatrix(505:532,400:699)];

Eighty_sixty = [Eighty_sixty_B; Eighty_sixty_C;
    Eighty_sixty_D; Eighty_sixty_E; Eighty_sixty_F;
    Eighty_sixty_G; Eighty_sixty_H; Eighty_sixty_I;
    Eighty_sixty_J];


% RPM 100 , Power 80
oneHund_eighty_B =  [SubB_NormIntMatrix(113:140,400:699); SubB_NormIntMatrix(281:308, 400:699); SubB_NormIntMatrix(505:532,400:699)];
oneHund_eighty_C =  [SubC_NormIntMatrix(225:252,400:699); SubC_NormIntMatrix(365:392, 400:699); SubC_NormIntMatrix(561:588,400:699)];
oneHund_eighty_D =  [SubD_NormIntMatrix(57:84,400:699); SubD_NormIntMatrix(393:420, 400:699); SubD_NormIntMatrix(701:728,400:699)];
oneHund_eighty_E =  [SubE_NormIntMatrix(225:252,400:699); SubE_NormIntMatrix(477:504, 400:699); SubE_NormIntMatrix(617:644,400:699)];
oneHund_eighty_F =  [SubF_NormIntMatrix(141:168,400:699); SubF_NormIntMatrix(421:448, 400:699); SubF_NormIntMatrix(533:560,400:699)];
oneHund_eighty_G =  [SubG_NormIntMatrix(1:28,400:699); SubG_NormIntMatrix(337:364, 400:699); SubG_NormIntMatrix(589:616,400:699)];
oneHund_eighty_H =  [SubH_NormIntMatrix(85:112,400:699); SubH_NormIntMatrix(449:476, 400:699); SubH_NormIntMatrix(617:644,400:699)];
oneHund_eighty_I =  [SubI_NormIntMatrix(1:28,400:699); SubI_NormIntMatrix(477:504, 400:699); SubI_NormIntMatrix(617:644,400:699)];
oneHund_eighty_J =  [SubJ_NormIntMatrix(197:224,400:699); SubJ_NormIntMatrix(337:364, 400:699); SubJ_NormIntMatrix(561:588,400:699)];

oneHund_eighty = [oneHund_eighty_B; oneHund_eighty_C;
    oneHund_eighty_D; oneHund_eighty_E; oneHund_eighty_F;
    oneHund_eighty_G; oneHund_eighty_H; oneHund_eighty_I;
    oneHund_eighty_J];



% RPM 120 , Power 100 
OneTwenty_oneHund_B =  [SubB_NormIntMatrix(29:56,400:699); SubB_NormIntMatrix(477:504, 400:699); SubB_NormIntMatrix(561:588,400:699)];
OneTwenty_oneHund_C =  [SubC_NormIntMatrix(1:28,400:699); SubC_NormIntMatrix(253:280,400:699); SubC_NormIntMatrix(673:700,400:699)];
OneTwenty_oneHund_D =  [SubD_NormIntMatrix(141:168,400:699); SubD_NormIntMatrix(337:364, 400:699); SubD_NormIntMatrix(561:588,400:699)];
OneTwenty_oneHund_E =  [SubE_NormIntMatrix(197:224,400:699); SubE_NormIntMatrix(449:476, 400:699); SubE_NormIntMatrix(729:756,400:699)];
OneTwenty_oneHund_F =  [SubF_NormIntMatrix(113:140,400:699); SubF_NormIntMatrix(449:476, 400:699); SubF_NormIntMatrix(673:700,400:699)];
OneTwenty_oneHund_G =  [SubG_NormIntMatrix(141:168,400:699); SubG_NormIntMatrix(281:308, 400:699); SubG_NormIntMatrix(505:532,400:699)];
OneTwenty_oneHund_H =  [SubH_NormIntMatrix(113:140,400:699); SubH_NormIntMatrix(309:336, 400:699); SubH_NormIntMatrix(645:672,400:699)];
OneTwenty_oneHund_I =  [SubI_NormIntMatrix(141:168,400:699); SubI_NormIntMatrix(309:336, 400:699); SubI_NormIntMatrix(533:560,400:699)];
OneTwenty_oneHund_J =  [SubJ_NormIntMatrix(169:196,400:699); SubJ_NormIntMatrix(449:476, 400:699); SubJ_NormIntMatrix(533:560,400:699)];

OneTwenty_oneHund = [OneTwenty_oneHund_B; OneTwenty_oneHund_C;
    OneTwenty_oneHund_D; OneTwenty_oneHund_E; OneTwenty_oneHund_F;
    OneTwenty_oneHund_G; OneTwenty_oneHund_H; OneTwenty_oneHund_I;
    OneTwenty_oneHund_J];


% RPM 140 , Power 140
oneForty_oneForty_B =  [SubB_NormIntMatrix(197:224,400:699); SubB_NormIntMatrix(421:448, 400:699); SubB_NormIntMatrix(673:700,400:699)];
oneForty_oneForty_C =  [SubC_NormIntMatrix(57:84,400:699); SubC_NormIntMatrix(393:420, 400:699); SubC_NormIntMatrix(645:672,400:699)];
oneForty_oneForty_D =  [SubD_NormIntMatrix(197:224,400:699); SubD_NormIntMatrix(421:448, 400:699); SubD_NormIntMatrix(645:672,400:699)];
oneForty_oneForty_E =  [SubE_NormIntMatrix(85:112,400:699); SubE_NormIntMatrix(421:448, 400:699); SubE_NormIntMatrix(645:672,400:699)];
oneForty_oneForty_F =  [SubF_NormIntMatrix(169:196,400:699); SubF_NormIntMatrix(477:504, 400:699); SubF_NormIntMatrix(617:644,400:699)];
oneForty_oneForty_G =  [SubG_NormIntMatrix(225:252,400:699); SubG_NormIntMatrix(253:280, 400:699); SubG_NormIntMatrix(561:588,400:699)];
oneForty_oneForty_H =  [SubH_NormIntMatrix(29:56,400:699); SubH_NormIntMatrix(477:504, 400:699); SubH_NormIntMatrix(673:700,400:699)];
oneForty_oneForty_I =  [SubI_NormIntMatrix(85:112,400:699); SubI_NormIntMatrix(393:420, 400:699); SubI_NormIntMatrix(561:588,400:699)];
oneForty_oneForty_J =  [SubJ_NormIntMatrix(141:168,400:699); SubJ_NormIntMatrix(393:420, 400:699); SubJ_NormIntMatrix(729:756,400:699)];

oneForty_oneForty = [oneForty_oneForty_B; oneForty_oneForty_C;
    oneForty_oneForty_D; oneForty_oneForty_E; oneForty_oneForty_F;
    oneForty_oneForty_G; oneForty_oneForty_H; oneForty_oneForty_I;
    oneForty_oneForty_J];

global_matrices = {Sixty_thirtyFive, Sixty_ninety, Sixty_oneSevenFive,Sixty_twoTen,Sixty_twoSixty,Eighty_sixty,oneHund_eighty,OneTwenty_oneHund,oneForty_oneForty};



% CODICE MATLAB PER LA GENERAZIONE DEI PLOT DELLE FORZE DI CONTATTO TRA LA
% SFERA E LE DITA NEL CASO DI GRIPPER ADATTIVO

clear,clc,close all

%% import dei file .csv per il caso con k = 2.115

inferior1_k_low = "C:\Users\utente\Desktop\RODS INF K 2.115\Contact_gommino_medium_ball_rods_inf_1.csv";
superior1_k_low = "C:\Users\utente\Desktop\RODS SUP K 2.115\Contact_gommino_medium_ball_rods_sup_1.csv";

inferior2_k_low = "C:\Users\utente\Desktop\RODS INF K 2.115\Contact_gommino_medium_ball_rods_inf_2.csv";
superior2_k_low = "C:\Users\utente\Desktop\RODS SUP K 2.115\Contact_gommino_medium_ball_rods_sup_2.csv";

inferior3_k_low = "C:\Users\utente\Desktop\RODS INF K 2.115\Contact_gommino_medium_ball_rods_inf_3.csv";
superior3_k_low = "C:\Users\utente\Desktop\RODS SUP K 2.115\Contact_gommino_medium_ball_rods_sup_3.csv";



%% lettura dei file .csv

data_inf_1_k_low = readmatrix(inferior1_k_low);
data_inf_2_k_low = readmatrix(inferior2_k_low);
data_inf_3_k_low = readmatrix(inferior3_k_low);

data_sup_1_k_low = readmatrix(superior1_k_low);
data_sup_2_k_low = readmatrix(superior2_k_low);
data_sup_3_k_low = readmatrix(superior3_k_low);

%% estrazione dei dati
time_inf_1 = data_inf_1_k_low(:,1);
force_inf_1 = data_inf_1_k_low(:,2);

time_sup_1 = data_sup_1_k_low(:,1);
force_sup_1 = data_sup_1_k_low(:,2);

time_inf_2 = data_inf_2_k_low(:,1);
force_inf_2 = data_inf_2_k_low(:,2);

time_sup_2 = data_sup_2_k_low(:,1);
force_sup_2 = data_sup_2_k_low(:,2);

time_inf_3 = data_inf_3_k_low(:,1);
force_inf_3 = data_inf_3_k_low(:,2);

time_sup_3 = data_sup_3_k_low(:,1);
force_sup_3 = data_sup_3_k_low(:,2);

%% generazione della figura con 3 subplot
figure;

subplot(3,1,1)
plot(time_inf_1, force_inf_1, 'b', 'LineWidth', 0.8)
hold on
plot(time_sup_1, force_sup_1, 'r', 'LineWidth', 0.8)
hold off
grid on
title('Medium Ball - Finger 1')
xlabel('Time [s]')
ylabel('Contact Force [N]')
legend('Lower Phalanx', 'Upper Phalanx')

subplot(3,1,2)
plot(time_inf_2, force_inf_2, 'b', 'LineWidth', 0.8)
hold on
plot(time_sup_2, force_sup_2, 'r', 'LineWidth', 0.8)
hold off
grid on
title('Medium Ball - Finger 2')
xlabel('Time [s]')
ylabel('Contact Force [N]')
legend('Lower Phalanx', 'Upper Phalanx')

subplot(3,1,3)
plot(time_inf_3, force_inf_3, 'b', 'LineWidth', 0.8)
hold on
plot(time_sup_3, force_sup_3, 'r', 'LineWidth', 0.8)
hold off
grid on
title('Medium Ball - Finger 3')
xlabel('Time [s]')
ylabel('Contact Force [N]')
legend('Lower Phalanx', 'Upper Phalanx')

% COMMENTI
% upper e lower fa riferimento vedendo la classica configurazione del
% gripper. 





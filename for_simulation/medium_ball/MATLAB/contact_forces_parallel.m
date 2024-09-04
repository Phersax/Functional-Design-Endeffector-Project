% CODICE MATLAB PER LA GENERAZIONE DEI PLOT DELLE FORZE DI CONTATTO TRA LA
% SFERA E LE DITA NEL CASO DI GRIPPER PARALLELO

clear, clc, close all

filename1 = "C:\Users\Francesco Stasi\OneDrive - Politecnico di Bari\UNI_Functional_desing\Functional-Design-Endeffector-Project\for_simulation\small_ball\csv-parallelo\fingerA.csv";
filename2 = "C:\Users\Francesco Stasi\OneDrive - Politecnico di Bari\UNI_Functional_desing\Functional-Design-Endeffector-Project\for_simulation\small_ball\csv-parallelo\fingerB.csv";
filename3 = "C:\Users\Francesco Stasi\OneDrive - Politecnico di Bari\UNI_Functional_desing\Functional-Design-Endeffector-Project\for_simulation\small_ball\csv-parallelo\fingerC.csv";

data1 = readmatrix(filename1);
data2 = readmatrix(filename2);
data3 = readmatrix(filename3);

time1 = data1(:,1);
contact_force1 = data1(:,2);

time2 = data2(:,1);
contact_force2 = data2(:,2);

time3 = data3(:,1);
contact_force3 = data3(:,2);

% Calcolo del valore medio della forza di contatto in intervalli di 2 secondi
interval = 2; % Intervallo di 2 secondi

% Funzione per calcolare i valori medi
calculate_average = @(time, force) arrayfun(@(i) mean(force(time >= i & time < i + interval)),min(time):interval:max(time));

% Calcolo dei valori medi per ciascun dito
average_force1 = calculate_average(time1, contact_force1);
average_force2 = calculate_average(time2, contact_force2);
average_force3 = calculate_average(time3, contact_force3);

% Creazione di un nuovo asse temporale per i valori medi
time_average1 = min(time1):interval:max(time1);
time_average2 = min(time2):interval:max(time2);
time_average3 = min(time3):interval:max(time3);

% Plot dei valori reali e medi in un'unica figura
figure(1)

subplot(3,1,1)
plot(time1, contact_force1, 'b', 'LineWidth', 0.8)
hold on
plot(time_average1, average_force1, 'LineWidth', 1.2, 'Color', 'r')
hold off
grid on
title('Medium Ball - Finger 1')
xlabel('Time [s]')
ylabel('Contact Force [N]')
legend('Experimental Contact Force', 'Average Contact Force')

subplot(3,1,2)
plot(time2, contact_force2, 'b', 'LineWidth', 0.8)
hold on
plot(time_average2, average_force2, 'LineWidth', 1.2, 'Color', 'r')
hold off
grid on
title('Medium Ball - Finger 2')
xlabel('Time [s]')
ylabel('Contact Force [N]')
legend('Experimental Contact Force', 'Average Contact Force')

subplot(3,1,3)
plot(time3, contact_force3, 'b', 'LineWidth', 0.8)
hold on
plot(time_average3, average_force3, 'LineWidth', 1.2, 'Color', 'r')
hold off
grid on
title('Medium Ball - Finger 3')
xlabel('Time [s]')
ylabel('Contact Force [N]')
legend('Experimental Contact Force', 'Average Contact Force')

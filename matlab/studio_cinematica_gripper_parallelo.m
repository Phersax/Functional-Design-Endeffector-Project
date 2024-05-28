clc; 
clear all; 
close all;

% Costanti
v1_hat = 6.87;   % distanza palmo dall'origine
v2 = 13.5;  % modulo del vettore 2
v3 = 14.3;  % modulo del vettore 3
v4 = 27;    % modulo del vettore 4
v5 = 42.62; % modulo del vettore 5
v6 = 7.75;  % modulo del vettore 6
v7 = v4;    % modulo delvettore 7
v8 = 44.59; % modulo del vettore 8

% Intervallo di altezza
v1_hat_hat_increase = linspace(-1.79, 11.2, 100);
v1_hat_hat_decrement = linspace(11.2, -1.79, 100);
v1_hat_hat_values = [v1_hat_hat_increase, v1_hat_hat_decrement(2:end)];

% Plotting iniziale
figure;
hold on;
xlabel('Asse reale');
ylabel('Asse immaginario');
title('Meccanismo gripper parallelo');
grid on;

for v1_hat_hat = v1_hat_hat_values
    cla;
    % Solutore sistema non lineare
    fun1 = @(x)nonlinsys1(x,v1_hat,v1_hat_hat,v2,v3); % equazione di chiusura
    x_01 = [112,265]; % soluzione di partenza
    x1 = fsolve(fun1, x_01); % vettore delle soluzioni [x1(1) = beta, x1(2) = gamma]

    fun2 = @(x)nonlinsys2(x,v5,v6,v8); % equazione di chiusura
    x_02 = [96,116]; % soluzione di partenza
    x2 = fsolve(fun2, x_02); % vettore delle soluzioni [x2(1) = delta, x2(2) = theta]

    % Calcolo delle coordinate dei vettori v1, v2, v3, v4, v5, v6, v7, v8

    v2_x = v2 * cosd(x1(1));
    v2_y = v2 * sind(x1(1));

    v3_x = v3 * cosd(x1(2));
    v3_y = v3 * sind(x1(2));

    v4_x = v4 * cosd(x1(1));
    v4_y = v4 * sind(x1(1));

    v5_x = v5 * cosd(x2(1));
    v5_y = v5 * sind(x2(1));

    v6_x = v6;
    v6_y = 0;

    v7_x = v7 * cosd(x1(1));
    v7_y = v7 * sind(x1(1));

    v8_x = v8 * cosd(x2(2));
    v8_y = v8 * sind(x2(2));

    % Plotting v1, v2, v3, v4, v5, v6, v7, v8
    quiver(0, 0, -v1_hat, 0, 'AutoScale', 'off','Linewidth',1.3); % v1_hat
    quiver(-v1_hat,0,0,v1_hat_hat,'AutoScale', 'off','Linewidth',1.3); % v1_hat_hat
    quiver(0, 0, v2_x, v2_y, 'AutoScale', 'off','Linewidth',1.3); % v2
    quiver(v2_x, v2_y, v3_x, v3_y, 'AutoScale', 'off','Linewidth',1.3); % v3
    quiver(0, 0, v4_x, v4_y, 'AutoScale', 'off','Linewidth',1.3); % v4
    quiver(v4_x, v4_y, v5_x, v5_y, 'AutoScale', 'off','Linewidth',1.3); % v5
    quiver(0, 0, v6_x, v6_y, 'AutoScale', 'off','Linewidth',1.3); % v6
    quiver(v6_x, v6_y, v7_x, v7_y, 'AutoScale', 'off','Linewidth',1.3); % v7
    quiver(v7_x+v6_x, v7_y+v6_y, v8_x, v8_y, 'AutoScale', 'off','Linewidth',1.3); % v8
    % Linea collineare all'albero motore (linea di finecorsa)
    x_value = -v1_hat-11.18; % dall'origine mi distanzio della base più la distanza dal foro centrale sull'elevatore
    y_limits = ylim; % Prendo i limiti dell'asse y
    line([x_value, x_value], y_limits, 'LineStyle', '--');

    axis equal;

    % Aggiungi la legenda
    legend('v1__hat','v1__hat__hat', 'v2', 'v3', 'v4', 'v5', 'v6', 'v7', 'v8')

    % Imposta i limiti degli assi per zoommare sul vettore v1
    xlim([-25,30]);
    ylim([-5, 70]);

    drawnow; % Aggiorna il plot ad ogni iterazione
end

%% Functions

% equazioni di chiusura meccanismo gripper parallelo

function F = nonlinsys1(x,v1_hat,v1_hat_hat,v2,v3)
    F(1) = -v1_hat - v2*cosd(x(1)) - v3*cosd(x(2));
    F(2) = v1_hat_hat - v2*sind(x(1)) - v3*sind(x(2));
end

function F = nonlinsys2(x,v5,v6,v8)
    F(1) = v5*cosd(x(1)) - v6 - v8*cosd(x(2));
    F(2) = v5*sind(x(1)) - v8*sind(x(2));
end

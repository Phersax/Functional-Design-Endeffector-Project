% ----------- CODICE MATLAB PER L'ANALISI DI POSIZIONE DEL GRIPPER
% ----------- PARALLELO PROGETTATO PER IL TEMA D'ANNO.

% L'analisi di posizione è fatta tramite il metodo dell'equazione di
% chiusura, al fine di determinare la variazione degli angoli beta e gamma
% in funzione della variazione dell'angolo alpha.

clc; 
clear all; 
close all;

% Costanti
b = 0.1; % distanza palmo dall'origine
v2 = 0.135; % modulo vettore 2
v3 = 0.15; % modulo vettore 3


% Intervallo di altezza
h_values = linspace(0.05, 0.2, 20);

% Plotting iniziale
figure;
hold on;
xlabel('Asse reale');
ylabel('Asse immaginario');
title('Meccanismo gripper parallelo');
grid on;

for h = h_values
    %cla;
    v1 = sqrt(h^2 + b^2); % modulo vettore 1
    alpha_r = pi/2 + acos(h/v1); % fase vettore 1 in radianti
    alpha_d = rad2deg(alpha_r); % fase vettore 1 in gradi

    % Solutore sistema non lineare
    fun = @(x)nonlinsys(x,v1,v2,v3,alpha_d); % equazione di chiusura
    x_0 = [0,0]; % soluzione di partenza
    options = optimoptions('fsolve','Display','off');
    x = fsolve(fun, x_0,options); % vettore delle soluzioni [x(1) = beta, x(2) = gamma]

    % Calcolo delle coordinate di v1, v2 e v3
    v1_x = v1 * cosd(alpha_d);
    v1_y = v1 * sind(alpha_d);

    v2_x = v2 * cosd(x(1));
    v2_y = v2 * sind(x(1));

    v3_x = v3 * cosd(x(2));
    v3_y = v3 * sind(x(2));
    
    % Plotting v1, v2 e v3
    quiver(0, 0, v1_x, v1_y, 'r', 'AutoScale', 'off'); % v1
    quiver(0, 0, v2_x, v2_y, 'g', 'AutoScale', 'off'); % v2
    quiver(v2_x, v2_y, v3_x, v3_y, 'b', 'AutoScale', 'off'); % v3
    axis equal;
    % Aggiungi la legenda
    legend('v1', 'v2', 'v3');

    % Imposta i limiti degli assi per zoommare sul vettore v1
    xlim([-0.15, 0.1]);
    ylim([0, 0.25]);

    drawnow; % Aggiorna il plot ad ogni iterazione
    
end

%% Funcitons

% equazione di chiusura meccanismo gripper parallelo
function F = nonlinsys(x,v1,v2,v3,alpha_d)
    F(1) = v1*cosd(alpha_d) - v2*cosd(x(1)) - v3*cosd(x(2));
    F(2) = v1*sind(alpha_d) - v2*sind(x(1)) - v3*sind(x(2));
end



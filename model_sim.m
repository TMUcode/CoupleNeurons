function [X] = model_sim(delta1, delta2, d1, d2)
% The following function simulates a pair of coupled lambda-omega oscillators.

% Output:
%   X = [x1; y1; x2; y2]

% Input:
%   noise intensity of oscillator 1: delta1
%   noise intensity of oscillator 2: delta2
%   coupling strength for oscillator 1: d1
%   coupling strength for oscillator 2: d2

% Time parameters
dt = 0.01;              % Time step
t_end = 100;            % Duration of simulation
t = (0:dt:t_end);       % Time domain

% Model parameters
lam = -1;       % lambda_0; control parameter
alp = -0.2;     % alpha
gam = -0.2;     % gamma
om0 = 2;        % omega_0
om1 = 0;        % omega_1

% Empty variables for output
X = zeros(4, length(t));

% Model simulation
X(:, 1) = 0.08 * randn(1, 4);   % Small random initial conditions
noise = randn(2, length(t));    % Vector of noise

for k = 2:length(t) % Iterate over the discrete time domain
    rsq = [X(1, k-1)^2 + X(2, k-1)^2; X(3, k-1)^2 + X(4, k-1)^2];

    % E-M method simulation
    X(:, k) = [ % Oscillator 1
        X(1, k-1) + ((lam + alp*rsq(1) + gam*rsq(1)^2) * X(1, k-1) - ...
        (om0 + om1*rsq(1)) * X(2, k-1) + d1 * (X(3, k-1) - X(1, k-1))) * dt + ...
        delta1 * sqrt(dt) * noise(1, k-1);
        X(2, k-1) + ((om0 + om1*rsq(1)) * X(1, k-1) + ...
        (lam + alp*rsq(1) + gam*rsq(1)^2) * X(2, k-1) + d1 * (X(4, k-1) - X(2, k-1))) * dt;

        % Oscillator 2
        X(3, k-1) + ((lam + alp*rsq(2) + gam*rsq(2)^2) * X(3, k-1) - ...
        (om0 + om1*rsq(2)) * X(4, k-1) + d2 * (X(1, k-1) - X(3, k-1))) * dt + ...
        delta2 * sqrt(dt) * noise(2, k-1);
        X(4, k-1) + ((om0 + om1*rsq(2)) * X(3, k-1) + ...
        (lam + alp*rsq(2) + gam*rsq(2)^2) * X(4, k-1) + d2 * (X(2, k-1) - X(4, k-1))) * dt;
    ];
end % End for loop
end % End function

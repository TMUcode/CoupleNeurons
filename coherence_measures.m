% Coherence Measure Computation Script
% This script computes the coherence measure (measures of PS) for the
% 'model_sim' and 'phase_calc' functions.

% Number of simulations
N = 1;

% Time parameters
dt = 0.001;                  % Timestep
t_end = 0.001 * 100000;      % Total number of points in time
t = (0:dt:t_end);            % Time domain
t0 = 15000;                  % Index of the first time instant used

% Model simulation parameters
d1 = 0.5;  % Coupling strength for oscillator 1
d2 = 0.01;  % Coupling strength for oscillator 2

% Vector of noise strengths (CHANGE AS NEEDED)
delta1_vec = [0.0001, 0.001, 0.005, 0.01, 0.02, 0.03, 0.05, 0.06, 0.07, 0.1, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.55];
delta2_vec = [0.00001, 0.0001, 0.001, 0.005, 0.01, 0.02, 0.03, 0.05, 0.07, 0.1, 0.15, ...
    0.25, 0.35, 0.45, 0.55, 0.7, 0.9, 1, 1.3, 1.7, 1.9, 2.1, 2.3, 3, 4, 5];

% Initialize matrices for results
R = zeros(length(delta1_vec), length(delta2_vec));
avg_abs_pdiff = zeros(length(delta1_vec), length(delta2_vec));
s = zeros(length(delta1_vec), length(delta2_vec));

for iter1 = 1:length(delta1_vec)        % Iterate over delta_1_vec
    delta1 = delta1_vec(iter1);         % Set delta1
    
    for iter2 = 1:length(delta2_vec)    % Iterate over delta_2_vec
        delta2 = delta2_vec(iter2);     % Set delta2
        for n = 1:N                     % Iterate over the number of simulations
            
            phase_calc;            % Compute the phase and simulate the model
            
            % Compute average phase difference
            avg_abs_n(n) = mean(abs(pdiff));    % Average absolute phase difference per iteration.
            
            % Compute R (coherence measure)
            r(n) = sqrt((mean(sin(pdiff)))^2 + (mean(cos(pdiff)))^2);
        end
        
        % Compute average R and average absolute phase difference per noise ratio
        R(iter1, iter2) = mean(r);
        avg_abs_pdiff(iter1, iter2) = mean(avg_abs_n);     % Average absolute phase difference per noise ratio.
        s(iter1, iter2) = std(avg_abs_n);

    end
end

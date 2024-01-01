% arbitrary function inputs
delta1 = 0.01;
d1 = 0.05;
d2 = 0.05;
delta2 = 0.00001;
X = model_sim(delta1, delta2, d1, d2);

% time parameters
dt = 0.001;              % timestep
t_end = 0.001 * 100000;  % 100000 is the number of points
t = (0:dt:t_end);        % time domain
t0 = 1500;               % first time instant used

% compute phase in the usual way
p1 = atan2(X(2, :), X(1, :)); % phase of oscillator 1
p2 = atan2(X(4, :), X(3, :)); % phase of oscillator 2

% unwrap phase (UNCOMMENT IF PHASE SHOULD BE UNWRAPPED; ADJUST TO FIT SIMUL.)
% % compute the averaged instantaneous frequency of both oscillators.
% f = 0.5 * (diff(p1) + diff(p2)) / dt;
%
% % frequency thresholds
% thresh = quantile(abs(f), 0.995);
% c = find(f >= thresh);
% ind = find(diff(c) >= 2000);
%
% % intervals which will not be unwrapped
% int = sort([0, c(1), c(ind), c(ind+1), c(end), length(p1) + 1]);
%
% for i = 1:length(int)/2
%     j = 2*i - 1;
%     p1(int(j) + 1 : int(j + 1) - 1) = unwrap(p1(int(j) + 1 : int(j + 1) - 1));
%     p2(int(j) + 1 : int(j + 1) - 1) = unwrap(p2(int(j) + 1 : int(j + 1) - 1));
%
%     % fix drift
%     if mean(p1(int(j) + 1:int(j + 1) - 1) - p2(int(j) + 1:int(j + 1) - 1)) >= 5
%         p2(int(j) + 1:int(j + 1) - 1) = p2(int(j) + 1:int(j + 1) - 1) + ...
%             mean(abs(p1(int(j) + 1:int(j + 1) - 1) - p2(int(j) + 1:int(j + 1) - 1)));
%
%     elseif  mean(p2(int(j) + 1:int(j + 1) - 1) - p1(int(j) + 1:int(j + 1) - 1)) >= 5
%         p1(int(j) + 1:int(j + 1) - 1) = p1(int(j) + 1:int(j + 1) - 1) + ...
%             mean(abs(p1(int(j) + 1:int(j + 1) - 1) - p2(int(j) + 1:int(j + 1) - 1)));
%     end
% end

% compute phase difference and normalize (we do this because we use the atan2 function)
% phase difference output
pdiff = (0.5 * (p1 - p2));
pdiff = pdiff(t0:end);  % without transient time

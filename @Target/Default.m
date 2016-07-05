function o = Default( o, CLOCK ,ENVIRONMENT, iTarget, sRandom)

sRandom; % random seed

% default setting for targets
% input : empty Target Class
%
% output : set Target Class

% InfoTech Version : consider states with bias,
% Target also has dynamics with constant velocity.


o.id = iTarget;
o.Ft = blkdiag([1 CLOCK.dt; 0 1],[1 CLOCK.dt; 0 1]);

o.Gt = [0.5*CLOCK.dt^2             0   ;
            CLOCK.dt               0   ;
                   0    0.5*CLOCK.dt^2 ;
                   0        CLOCK.dt  ]; % only for target part (beware that w/o bias!)
               
 
o.Gu = zeros(2); % 2 state - 2 state

% moving, randomized location within given environment
o.x = [ENVIRONMENT.xlength(1)+(ENVIRONMENT.xlength(2)-ENVIRONMENT.xlength(1))*rand(1);...
                                                                           10*rand(1);...
       ENVIRONMENT.ylength(1)+(ENVIRONMENT.ylength(2)-ENVIRONMENT.ylength(1))*rand(1);...
                                                                           10*rand(1)];
       
o.hist.x = o.x; % store initial condition
o.hist.stamp = 0; % store initialized time

o.Qt = diag([1; 1]); 

o.plot.statecolor = rand(1,3);
o.plot.marker = ['^';'x']; % start; end
o.plot.markersize = 10;
o.plot.linewidth = 3;

o.plot.legend = [{strcat('Target ',num2str(o.id))},...
    {strcat('Target ',num2str(o.id),' start')},...
    {strcat('Target ',num2str(o.id),' end')}];
    
end
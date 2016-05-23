classdef Agent < handle
    properties ( SetAccess = public, GetAccess = public )
        
        id      % Agent id (integers)        
        
        TA      % Task Allocation Class (sub-class of agent)
        COMM    % Communication Class (sub-class of agent)
        
        DYNAMICS% Dynamics Class (sub-class of agent)
        MEASURE % Measurement Class (usb-class of agent)
        CONTROL % Control Class (sub-class of agent)
        
        FDDF    % Factorized DDF Class
       
        ESTIMATOR % Estimator Class (super class of KF, EKF..)
        LOCAL_KF % KF Estimation Class (sub-class of agent)
        DECEN_KF % KF Estimation Class (sub-class of agent)
        FDDF_KF % Factorized DDF based KF Estimation Class 
        
        hist    % History
        plot    % Plot handle
        
    end % Properties
    
    methods
        function o = Agent( TARGET, ENVIRONMENT, SIMULATION, CLOCK ,iAgent )
             o = Default(o, TARGET, ENVIRONMENT, SIMULATION, CLOCK ,iAgent );
        end
        
        o = get( o, varargin );
    end
    
end




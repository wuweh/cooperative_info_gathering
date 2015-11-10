classdef Measurement < handle
    properties % ( SetAccess = public, GetAccess = public )
        
        y       % measurement [e_rel,n_rel,e_abs,n_abs]
        
        Hp      % Ownship sensor measurement matrix (agent part)
        Ht      % Ownship sensor measurement matrix (target part)
        Hb      % Ownship sensor measurement matrix (target bias part) 
        
        rt      % Random variable wrt target-agent relation
        
        Rp      % platform measurement noise variances
        Rt      % platform to target measurement noise variances (CELL FORM :: [# of target]*[2x2 array])
                
        hist    % History 
        plot    % Plot handle
        
    end % Properties
    
    methods
        function o = Measurement( TARGET, CLOCK, iAgent )
             o = Default(o, TARGET, CLOCK, iAgent );
        end
        
        o = get( o, varargin );
    end
    
end




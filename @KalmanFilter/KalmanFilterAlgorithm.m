function o = KalmanFilterAlgorithm( o, SIMULATION, AGENT, option )

o.Y = [];

switch (option)
    case 'central'
        for iAgent = 1 : length(AGENT)
            o.Y = [o.Y;AGENT(iAgent).MEASURE.y];
        end
    case 'local'        
            o.Y = [o.Y;AGENT.MEASURE.y];
    case 'decentral'
        for iAgent = 1 : SIMULATION.nAgent
            if AGENT.id == iAgent % if index is the agent itself
                o.Y = [o.Y;AGENT.MEASURE.y];
            else
                o.Y = [o.Y;AGENT.COMM.Z(iAgent).y];
            end
        end
end
    
%%Prediction
Xbar = o.F*o.Xhat; % no input matrix.
Pbar = o.F*o.Phat*o.F' + o.Gamma*o.Q*o.Gamma';

%%Measurement update
innov = o.Y - o.H*Xbar;
S = o.H*Pbar*o.H' + o.R;
W = Pbar*o.H' / S;

Xhat = Xbar + W*innov;
Phat = (eye(o.nState) - W*o.H)*Pbar*(eye(o.nState) - W*o.H)' + W*o.R*W';

%%Store and update
o.hist.Y(:,end+1) = o.Y;
o.hist.Xhat(:,end+1) = Xhat;
o.hist.Phat(:,:,end+1) = Phat;
o.Xhat = Xhat;
o.Phat = Phat;


end
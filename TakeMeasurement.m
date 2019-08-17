function meas = TakeMeasurement(targetState,agentState,sensorParam,property)

switch property
    case 'PosLinear'
        meas = PositionMeasurement(targetState,sensorParam);
    case 'range_bear'
        meas = RangeBearMeasurement(targetState,agentState,sensorParam);
    case 'bear'
        meas = BearMeasurement(targetState,agentState,sensorParam);
    case 'detection'
        meas = BinarySensorMeasurement(targetState,agentState,sensorParam);
end

end
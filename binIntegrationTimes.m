function [ bintimes ] = binIntegrationTimes( xdata, starttime1, endtime1, starttime2, endtime2 )
%binIntegrationTimes Outputs a row of integration limits given time data
%and integration limits (in time).

times = [starttime1, endtime1, starttime2, endtime2];
times = repmat(times,[size(xdata),1]);
xdata = repmat(xdata,[1,4]);
[~,bintimes] = min((xdata-times).^2);

end


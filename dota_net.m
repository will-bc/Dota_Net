%dota_net()
% Make statisticals measures from ping_database.m ...
% and say if secure to play or not
% Copyright (c) Willian B. C; December 18, 2017.

%% Statistical properties
% Drop Net: Percentage when the internet drop about last ... 
% hour.
%
% Delay : mean of all last hour ping (ms)
%
%Visualization: Ping response time for each trial in ...
%last hour. 



%% Drop Net

r = size(pdb,1); %total rows



idx=pdb{r,1}==0; % sum of events to ...
out=sum(idx(:)); % drop internet

tc= size(pdb{r,1},2); % total colunms  last hour

c_lh = out / tc; % percentage



if c_lh == 0 
    
    disp({'Internet apparent secure'});
    disp({'Go! Play Dota !'});
    
    
end

if c_lh < 0.01 
    
    disp({'Internet apparent secure'});
    disp({'Drops below 1 %'});
    disp({'Go! Play Dota !'});
    
end

if c_lh > 0.01 
    
    disp({'It is apparent not safe'});
    disp({'Drops above 1 %'});
    disp({'You can try ! Good luck to Play Dota!'});
    
    
end

disp({'last-hour drop net percentage:' })
disp({c_lh*100,'%'});


%% Delay

ping_mean = sum(pdb{r,1}) / size(pdb{r,1},2);

disp({'last-hour delay (ms) mean:' })
disp(ping_mean);





%% Visualization

figure;
hold on;

line= double(linspace(1,tc,tc));

plot(pdb{r,1},'*','color', 'k');
plot(line,0, 'd','color','y');
ylabel('Time (ms)');
xlabel('Trials');
title('Ping Response Time', 'color' ,'b')
legend('Blue = pings', 'Yellow = Lost pings zone', 'Location','southwest');


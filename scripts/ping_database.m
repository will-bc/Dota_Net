%pdb = Ping Database
%Creates a database (cell array) of pings according ...
%to the time it takes to execute.
% Copyright (c) Willian B. C; December 18, 2017.


%% ~ 0.183 Hz , 11 samples for minute in my computer


pdb= cell({['values'],['hour'],['day']});

while true
    
    daymonth = day(date);
    hour = datetime('now','Format','HH:mm:ss.SSS');
    [hour] = hms(hour);
    
    for i=1:size(pdb,1)
        
        if pdb{i,3}== daymonth
            
            for ii=1:size(pdb,1)
                
                
                if pdb{ii,2}== hour
                    
                    [pt]= pingmoment();
                    
                    x= size(pdb{ii,1},2)+1;
                    
                    pdb{ii,1}(x)= pt; 
                    
                end
                try
                 if  ii== size(pdb,1) & pdb{ii,2}~= hour ...
                         | isempty(pdb{ii+1,2})==1
       
                 pdb{ii+1,2}= hour;
        
                 end
       
                end
            end
            
        end
    if  i==size(pdb,1) & pdb{i,3}~= daymonth
       
        pdb{i+1,3}= daymonth;
        
    end
        
        
    end
    
    
    
 pause(5);   % Here you can change the frequency ...
             % altering the pause and use a chronometer
             % to measure. 
	

    
end



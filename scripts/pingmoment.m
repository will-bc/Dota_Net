function [pt] = pingmoment()

%pt (ping time) 
%Return the ping, if it hasn't the value of return is 0 

[~,b]=dos('ping -n 1 www.google.com');

[C,matches] = strsplit(b,{'tempo=','ms'},'CollapseDelimiters',...
false, 'DelimiterType','RegularExpression');



if isempty(matches)==1
   
    pt= 0;
    
end

if isempty(matches)==0
   
    pt= str2double(C{2});
    
end

end

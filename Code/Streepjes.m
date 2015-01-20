function [kenteken] = Streepjes( kenteken )
% Kenteken van de vormen: 99XXX9 en XX999X.
pattern25 = '([A-Z]{2})(\d{3})([A-Z]{1})|(\d{2})([A-Z]{3})(\d{1})';
kenteken = regexprep(kenteken,pattern25,'$1-$2-$3');

pattern14 = '([A-Z]{1})(\d{3})([A-Z]{2})|(\d{1})([A-Z]{3})(\d{2})';
kenteken = regexprep(kenteken,pattern14,'$1-$2-$3');
if(length(kenteken)==6)
    kenteken = sprintf('%s-%s-%s', kenteken(1:2),kenteken(3:4),kenteken(5:6));
end
end

% if(regexpi(kenteken,pattern25)==1)
%     %insert streepjes na 2 en 5
%     a = 1;
% elseif(regexpi(kenteken,pattern14)==1)
%     %insert streepjes na 1 en 4
%     b = 1;
% else
%     %insert streepjes na 2 en 4
%     c= 1;
% end
% 
% end


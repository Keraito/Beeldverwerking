p = 1;
%73,74
results = {};
for(k = 1:4:1901)
frame=read(vid,k);
kenteken = run(frame);
if length(kenteken)>1
%     if(isempty(results))
        results{p,1} = kenteken;
        results{p,2} = k;
        time = toc;
        results{p,3} = time; 
        results{p,4} = 1;
        p = p + 1;
%     else
%         if(~isempty(results) && length(results(:,1))>5)
%             marge = 5;
%         else
%             marge = length(results(:,1));
%         end
%         a = 0;
%         for(i = p-marge:p-1)
%             if(sum(char(results(i,1)) == kenteken)==8)
%                 amount = cell2mat(results(i,4)) + 1;
%                 results(i,4) = num2cell(amount);
%                 i=p-1;
%                 a=1;
%             end
%         end
%         if a == 0
%             results{p,1} = kenteken;
%             results{p,2} = k;
%             time = toc;
%             results{p,3} = time; 
%             results{p,4} = 1;
%             p = p + 1;
%         end    
%     end
% end
end
end
% results = results(:,1:3);
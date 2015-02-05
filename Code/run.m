
function [ kenteken ] = run( frame )
plate = ExtractLicensePlate(frame);
if length(plate{1})>1
    for(k = 1:length(plate))
        chars = segmentCharacters(plate{k});
        
        if length(chars)>1
             reference = imread('Characters/Reference.png');
             % begin x (note data in dip starts 0,0 matrix starts 1,1 so +1)
            lookup = [1 22 42 65 84 106 128 145 167 186 214 236 257 279 300 321 344 367 391 414 434 457 467 487 507 529 551 572 592 614 636];
            dictionary = ['B' 'C' 'D' 'F' 'G' 'H' 'J' 'K' 'L' 'M' 'N' 'P' 'R' 'S' 'T' 'V' 'W' 'X' 'Y' 'Z' '0':'9'];
            nummerbord = matchCharacters(chars, reference, lookup, dictionary);

            kenteken{k} = Streepjes(nummerbord);
        else
            kenteken{k} = 0;
        end
        
    end
else
    kenteken{1} = 0;
end
end
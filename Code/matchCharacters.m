function [ characters ] = matchCharacters( labels, reference, lookup, dictionary )
    % Measure min and max coordinates of the labeled objects.
    msr = measure(labels,[],{'Minimum','Maximum'},[],Inf,0,0);
    % data layout: [ labelID  minimumX  maximumX  minimumY maximumY ]
    data = [ [msr.ID]' [msr.Minimum(1,:)]' [msr.Maximum(1,:)]' [msr.Minimum(2,:)]' [msr.Maximum(2,:)]' ];
    % Sort the matrix by ascending minimum X value, because we read the 
    % license plates from left to right.
    data = sortrows(data, 2); 
    n = data(:,1); % The order in which the labels should be viewed
    % NOTE: please remove for-loops if possible !!!!!
    f = labels > 0;
    sample = uint8(~f); % ~f because the character should be black, background white as is our reference
    characters = '';
    correlations = zeros(size(dictionary));
    for i = 1:length(n)
        xRange = (data(i,2):data(i,3)) +1;
        yRange = (data(i,4):data(i,5)) +1;
        for j = 1:length(dictionary)
           refChar = rgb2gray(reference(1:33,lookup(j):lookup(j+1)-1,:));
           scaledSample = imresize(sample(yRange,xRange,:), size(refChar));
           correlations(j) = corr2(scaledSample, refChar);
        end
        [~, index] = max(correlations);
        characters = strcat(characters, dictionary(index));
    end
    
end


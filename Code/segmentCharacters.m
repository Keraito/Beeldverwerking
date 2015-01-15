function [ result ] = segmentCharacters( image )
    smooth = uint8(medif(image,3,'elliptic')); %Remove noise
    r = laplace(rgb2gray(smooth)); % find edges
    b = r > 2; % threshold on edges
    cl = closing(b,3,'elliptic'); % close the gaps
    lbl = label(cl,Inf,50,0);
    msr = measure(lbl,[],{'Size','CartesianBox'},[],Inf,0,0);
    % Data = [ ID  CartesianBox-DimX  CartesianBox-DimY  Size(Area) ]
    data = [ msr.ID' msr.CartesianBox(1,:)' msr.CartesianBox(2,:)' msr.Size' ]; % for sorting
    med = median(data(:,2:4));
    result = abs(bsxfun(@minus, data(:,2:4), med));
    result = (sum(result') / 3)';
    [s i] = sort(max(result,[],2));
    needed_labels = i(1:6); % because only 6 characters on numberplate
    regions = uint8(lbl & 0);
    for j = needed_labels'
        %ui = uint8(lbl);
       regions = regions + j*(lbl == j);
    end
    result = uint8(regions);
end
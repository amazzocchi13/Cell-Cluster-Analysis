clear
k = table;
n = 3;
d = 'h-pos';

for j = 1:n
    filename = strcat(d,'-',num2str(j),'.jpg');
    imfile{j} = filename;
end


for i = 1:n
% Importing and editing image
image = imread(imfile{i}); % Import image
image = im2bw(image); % Convert from gray scale to binary 
image = imcomplement(image); % make complement image
image = imfill(image,'holes'); % fill holes
image = bwareafilt(image,[800 80000]); % exlcude small clusters, change to 800, 80000 for H&L

% Identifying clusters
s = regionprops(image,'Area','Circularity');
s = struct2table(s);
k = [k;s];
end



% Area
%meanArea = mean(k.Area);
%medianArea = median(k.Area);
%stdArea = std(k.Area);
%stderrorArea= std(k.Area)/sqrt(length);

%Circularity = k.Circularity; 

% Circularity 
%meanCircularity = mean(k.Circularity)
%stdCircularity = std(k.Circularity)
%stderrorCirculatiry= std(k.Circularity)/sqrt(length)


%boxplot(newArea)


















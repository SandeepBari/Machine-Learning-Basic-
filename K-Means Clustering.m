clear all;
close all; 
clc;

load fisheriris;

x = meas(:,3:4);
k = 3;
max_it = 10;
centroids = zeros(k,size(x,2));
rand_id = randperm(size(x,1));
centroids = x(rand_id(1:k),:);

for i = i:max_it
    indices = zeros(size(x,1), 1);
    for i = 1:150
        cluster_no = 1;
        min_dist = sum((x(i, :) - centroids(1, :)).^2);
        for j = 2:k
            dist = sum((x(i, :) - centroids(j, :)).^2);
            if(dist < min_dist)
                min_dist  = dist;
                cluster_no = j;
            end
        end
    indices(i) = cluster_no;
    end
    [m, n] = size(x);
    centroids = zeros(k, n);
    for i = 1:k
        xi = x(indices==i, :);
        ck = size(xi, 1);
        centroids(i, :) = (1/ck) * [sum(xi(:,1)) sum(xi(:,2))];
    end
end

j = 1;
for i = 1:length(indices)
    plot(x(j, 1) , x(j, 2) , 'r+', 'MarkerSize', indices(i)*4);
    hold on;
    j = j + 1;
end

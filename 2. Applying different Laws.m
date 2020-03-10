I = imread('a2.jpg');
H = rgb2gray(I);
I = rgb2gray(I);    

[a, b] = size(I);

arr1 = zeros(1, 256);
count1 = 0;
for ct = 1:256
    for i = 1:a
        for j = 1:b
            if I(i, j) == ct - 1
                count1 = count1 + 1;
            end
        end
    end
    arr1(ct) = count1;
    count1 = 0;
end

figure, bar(0:255, arr1);

gamma = 'Provide the value of gamma: ';
Y = input(gamma); %taking an user input value of gamma
C1 = 1.5;
R = im2double(I);
S = C1 * ( R .^Y); 

arr2 = zeros(1, 10);
count2 = 0;
left2 = 0.0;
right2 = 0.05;
for ct = 1:20
    for i = 1:a
        for j = 1:b
            if S(i, j) >= left2 && S(i, j) <= right2
                count2 = count2 + 1;
            end
        end
    end
    left2 = right2;
    right2 = right2  + 0.05;
    arr2(ct) = count2;
    count2 = 0;
end

figure, bar(arr2, .1);

threshold = 'Provide the threshold value: ';
A = input(threshold);
BB = 0;
[x, y] = size(H);

for i = 1:x
    for j = 1:y
        if I(i, j) < A
            BB = H(i, j);
            BB = BB + BB * .5;
            if BB >= 255
                H(i, j) = 255;
            else
                H(i, j) = BB;
            end
        else
            BB = H(i, j);
            BB = BB - BB * .25;
            if BB <= 0
                H(i, j) = 0;
            else
                H(i, j) = BB;
            end
        end   
           
    end
end

arr3 = zeros(1, 256);
count3 = 0;
for ct = 1:256
    for i = 1:a
        for j = 1:b
            if H(i, j) == ct - 1
                count3 = count3 + 1;
            end
        end
    end
    arr3(ct) = count3;
    count3 = 0;
end

figure, bar(0:255, arr3);

C2 = 1.9;
G = C2 * log(1 + R);

arr4 = zeros(1, 10);
count4 = 0;
left4 = 0.0;
right4 = 0.05;
for ct = 1:20
    for i = 1:a
        for j = 1:b
            if G(i, j) >= left4 && G(i, j) <= right4
                count4 = count4 + 1;
            end
        end
    end
    left4 = right4;
    right4 = right4 + .05;
    arr4(ct) = count4;
    count4 = 0;
end

figure, bar(arr4, 0.1);


N = 255 - I;

arr5 = zeros(1, 256);
count5 = 0;
for ct = 1:256
    for i = 1:a
        for j = 1:b
            if N(i, j) == ct - 1
                count5 = count5 + 1;
            end
        end
    end
    arr5(ct) = count5;
    count5 = 0;
end

figure, bar(0:255, arr5);

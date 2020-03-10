img1 = imread('bean1.jpg');
img2 = imread('bean2.jpg');

figure, imshow(img1);
figure, imshow(img2);

[rows, columns, color] = size(img1);

blank_image = uint8(zeros(rows, columns, color));

division=columns/5;
left=1;
right=n;

for t = 1:3     
    for i = 1:5
        if mod(i, 2) ~= 0
            blank_image(:, left:right) = img1(:, left:right);
            left=left+division;
            right=right+division;        
        else            
            blank_image(:, left:right) = img2(:, left:right);
            left=left+division;
            right=right+division;
        end 
    end    
end

figure, imshow(uint8(blank_image));

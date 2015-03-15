function [result, row_offset, column_offset]=transform_image(M, input)
%

input_rows = size(input, 1);
input_columns = size(input, 2);

p1 = M*[1;1;1];
p2 = M*[input_rows;1;1];
p3 = M*[input_rows;input_columns;1];
p4 = M*[1;input_columns;1];

min_rows = ceil(max([p1(1), p4(1)]));
max_rows = floor(min([p2(1), p3(1)]));
min_columns = ceil(max([p1(2), p2(2)]));
max_columns = floor(min([p3(2), p4(2)]));

result_rows = max_rows-min_rows;
result_columns = max_columns-min_columns;

row_offset = min_rows;
column_offset = min_columns;

result = zeros(result_rows,result_columns,3);

M_inverse = inv(M);

for i=1:result_rows
    for j=1:result_columns
        p=M_inverse*[i+row_offset;j+column_offset;1];
        result(i,j,:)=input(floor(p(1)),floor(p(2)),:);
    end
end

row_offset=row_offset+(input_rows-result_rows);
column_offset=column_offset;

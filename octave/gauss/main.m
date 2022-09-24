printf("Upper Triangular\r\n")
matrix = [1, 2, 3; 0, 1, -1; 0, 0, 1];
ind = [3, -1, 2];
result = upper_triangular(matrix, ind);
disp(result);

printf("Lower Triangular\r\n")
matrix = [0, 0, 1; 0, 1, -1; 1, 2, 3];
ind = [2, -1, 3];
result = lower_triangular(matrix, ind);
disp(result);

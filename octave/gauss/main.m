# printf("Upper Triangular\r\n")
# matrix = [1, 2, 3; 0, 1, -1; 0, 0, 1];
# ind = [3, -1, 2];
# result = upper_triangular(matrix, ind);
# disp(result);
#
# printf("Lower Triangular\r\n")
# matrix = [0, 0, 1; 0, 1, -1; 1, 2, 3];
# ind = [2, -1, 3];
# result = lower_triangular(matrix, ind);
# disp(result);

printf("Gaussify\r\n");
printf("Start matrix:\r\n");
matrix = [1, 3, 0;  2, 1, -1; 2, 4, -1];
ind = [4, 0, 2];
disp(matrix);
printf("Ind terms:\r\n");
disp(ind);
printf("\r\n");

printf("Processed matrix:\r\n");
[rmat, rind] = gaussify(matrix, ind);
disp(rmat);
printf("Ind terms:\r\n");
disp(rind);
printf("\r\n");

printf("Solution:\r\n");
result = upper_triangular(rmat, rind);
disp(result);

# printf("Gaussify Pivot\r\n");
# printf("Start matrix:\r\n");
# matrix = [1, 3, 0;  2, 1, -1; 2, 4, -1];
# ind = [4, 0, 2];
# disp(matrix);
# printf("Ind terms:\r\n");
# disp(ind);
# printf("\r\n");
#
# printf("Processed matrix:\r\n");
# [rmat, rind] = gaussify_pivot(matrix, ind);
# disp(rmat);
# printf("Ind terms:\r\n");
# disp(rind);
# printf("\r\n");
#
# printf("Solution:\r\n");
# result = upper_triangular(rmat, rind);
# disp(result);

printf("Gaussify Pivot Maximal\r\n");
printf("Start matrix:\r\n");
matrix = [1, 3, 0;  2, 1, -1; 2, 4, -1];
ind = [4, 0, 2];
disp(matrix);
printf("Ind terms:\r\n");
disp(ind);
printf("\r\n");

printf("Processed matrix:\r\n");
[rmat, rind, pos] = gaussify_pivot_max(matrix, ind);
disp(rmat);
printf("Ind terms:\r\n");
disp(rind);
printf("Position:\r\n");
disp(pos);
printf("\r\n");

printf("Solution:\r\n");
result = upper_triangular(rmat, rind);
disp(result);

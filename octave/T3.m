printf("T3:\r\n");
printf("Start matrix:\r\n");
matrix = [
	1 / 10 ^ 5, 1 / 10 ^ 4, 1 / 10 ^ 3, 1 / 10 ^ 2, 1 / 10, 1;
	1 / 2 ^ 5, 1 / 2 ^ 4, 1 / 2 ^ 3, 1 / 2 ^ 2, 1 / 2, 1;
	1 / 10000 ^ 5, 1 / 10000 ^ 4, 1 / 10000 ^ 3, 1 / 10000 ^ 2, 1 / 10000, 1;
	10 ^ 5, 10 ^ 4, 10 ^ 3, 10 ^ 2, 10, 1;
	100 ^ 5, 100 ^ 4, 100 ^ 3, 100 ^ 2, 100, 1;
	1000 ^ 5, 1000 ^ 4, 1000 ^ 3, 1000 ^ 2, 1000, 1
];
ind = [1; 1; 0; 1; 1; 0];
solution = [
	199880029976793242200 / 9981899896193239895882001; 
	-1233259785019090723703579 / 55454999423295777199344450;
	55247062927301712819753883 / 24707673010379306672975250;
	-2110922112147143999843521631 / 98830692041517226691901000;
	4034578405307821825231360507 / 332729996539774663196066700;
	-12101603206909988084210 / 9981899896193239895882001
];

disp(matrix);
printf("Ind terms:\r\n");
disp(ind);
printf("\r\n");

printf("Processed matrix:\r\n");
[rmat, rind, rord] = gaussify_pivot_full(matrix, ind);
disp(rmat);
printf("Ind terms:\r\n");
disp(rind);
printf("Solution order:\r\n");
disp(rord);
printf("\r\n");

result = upper_triangular(rmat, rind);
tmp_mat = rmat;
tmp_result = result;
for i = 1:length(rord)
	result(rord(i)) = tmp_result(i);
	for j = 1:columns(rmat)
		rmat(rord(i), j) = tmp_mat(i, j);
	end
end

printf("Reordered matrix\r\n");
disp(rmat);
printf("Solution:\r\n");
disp(result);

printf("Expected solution:\r\n");
disp(solution);
printf("Error:\r\n");
err = error_sol(solution, result);
disp(err);


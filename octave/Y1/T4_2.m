printf("T4.2:\r\n");
printf("Start matrix:\r\n");
c = flip([
	1 / 200,
	1 / 75,
	1 / 15,
	1,
	3,
	10,
	20,
	100
]);
matrix = vander(c);
ind = flip([
	1,
	-5,
	-1,
	2,
	0,
	1,
	-1,
	-2
]);
solution = [
	-456547599068726817076076042748125 / 2091483846816079254458865491167776; 
	489691412182659110718553121002503725 / 16731870774528634035670923929342208;
	-122708825438523411105646534380737534801 / 150586836970757706321038315364079872;
	1833550249147538501512000490399566061959 / 250978061617929510535063858940133120;
	-2161902481470101446989583995802788619381 / 107562026407684075943598796688628480;
	166070759287366506638891913539842214737 / 11408093709905886842502902679096960;
	-4198869670106420075327488729338627257 / 4278035141214707565938588504661360;
	8699606188343403635653696130082301 / 1568612885112059440844149118375832
];

disp(matrix);
printf("Ind terms:\r\n");
disp(ind);
printf("\r\n");

printf("### GAUSS ###\r\n");
printf("Processed matrix:\r\n");
[rmat, rind] = gaussify(matrix, ind);
disp(rmat);
printf("Ind terms:\r\n");
disp(rind);
result = upper_triangular(rmat, rind);
printf("Solution:\r\n");
disp(result);

printf("Expected solution:\r\n");
disp(solution);
printf("Error:\r\n");
err = error_sol(solution, result);
disp(err);
printf("\r\n");

printf("### GAUSS PIVOT ###\r\n");
printf("Processed matrix:\r\n");
[rmat, rind] = gaussify_pivot_partial(matrix, ind);
disp(rmat);
printf("Ind terms:\r\n");
disp(rind);
result = upper_triangular(rmat, rind);
printf("Solution:\r\n");
disp(result);

printf("Expected solution:\r\n");
disp(solution);
printf("Error:\r\n");
err = error_sol(solution, result);
disp(err);
printf("\r\n");

printf("### GAUSS PIVOT MAX ###\r\n");
printf("Processed matrix:\r\n");
[rmat, rind, rord] = gaussify_pivot_full(matrix, ind);
disp(rmat);
printf("Ind terms:\r\n");
disp(rind);
printf("Solution order:\r\n");
disp(rord);
printf("\r\n");

result = upper_triangular(rmat, rind);
printf("Solution:\r\n");
disp(result);
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
printf("Reordered solution:\r\n");
disp(result);

printf("Expected solution:\r\n");
disp(solution);
printf("Error:\r\n");
err = error_sol(solution, result);
disp(err);


function [result] = upper_triangular(matrix, ind)
	mrows = rows(matrix);
	mcols = columns(matrix);
	result = zeros(mcols, 1);
	result(mcols) = ind(mcols) / matrix(mrows, mcols);

	for i = mrows - 1:-1:1
		ind_result = ind(i);
		for j = i + 1:mcols
			ind_result -= matrix(i, j) * result(j);
		end
		result(i) = ind_result / matrix(i, i);
	end
end


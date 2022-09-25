function [result] = lower_triangular(matrix, ind)
	# Solve a lower triangular system of equations.
	mrows = rows(matrix);
	mcols = columns(matrix);
	result = zeros(mcols, 1);
	result(mcols) = ind(1) / matrix(1, mcols);

	for i = 2:mrows
		ind_result = ind(i);
		for j = mcols - (i - 2):mcols
			ind_result -= matrix(i, j) * result(j);
		end
		result(mrows - (i - 1)) = ind_result / matrix(i, mcols - (i - 1));
	end
end


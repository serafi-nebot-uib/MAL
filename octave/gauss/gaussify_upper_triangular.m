function [rmat, rind] = gaussify_upper_triangular(matrix, ind)
	mrows = rows(matrix);
	mcols = columns(matrix);
	rmat = matrix;
	rind = ind;

	for i = 1:mrows - 1
		for j = i + 1:mrows
			mult = rmat(j, i) / rmat(i, i);
			for k = 1:mcols
				rmat(j, k) = rmat(j, k) - mult * rmat(i, k);
			end
			rind(j) = rind(j) - mult * rind(i);
		end
	end
end


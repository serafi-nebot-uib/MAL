function [rmat, rind] = gaussify_pivot(matrix, ind)
	mrows = rows(matrix);
	mcols = columns(matrix);
	rmat = matrix;
	rind = ind;

	for i = 1:mrows - 1
		greatest = i;
		for j = i:mrows
			if abs(rmat(j, i)) > abs(rmat(greatest, i))
				greatest = j;
			end
		end

		if rmat(greatest, i) != 0
			tmp_mat = rmat;
			for j = 1:mcols
				rmat(i, j) = tmp_mat(greatest, j);
				rmat(greatest, j) = tmp_mat(i, j);
			end
			tmp_ind = rind;
			rind(i) = tmp_ind(greatest);
			rind(greatest) = tmp_ind(i);
		end

		for j = i + 1:mrows
			mult = rmat(j, i) / rmat(i, i);
			for k = 1:mcols
				rmat(j, k) = rmat(j, k) - mult * rmat(i, k);
			end
			rind(j) = rind(j) - mult * rind(i);
		end
	end
end


function [rmat, rind, rpos] = gaussify_pivot_max(matrix, ind)
	mrows = rows(matrix);
	mcols = columns(matrix);
	rmat = matrix;
	rind = ind;
	rpos = 1:mrows;

	for i = 1:mrows - 1
		gri = i; # greatest row index
		gci = i; # greatest column index
		for j = i:mrows
			for k = i:mcols
				if abs(rmat(j, k)) > abs(rmat(gri, gci))
					gri = j;
					gci = k;
				end
			end
		end

		if rmat(gri, gci) != 0
			# permutate rows
			tmp_mat = rmat;
			for j = 1:mcols
				rmat(i, j) = tmp_mat(gri, j);
				rmat(gri, j) = tmp_mat(i, j);
			end
			tmp_ind = rind;
			rind(i) = tmp_ind(gri);
			rind(gri) = tmp_ind(i);

			# permutate columns
			tmp_mat = rmat;
			for j = 1:mrows
				rmat(j, i) = tmp_mat(j, gci);
				rmat(j, gci) = tmp_mat(j, i);
			end
			tmp_pos = rpos;
			rpos(i) = tmp_pos(gci);
			rpos(gci) = tmp_pos(i);
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

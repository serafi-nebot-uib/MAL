function [rmat, rind] = gaussify(matrix, ind)
	# Convert a system of equations to upper triangular.
	#	Converts a system of equations to an equilavent upper triangular system of equations
	#	using gaussian elimination.
	#
	# Params:
	#	matrix: matrix containing the system of equation's terms
	#	ind: vector containing the system of equation's independent terms
	#
	# Returns:
	#	vector[rmat, rind]
	#		rmat: converted matrix
	#		rind: converted independent terms vector
	mrows = rows(matrix);
	mcols = columns(matrix);
	rmat = matrix;
	rind = ind;

	# gaussian elimination
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


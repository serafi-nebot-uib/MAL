function matprint(matrix)
	fprintf([repmat('%.6f\t', 1, size(matrix, 2)) '\n'], matrix');
end

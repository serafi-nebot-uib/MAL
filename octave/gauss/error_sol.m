function err = error_sol(expected, actual)
	# Calculate the error of a system of equation's solution
	#	Calculates the of a system of equation's solution using the
	#	euclidean distance between the expected and the actual solution.
	#
	# Params:
	#	expected: expected solution vector
	#	actual: actual solution vector
	#
	# Returns:
	#	err: solution error
	if length(expected) != length(actual)
		error("supplied vectors are not of the same dimension");
	end

	err = 0;
	for i = 1:length(expected)
		err += (expected(i) - actual(i)) ^ 2;
	end
	err = sqrt(err);
 end

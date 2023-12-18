function [R] = rsolve_plu(A, b, n)
	[L, U] = fact_lu(A);
	R = [b nan(rows(b), n)];
	for i = 1:columns(R)-1
		R(:,i+1) = upper_triangular(U, lower_triangular(L, R(:,i)));
	end
end

# function [R] = rsolve_plu(A, b, n)
# 	[P, L, U] = fact_lu_pivot_partial(A);
# 	R = [b nan(rows(b), n)];
# 	for i = 1:columns(R)-1
# 		R(:,i+1) = upper_triangular(U, lower_triangular(L, P*R(:,i)));
# 	end
# end

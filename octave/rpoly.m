function [sol] = rpoly(coeff, x)
	sol = 0;
	n = rows(coeff);
	for i = 1:n
		sol += coeff(i) * x^(n-i);
	end
end

function[lambda] = CH2MP2(R,C)

%Determine the coefficients for characteristics equation.
A = [1, (1/R(1)+1/R(2)+1/R(3))/C(2), 1/(R(1)*R(2)*C(1)*C(2))];

% Determine characteristic roots:
lambda = roots(A)

function output = integration(input1, input2)

fun = @(x) x.^2;
output = integral(fun,input1,input2);

end

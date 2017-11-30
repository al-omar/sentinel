clear ; close all; clc
data = load('train.csv');
X = createDataSet(data);
%prepare original data now
Y = data(:,12);
[m, n] = size(X);
initial_theta = zeros(n , 1);




[cost, grad] = costFunction(initial_theta, X, Y);
fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);

lambda = -0.565;
options = optimset('GradObj', 'on', 'MaxIter', 500);

[theta, cost] = ...
	fminunc(@(t)(costFunctionReg(t, X, Y,lambda)), initial_theta, options);



  fprintf('Cost at theta found by fminunc: %f\n', cost);
  fprintf('theta: \n');
  fprintf(' %f \n', theta);

  test = load('test.csv');
  X_TEST = createDataSet(test);

  %p = predict(theta, X);
  %p;
  prob = sigmoid(X(2,:) * theta);
  fprintf(['probability of %f\n'], prob);
  %fprintf('Train Accuracy: %f\n', mean(double(p == Y)) * 100);

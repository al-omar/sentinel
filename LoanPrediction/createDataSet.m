function [X] = createDataSet(data)
%  X = ones(length(data),1);
%  X = [X data(:,[1 2 3 4 5 6 7 8 9 10 11] )];

gender = data( :, 1);
married = data(:,2);
dependents = data(:,3);
education = data(:,4);
selfEmployed = data(:,5);
income = data(:,6);
coincome = data(:,7);
loanAmt = data(:,8);
time = data(:,9);
creditHistory = data(:,10);
location = data(:,11);

%z = [gender married dependents education selfEmployed income coincome loanAmt time creditHistory location married.*dependents married.*selfEmployed married.*income married.*coincome education.*selfEmployed education.*income education.*loanAmt education.*creditHistory selfEmployed.*income selfEmployed.*loanAmt selfEmployed.*creditHistory income.*loanAmt income.*creditHistory income.*location coincome.*location loanAmt.*time time.*location selfEmployed.*location] ;

z=[ married.*dependents.*selfEmployed dependents.*coincome income.*coincome education.*selfEmployed  education.*creditHistory income.*loanAmt selfEmployed.*creditHistory creditHistory.*location loanAmt.*time.*location selfEmployed.*location time.*income.*coincome] ;

[m, n]=size(z);

X = [ones(m,1) z];

end

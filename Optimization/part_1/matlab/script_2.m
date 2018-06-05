clc; clearvars
% ���������
Tmin1 = (18*60)*0.7;  %���������� ���������� ����� ������ 1 ������
Tmin2 = (20*60)*0.7;  %���������� ���������� ����� ������ 2 ������
Tmax1 = (18*60);  %����������� ���������� ����� ������ 1 ������
Tmax2 = (20*60);  %����������� ���������� ����� ������ 2 ������
coeff = 0.3;

% ������� �������
f1 = @(X) 30*X(1) + 20*X(3); % -> max
f2 = @(X) 3*(X(1)+X(2))+12*(X(3)+X(4)); % -> min
f3 = @(X) 45*X(2) + 21*X(4); % -> max

z1 = @(N) -f1(N); % -> min
z3 = @(N) -f3(N); % -> min

% �������������� ����������� (� ������ ������ ������ ��������)
A = [1,1,5,5;
    -1,-1,-5,-5;
    2,2,7,7;
    -2,-2,-7,-7;
    1,1,0,0;
    0,0,1,1];
b = [Tmax1; -Tmin1; Tmax2; -Tmin2;  5000; 9000];

Aeq = [];
beq = [];
% ��������������� �����������
lb = [0; 0; 0; 0];
ub = [5000; 5000; 9000; 9000];

%% ����� ��������� ������� ���������
startingPoint = lb;
[x, z1_opt] = fmincon(z1, startingPoint, A, b, Aeq, beq, lb, ub)
[x, f2_opt] = fmincon(f2, startingPoint, A, b, Aeq, beq, lb, ub)
[x, z3_opt] = fmincon(z3, startingPoint, A, b, Aeq, beq, lb, ub)


A = [1,1,5,5;
    -1,-1,-5,-5;
    2,2,7,7;
    -2,-2,-7,-7;
    1,1,0,0;
    0,0,1,1
    3,3,12,12;
    0,-45,0,-21];
b = [Tmax1; -Tmin1; Tmax2; -Tmin2;  5000; 9000; 1950; -1000];

[x, f_val] = fmincon(z1, startingPoint, A, b, Aeq, beq, lb, ub)


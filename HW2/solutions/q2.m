clc;
clear all;
close all;
%% QUESTION 2
syms theta1 theta2 theta3 theta4 theta5 theta6;
theta = [theta1 theta2+90 theta3 theta4 theta5 theta6]
d =  [290,0,0,302,0,72]
a =  [0,-270,-70,0,0,0]
alpha =  [-90,0,90,-90,90,0]
figure;
dh = imread('./screens/DH.png');
imshow(dh);

%% QUESTION 3
figure;
f1 = imread('./screens/func1.png');
imshow(f1);
T = [];
for m = 1:6
    T_temp = dhparam2matrix(theta(m), d(m), a(m), alpha(m));
    T = [T, T_temp];
end

T1 = vpa(T(:, 1:4),4)
T2 = vpa(T(:, 5:8),4)
T3 = vpa(T(:, 9:12),4)
T4 = vpa(T(:, 13:16),4)
T5 = vpa(T(:, 17:20),4)
T6 = vpa(T(:, 21:24),4)

%% QUESTION 4
T06 = (T1 * T2 * T3 * T4 * T5 * T6);
T06 = vpa(T06,4);
disp('T06');
disp(T06);

%% QUESTION 5
T_subs_zero = subs(T06, {theta1, theta2, theta3, theta4, theta5, theta6}, {0,0,0,0,0,0});

T_subs_zero = double(vpa(T_subs_zero))
i1 = imread('./screens/compare1.png');
imshow(i1);

%% QUESTION 6
disp('Solution 6a');
T_subs_1 = subs(T06, {theta1, theta2, theta3, theta4, theta5, theta6}, {-45,30,-30,-30,-45,180});
T_subs_1 = double(T_subs_1)

disp('Solution 6b i');

disp('The cartesian position of the robot tip in millimeters in X,Y,Z directions is shown below: ');
disp(T_subs_1(1,4));
disp(T_subs_1(2,4));
disp(T_subs_1(3,4));

disp('Solution 6b ii');
fprintf('The unit vector representing the approach vector of the robot in this configuration is: %s %d %e', double(T_subs_1(1,3))...
    , double(T_subs_1(2,3)), double(T_subs_1(3,3)));
i2 = imread('./screens/compare2.png');
imshow(i2);

%% QUESTION 7

config1 = [0,0,0,0,0,0];
config2 = [-45,30,-30,-30,-45,180];

figure;
[T] = forwardKin(config1);
disp('Transformatio Matrix for configuration in Q 5')
disp(T);

figure;
[T] = forwardKin(config2);
disp('Transformatio Matrix for configuration in Q 6')
disp(T);

%% QUESTION 8
config3 = [45,-30,30,30,45, -180];
config4 = [45,45,45,45,45,45];
config5 = [10,10,10,10,10,10];
config6 = [0,45,0,90,0,0];
config7 = [0,-45,0,-90,0,0];
figure;
[T] = forwardKin(config3);
disp('Transformatio Matrix for configuration #1 Q8');

disp(T);

figure;
[T] = forwardKin(config4);
disp('Transformatio Matrix for configuration #2 Q8');
disp(T);
figure;
[T] = forwardKin(config5);
disp('Transformatio Matrix for configuration #3 Q8');
disp(T);
figure;
[T] = forwardKin(config6);
disp('Transformatio Matrix for configuration #4 Q8');
disp(T);
figure;
[T] = forwardKin(config7);
disp('Transformatio Matrix for configuration #5 Q8');
disp(T);
figure;
i3 = imread('./screens/compare3.png');
imshow(i3);

figure;
i4 = imread('./screens/compare4.png');
imshow(i4);

figure;
i5 = imread('./screens/compare5.png');
imshow(i5);

figure;
i6 = imread('./screens/compare6.png');
imshow(i6);

figure;
i7 = imread('./screens/compare7.png');
imshow(i7);

figure;
j1 = imread('./screens/config1.png');
imshow(j1);

figure;
j2 = imread('./screens/config2.png');
imshow(j2);

figure;
j3 = imread('./screens/config3.png');
imshow(j3);

figure;
j4 = imread('./screens/config4.png');
imshow(j4);

figure;
j5 = imread('./screens/config5.png');
imshow(j5);

figure;
j6 = imread('./screens/config6.png');
imshow(j6);

figure;
j7 = imread('./screens/config7.png');
imshow(j7);


function [T] = forwardKin(config)

    c1 = config(1);
    c2 = config(2);
    c3 = config(3);
    c4 = config(4);
    c5 = config(5);
    c6 = config(6);
    
    syms theta1 theta2 theta3 theta4 theta5 theta6;
    theta = [theta1 theta2+90 theta3 theta4 theta5 theta6];
    d =  [290,0,0,302,0,72];
    a =  [0,-270,-70,0,0,0];
    alpha =  [-90,0,90,-90,90,0];
    
    T = [];
    for m = 1:6
        T_temp = dhparam2matrix(theta(m), d(m), a(m), alpha(m));
        T = [T, T_temp];
    end
    
    T1 = vpa(T(:, 1:4),4);
    T2 = vpa(T(:, 5:8),4);
    T3 = vpa(T(:, 9:12),4);
    T4 = vpa(T(:, 13:16),4);
    T5 = vpa(T(:, 17:20),4);
    T6 = vpa(T(:, 21:24),4);   

    T01 = subs(T1, {theta1, theta2, theta3, theta4, theta5, theta6}, {c1, c2, c3, c4,c5,c6});
    T02 =subs((T01*T2), {theta1, theta2, theta3, theta4, theta5, theta6}, {c1, c2, c3, c4,c5,c6});
    T03 = subs((T02*T3), {theta1, theta2, theta3, theta4, theta5, theta6}, {c1, c2, c3, c4,c5,c6});
    T04 = subs((T03*T4), {theta1, theta2, theta3, theta4, theta5, theta6}, {c1, c2, c3, c4,c5,c6});
    T05 = subs((T04*T5), {theta1, theta2, theta3, theta4, theta5, theta6}, {c1, c2, c3, c4,c5,c6});
    T06 = subs((T05*T6), {theta1, theta2, theta3, theta4, theta5, theta6}, {c1, c2, c3, c4,c5,c6});


    T = subs(T06, {theta1, theta2, theta3, theta4, theta5, theta6}, {0,0,0,0,0,0});
    T = double((vpa(T,2)));
    
    X = [0, T01(1,4), T02(1,4), T03(1,4), T04(1,4), T05(1,4), T06(1,4)];
    X = double(X);
    %X = uint8(X);
    Y = [0, T01(2,4), T02(2,4), T03(2,4), T04(2,4), T05(2,4), T06(2,4)];
    Y = double(Y);
    Y = uint8(Y);
    Z = [0, T01(3,4), T02(3,4), T03(3,4), T04(3,4), T05(3,4), T06(3,4)];
    Z = double(Z);
    %Z = uint8(Z);
    
    plotarm(X,Y,Z)
    
    %C = [X;Y;Z]; 
end
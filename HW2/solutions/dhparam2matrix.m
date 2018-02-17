function T = dhparam2matrix(theta, d, a, alpha)
    theta = theta * pi /180;
    alpha = alpha * pi /180;
    rot_z = [cos(theta),-sin(theta),0,0; sin(theta),cos(theta),0,0; 0,0,1,0; 0,0,0,1];
    trans_z = [1,0,0,0; 0,1,0,0; 0,0,1,d; 0,0,0,1];
    rot_x = [1,0,0,0; 0, cos(alpha), -sin(alpha), 0; 0, sin(alpha), cos(alpha), 0; 0,0,0,1];
    trans_x = [1,0,0,a; 0,1,0,0; 0,0,1,0; 0,0,0,1];
    T = rot_z * trans_z * rot_x * trans_x;
end
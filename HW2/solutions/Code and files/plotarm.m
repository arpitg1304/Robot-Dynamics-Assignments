function fig = plotarm(X,Y,Z)
    plot3(X,Y,Z);
    xlabel('XXX');
    ylabel('YYY');
    zlabel('ZZZ');
    
    hold on;
    scatter3(X,Y,Z);

end
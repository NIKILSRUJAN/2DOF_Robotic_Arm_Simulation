clear;
clc; 
close all;


L1 = 1; 
L2 = 1;
t = linspace(0,2*pi,300); dt = t(2)-t(1);
xc = 0.8*cos(t); yc = 0.8*sin(t) + 0.5;
theta1_all = zeros(size(t)); theta2_all = zeros(size(t)); x_end = zeros(size(t)); y_end = zeros(size(t));
figure
for i = 1:length(t)

    x = xc(i);
    y = yc(i);

    D = (x^2 + y^2 - L1^2 - L2^2)/(2*L1*L2);
    if abs(D) > 1
        continue
    end

    theta2 = atan2(sqrt(1 - D^2), D);
    theta1 = atan2(y,x) - atan2(L2*sin(theta2), L1 + L2*cos(theta2));

    theta1_all(i) = theta1;
    theta2_all(i) = theta2;

    x1 = L1*cos(theta1);
    y1 = L1*sin(theta1);

    x2 = x1 + L2*cos(theta1 + theta2);
    y2 = y1 + L2*sin(theta1 + theta2);

    x_end(i) = x2;
    y_end(i) = y2;

    subplot(2,2,1)
    plot([0 x1 x2],[0 y1 y2],'LineWidth',3)
    hold on
    plot(xc,yc,'r--')
    plot(x2,y2,'bo','MarkerSize',6,'MarkerFaceColor','b')
    hold off
    axis equal
    xlim([-2 2])
    ylim([-2 2])
    title('Arm Animation')

    subplot(2,2,2)
    plot(t(1:i),theta1_all(1:i),'b',t(1:i),theta2_all(1:i),'r')
    title('Joint Angles')
    legend('theta1','theta2')

    subplot(2,2,3)
    if i > 1
        v1 = diff(theta1_all(1:i))/dt;
        v2 = diff(theta2_all(1:i))/dt;
        plot(t(2:i),v1,'b',t(2:i),v2,'r')
        title('Joint Velocities')
        legend('omega1','omega2')
    end

    subplot(2,2,4)
    err = sqrt((x_end(1:i)-xc(1:i)).^2 + (y_end(1:i)-yc(1:i)).^2);
    plot(t(1:i),err,'k')
    title('Tracking Error')

    drawnow

end
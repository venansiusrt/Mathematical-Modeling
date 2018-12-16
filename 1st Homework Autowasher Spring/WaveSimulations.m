a = 1;
b = 1;
om = 1;
n = 6;
L = 1;

x = 1;
t = 0:0.01:1;

u = zeros([1, 101]);

for j = 1:1:101
     u(j) = (sin(n*pi*x/L))*(a*sin(n*om*t(j))+b*cos(n*om*t(j)));
end

% for i = 1:1:201
%     for j = 1:1:201
%         u(i,j) = (sin(n*pi*x(i)/L))*(a*sin(n*om*t(j))+b*cos(n*om*t(j)));
%     end
% end

plot(t,u); 
% contour3(x,t,u)
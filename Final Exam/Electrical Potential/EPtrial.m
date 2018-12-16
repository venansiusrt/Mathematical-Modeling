[X,Y] = meshgrid(0:0.2:5);
Z = @(x,y,A,L,n) A.*sin(n.*pi.*x./L).*sinh(n.*pi.*y./L)./10*sinh(n.*pi);

n = 1;
A = 3;
L = 5;

subplot(2,2,1); mesh(X,Y,Z(X,Y,A,L,n)); rotate3d on;
subplot(2,2,2); mesh(X,Y,Z(X,Y,A,L,n)); rotate3d on;
subplot(2,2,3); mesh(X,Y,Z(X,Y,A,L,n)); rotate3d on;
subplot(2,2,4); mesh(X,Y,Z(X,Y,A,L,n)); rotate3d on;
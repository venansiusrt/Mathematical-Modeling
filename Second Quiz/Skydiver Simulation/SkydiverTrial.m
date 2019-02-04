m = 50;
c = 4;
t = 10;

T = 0:t;
v = [];
g = 9.8;

for i = 1:length(T)
    v(i) = (m*g/c)*(1-exp(-c*i/m));
end

plot(T,v);
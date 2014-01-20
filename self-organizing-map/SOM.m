#Script for running Self Organizing Map
x_u = rand(500,1)*2-1; y_u = rand(500,1)*2-1;
x_u
clc
[x_t, y_t] = pol2cart(rand(500,1)*2*pi, ...
rand(500,1)/10+.9);
plot(x_u,y_u,'.')
figure
plot(x_t,y_t,'r.')

net1 = selforgmap([10 10]);
net = selforgmap([100 1]);


net = train(net,[x_u y_u]')
net1 = train(net1,[x_u y_u]')


toresnet = selforgmap([100 1]);
toresnet1 = selforgmap([10 10]);


toresnet = train(toresnet,[x_t y_t]')
toresnet1 = train(toresnet1,[x_t y_t]')

figure;
plotsom(net.layers{1}.positions);
figure;
plotsom(net1.layers{1}.positions);
figure;
plotsom(toresnet.layers{1}.positions);
figure;
plotsom(toresnet1.layers{1}.positions);
figure;
plotsom(net.iw{1, 1}, net.layers{1}.distances);
figure;
plotsom(net1.iw{1, 1}, net1.layers{1}.distances);
figure;
plotsom(toresnet.iw{1, 1}, toresnet.layers{1}.distances);
figure;
plotsom(toresnet1.iw{1, 1}, toresnet1.layers{1}.distances);
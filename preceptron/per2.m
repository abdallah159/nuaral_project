p=[0 0 1 1 ; 0 1 0 1 ];
t=[0 1 1 1];
plotpv(p,t);
x = perceptron ;
x = train(x,p,t);
view(x);
y = x(p);
l=plotpc(x.IW{1} , x.b{1});
E=1;
 while(mse(E))
    [x,a,E] = adapt(x,p,t);
    l=plotpc(x.IW{1},x.b{1},l);
 end
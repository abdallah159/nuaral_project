p1=[1  -1    -1];%% axes-points of image  RGP 
p2=[1   1    -1];
p=[p1 ; p2];
t1=[-1];
t2=[1];
t=[t1  t2];
w=t * p;
if(w*p1') ==t1
    fprintf(' orthognal');
    
else
    fprintf('not orthogonal');
end
    
pp=p*p';
pinv=inv(pp);
ps = pinv*p;
w2=t*ps ;
if(w2*p1') ==t1
    fprintf(' orthognal');
    
else
    fprintf('not orthogonal');
end

function time=TurncationTime(m)
for i=4:2:24
    c=sum(m,2)/100;
    d(i/2)=c(i);
    time=d;
end

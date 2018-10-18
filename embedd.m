function c = embedd(bit,F)

f = F/20;

if bit==1
    
    f = f - 0.5;
    f=f/2;
    k=round(f);
    
    c = (2*k + 0.5)*20;
     
end

if bit==0
    f = f + 0.5;
    f=f/2;
    k=round(f);
    c = (2*k - 0.5)*20;
    
end

end
    

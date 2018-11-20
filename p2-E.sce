

//modulacao delta
clear
passo = 1e-2;
tempo_final = 2;
y(1) = 0;
w = 2*%pi //rad por segundo
x_q(1) = 0;
delta = 0.1;
for k=1:tempo_final/passo
    t(k+1) = passo+passo*k;
    x(k) = sin(w*t(k));
    e(k) = x(k) - x_q(k);
    e_q(k) = delta*sign(e(k));
    x_q(k+1) = x_q(k) + e_q(k); 
end
//plot(t,y)
plot2d2(t,x_q)

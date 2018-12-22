//sinal 1 - Estela
load('./xa_10_1.sod') 
S1 = x_a

//sinal 2- Lais
load('./xa_26_1.sod') 
S2 = x_a

//sinal 3 - Willane
load('./xa_43_1.sod')
S3 = x_a

S = [S1 S2 S3]

function sigDelta = modDelta(sinal,tempoFim, passo, delta)
    sigDelta(1) = 0;
    for k=1:tempoFim/passo
        e(k) = sinal(k) - sigDelta(k); //sinal de erro
        e_q(k) = delta*sign(e(k)); //versão quantizada
        sigDelta(k+1) = sigDelta(k) + e_q(k); //aprox. do sinal quantizado 
    end

endfunction

passo = 1e-2;
tempoFinal = 2;
delta = 0.1;

t1 = 0 : 1/200 : 1
sinalFinal = modDelta(S,tempoFinal,passo,delta)

plot2d3(t1,sinalFinal)

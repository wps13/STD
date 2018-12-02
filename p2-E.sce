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

N = length(S)

fs=35000 //taxa de amostragem

tempoAmostragem = 1/fs //período de amostragem a ser usado

t = linspace(0,N/264600,N) //tempo

function sinalAmostrado = amostragemSinal(tempo,sinal,tAmostragem)
    N = length(sinal);
    n=0;
    for k=1:N
        if tempo(k)>n*tAmostragem
            sinalAmostrado(n+1) = sinal(k)
            n=n+1    
        end      
    end
endfunction

sinalAmostra = amostragemSinal(t,S, tempoAmostragem)

delta =

function resDelta = modDelta(sinal,delta)
	

endfunction

sinalFinal = modDelta(sinalAmostra,delta)

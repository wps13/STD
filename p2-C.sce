load('/home/willane/Downloads/p2STD/xa_10_1.sod')
x1 = x_a

load('/home/willane/Downloads/p2STD/xa_26_1.sod')
x2 = x_a

load('/home/willane/Downloads/p2STD/xa_43_1.sod')
x3 = x_a

x = [x1 x2 x3]

Xf = fft(x)

N = length(x)

fs=35000 //taxa de amostragem

periodo = 1/fs

t = linspace(0,N/264600,N)

function sinal_amostrado = amostragem_sinal(tempo,sinal,periodo_amostragem)
    N = length(sinal);
    n=0;
    for k=1:N
        if tempo(k)>n*periodo_amostragem
            sinal_amostrado(n+1) = sinal(k)
            n=n+1    
        end      
    end
endfunction

sinalFinal = amostragem_sinal(t,x,periodo)

Sf = fft(sinalFinal)

tam = length(Sf)/2

Sf = Sf(1:tam)

plot2d3(abs(Sf))

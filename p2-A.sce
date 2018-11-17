load('/home/willane/Downloads/p2STD/xa_10_1.sod')
x1=x_a

load('/home/willane/Downloads/p2STD/xa_26_1.sod')
x2=x_a

load('/home/willane/Downloads/p2STD/xa_43_1.sod')
x3=x_a

X = [x1 x2 x3] //concatenação dos sinais

Xt=fft(X)		//cálculo da transformada de fourier

nXt = length(Xt) //calcula o tamanho do sinal

Xutil = Xt(1:nXt/2) //Armazena metade do sinal

f = linspace(0,0.5*50000,length(Xutil)) //vetor de freq.

XutilMag=abs(Xutil) //magnitude da parte util do sinal

figure()

plot2d3(f,log10(1e-13+XutilMag))


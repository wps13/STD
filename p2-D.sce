//sinal 1 - Estela
load('/home/willane/Downloads/p2STD/xa_10_1.sod') 
S1 = x_a

//sinal 2- Lais
load('/home/willane/Downloads/p2STD/xa_26_1.sod') 
S2 = x_a

//sinal 3 - Willane
load('/home/willane/Downloads/p2STD/xa_43_1.sod')
S3 = x_a

S = [S1 S2 S3]

N = length(S)

fs=35000 //taxa de amostragem

tempoAmostragem = 1/fs //período de amostragem a ser usado

t = linspace(0,N/264600,N) //tempo

//Função que amostra o sinal mensagem
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


//função responsável por realizar a codificação para um sinal discretizado
function seqPCM = codificacaoPCM(sinalDisc, min,max, qtndBits)
	excursao = max - min
	totalNiveis = 2^(qntdBits)
	limInferior = min+0.5*excursao/totalNiveis
	passo = excursao/numero_de_niveis
	limSuperior = max-0.5*excursao/totalNiveis
	niveis =limInferior:passo: limSuperior

    for k=1:length(sinalDisc)
        for j=1:totalNiveis
        b(j) = abs(sinalDisc(k)-niveis(j));
        i = find(b==min(b)) //erro
        end
        palavra_pcm_como_string(k) = dec2bin(i-1);
        for j=1:numero_de_bits
            if part(palavra_pcm_como_string(k),j)=='1'
            palavra_pcm(j,k)=1;
            end
            if part(palavra_pcm_como_string(k),j)=='0'
            palavra_pcm(j,k)=0;
            end
        end
    end
endfunction

//função que realiza a quantizacao em um sinal
function sinalQuantizado = quantizacaoMidrise(sinal,min,max,qntdBits)
    excursao = max-min;
    totalNiveis = 2^(qntdBits);
	limInferior = min+0.5*excursao/totalNiveis
	passo =excursao/totalNiveis
	limSuperior =max-0.5*excursao/totalNiveis
    niveis = limInferior:passo:limSuperior

    for k=1:length(sinal)
        for j=1:totalNiveis
        b(j) = abs(sinal(k)-niveis(j));
        i = find(b==min(b))
        nivelEscolhido = niveis(i);
        end

        sinalQuantizado(k) = nivelEscolhido;
    end
endfunction

sinalAmostra = amostragemSinal(t,S, tempoAmostragem)

min = min(sinalAmostra)
max = max(sinalAmostra)
bits = 8

sinalDiscretizado = quantizacaoMidrise(sinalAmostra,min,max,bits)

//plotar o sinal msg, amostrado e discretizado
plot2d3(t,S) //plot do sinal mensagem

plot2d3(t,sinalAmostra) //plot do sinal amostrado

plot2d3(t,sinalDiscretizado) 

sinalFinal = amostragem_sinal(t,x,periodo)

sequenciaPCM = codificacaoPCM(sinalDiscretizado,min,max,bits)

//plotar a sequencia(tempo e amplitude)

plot2d3(t,sequenciaPCM)

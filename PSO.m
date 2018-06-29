%Algoritmo PSO
%Autor: S�rgio Saraiva de Sousa Neto
%UFC - Sobral - Engenharia da Computa��o

clear;
clc;
%Passo 1
d = 2; %numero de vari�veis da fun��o
n = input('Informe o n�mero de particulas desejadas\n');
w = input('Informe o parametro de in�rcia (entre 0,9 e 0,4 de preferencia)\n');
e = input('Informe o n�mero de �pocas\n');
c = 2.05;
r1 = rand(1);
r2 = rand(1);

for i=1:n
    for j=1:d
        x(i,j) = randi(20);
        v(i,j) = randi(20);
    end
end

X = x(:,1);%divis�o das posi��es X do vetor x
Y = x(:,2);%divis�o das posi��es Y do vetor x

p = zeros(n,d);
pg = 0;


%Passo 2
for i=1:n
    f(i) = abs((X(i)*(sin(Y(i))*(pi/4))) + (Y(i)*(sin(X(i))*(pi/4))));
end

%p recebe x e na terceira coluna recebe a avalia��o daquela posi��o
for i=1:n
    p(i,1:d) = x(i,:);
    p(i,3) = f(i);
end

%encontra o valor da melhor posi��o global e coloca a avalia��o daquela posi��o na
%sua terceira coluna
maximo = max(f);
a = find(f == maximo,1);
pg = x(a,:);
pg(1,3) = f(a);
a=0;%resetamos o a

for k=1:e
    %Passo 3 - atualiza��o do valores de x e v
    for i=1:n
        for j=1:d
            v(i,j) = w*v(i,j)+c*r1*(p(i,j)-x(i,j))+c*r2*(pg(1,j)-x(i,j));
            x(i,j) = x(i,j)+v(i,j);
        end
    end

    X = x(:,1);%divis�o das posi��es X do vetor x
    Y = x(:,2);%divis�o das posi��es Y do vetor x

    %nova avalia��o
    for i=1:n
        f(i) = abs((X(i)*(sin(Y(i))*(pi/4))) + (Y(i)*(sin(X(i))*(pi/4))));
    end

    %verificar se as novas posi��es de x s�o melhores, se for subsitui em p
    for i=1:n
        if (f(i)> p(i,3))
            p(i,1:2) = x(i,:);
            p(i,3) = f(i);
        end
    end

    if (max(f)>pg(1,3))
        maximo = max(f);
        a = find(f == maximo, 1);
        pg(1,1:2) = x(a,:);
        pg(1,3) = f(a);
        a=0;%resetamos o a
    end
end

disp(pg);%as duas primeira colunas seria a posi��o e a terceira a nota
        


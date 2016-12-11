


%%declararea datelor 
D=20; 
tTriunghi=0:0.001:D-0.001; 
P=40;
w0=2*pi/P;

%% construirea lui x
xTriunghi= sawtooth((pi/10)*tTriunghi,0.5)/2+0.5; 
t_semnal = 0:0.001:P-0.001; 
x = zeros(1,length(t_semnal)); 

for i = 1: size(tTriunghi,2)-1
x(i) =xTriunghi(i); 
end



%% caluculul integralei
for k = -50:50
    xSuma = x;
    xSuma = xSuma.*exp(-j*k*w0*t_semnal);
    X(k+51) = trapz(t_semnal,xSuma);
end
    
%% reconstructia semnalului

for i = 1: length(t_semnal)
    xReconst(i) = 0;
    for k=-50:50
        xReconst(i) = xReconst(i) + (1/P)*X(k+51)*exp(j*k*w0*t_semnal(i)); 
    end
end



%% afisarea graficelor

figure(1);
plot(t_semnal,x); 
title('x(t)(linie solida) si reconstructia folosind N coeficienti (linie punctata)');
hold on;
plot(t_semnal,xReconst,'--'); 

figure(2);
w=-50*w0:w0:50*w0; 
stem(w/(2*pi),abs(X));
title('Spectrul lui x(t)')
xlabel('Pulsatia');
ylabel('Amplitudinea');


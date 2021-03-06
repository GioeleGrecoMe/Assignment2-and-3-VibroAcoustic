function err=errHjki_cw(xpar,rfHjkiexp,Hjkiexp)

%xpar -> vector of simplified identification formula parameters
if max(size(xpar))~=8
    disp('parameter vector xpar: length error!')
    disp(['Length= ' num2str(length(xpar)) ' instead of 8'])
    return
end
csii=xpar(1);
w0i=xpar(2);
Aj=xpar(3);
Bj=xpar(4);
Cj=xpar(5);
Dj=xpar(6);
Ej=xpar(7);
Fj=xpar(8);

if w0i<0
    err0=10000;
else
    err0=0;
end
%computatuion of the semplified formula

Om=2*pi*rfHjkiexp;
Hjki=((Aj+1i*Bj)./(-Om.^2+2i*Om*(csii*w0i)+w0i^2))+(Cj+1i*Dj)+((Ej+1i*Fj)./(Om.^2));

% Output error
errcpx=(Hjki-Hjkiexp);
err=sum(real(errcpx).^2)+sum(imag(errcpx).^2)+err0;
%err=sum((abs(errcpx).^2))+sum(angle(errcpx).^2)+err0

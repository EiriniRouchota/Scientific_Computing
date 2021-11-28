function [P] = band_stats(mxid,p)
%Author Ε.ΡΟΥΧΩΤΑ, ΑΜ:1059654, DATE:15/2/2021 
if strcmp(mxid,'AM')==0 && size(mxid,1)==1
    
     mat=ssget(mxid);
     A=mat.A;
elseif size(mxid,1)>1 
    A=mxid;
    mxid='Wathen';
else 
    prompt = 'Give the latest 4 digits of AM: ';
    k = input(prompt);
    k=1+mod(k,2892);
    mat=ssget(k);
    A=mat.A;
    [m,n]=size(A);
    if m -n>0
        A=A(1:n,1:n);
    else n-m<0
        A=A(1:m,1:m);
    end
        
    if m>1000 && n>1000 
        A=A(1:1000,1:1000);
    end 

end 
m=size(A,1);
Diag=diag(diag(A));
nnzA=nnz(Diag);
rerr=norm(A-Diag,'fro')/norm(A,'fro');
for i=1:p
         Diag=diag(diag(A,i),i)+diag(diag(A,-i),-i)+Diag;
         
         nnA=nnz(Diag);
         nnzA=[nnzA nnA];
         rerrA=norm(A-Diag,'fro')/norm(A,'fro');
         rerr=[rerr rerrA];
end
%%%Calculate errors
rnnz=nnzA/nnz(A);
P=struct('rnnz',rnnz,'rerr',rerr);
plot(1:2:2*p+1,rnnz,'r--x');
hold on
plot(1:2:2*p+1, rerr,'b');
legend('rrnz','rerr')
title(['Σφάλματα για το μητρώο:' mxid]);
xlabel('Εύρος ζώνης k');
ylabel('Τιμή σφαλμάτων');

    




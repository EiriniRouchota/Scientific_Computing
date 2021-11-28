
%Author Ε.ΡΟΥΧΩΤΑ, ΑΜ:1059654, DATE:17/2/2021
n=500;
A=randn(n);
xsol=rand(n,1);
b=A*xsol;
tol=1e-6;
maxit=4*n;
B=A.'*A;
tic;
[x,fl0,rr0,it0,rv0] = pcg(B,A.'*b,tol,maxit);
time_for_pcg=toc;
tic;
[y,fl1,rr1,it1,rv1] = gmres(A,b,100,tol,500);
time_for_gmresm=toc;
tic;
[w,fl2,rr2,it2,rv2] = gmres(A,b,[],tol,500);
time_for_gmresn=toc;
tic;
v=A\b;
time_for_mld=toc;
semilogy(1:length(rv0),rv0/norm(A.'*b),'r-*')
hold on
yline(tol,'b--');
hold on
semilogy(1:length(rv1),rv1/norm(b),'blue-')
hold on
semilogy(1:length(rv2),rv2/norm(b),'g-o')
xlabel('Επαναλήψεις')
ylabel('Σχετικό Κατάλοιπο')
title('Διάγραμμα σχετικού καταλοίπου για τυχαία μητρώα')
legend('PCG','tol','Gmres with m=100','Gmres with n=500')
caption = sprintf('resvec for PCG is %f,resvec for gmres m=100 is %f ,resvec for gmres n=500 is %f', rv0(end) , rv1(end),rv2(end));
annotation('textbox','String',caption,'FitBoxToText','on');

akribeia_pcg=norm(x-xsol);
akribeia_gmresm=norm(y-xsol);
akribeia_gmresn=norm(w-xsol);
akribeia_mld=norm(v-xsol);
fprintf("Time for pcg is: %d\n", time_for_pcg);
fprintf("Time for gmres with m is: %d\n", time_for_gmresm);
fprintf("Time for gmres with n is: %d\n", time_for_gmresn);
fprintf("Time for mld is:%d\n", time_for_mld);
fprintf("Norm pcg and xsol is: %d\n", akribeia_pcg);
fprintf("Norm gmresn and xsol is: %d\n", akribeia_gmresm);
fprintf("Norm gmresn and xsol is: %d\n", akribeia_gmresn);
fprintf("Norm mld and xsol is: %d\n", akribeia_mld);

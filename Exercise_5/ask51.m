
%Author Ε.ΡΟΥΧΩΤΑ, ΑΜ:1059654, DATE:17/2/20217
n=500;
A=spdiags([1:n]',[0],n,n);
xsol=ones(n,1);
b=A*xsol;
tic;
[x1,fl1,rr1,it1,rv1]=pcg(A,b,[],4*n);
time_for_pcg_A=toc;
%%%%%%%%%%%%%%%%%%%%%
n=500; 
tol=1e-6;
B =spdiags([linspace(1,2,n/2)';linspace(1000,1001,n/2)'],[0],n,n);
ysol = ones(n,1); 
c = B*ysol;
tic;
[y1,fl2,rr2,it2,rv2]=pcg(B,c,[],4*n);
time_for_pcg_B=toc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
semilogy(1:length(rv1),rv1/norm(b),'black-*')
hold on
semilogy(1:length(rv2),rv2/norm(c))
hold on
yline(tol,'r--');
xlabel('Επαναλήψεις')
ylabel('Σχετικό Κατάλοιπο')
title('Διάγραμμα σχετικού καταλοίπου για ειδικά μητρώα')
legend('spdiagns([1:n],[0],n,n)','spdiags([linspace...)','tol')
caption = sprintf('resvec for A is %f , resvec for B is %f ', rv1(end) , rv2(end));
annotation('textbox','String',caption,'FitBoxToText','on');

akribeiaA=norm(x1-xsol);
akribeiaB=norm(y1-ysol);
deiktis_katastasisA=condest(A);
deiktis_katastasisB=condest(B);

fprintf("Time for A is: %d\n", time_for_pcg_A);
fprintf("Time for B is: %d\n", time_for_pcg_B);
fprintf("Norm  A-xsol is: %d\n", akribeiaA);
fprintf("Norm B-ysol is: %d\n", akribeiaB);
fprintf("Cond for A is: %d\n", deiktis_katastasisA);
fprintf("Cond for b  is: %d\n", deiktis_katastasisB);



%%%%Profile for MVS 
profile on;
[x1,fl1,rr1,it1,rv1]=pcg(A,b,[],4*n);
profile viewer;
profile on;
[y1,fl2,rr2,it2,rv2]=pcg(B,c,[],4*n);
profile viewer;
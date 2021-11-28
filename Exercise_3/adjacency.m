function [G] = adjacency(A,k)
%Author е.яоувыта, ал:1059654, DATE:18/2/2021
[m,n]=size(A);
if m~=n 
    error('Adjecency Matrix is always square');
end
prompt = 'Do you want to search for a specific pair? YES or NO:';
answer = input(prompt);
if strcmp(answer,'YES')== 1
     prompt = 'Which row?:';
     i=input(prompt);
     prompt='Which column?:';
     j=input(prompt);
end
G=tenzeros(n,n,k);
G(:,:,1)=A;
for p=2:k
    temp=double(G(:,:,p-1));
    G(:,:,p)=A*temp;
end
T=tenmat(G,3);
total_sums=sum(T.data);
if strcmp(answer,'YES')== 1
    max_length=sum(T(:,j*n-(n-i)));
    fprintf("The max length %d for pair (%d,%d) is %d \n", k,i,j,max_length);
else 
    for j=1:n
        for i=1:n
           fprintf("The max length %d for pair (%d,%d) is %d \n", k,j,i,sum(total_sums(j*n-(n-i))));
        end
    end
end
end
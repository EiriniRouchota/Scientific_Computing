function [val,col_idx,row_blk]= sp_mx2bcrs(A,nb)
%Author е.яоувыта, ал:1059654, DATE:14/1/2021 

if mod(size(A,2),nb)~0
    error('Wrong dimensions the A must be divided in nb blocks')
end
skip=length(A)/nb;
zr=zeros((size(A,2)^2)/(nb*nb),1)';
row_blk=zeros(1,1);

k=0;
row_blk(1,1)=0;
col_idx=zeros(1,1);
values=zeros(1,1);
ten_b=[];
for i=1:nb:size(A,1)
      for j=1:nb:size(A,1)
           b=A(i:i+nb-1,j:j+nb-1);
            nz=nnz(b);
            k=k+1;
        if nz~=0
           zr(1,k)=1;
           col_idx=[col_idx j];
           ten_b=[ten_b b];
           B = reshape(b.',1,[]);
           values=[values B];
       end
      end
end
temp=0;

for i=1:skip:size(zr,2)
       
         temp=temp+sum(zr(i:i+skip-1));
         row_blk=[row_blk temp];
       
end
ten_b=full(ten_b);
val=reshape(ten_b,nb,nb,length(ten_b)/nb);
row_blk=row_blk+1;
col_idx(:,1)=[];
values(:,1)=[];
end



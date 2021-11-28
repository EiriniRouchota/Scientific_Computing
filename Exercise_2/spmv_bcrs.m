function [y] = spmv_bcrs(y,val,col_idx,row_blk,x)
%Author е.яоувыта, ал:1059654, DATE:20/1/2021 
dif=[];
nb=size(val,1);
for i=1:length(row_blk)-1
  def=abs(row_blk(i+1)-row_blk(i));
  dif=[dif def];
end
idx_counter=1;
   y_idx = 1;
   for i = dif
     for j = 1:i
        
        y(y_idx:y_idx + nb-1) = y(y_idx:y_idx + nb-1) + val(:,:,idx_counter) * x(col_idx(idx_counter):col_idx(idx_counter) + nb-1);       
        idx_counter = idx_counter + 1;
     end
   y_idx = y_idx + nb;
   end
end   

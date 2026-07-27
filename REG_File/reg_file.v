module reg_file 
(
input [15 : 0 ] WrData ,
input  [2:0] Address ,
input WrEn , RdEn ,
input clk ,rst ,
output reg  [15 : 0 ] RdData
);

reg [15 : 0 ] file [7 : 0] ;

always@(posedge clk , negedge rst)
begin
 if (~rst)
  begin 
   file [0] <= 'b0 ; 

   file [1] <= 'b0 ;

   file [2] <= 'b0 ; 

   file [3] <= 'b0 ;

   file [4] <= 'b0 ; 

   file [5] <= 'b0 ;

   file [6] <= 'b0 ; 

   file [7] <= 'b0 ;

   RdData   <= 'b0 ;

  end

 else if(WrEn & !RdEn)	begin

    file [Address] <= WrData ; 

  end

 else if(RdEn & !WrEn)	begin
 
    RdData <= file [Address] ;

  end
  
end // always

endmodule

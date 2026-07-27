module CMP_UNIT #(parameter width = 16) (
input [width - 1 : 0] A , B,
input clk , rst,
input [1:0] ALU_FUN ,
input CMP_Enable ,
output reg CMP_Flag,
output reg [width - 1 : 0]CMP_OUT
);
always@(posedge clk , negedge rst)	

begin

	if(!rst)	 
		begin
			CMP_Flag <= 'b0 ;
			CMP_OUT <= 'b0 ;
		end

	else if(CMP_Enable)	
		begin
			case (ALU_FUN)

				2'b00 :	
					begin   // need review
						CMP_Flag <= 'b1 ;
					end


				2'b01 :	
					begin   
						CMP_Flag <= 'b1 ;

						if(A == B)	

							begin
								CMP_OUT <= 'b1 ;
							end

						else 	
							begin
								CMP_OUT <= 'b0 ;
							end 	
					end // 'b01


				2'b10 :	
					begin   
						CMP_Flag <= 'b1 ;

						if(A > B)	
							begin
								CMP_OUT <= 'b10 ;
							end

						else 	
							begin
								CMP_OUT <= 'b0 ;
							end 	
				end // 'b10


				2'b11 :	
					begin   
						CMP_Flag <= 'b1 ;

						if(A < B)	
							begin
								CMP_OUT <= 'b11 ;
							end

						else 	
							begin
								CMP_OUT <= 'b0 ;
							end 	
				end // 'b11

			endcase


	end // else if

	else 
		begin
			CMP_Flag <= 'b0 ;
			CMP_OUT <= 'b0 ;
		end
end //always
endmodule

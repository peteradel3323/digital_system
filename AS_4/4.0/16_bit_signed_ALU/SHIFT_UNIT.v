module SHIFT_UNIT#(parameter width = 16) (
input [width - 1 : 0] A , B ,
input clk , rst ,
input [1:0] ALU_FUN,
input shift_Enable,
output reg SHIFT_Flag,
output reg [width - 1 : 0] SHIFT_OUT
);

always@(posedge clk , negedge rst)	begin
	if(!rst)	begin
		SHIFT_Flag <= 'b0 ;
		SHIFT_OUT <= 'b0 ;
	end

	else if(shift_Enable)	begin
		case (ALU_FUN)
			
			2'b00 :	begin
				SHIFT_OUT <= A >> 1 ;
				SHIFT_Flag <= 'b1 ;
			end

			2'b01 :	begin
				SHIFT_OUT <= A << 1 ;
				SHIFT_Flag <= 'b1 ;
			end

			2'b10 :	begin
				SHIFT_OUT <= B >> 1 ;
				SHIFT_Flag <= 'b1 ;
			end

			2'b11 :	begin
				SHIFT_OUT <= B << 1 ;
				SHIFT_Flag <= 'b1 ;
			end
		endcase

	end //else if


	else 	begin 
		SHIFT_Flag <= 'b0 ;
		SHIFT_OUT <= 'b0 ;
	end



end // always
endmodule

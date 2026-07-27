module ARITHMETIC_UNIT#(parameter width = 16) (
input signed [width - 1 :0] A , B ,
input clk,rst,
input [1:0] ALU_FUN,
input Arith_Enable,
output reg Arith_Flag,
output reg [2*width - 1 :0] Arith_OUT
);


always@(posedge clk , negedge rst)	begin

	if(!rst)	begin
		Arith_Flag <= 'b0 ;
		Arith_OUT <= 'b0 ;
	end

	else if (Arith_Enable)	begin

		case (ALU_FUN)
			2'b00 :		begin
				Arith_Flag <= 'b1;
				Arith_OUT <= A + B ;
			end

			2'b01 :		begin
				Arith_Flag <= 'b1;
				Arith_OUT <= A - B ;
			end

			2'b10 :		begin
				Arith_Flag <= 'b1;
				Arith_OUT <= A * B ;
			end

			2'b11 :		begin
				Arith_Flag <= 'b1;
				Arith_OUT <= A / B ;
			end

		endcase

	end //else if

	else	begin
		Arith_Flag <= 'b0 ;
		Arith_OUT <= 'b0 ;
	end
end //always
endmodule
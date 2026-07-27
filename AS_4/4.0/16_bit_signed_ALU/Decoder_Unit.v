
module Decoder_Unit(
input [1:0] dec_in,
input  rst,
output reg SHIFT_EN,CMP_EN,Logic_EN,Arith_EN 
);

always@(*)	
begin
	if(!rst)	
	begin
		SHIFT_EN = 0 ;
		CMP_EN = 0 ;
		Logic_EN = 0 ;
		Arith_EN = 0 ;
	end

	else 	begin
			SHIFT_EN = 0 ;
			Arith_EN = 0 ;
			Logic_EN = 0 ;
			CMP_EN = 0 ;
		case (dec_in) 

			2'b00:	begin
				Arith_EN = 1 ;
			end

			2'b01:	begin
				Logic_EN = 1 ;
			end


			2'b10:	begin
				CMP_EN = 1 ;
			end

			2'b11:	begin
				SHIFT_EN = 1 ;
			end

			default:	begin
			SHIFT_EN = 0 ;
			Arith_EN = 0 ;
			Logic_EN = 0 ;
			CMP_EN = 0 ;
			end
		endcase

	end //else
end //always

endmodule
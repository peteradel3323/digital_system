module LOGIC_UNIT #(parameter width = 16) (
input [width - 1 : 0] A , B ,
input clk , rst ,
input [1:0] ALU_FUN ,
input Logic_Enable ,
output reg Logic_Flag ,
output reg [width - 1 :0] Logic_OUT
);

always@(posedge clk , negedge rst)	begin
	if(!rst)	begin 
		Logic_Flag <= 0 ;
		Logic_OUT <= 'b0 ;
	end

	else if(Logic_Enable)	begin

		Logic_Flag <= 0 ;
		Logic_OUT <= 'b0 ;

		case(ALU_FUN)

			'b00: 	begin 
				Logic_Flag <= 'b1;
				Logic_OUT <= A & B ;
			end

			'b01: 	begin 
				Logic_Flag <= 'b1;
				Logic_OUT <= A | B ;
			end

			'b10: 	begin 
				Logic_Flag <= 'b1;
				Logic_OUT <= ~(A & B) ;
			end

			'b11: 	begin 
				Logic_Flag <= 'b1;
				Logic_OUT <= ~(A | B) ;
			end

			default: 	begin 
				Logic_Flag <= 0 ;
				Logic_OUT <= 'b0 ;
			end


		endcase


	end //else if

	else	begin
		Logic_Flag <= 'b0 ;
		Logic_OUT <= 'b0 ;
	end

end //always
endmodule

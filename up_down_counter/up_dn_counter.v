module up_dn_counter (
input [4:0] in,
input load , up , down ,
input clk,
output reg high , low ,
output reg [4:0] counter
);


always@(posedge clk)	
	begin 

	if(load)
		begin 
		counter <= in ;
		end

	else if(down && !low )
		begin 
		counter <= counter - 1;
		end

	else if(up && !high && ~ down)
		begin
		counter <= counter + 1; 
		end

	end	// always

always@(*) 
	begin 

	high = &counter ;
	low = ~|counter ;

	end //always_2
endmodule 
`timescale 1 ns / 1 ps
module up_dn_counter_tb();

reg [4:0] in_tb;
reg load_tb , up_tb , down_tb ;
reg clk_tb;
wire high_tb , low_tb ;
wire [4:0] counter_tb;


	up_dn_counter dut	//counter instatiation
	(
		.in(in_tb),
		.load(load_tb),
		.up(up_tb),
		.down(down_tb),
		.clk(clk_tb),
		.high(high_tb),
		.low(low_tb),
		.counter(counter_tb)
	);

always #5 begin clk_tb = ~clk_tb ; end // waveform clock generator


	initial

	begin
		$dumpfile("up_dn_counter_tb.vcd") ;
		$dumpvars ;
	$display("starting the test");
		clk_tb = 0 ;
		load_tb = 1 ;
		up_tb = 0 ;
		down_tb = 0;
		in_tb = 5'b00101 ;
	#10

		if(counter_tb == 5'b00101)	begin
	$display("loading the num pass");
		end

		else begin 
	$display("loading the num fails");
		end 

down_tb = 1'b1;

	#10

		if(counter_tb == 5'b00101)	begin
	$display("load has higher priority than down");
		end

		else 	begin 
	$display("load & down priority fails");
		end 

up_tb = 1'b1 ;

	#10

		if(counter_tb == 5'b00101)	begin
	$display("load has higher priority than down & up");
		end

		else 	begin 
	$display("load & down & (up)  priority fails");
		end 

load_tb = 0;
 
	#10

		if(counter_tb == 5'b00100)	begin
	$display("down has higher priority than up");
		end

		else 	begin 
	$display(" down & up priority fails");
		end 


down_tb = 0;
 
	#10

		if(counter_tb == 5'b00101)	begin
	$display("counter counts up properly");
		end

		else 	begin 
	$display(" up counting fails");
		end 

	#300

		if(counter_tb == 5'b11111)	begin
	$display("counter stop counting up @ 31");
		end

		else 	begin 
	$display(" counter does not stop @ 31");
		end 

		if(high_tb == 1'b1)	begin 
	$display("high flag works properly");
		end 

		else	begin
	$display("high flag fails");
		end

down_tb = 1'b1;

	#400

		if(counter_tb == 5'b0)	begin
	$display("counter stop counting down @ 0");
		end

		else 	begin 
	$display(" counter does not stop @ 0");
		end 

		if(low_tb == 1'b1)	begin 
	$display("low flag works properly @ 0");
		end 

		else	begin
	$display("low flag fails");
	end

$stop; 

end	// initial block


endmodule


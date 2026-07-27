`timescale 1 ns /100 ps 
module reg_file_tb ();

reg [15 : 0 ] WrData_tb ;
reg  [2:0] Address_tb ;
reg WrEn_tb , RdEn_tb ;
reg clk_tb ,rst_tb ;
wire  [15 : 0 ] RdData_tb ;

reg_file DUT
(
.WrData(WrData_tb),
.Address(Address_tb),
.WrEn(WrEn_tb),
.RdEn(RdEn_tb),
.clk(clk_tb),
.rst(rst_tb),
.RdData(RdData_tb)
);
 always #5 begin	clk_tb = ~clk_tb ;	end // periodic time 10 ns

initial 
 begin
$dumpfile("reg_file.vcd") ;
$dumpvars ;
$display("----------starting test bench---------------");
  rst_tb = 0 ;
  clk_tb = 0 ;
#15
////////////////////////////////// reg [0]
  rst_tb = 1 ;
  WrData_tb = 220 ;
  Address_tb = 0 ;
  WrEn_tb = 1 ;
  RdEn_tb = 0;

#10
// reading the written data above
  WrEn_tb = 0 ;
  RdEn_tb = 1;

#10

  if(RdData_tb == 220 )
   begin 
    $display(" the data have been written and read correctly") ;
   end

  else
   begin 
    $display(" the data have been written or read failed") ;
   end

////////////////////////////////// reg [1]
  WrData_tb = 150 ;
  Address_tb = 1 ;
  WrEn_tb = 1 ;
  RdEn_tb = 0;

#10
// reading the written data above
  WrEn_tb = 0 ;
  RdEn_tb = 1;

#10

  if(RdData_tb == 150 )
   begin 
    $display(" the data have been written and read correctly") ;
   end

  else
   begin 
    $display(" the data have been written or read failed") ;
   end

////////////////////////////////// reg [2]
  WrData_tb = 67 ;
  Address_tb = 2 ;
  WrEn_tb = 1 ;
  RdEn_tb = 0;

#10
// reading the written data above
  WrEn_tb = 0 ;
  RdEn_tb = 1;

#10

  if(RdData_tb == 67 )
   begin 
    $display(" the data have been written and read correctly") ;
   end

  else
   begin 
    $display(" the data have been written or read failed") ;
   end

////////////////////////////////// reg [3]
  WrData_tb = 99 ;
  Address_tb = 3 ;
  WrEn_tb = 1 ;
  RdEn_tb = 0;

#10
// reading the written data above
  WrEn_tb = 0 ;
  RdEn_tb = 1;

#10

  if(RdData_tb == 99 )
   begin 
    $display(" the data have been written and read correctly") ;
   end

  else
   begin 
    $display(" the data have been written or read failed") ;
   end


////////////////////////////////// reg [4]
  WrData_tb = 11 ;
  Address_tb = 4 ;
  WrEn_tb = 1 ;
  RdEn_tb = 0;

#10
// reading the written data above
  WrEn_tb = 0 ;
  RdEn_tb = 1;

#10

  if(RdData_tb == 11 )
   begin 
    $display(" the data have been written and read correctly") ;
   end

  else
   begin 
    $display(" the data have been written or read failed") ;
   end

////////////////////////////////// reg [5]
  WrData_tb = 95 ;
  Address_tb = 5 ;
  WrEn_tb = 1 ;
  RdEn_tb = 0;

#10
// reading the written data above
  WrEn_tb = 0 ;
  RdEn_tb = 1;

#10

  if(RdData_tb == 95 )
   begin 
    $display(" the data have been written and read correctly") ;
   end

  else
   begin 
    $display(" the data have been written or read failed") ;
   end

////////////////////////////////// reg [6]
  WrData_tb = 66 ;
  Address_tb = 6 ;
  WrEn_tb = 1 ;
  RdEn_tb = 0;

#10
// reading the written data above
  WrEn_tb = 0 ;
  RdEn_tb = 1;

#10

  if(RdData_tb == 66 )
   begin 
    $display(" the data have been written and read correctly") ;
   end

  else
   begin 
    $display(" the data have been written or read failed") ;
   end

////////////////////////////////// reg [7]
  WrData_tb = 73 ;
  Address_tb = 7 ;
  WrEn_tb = 1 ;
  RdEn_tb = 0;

#10
// reading the written data above
  WrEn_tb = 0 ;
  RdEn_tb = 1;

#10

  if(RdData_tb == 73 )
   begin 
    $display(" the data have been written and read correctly") ;
   end

  else
   begin 
    $display(" the data have been written or read failed") ;
   end

  rst_tb = 0 ;
  Address_tb = 0 ;
#10
  if(RdData_tb == 0 )
   begin 
    $display(" reg 0 rst works ") ;
   end

  else
   begin 
    $display(" reg 0 rst hasa problem ") ;
   end
  rst_tb = 1 ;
  Address_tb = 1 ;
#10
  if(RdData_tb == 0 )
   begin 
    $display(" reg 1 rst works ") ;
   end

  else
   begin 
    $display(" reg 1 rst hasa problem ") ;
   end

  Address_tb = 2 ;
#10
  if(RdData_tb == 0 )
   begin 
    $display(" reg 2 rst works ") ;
   end

  else
   begin 
    $display(" reg 2 rst hasa problem ") ;
   end

  Address_tb = 3 ;
#10
  if(RdData_tb == 0 )
   begin 
    $display(" reg 3 rst works ") ;
   end

  else
   begin 
    $display(" reg 3 rst hasa problem ") ;
   end

  Address_tb = 4 ;
#10
  if(RdData_tb == 0 )
   begin 
    $display(" reg 4 rst works ") ;
   end

  else
   begin 
    $display(" reg 4 rst hasa problem ") ;
   end

  Address_tb = 5 ;
#10
  if(RdData_tb == 0 )
   begin 
    $display(" reg 5 rst works ") ;
   end

  else
   begin 
    $display(" reg 5 rst hasa problem ") ;
   end

  Address_tb = 6 ;
#10
  if(RdData_tb == 0 )
   begin 
    $display(" reg 6 rst works ") ;
   end

  else
   begin 
    $display(" reg 6 rst hasa problem ") ;
   end


  Address_tb = 7 ;
#10
  if(RdData_tb == 0 )
   begin 
    $display(" reg 7 rst works ") ;
   end

  else
   begin 
    $display(" reg 7 rst hasa problem ") ;
   end


$stop ;

 end //initial
endmodule
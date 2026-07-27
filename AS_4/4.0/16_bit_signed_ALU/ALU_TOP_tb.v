`timescale 1 us / 1 ns 
module ALU_TOP_tb #( parameter  Width = 16 ) ();

 reg [Width - 1 :0] A_tb , B_tb ;
 reg [3:0] ALU_FUN_tb ;
 reg clk_tb , rst_tb ;
 wire  [ Width - 1 : 0] Logic_OUT_tb , CMP_OUT_tb , SHIFT_OUT_tb ;
 wire [2 * Width - 1 : 0] Arith_OUT_tb ;
 wire Arith_Flag_tb , Logic_Flag_tb , CMP_Flag_tb , SHIFT_Flag_tb ;

 ALU_TOP DUT 
 (
  .A (A_tb) ,
  .B (B_tb) ,
  .clk (clk_tb) ,
  .rst (rst_tb) ,
  .ALU_FUN (ALU_FUN_tb) ,
  .Arith_OUT (Arith_OUT_tb) ,
  .Logic_OUT (Logic_OUT_tb) ,
  .CMP_OUT (CMP_OUT_tb) ,
  .SHIFT_OUT (SHIFT_OUT_tb) ,
  .Arith_Flag (Arith_Flag_tb) ,
  .Logic_Flag (Logic_Flag_tb) ,
  .CMP_Flag (CMP_Flag_tb) ,
  .SHIFT_Flag (SHIFT_Flag_tb) 
 );

always	// clock generator
 begin 
  #6
  clk_tb = ~ clk_tb ;
  #4
  clk_tb = ~ clk_tb ;
 end

initial 		
 begin 
  $dumpfile("signed_alu.vcd") ;
  $dumpvars ;
  $display ("starting the test bench");
  
  clk_tb = 'd 1;
  rst_tb = 'b 1;
  A_tb = -'d21 ;
  B_tb = -'d39 ;
  ALU_FUN_tb = 'b0000 ;
 #16

  $display ("testing  Signed Arithmetic Addition: A is Negative & B is Negative "); //////////////////////// case_1
  
   if(Arith_Flag_tb == 'b 1 && ~( Logic_Flag_tb | CMP_Flag_tb | SHIFT_Flag_tb ) )

    begin
     $display ("	ALU could detect Signed Arithmetic Addition ");
    end


   else

    begin
     $display ("	ALU flags have problem " ,$time ,Arith_Flag_tb ,Logic_Flag_tb,CMP_Flag_tb,SHIFT_Flag_tb );
    end

  
   if( Arith_OUT_tb == -'d60 && ~|( Logic_OUT_tb | CMP_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in Signed Arithmetic Addition : A is Negative & B is Negative ");
    end

   else

    begin
     $display ("	ALU Arithmetic_block has problem in add when neg & neg ", Arith_OUT_tb);
    end 		///////// case_1

  A_tb = 'd21 ;
 #16
 
  $display ("testing  Signed Arithmetic Addition: A is positive & B is Negative "); //////////////////////// case_2
  
   if(Arith_Flag_tb == 'b 1 && ~|( Logic_Flag_tb | CMP_Flag_tb | SHIFT_Flag_tb ) )

    begin
     $display ("	ALU could detect Signed Arithmetic Addition ");
    end


   else

    begin
     $display ("	ALU flags have problem ");
    end

  
   if( Arith_OUT_tb == -'d18 && ~|( Logic_OUT_tb | CMP_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in Signed Arithmetic Addition : A is positive & B is Negative ");
    end

   else

    begin
     $display ("	ALU Arithmetic_block has problem in add when pos & neg ");
    end 		///////// case_2


  B_tb = 'd 21 ;
  A_tb = - 'd 21 ;
 #16

  $display ("testing  Signed Arithmetic Addition: A is negative & B is positive "); //////////////////////// case_3
  
   if(Arith_Flag_tb == 'b 1 && ~|( Logic_Flag_tb | CMP_Flag_tb | SHIFT_Flag_tb ) )

    begin
     $display ("	ALU could detect Signed Arithmetic Addition ");
    end


   else

    begin
     $display ("	ALU flags have problem ");
    end

  
   if( Arith_OUT_tb == 'd0 && ~|( Logic_OUT_tb | CMP_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in Signed Arithmetic Addition : A is negative & B is positive ");
    end

   else

    begin
     $display ("	ALU Arithmetic_block has problem in add when pos & neg ");
    end 		///////// case_3



  B_tb = 'd 56 ;
  A_tb = 'd 591 ;
 #16

  $display ("testing  Signed Arithmetic Addition: A is positive & B is positive "); //////////////////////// case_4
  
   if(Arith_Flag_tb == 'b 1 && ~|( Logic_Flag_tb | CMP_Flag_tb | SHIFT_Flag_tb ) )

    begin
     $display ("	ALU could detect Signed Arithmetic Addition ");
    end


   else

    begin
     $display ("	ALU flags have problem ");
    end

  
   if( Arith_OUT_tb == 'd647 && ~|( Logic_OUT_tb | CMP_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in Signed Arithmetic Addition : A is positive & B is positive ");
    end

   else

    begin
     $display ("	ALU Arithmetic_block has problem in add when pos & pos ");
    end 		///////// case_4

////////////////////////////////////////////////////////////////////////////////////////Signed Arithmetic Subtraction

  
  A_tb = -'d21 ;
  B_tb = -'d39 ;
  ALU_FUN_tb = 'b0001 ;
 #16

  $display ("testing  Signed Arithmetic Subtraction: A is Negative & B is Negative "); //////////////////////// case_1
  
   if(Arith_Flag_tb == 'b 1 && ~( Logic_Flag_tb | CMP_Flag_tb | SHIFT_Flag_tb ) )

    begin
     $display ("	ALU could detect Signed Arithmetic Subtraction ");
    end


   else

    begin
     $display ("	ALU flags have problem ");
    end

  
   if( Arith_OUT_tb == 'd18 && ~|( Logic_OUT_tb | CMP_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in Signed Arithmetic Subtraction : A is Negative & B is Negative ");
    end

   else

    begin
     $display ("	ALU Arithmetic_block has problem in Subtraction when neg & neg ");
    end 		///////// case_1

  A_tb = 'd21 ;
 #16

  $display ("testing  Signed Arithmetic Subtraction: A is positive & B is Negative "); //////////////////////// case_2
  
  
   if( Arith_OUT_tb == 'd60 && ~|( Logic_OUT_tb | CMP_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in Signed Arithmetic Subtraction : A is positive & B is Negative ");
    end

   else

    begin
     $display ("	ALU Arithmetic_block has problem in Subtraction when pos & neg ");
    end 		///////// case_2


  B_tb = 'd 21 ;
  A_tb = - 'd 21 ;
 #16

  $display ("testing  Signed Arithmetic Subtraction: A is negative & B is positive "); //////////////////////// case_3

   if( Arith_OUT_tb == -'d42 && ~|( Logic_OUT_tb | CMP_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in Signed Arithmetic Subtraction : A is negative & B is positive ");
    end

   else

    begin
     $display ("	ALU Arithmetic_block has problem in Subtraction when pos & neg ");
    end 		///////// case_3



  B_tb = 'd 56 ;
  A_tb = 'd 591 ;
 #16

  $display ("testing  Signed Arithmetic Subtraction: A is positive & B is positive "); //////////////////////// case_4
   
   if( Arith_OUT_tb == 'd535 && ~|( Logic_OUT_tb | CMP_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in Signed Arithmetic Subtraction : A is positive & B is positive ");
    end

   else

    begin
     $display ("	ALU Arithmetic_block has problem in Subtraction when pos & pos ");
    end 		///////// case_4



//////////////////////////////////////////////////////////////////////////////////////// Signed Arithmetic Multiplication

  
  A_tb = -'d21 ;
  B_tb = -'d39 ;
  ALU_FUN_tb = 'b0010 ;
 #16

  $display ("testing  Signed Arithmetic Multiplication: A is Negative & B is Negative "); //////////////////////// case_1
  
   if(Arith_Flag_tb == 'b 1 && ~( Logic_Flag_tb | CMP_Flag_tb | SHIFT_Flag_tb ) )

    begin
     $display ("	ALU could detect Signed Arithmetic Subtraction ");
    end


   else

    begin
     $display ("	ALU flags have problem ");
    end

  
   if( Arith_OUT_tb == 'd819 && ~|( Logic_OUT_tb | CMP_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in Signed Arithmetic Multiplication : A is Negative & B is Negative ");
    end

   else

    begin
     $display ("	ALU Arithmetic_block has problem in Multiplication when neg & neg ");
    end 		///////// case_1

  A_tb = 'd21 ;
 #16
  
  $display ("testing  Signed Arithmetic Multiplication: A is positive & B is Negative "); //////////////////////// case_2
  
  
   if( Arith_OUT_tb == - 'd819 && ~|( Logic_OUT_tb | CMP_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in Signed Arithmetic Multiplication : A is positive & B is Negative ");
    end

   else

    begin
     $display ("	ALU Arithmetic_block has problem in Multiplication when pos & neg ");
    end 		///////// case_2


  B_tb = 'd 21 ;
  A_tb = - 'd 21 ;
 #16

  $display ("testing  Signed Arithmetic Multiplication: A is negative & B is positive "); //////////////////////// case_3

   if( Arith_OUT_tb == -'d441 && ~|( Logic_OUT_tb | CMP_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in Signed Arithmetic Multiplication : A is negative & B is positive ");
    end

   else

    begin
     $display ("	ALU Arithmetic_block has problem in Multiplication when pos & neg ");
    end 		///////// case_3



  B_tb = 'd 56 ;
  A_tb = 'd 591 ;
 #16

  $display ("testing  Signed Arithmetic Multiplication: A is positive & B is positive "); //////////////////////// case_4
   
   if( Arith_OUT_tb == 'd33096 && ~|( Logic_OUT_tb | CMP_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in Signed Arithmetic Multiplication : A is positive & B is positive ");
    end

   else

    begin
     $display ("	ALU Arithmetic_block has problem in Multiplication when pos & pos ");
    end 		///////// case_4


//////////////////////////////////////////////////////////////////////////////////////// Signed Arithmetic Division

  
  A_tb = -'d500 ;
  B_tb = -'d25 ;
  ALU_FUN_tb = 'b0011 ;
 #16

  $display ("testing  Signed Arithmetic Division: A is Negative & B is Negative "); //////////////////////// case_1
  
   if(Arith_Flag_tb == 'b 1 && ~( Logic_Flag_tb | CMP_Flag_tb | SHIFT_Flag_tb ) )

    begin
     $display ("	ALU could detect Signed Arithmetic Division ");
    end


   else

    begin
     $display ("	ALU flags have problem ");
    end

  
   if( Arith_OUT_tb == 'd20 && ~|( Logic_OUT_tb | CMP_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in Signed Arithmetic Division : A is Negative & B is Negative ");
    end

   else

    begin
     $display ("	ALU Arithmetic_block has problem in Division when neg & neg ");
    end 		///////// case_1

  A_tb = 'd3600 ;
  B_tb = -'d75 ;
 #16
  
  $display ("testing  Signed Arithmetic Division: A is positive & B is Negative "); //////////////////////// case_2
  
  
   if( Arith_OUT_tb == - 'd48 && ~|( Logic_OUT_tb | CMP_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in Signed Arithmetic Division : A is positive & B is Negative ");
    end

   else

    begin
     $display ("	ALU Arithmetic_block has problem in Division when pos & neg ");
    end 		///////// case_2


  B_tb = 'd 52 ;
  A_tb = - 'd 1716 ;
 #16

  $display ("testing  Signed Arithmetic Division: A is negative & B is positive "); //////////////////////// case_3

   if( Arith_OUT_tb == -'d33 && ~|( Logic_OUT_tb | CMP_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in Signed Arithmetic Division : A is negative & B is positive ");
    end

   else

    begin
     $display ("	ALU Arithmetic_block has problem in Division when pos & neg ");
    end 		///////// case_3



  A_tb = 'd 400 ;
  B_tb = 'd 20 ;
 #16

  $display ("testing  Signed Arithmetic Division: A is positive & B is positive "); //////////////////////// case_4
   
   if( Arith_OUT_tb == 'd20 && ~|( Logic_OUT_tb | CMP_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in Signed Arithmetic Division : A is positive & B is positive ");
    end

   else

    begin
     $display ("	ALU Arithmetic_block has problem in Division when pos & pos "  );
    end 		///////// case_4


//////////////////////////////////////////////////////////////////////////////////////// Logical Operations

  
  A_tb = 'd500 ;
  B_tb = 'd25 ;
  ALU_FUN_tb = 'b0100 ;
 #16
 
  $display ("testing  Logical Operations: AND "); //////////////////////// case_1
  
   if(Logic_Flag_tb == 'b 1 && ~( Arith_Flag_tb | CMP_Flag_tb | SHIFT_Flag_tb ) )

    begin
     $display ("	ALU could detect Logical Operations ");
    end


   else

    begin
     $display ("	ALU flags have problem " ,$time ,Logic_Flag_tb);
    end

  
   if( Logic_OUT_tb == 'b10000 && ~|( Arith_OUT_tb | CMP_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in AND ");
    end

   else

    begin
     $display ("	ALU has problem with AND ");
    end 		///////// case_1

  ALU_FUN_tb = 'b0101 ;
  A_tb = 'd500 ;
  B_tb = 'd25 ;
 #16
  $display ("testing  OR "); //////////////////////// case_2
  
  
   if( Logic_OUT_tb == 'd509 && ~|( Arith_OUT_tb | CMP_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in OR ");
    end

   else

    begin
     $display ("	ALU has problem with OR " ,Logic_OUT_tb ,$time);
    end 		///////// case_2


  ALU_FUN_tb = 'b0110 ;
 #16

  $display ("testing NAND "); //////////////////////// case_3

   if( Logic_OUT_tb == 'hffef && ~|( Arith_OUT_tb | CMP_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in NAND ");
    end

   else

    begin
     $display ("	ALU has problem in NAND " ,Logic_OUT_tb );
    end 		///////// case_3



  ALU_FUN_tb = 'b0111 ;
 #16

  $display ("testing  NOR "); //////////////////////// case_4
   
   if( Logic_OUT_tb == 'b1111111000000010 && ~|( Arith_OUT_tb | CMP_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in NOR ");
    end

   else

    begin
     $display ("	ALU has problem in NOR ");
    end 		///////// case_4

//////////////////////////////////////////////////////////////////////////////////////// compare

  
  A_tb = 'd500 ;
  B_tb = 'd25 ;
  ALU_FUN_tb = 'b1001 ;
 #16
 
  $display ("testing equal "); //////////////////////// case_1
  
   if(CMP_Flag_tb == 'b 1 && ~( Arith_Flag_tb | Logic_Flag_tb | SHIFT_Flag_tb ) )

    begin
     $display ("	ALU could detect compare Operations ");
    end


   else

    begin
     $display ("	ALU flags have problem ");
    end

  
   if( CMP_OUT_tb == 'b0 && ~|( Arith_OUT_tb | Logic_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in equal (it is not equal) ");
    end

   else

    begin
     $display ("	ALU has problem with not equal ");
    end 		

  
  A_tb = 'd25 ;
  B_tb = 'd25 ;
 #16
   if( CMP_OUT_tb == 'b1 && ~|( Arith_OUT_tb | Logic_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in equal (it is equal) ");
    end

   else

    begin
     $display ("	ALU has problem with equal ");
    end 		///////// case_1

  A_tb = 'd255 ;
  B_tb = 'd25 ;
  ALU_FUN_tb = 'b1010 ;
 #16

  $display ("testing  greater than "); //////////////////////// case_2
  
   if( CMP_OUT_tb == 'b10 && ~|( Arith_OUT_tb | Logic_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in greater (it is greater) ");
    end

   else

    begin
     $display ("	ALU has problem with greater (it is greater)  ");
    end 		

  
  A_tb = 'd5 ;
  B_tb = 'd25 ;
 #16

   if( CMP_OUT_tb == 'b0 && ~|( Arith_OUT_tb | Logic_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in greater (it is not greater) ");
    end

   else

    begin
     $display ("	ALU has problem with greater (it is not greater) ");
    end 		///////// case_2


  A_tb = 'd2 ;
  B_tb = 'd25 ;
  ALU_FUN_tb = 'b1011 ;
 #16

  $display ("testing  less than "); //////////////////////// case_3
  
   if( CMP_OUT_tb == 'b11 && ~|( Arith_OUT_tb | Logic_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in less (it is less) ");
    end

   else

    begin
     $display ("	ALU has problem with less (it is less)  ");
    end 		

  
  A_tb = 'd555 ;
  B_tb = 'd25 ;
 #16

   if( CMP_OUT_tb == 'b0 && ~|( Arith_OUT_tb | Logic_OUT_tb | SHIFT_OUT_tb ) )
    
    begin
     $display ("		ALU works in less (it is not less) ");
    end

   else

    begin
     $display ("	ALU has problem with less (it is not less) ");
    end 		///////// case_3

//////////////////////////////////////////////////////////////////////////////////////// shift

  
  A_tb = 'd500 ;
  B_tb = 'd100 ;
  ALU_FUN_tb = 'b1100 ;
 #16
 
  $display ("testing shifting A to right "); //////////////////////// case_1
  
   if(  SHIFT_Flag_tb == 'b 1 && ~( Logic_Flag_tb | CMP_Flag_tb | Arith_Flag_tb ) )

    begin
     $display ("	ALU could detect shift ");
    end


   else

    begin
     $display ("	ALU flags have problem (shift) ",Logic_Flag_tb , CMP_Flag_tb, Arith_Flag_tb, $time);
    end

  
   if( SHIFT_OUT_tb == 'd250 && ~|( Logic_OUT_tb | CMP_OUT_tb | Arith_OUT_tb ) )
    
    begin
     $display ("		ALU works in shifting A to right ");
    end

   else

    begin
     $display ("	ALU has problem in shifting A to right ");
    end 		///////// case_1

  ALU_FUN_tb = 'b1101 ;
 #16
  
  $display ("testing  shifting A to left "); //////////////////////// case_2
  
  
   if( SHIFT_OUT_tb == 'd1000 && ~|( Logic_OUT_tb | CMP_OUT_tb | Arith_OUT_tb ) )
    
    begin
     $display ("		ALU works in shifting A to left ");
    end

   else

    begin
     $display ("	ALU has problem in shifting A to left ");
    end 		///////// case_2


 
  ALU_FUN_tb = 'b1110 ;
 #16
  
  $display ("testing shifting B to the right "); //////////////////////// case_3
  
  
   if( SHIFT_OUT_tb == 'd50 && ~|( Logic_OUT_tb | CMP_OUT_tb | Arith_OUT_tb ) )
    
    begin
     $display ("		ALU works in shifting B to Right ");
    end

   else

    begin
     $display ("	ALU has problem in shifting B to Right ");
    end 		///////// case_3


  ALU_FUN_tb = 'b1111 ;
 #16
  
  $display ("testing shifting B to the left "); //////////////////////// case_4
  
  
   if( SHIFT_OUT_tb == 'd200 && ~|( Logic_OUT_tb | CMP_OUT_tb | Arith_OUT_tb ) )
    
    begin
     $display ("		ALU works in shifting B to left ");
    end

   else

    begin
     $display ("	ALU has problem in shifting B to left ");
    end 		///////// case_4

$stop ;
 

 end //initial
endmodule 

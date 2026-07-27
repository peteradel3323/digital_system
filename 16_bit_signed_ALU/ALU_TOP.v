module ALU_TOP #(parameter Width = 16 )(
input [Width - 1 :0] A , B,
input [3:0] ALU_FUN ,
input clk , rst ,
output [Width - 1 : 0]  Logic_OUT , CMP_OUT , SHIFT_OUT,
output [2 * Width - 1 : 0] Arith_OUT ,
output Arith_Flag , Logic_Flag , CMP_Flag , SHIFT_Flag
);

wire [1:0] decoder_out ;
wire [1:0] op_code ;
wire shift_Enable , CMP_Enable , Logic_Enable , Arith_Enable ;





assign decoder_out = ALU_FUN [3:2];
assign op_code = ALU_FUN [1:0];


Decoder_Unit dec_1(
.dec_in(decoder_out),
.rst(rst),
.SHIFT_EN(shift_Enable),
.Logic_EN(Logic_Enable),
.CMP_EN(CMP_Enable),
.Arith_EN(Arith_Enable)
);


SHIFT_UNIT #( .width(Width) ) shift_block (
.A(A),
.B(B),
.clk(clk),
.rst(rst),
.ALU_FUN(op_code),
.shift_Enable(shift_Enable),
.SHIFT_Flag(SHIFT_Flag),
.SHIFT_OUT(SHIFT_OUT)
);


CMP_UNIT #( .width(Width) ) cmp_block (
.A(A),
.B(B),
.clk(clk),
.rst(rst),
.ALU_FUN(op_code),
.CMP_Enable(CMP_Enable),
.CMP_Flag(CMP_Flag),
.CMP_OUT(CMP_OUT)
);


ARITHMETIC_UNIT #( .width (Width) ) arith_block (
.A(A),
.B(B),
.clk(clk),
.rst(rst),
.ALU_FUN(op_code),
.Arith_Enable(Arith_Enable),
.Arith_Flag(Arith_Flag),
.Arith_OUT(Arith_OUT)
);

LOGIC_UNIT #( .width (Width) ) logic_block (
.A(A),
.B(B),
.clk(clk),
.rst(rst),
.ALU_FUN(op_code),
.Logic_Enable(Logic_Enable),
.Logic_Flag(Logic_Flag),
.Logic_OUT(Logic_OUT)
);


endmodule

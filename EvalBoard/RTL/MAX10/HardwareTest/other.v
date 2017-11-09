module mul_o(mulin1, mulin2, mulout);
    input [63:0] mulin1, mulin2;
    output [63:0] mulout;
    assign mulout=mulin1*mulin2;
endmodule

module divi(clk, clkout);
	input clk;
	output reg clkout;
	reg [25:0] cnt;
	
	always @(posedge clk)
		begin
			cnt=cnt+1;
			if (cnt==26'b00000000000000000000010100)
				begin clkout=~clkout; cnt=25'b0; end
		end
		
endmodule

module mux2(muxin1, muxin2, sel, muxout);
	input [255:0] muxin1, muxin2;
	input sel;
	output [255:0] muxout;
	assign muxout=(sel==1'b1)? muxin2:muxin1;
endmodule

module sqrt_o(in1, out1);
	input [63:0] in1;
	output [63:0] out1;
	assign out1=in1**2;
endmodule

module mod_o(in1, in2, out1);
	input [63:0] in1, in2;
	output [63:0] out1;
	assign out1=in1 % in2;
endmodule

module sam_o (clk, z, n, x, e, zz);
	input e, clk;
	input [63:0] z, n, x;
	output reg [63:0] zz;
	wire [63:0] a1, a2, a3, a4;
	
	sqrt_o U0(.in1(z), .out1(a1));
	mod_o U1(.in1(a1), .in2(n), .out1(a2));
	mul_o U2(.mulin1((e==1'b1)? a2: 64'h0000000000000000), .mulin2((e==1'b0)? 64'h0000000000000000: x), .mulout(a3));
	mod_o U3(.in1(a3), .in2(n), .out1(a4));
	
	always @(posedge clk) zz=(e==1'b1)? a4:a2;
	
endmodule

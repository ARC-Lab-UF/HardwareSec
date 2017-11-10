/////////////////////////////////////////////////////////////////////
////                                                             ////
////  DES                                                        ////
////  DES Top Level module                                       ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2001 Rudolf Usselmann                         ////
////                    rudi@asics.ws                            ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////
//// For EEL 5934:
//// This file has been modified in 2016 by sy. There are 
//// two modules in this file: des and des_o. des_o is the 
//// original top module. des is the new top module. des_o is 
//// instantiated in des. Plaintext and key are given in des. 
//// There is a RAM module called ram1 instantiated, which is a 
//// 64-bit wide, 32-word deep RAM. It will store all the 
//// encryption results of the 16 rounds. All the submodules 
//// are given except the ram1 module. You should create the 
//// ram1 module from ‘RAM: 1-PORT’ of the installed IP with 
//// exactly the same name, ram1, and exactly the same size. 
//// Make sure it can be captured by the In-System Memory 
//// Content Editor in the last step of Parameter Settings.
//// Plan clk_in on PIN_88 and rst on a switch, e.g. PIN_30.
//// Module divi is added to slow down the clock so that an error
//// will not be caused due to a fast clock. You can even make it
//// slower.
////////////////////////////////////////////////////////////////////

module des(clk_in, rst);
	input rst;
	input clk_in;
	wire [63:0] desout;
	wire [63:0] desIn;
	wire [63:0] key64;
	wire [55:0] key56;
	reg [3:0] cnt;
	wire clk;
	
	divi Uclk(.clk(clk_in), .clkout(clk));
	

	assign desIn=64'hA42F891BD376CE05;
	assign key64=64'h0123456789ABCDEF;
	assign key56={key64[63:57],key64[55:49],key64[47:41],key64[39:33],key64[31:25],key64[23:17],key64[15:9],key64[7:1]};
	
	des_o U1(.desOut(desout), 
				.desIn(desIn), 
				.key(key56), 
				.decrypt(1'b0), 
				.roundSel(cnt), 
				.clk(clk));
				
	ram1 U2(
	.address({1'b0,cnt[3:0]}),
	.clock(clk),
	.data(desout),
	.wren(1'b1),
	.q());
	
	always @(posedge clk)
		begin
			if(rst) cnt=4'b0000;
			else cnt=cnt+4'b0001;
		end		
	
endmodule


module des_o(desOut, desIn, key, decrypt, roundSel, clk);
	output	[63:0]	desOut;
	input	[63:0]	desIn;
	input	[55:0]	key;
	input		decrypt;
	input	[3:0]	roundSel;
	input		clk;

	wire	[1:48]	K_sub;
	wire	[1:64]	IP, FP;
	reg	[1:32]	L, R;
	wire	[1:32]	Xin;
	wire	[1:32]	Lout, Rout;
	wire	[1:32]	out;

	assign Lout = (roundSel == 0) ? IP[33:64] : R;
	assign Xin  = (roundSel == 0) ? IP[01:32] : L;
	assign Rout = Xin ^ out;
	assign FP = { Rout, Lout};

	crp u0( .P(out), .R(Lout), .K_sub(K_sub) );

	always @(posedge clk)
			  L <= #1 Lout;

	always @(posedge clk)
			  R <= #1 Rout;
			  
	// Select a subkey from key.
	key_sel u1(
		.K_sub(		K_sub		),
		.K(		key		),
		.roundSel(	roundSel	),
		.decrypt(	decrypt		)
		);

	// Perform initial permutation
	assign IP[1:64] = {	desIn[06], desIn[14], desIn[22], desIn[30], desIn[38], desIn[46],
				desIn[54], desIn[62], desIn[04], desIn[12], desIn[20], desIn[28],
				desIn[36], desIn[44], desIn[52], desIn[60], desIn[02], desIn[10], 
				desIn[18], desIn[26], desIn[34], desIn[42], desIn[50], desIn[58], 
				desIn[00], desIn[08], desIn[16], desIn[24], desIn[32], desIn[40], 
				desIn[48], desIn[56], desIn[07], desIn[15], desIn[23], desIn[31], 
				desIn[39], desIn[47], desIn[55], desIn[63], desIn[05], desIn[13],
				desIn[21], desIn[29], desIn[37], desIn[45], desIn[53], desIn[61],
				desIn[03], desIn[11], desIn[19], desIn[27], desIn[35], desIn[43],
				desIn[51], desIn[59], desIn[01], desIn[09], desIn[17], desIn[25],
				desIn[33], desIn[41], desIn[49], desIn[57] };

	// Perform final permutation
	assign desOut = {	FP[40], FP[08], FP[48], FP[16], FP[56], FP[24], FP[64], FP[32], 
				FP[39], FP[07], FP[47], FP[15], FP[55], FP[23], FP[63], FP[31], 
				FP[38], FP[06], FP[46], FP[14], FP[54], FP[22], FP[62], FP[30], 
				FP[37], FP[05], FP[45], FP[13], FP[53], FP[21], FP[61], FP[29], 
				FP[36], FP[04], FP[44], FP[12], FP[52], FP[20], FP[60], FP[28], 
				FP[35], FP[03], FP[43], FP[11], FP[51], FP[19], FP[59], FP[27],
				FP[34], FP[02], FP[42], FP[10], FP[50], FP[18], FP[58], FP[26], 
				FP[33], FP[01], FP[41], FP[09], FP[49], FP[17], FP[57], FP[25] };

endmodule

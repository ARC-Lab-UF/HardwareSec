module mul
(
    input   clk_o,
    input   rst
    //input   [7:0] e
);

    assign clk_out = clk;

    reg [4:0] cnt;
    wire clk;
    wire [63:0] z, n, x, zz1, zz2, zz3, zz4, zz5, zz6, zz7, zz8, zz9, zz10;
    wire e_round;

    /////////////////////////////////////////////////////////
    // This should be replaced later by setting e as an input
    wire [7:0] e;
    assign e=8'b00001111;
    /////////////////////////////////////////////////////////

    assign n=64'hbe3a20ff7a7d7fca;
    assign x=64'hf01f2e724ac0ab35;

    sam_o U1  (.clk(clk), .z( (cnt[2:0]==3'b000)? 64'h0000000000000001:zz1) , .n(n), .x(x), .e(e_round), .zz(zz1));
    sam_o U2  (.clk(clk), .z( (cnt[2:0]==3'b000)? 64'h0000000000000001:zz2) , .n(n), .x(x), .e(e_round), .zz(zz2));
    sam_o U3  (.clk(clk), .z( (cnt[2:0]==3'b000)? 64'h0000000000000001:zz3) , .n(n), .x(x), .e(e_round), .zz(zz3));
    sam_o U4  (.clk(clk), .z( (cnt[2:0]==3'b000)? 64'h0000000000000001:zz4) , .n(n), .x(x), .e(e_round), .zz(zz4));
    sam_o U5  (.clk(clk), .z( (cnt[2:0]==3'b000)? 64'h0000000000000001:zz5) , .n(n), .x(x), .e(e_round), .zz(zz5));
    sam_o U6  (.clk(clk), .z( (cnt[2:0]==3'b000)? 64'h0000000000000001:zz6) , .n(n), .x(x), .e(e_round), .zz(zz6));
    sam_o U7  (.clk(clk), .z( (cnt[2:0]==3'b000)? 64'h0000000000000001:zz7) , .n(n), .x(x), .e(e_round), .zz(zz7));
    sam_o U8  (.clk(clk), .z( (cnt[2:0]==3'b000)? 64'h0000000000000001:zz8) , .n(n), .x(x), .e(e_round), .zz(zz8));
    sam_o U9  (.clk(clk), .z( (cnt[2:0]==3'b000)? 64'h0000000000000001:zz9) , .n(n), .x(x), .e(e_round), .zz(zz9));
    sam_o U10 (.clk(clk), .z( (cnt[2:0]==3'b000)? 64'h0000000000000001:zz10), .n(n), .x(x), .e(e_round), .zz(zz10));
    

    divi Ud(.clk(clk_o), .clkout(clk));

    
    assign e_round=e[7-cnt[2:0]];


    always @(negedge clk) begin
        if(rst==1'b1) cnt=5'b00000;
        else cnt=cnt+5'b00001;
    end


    ram64 Ur [1:10](
    .address(cnt),
    .clock(clk),
    .data({zz1, zz2, zz3, zz4, zz5, zz6, zz7, zz8, zz9, zz10}),
    .wren(1'b1),
    .q());

endmodule

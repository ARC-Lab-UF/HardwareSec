module top
(
    input   clk,
    input   rst,
    input   enable,
    output  trigger,
    output  [7:0] LEDs
);

// Wires for top level connections
wire [3:0]  count;

// Clock divider stuff
reg         div_clk;
reg [24:0]  div_count;

// Attach the key to the LEDs
assign LEDs = ~{count, count};

// Use a clock divider to being the 50 MHz clock downto 1 Hz
//always @ (posedge clk)
//begin
//    if(rst) begin
//        div_clk     <= 1'b0;
//        div_count   <= 25'h0;
//    end
//    else begin
//        if (div_count == 25'h17D7840) begin
//            div_clk     <= ~div_clk;
//            div_count   <= 25'h0;
//        end
//        else begin
//            div_count   <= div_count + 1;
//        end
//    end
//end
//
//// Incrementing 4-bit counter
//counter counter_i
//    (
//        .clk(div_clk),
//        .en(enable),
//        .rst(rst),
//        .out(count)
//    );

// We need something to run to see if we can capture the trace.
//mul mul_i
//    (
//        .clk_o(clk),
//        .rst(rst)
//    );

des des_i
    (
        .clk_in(clk),
        .rst(rst),
        .enable(enable),
        .trigger(trigger)
    );

endmodule

module counter
(
    input               clk,
    input               en,
    input               rst,
    output reg [3:0]    out
);

always @ (posedge clk or posedge rst)
    if (rst) begin
        out <= 4'h0;
    end
    else if (en)
    begin
        out <= out + 1;
    end
endmodule 
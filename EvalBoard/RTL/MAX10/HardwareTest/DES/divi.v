module divi (
                input       clk,
                input       enable,
                output reg  clkout
            );

    reg [25:0] cnt;

    always @(posedge clk)
        begin
            if (enable == 1)
            begin
                cnt=cnt+1;
            end

            //if (cnt==26'b00000110101111000010000000)
            if (cnt==26'b00000000000000000000010100) // faster clock ftw
            begin
                clkout=~clkout;
                cnt=26'b0;
            end
        end
endmodule

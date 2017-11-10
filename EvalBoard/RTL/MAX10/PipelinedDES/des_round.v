module des_round
    (
        input   [1:32] Rin,  // 32-bit right-half input
        input   [1:32] Lin,  // 32-bit left-half input
        input   [1:48] K,    // 48-bit round key
        output  [1:32] Rout, // 32-bit right-half output
        output  [1:32] Lout  // 32-bit left-half output
    );

    wire    [1:32] P;   // 32-bit output of round function
    wire    [1:32] PXL; // 32-bit result of P XOR L

    // Pass the right-half input into the round function
    des_round_function u0 (
            .R(Rin),
            .K(K),
            .P(P)
        );

    // Bit-wise XOR P and Lin
    assign PXL = P ^ Lin;

    // Swap the sides for the next round
    assign Rout = PXL;
    assign Lout = Rin;
endmodule

/*
 *  This module is designed to perform the round function for DES. The
 *   indexing has been adjusted to match the values in the respective
 *   tables (https://en.wikipedia.org/wiki/DES_supplementary_material).
 */
module des_round_function
    (
        input   [1:32] R, // 32-bit right-half input
        input   [1:48] K, // 48-bit round key
        output  [1:32] P  // 32-bit output permutation
    );

    wire    [1:48] E;   // 48-bit expanded right-half input
    wire    [1:48] EXK; // 48-bit result of E XOR K
    wire    [1:32] S;   // 32-bit output of S-Boxes

    // First, apply the Expansion to R0
    assign E[1:48] = {
        R[32], R[01], R[02], R[03], R[04], R[05],
        R[04], R[05], R[06], R[07], R[08], R[09],
        R[08], R[09], R[10], R[11], R[12], R[13],
        R[12], R[13], R[14], R[15], R[16], R[17],
        R[16], R[17], R[18], R[19], R[20], R[21],
        R[20], R[21], R[22], R[23], R[24], R[25],
        R[24], R[25], R[26], R[27], R[28], R[29],
        R[28], R[29], R[30], R[31], R[32], R[01]
    };

    // Bit-wise XOR E and K
    assign EXK = E ^ K;

    // Split EXK into groups of 6-bits, then feed those values
    //  into the respective S-Box.
    sbox_1 u0 (
        .addr(EXK[01:06]),
        .data(S[01:04])
    );

    sbox_2 u1 (
        .addr(EXK[07:12]),
        .data(S[05:08])
    );

    sbox_3 u2 (
        .addr(EXK[13:18]),
        .data(S[09:12])
    );

    sbox_4 u3 (
        .addr(EXK[19:24]),
        .data(S[13:16])
    );

    sbox_5 u4 (
        .addr(EXK[25:30]),
        .data(S[17:20])
    );

    sbox_6 u5 (
        .addr(EXK[31:36]),
        .data(S[21:24])
    );

    sbox_7 u6 (
        .addr(EXK[37:42]),
        .data(S[25:28])
    );

    sbox_8 u7 (
        .addr(EXK[43:48]),
        .data(S[29:32])
    );

    // Apply the permutation to the S-Box outputs
    assign P[1:32] = {
        S[16], S[07], S[20], S[21], S[29], S[12], S[28], S[17],
        S[01], S[15], S[23], S[26], S[05], S[18], S[31], S[10],
        S[02], S[08], S[24], S[14], S[32], S[27], S[03], S[09],
        S[19], S[13], S[30], S[06], S[22], S[11], S[04], S[25]
    };
endmodule

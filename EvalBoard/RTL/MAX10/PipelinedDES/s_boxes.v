/*
 *  This file contains a collection of S-Boxes. Each one should be
 *   implemented as distributed ram.
 */
module sbox_1
    (
        input       [1:6] addr,
        output reg  [1:4] data
    );

    always @ (addr)
    begin
        case ({addr[1], addr[6], addr[2:5]})
             0:  data =  14;
             1:  data =   4;
             2:  data =  13;
             3:  data =   1;
             4:  data =   2;
             5:  data =  15;
             6:  data =  11;
             7:  data =   8;
             8:  data =   3;
             9:  data =  10;
            10:  data =   6;
            11:  data =  12;
            12:  data =   5;
            13:  data =   9;
            14:  data =   0;
            15:  data =   7;

            16:  data =   0;
            17:  data =  15;
            18:  data =   7;
            19:  data =   4;
            20:  data =  14;
            21:  data =   2;
            22:  data =  13;
            23:  data =   1;
            24:  data =  10;
            25:  data =   6;
            26:  data =  12;
            27:  data =  11;
            28:  data =   9;
            29:  data =   5;
            30:  data =   3;
            31:  data =   8;

            32:  data =   4;
            33:  data =   1;
            34:  data =  14;
            35:  data =   8;
            36:  data =  13;
            37:  data =   6;
            38:  data =   2;
            39:  data =  11;
            40:  data =  15;
            41:  data =  12;
            42:  data =   9;
            43:  data =   7;
            44:  data =   3;
            45:  data =  10;
            46:  data =   5;
            47:  data =   0;

            48:  data =  15;
            49:  data =  12;
            50:  data =   8;
            51:  data =   2;
            52:  data =   4;
            53:  data =   9;
            54:  data =   1;
            55:  data =   7;
            56:  data =   5;
            57:  data =  11;
            58:  data =   3;
            59:  data =  14;
            60:  data =  10;
            61:  data =   0;
            62:  data =   6;
            63:  data =  13;
        endcase
    end
endmodule

module sbox_2
    (
        input       [1:6] addr,
        output reg  [1:4] data
    );

    always @ (addr)
    begin
        case ({addr[1], addr[6], addr[2:5]})
             0:  data = 15;
             1:  data =  1;
             2:  data =  8;
             3:  data = 14;
             4:  data =  6;
             5:  data = 11;
             6:  data =  3;
             7:  data =  4;
             8:  data =  9;
             9:  data =  7;
            10:  data =  2;
            11:  data = 13;
            12:  data = 12;
            13:  data =  0;
            14:  data =  5;
            15:  data = 10;

            16:  data =  3;
            17:  data = 13;
            18:  data =  4;
            19:  data =  7;
            20:  data = 15;
            21:  data =  2;
            22:  data =  8;
            23:  data = 14;
            24:  data = 12;
            25:  data =  0;
            26:  data =  1;
            27:  data = 10;
            28:  data =  6;
            29:  data =  9;
            30:  data = 11;
            31:  data =  5;

            32:  data =  0;
            33:  data = 14;
            34:  data =  7;
            35:  data = 11;
            36:  data = 10;
            37:  data =  4;
            38:  data = 13;
            39:  data =  1;
            40:  data =  5;
            41:  data =  8;
            42:  data = 12;
            43:  data =  6;
            44:  data =  9;
            45:  data =  3;
            46:  data =  2;
            47:  data = 15;

            48:  data = 13;
            49:  data =  8;
            50:  data = 10;
            51:  data =  1;
            52:  data =  3;
            53:  data = 15;
            54:  data =  4;
            55:  data =  2;
            56:  data = 11;
            57:  data =  6;
            58:  data =  7;
            59:  data = 12;
            60:  data =  0;
            61:  data =  5;
            62:  data = 14;
            63:  data =  9;
        endcase
    end
endmodule

module sbox_3
    (
        input       [1:6] addr,
        output reg  [1:4] data
    );

    always @ (addr)
    begin
        case ({addr[1], addr[6], addr[2:5]})
             0:  data = 10;
             1:  data =  0;
             2:  data =  9;
             3:  data = 14;
             4:  data =  6;
             5:  data =  3;
             6:  data = 15;
             7:  data =  5;
             8:  data =  1;
             9:  data = 13;
            10:  data = 12;
            11:  data =  7;
            12:  data = 11;
            13:  data =  4;
            14:  data =  2;
            15:  data =  8;

            16:  data = 13;
            17:  data =  7;
            18:  data =  0;
            19:  data =  9;
            20:  data =  3;
            21:  data =  4;
            22:  data =  6;
            23:  data = 10;
            24:  data =  2;
            25:  data =  8;
            26:  data =  5;
            27:  data = 14;
            28:  data = 12;
            29:  data = 11;
            30:  data = 15;
            31:  data =  1;

            32:  data = 13;
            33:  data =  6;
            34:  data =  4;
            35:  data =  9;
            36:  data =  8;
            37:  data = 15;
            38:  data =  3;
            39:  data =  0;
            40:  data = 11;
            41:  data =  1;
            42:  data =  2;
            43:  data = 12;
            44:  data =  5;
            45:  data = 10;
            46:  data = 14;
            47:  data =  7;

            48:  data =  1;
            49:  data = 10;
            50:  data = 13;
            51:  data =  0;
            52:  data =  6;
            53:  data =  9;
            54:  data =  8;
            55:  data =  7;
            56:  data =  4;
            57:  data = 15;
            58:  data = 14;
            59:  data =  3;
            60:  data = 11;
            61:  data =  5;
            62:  data =  2;
            63:  data = 12;
        endcase
    end
endmodule

module sbox_4
    (
        input       [1:6] addr,
        output reg  [1:4] data
    );

    always @ (addr)
    begin
        case ({addr[1], addr[6], addr[2:5]})
             0:  data =  7;
             1:  data = 13;
             2:  data = 14;
             3:  data =  3;
             4:  data =  0;
             5:  data =  6;
             6:  data =  9;
             7:  data = 10;
             8:  data =  1;
             9:  data =  2;
            10:  data =  8;
            11:  data =  5;
            12:  data = 11;
            13:  data = 12;
            14:  data =  4;
            15:  data = 15;

            16:  data = 13;
            17:  data =  8;
            18:  data = 11;
            19:  data =  5;
            20:  data =  6;
            21:  data = 15;
            22:  data =  0;
            23:  data =  3;
            24:  data =  4;
            25:  data =  7;
            26:  data =  2;
            27:  data = 12;
            28:  data =  1;
            29:  data = 10;
            30:  data = 14;
            31:  data =  9;

            32:  data = 10;
            33:  data =  6;
            34:  data =  9;
            35:  data =  0;
            36:  data = 12;
            37:  data = 11;
            38:  data =  7;
            39:  data = 13;
            40:  data = 15;
            41:  data =  1;
            42:  data =  3;
            43:  data = 14;
            44:  data =  5;
            45:  data =  2;
            46:  data =  8;
            47:  data =  4;

            48:  data =  3;
            49:  data = 15;
            50:  data =  0;
            51:  data =  6;
            52:  data = 10;
            53:  data =  1;
            54:  data = 13;
            55:  data =  8;
            56:  data =  9;
            57:  data =  4;
            58:  data =  5;
            59:  data = 11;
            60:  data = 12;
            61:  data =  7;
            62:  data =  2;
            63:  data = 14;
        endcase
    end
endmodule

module sbox_5
    (
        input       [1:6] addr,
        output reg  [1:4] data
    );

    always @ (addr)
    begin
        case ({addr[1], addr[6], addr[2:5]})
             0:  data =  2;
             1:  data = 12;
             2:  data =  4;
             3:  data =  1;
             4:  data =  7;
             5:  data = 10;
             6:  data = 11;
             7:  data =  6;
             8:  data =  8;
             9:  data =  5;
            10:  data =  3;
            11:  data = 15;
            12:  data = 13;
            13:  data =  0;
            14:  data = 14;
            15:  data =  9;

            16:  data = 14;
            17:  data = 11;
            18:  data =  2;
            19:  data = 12;
            20:  data =  4;
            21:  data =  7;
            22:  data = 13;
            23:  data =  1;
            24:  data =  5;
            25:  data =  0;
            26:  data = 15;
            27:  data = 10;
            28:  data =  3;
            29:  data =  9;
            30:  data =  8;
            31:  data =  6;

            32:  data =  4;
            33:  data =  2;
            34:  data =  1;
            35:  data = 11;
            36:  data = 10;
            37:  data = 13;
            38:  data =  7;
            39:  data =  8;
            40:  data = 15;
            41:  data =  9;
            42:  data = 12;
            43:  data =  5;
            44:  data =  6;
            45:  data =  3;
            46:  data =  0;
            47:  data = 14;

            48:  data = 11;
            49:  data =  8;
            50:  data = 12;
            51:  data =  7;
            52:  data =  1;
            53:  data = 14;
            54:  data =  2;
            55:  data = 13;
            56:  data =  6;
            57:  data = 15;
            58:  data =  0;
            59:  data =  9;
            60:  data = 10;
            61:  data =  4;
            62:  data =  5;
            63:  data =  3;
        endcase
    end
endmodule

module sbox_6
    (
        input       [1:6] addr,
        output reg  [1:4] data
    );

    always @ (addr)
    begin
        case ({addr[1], addr[6], addr[2:5]})
             0:  data = 12;
             1:  data =  1;
             2:  data = 10;
             3:  data = 15;
             4:  data =  9;
             5:  data =  2;
             6:  data =  6;
             7:  data =  8;
             8:  data =  0;
             9:  data = 13;
            10:  data =  3;
            11:  data =  4;
            12:  data = 14;
            13:  data =  7;
            14:  data =  5;
            15:  data = 11;

            16:  data = 10;
            17:  data = 15;
            18:  data =  4;
            19:  data =  2;
            20:  data =  7;
            21:  data = 12;
            22:  data =  9;
            23:  data =  5;
            24:  data =  6;
            25:  data =  1;
            26:  data = 13;
            27:  data = 14;
            28:  data =  0;
            29:  data = 11;
            30:  data =  3;
            31:  data =  8;

            32:  data =  9;
            33:  data = 14;
            34:  data = 15;
            35:  data =  5;
            36:  data =  2;
            37:  data =  8;
            38:  data = 12;
            39:  data =  3;
            40:  data =  7;
            41:  data =  0;
            42:  data =  4;
            43:  data = 10;
            44:  data =  1;
            45:  data = 13;
            46:  data = 11;
            47:  data =  6;

            48:  data =  4;
            49:  data =  3;
            50:  data =  2;
            51:  data = 12;
            52:  data =  9;
            53:  data =  5;
            54:  data = 15;
            55:  data = 10;
            56:  data = 11;
            57:  data = 14;
            58:  data =  1;
            59:  data =  7;
            60:  data =  6;
            61:  data =  0;
            62:  data =  8;
            63:  data = 13;
        endcase
    end
endmodule

module sbox_7
    (
        input       [1:6] addr,
        output reg  [1:4] data
    );

    always @ (addr)
    begin
        case ({addr[1], addr[6], addr[2:5]})
             0:  data =  4;
             1:  data = 11;
             2:  data =  2;
             3:  data = 14;
             4:  data = 15;
             5:  data =  0;
             6:  data =  8;
             7:  data = 13;
             8:  data =  3;
             9:  data = 12;
            10:  data =  9;
            11:  data =  7;
            12:  data =  5;
            13:  data = 10;
            14:  data =  6;
            15:  data =  1;

            16:  data = 13;
            17:  data =  0;
            18:  data = 11;
            19:  data =  7;
            20:  data =  4;
            21:  data =  9;
            22:  data =  1;
            23:  data = 10;
            24:  data = 14;
            25:  data =  3;
            26:  data =  5;
            27:  data = 12;
            28:  data =  2;
            29:  data = 15;
            30:  data =  8;
            31:  data =  6;

            32:  data =  1;
            33:  data =  4;
            34:  data = 11;
            35:  data = 13;
            36:  data = 12;
            37:  data =  3;
            38:  data =  7;
            39:  data = 14;
            40:  data = 10;
            41:  data = 15;
            42:  data =  6;
            43:  data =  8;
            44:  data =  0;
            45:  data =  5;
            46:  data =  9;
            47:  data =  2;

            48:  data =  6;
            49:  data = 11;
            50:  data = 13;
            51:  data =  8;
            52:  data =  1;
            53:  data =  4;
            54:  data = 10;
            55:  data =  7;
            56:  data =  9;
            57:  data =  5;
            58:  data =  0;
            59:  data = 15;
            60:  data = 14;
            61:  data =  2;
            62:  data =  3;
            63:  data = 12;
        endcase
    end
endmodule

module sbox_8
    (
        input       [1:6] addr,
        output reg  [1:4] data
    );

    always @ (addr)
    begin
        case ({addr[1], addr[6], addr[2:5]})
             0:  data = 13;
             1:  data =  2;
             2:  data =  8;
             3:  data =  4;
             4:  data =  6;
             5:  data = 15;
             6:  data = 11;
             7:  data =  1;
             8:  data = 10;
             9:  data =  9;
            10:  data =  3;
            11:  data = 14;
            12:  data =  5;
            13:  data =  0;
            14:  data = 12;
            15:  data =  7;

            16:  data =  1;
            17:  data = 15;
            18:  data = 13;
            19:  data =  8;
            20:  data = 10;
            21:  data =  3;
            22:  data =  7;
            23:  data =  4;
            24:  data = 12;
            25:  data =  5;
            26:  data =  6;
            27:  data = 11;
            28:  data =  0;
            29:  data = 14;
            30:  data =  9;
            31:  data =  2;

            32:  data =  7;
            33:  data = 11;
            34:  data =  4;
            35:  data =  1;
            36:  data =  9;
            37:  data = 12;
            38:  data = 14;
            39:  data =  2;
            40:  data =  0;
            41:  data =  6;
            42:  data = 10;
            43:  data = 13;
            44:  data = 15;
            45:  data =  3;
            46:  data =  5;
            47:  data =  8;

            48:  data =  2;
            49:  data =  1;
            50:  data = 14;
            51:  data =  7;
            52:  data =  4;
            53:  data = 10;
            54:  data =  8;
            55:  data = 13;
            56:  data = 15;
            57:  data = 12;
            58:  data =  9;
            59:  data =  0;
            60:  data =  3;
            61:  data =  5;
            62:  data =  6;
            63:  data = 11;
        endcase
    end
endmodule

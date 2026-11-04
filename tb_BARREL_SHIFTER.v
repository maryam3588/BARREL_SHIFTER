`timescale 1ns / 1ps

module tb_BARREL_SHIFTER;

    localparam N = 8;
    localparam Q = 3;

    reg  [N-1:0] a;
    reg  [Q-1:0] s;
    wire [N-1:0] y;

    reg  [N-1:0] expected;
    integer input_value;
    integer shift_amount;

    BARREL_SHIFTER #(
        .N(N),
        .Q(Q)
    ) dut (
        .a(a),
        .s(s),
        .y(y)
    );

    initial begin
        for (input_value = 0; input_value < (1 << N); input_value = input_value + 1) begin
            for (shift_amount = 0; shift_amount < (1 << Q); shift_amount = shift_amount + 1) begin
                a = input_value;
                s = shift_amount;
                expected = a >> shift_amount;

                #10;

                if (y !== expected) begin
                    $display("FAIL: a=%b s=%b expected=%b got=%b",
                             a, s, expected, y);
                    $finish;
                end
            end
        end

        $display("PASS: all input and shift combinations passed.");
        $finish;
    end

endmodule


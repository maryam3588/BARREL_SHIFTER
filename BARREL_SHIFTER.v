`timescale 1ns / 1ps

module BARREL_SHIFTER#(
    parameter integer N = 8,
    parameter integer Q = $clog2(N)
) (
    input      [N-1:0] a,
    input      [Q-1:0] s,
    output reg [N-1:0] y
);

    reg [N-1:0] stage [0:Q];
    integer i;

    always @(*) begin
        stage[0] = a;

        for (i = 0; i < Q; i = i + 1) begin
            if (s[i])
                stage[i+1] = stage[i] >> (2**i);
            else
                stage[i+1] = stage[i];
        end

        y = stage[Q];
    end

endmodule




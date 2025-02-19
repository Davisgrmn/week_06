module ones_compliment(
    input [3:0] A, B,
    output [3:0] Y
);
    wire [3:0] APlusB;
    wire [3:0] carry;
    wire [3:0] last;

    full_adder zero_bit(
        .A(A[0]),
        .B(B[0]),
        .Cin(1'b0),
        .Cout(carry[0]),
        .Y(APlusB[0])
    );
    
    full_adder one_bit(
        .A(A[1]),
        .B(B[1]),
        .Cin(carry[0]),
        .Cout(carry[1]),
        .Y(APlusB[1])
    );
    
    full_adder third_bit(
        .A(A[2]),
        .B(B[2]),
        .Cin(carry[1]),
        .Cout(carry[2]),
        .Y(APlusB[2])
    );
    
    full_adder four_bit(
        .A(A[3]),
        .B(B[3]),
        .Cin(carry[2]),
        .Cout(carry[3]),
        .Y(APlusB[3])
    );
    
    full_adder final_zero_bit(
        .A(APlusB[0]),
        .B(1'b0),
        .Cin(carry[3]),
        .Cout(last[0]),
        .Y(Y[0])
    );
    
    full_adder final_first_bit(
        .A(APlusB[1]),
        .B(1'b0),
        .Cin(last[0]),
        .Cout(last[1]),
        .Y(Y[1])
    );
    
     full_adder final_second_bit(
        .A(APlusB[2]),
        .B(1'b0),
        .Cin(last[1]),
        .Cout(last[2]),
        .Y(Y[2])
    );
    
    full_adder final_third_bit(
        .A(APlusB[3]),
        .B(1'b0),
        .Cin(last[2]),
        .Cout(last[3]),
        .Y(Y[3])
    );

endmodule
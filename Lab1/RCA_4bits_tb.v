

module ripple_carry_adder_tb;
    reg [3:0] in0;
    reg [3:0] in1;
    wire [3:0] out;
    wire cout;
    wire s_overflow;
    wire u_overflow;

    ripple_carry_adder rca(.in0(in0), .in1(in1), .out(out), .cout(cout), .s_overflow(s_overflow), .u_overflow(u_overflow));
    
    initial begin
        in0 = 4'b0000; in1 = 4'b0010; #10
        in0 = 4'b1111; in1 = 4'b1110; #10
        in0 = 4'b1111; in1 = 4'b1111;

    end

    initial begin
    $monitor($time, ": %b + %b = %b, %b ,signed_overflow=%b ,unsigned_overflow=%b", in0, in1, out, cout,s_overflow,u_overflow);

    end

endmodule
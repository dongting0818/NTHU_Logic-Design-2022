module ripple_carry_adder (in0, in1, out, cout,s_overflow,u_overflow);
// declare input signals
input [3:0] in0;
input [3:0] in1;

// declare output signals
output [3:0] out;
output cout;
output s_overflow;
output u_overflow;

// here is your design
wire carry0,carry1,carry2,carry3;
fullAdder f0(in0[0], in1[0], out[0], carry0, 0);
fullAdder f1(in0[1], in1[1], out[1], carry1, carry0);
fullAdder f2(in0[2], in1[2], out[2], carry2, carry1);
fullAdder f3(in0[3], in1[3], out[3], cout, carry2);
or or3(u_overflow, 0, cout);
or or4(s_overflow, 0, cout);
//assign u_overflow = carry3;
//assign s_overflow = carry3;
//assign cout = carry3;
endmodule

module fullAdder(A, B, out, carry, pre_carry);
input A;
input B;
input pre_carry;
output out, carry;
/*wire x1,x2,o1,a1,a2,x3;
xor xor2(x2,A,B);
xor xor1(x1,x2,pre_carry);
xor xor3(x3,A,B);
and and2(a2,pre_carry,x3);
and and1(a1,A,B);
or or1(o1,a1,a2);*/

wire n1,n2,n3,a1,a2,a3,a4,a5;
wire aa1,aa2,aa3,o2;
not not1(n1,A);
not not2(n2,B);
not not3(n3,pre_carry);
and and1(a1,n1,n2,pre_carry);
and and2(a2,n1,B,n3);
and and3(a3,A,n2,n3);
and and4(a4,A,B,pre_carry);
or or1(out,a1,a2,a3,a4);
//assign out = o1;
and and5(aa1,A,B);
and and6(aa2,B,pre_carry);
and and7(aa3,A,pre_carry);
or or2(carry,aa1,aa2,aa3);
//assign carry = o2;



//assign out = x1;
//assign carry = o1;


endmodule



module assign_2_Q2_tb
#(parameter N = 4)
();

//Interfacing signals...
reg [N - 1 : 0] a_tb, b_tb, c_tb;

wire [(2 * N) - 1 : 0] out1_tb, out2_tb;

//Module instantiation...
assign_2_Q2 #(.n(N)) DUT
(
	.a(a_tb),
	.b(b_tb),
	.c(c_tb),
	.out1(out1_tb),
	.out2(out2_tb)
);

//Testbench...
initial
begin
	a_tb = 'b0;
	b_tb = 'b0;
	c_tb = 'b0;

	#10
	a_tb = $random;
	b_tb = $random;
	c_tb = $random;

	#5
	b_tb = $random;

	#7
	c_tb = $random;

	#12
	a_tb = $random;
	b_tb = $random;
	c_tb = $random;

	#4
	a_tb = $random;
end

initial
	$monitor ("When a = %b\tb = %b\tc = %b ---> out1 = %b\tout2 = %b", a_tb, b_tb, c_tb, out1_tb, out2_tb);

endmodule
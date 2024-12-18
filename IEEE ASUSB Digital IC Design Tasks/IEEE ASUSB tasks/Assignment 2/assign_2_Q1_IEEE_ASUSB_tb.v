module assign_2_Q1_tb
();

//interfacing signals...
reg [2 : 0] a_tb;
reg en_n_tb;
wire [7 : 0] y_tb;

//Module instantiation...
assign_2_Q1 DUT
(
	.a(a_tb),
	.en_n(en_n_tb),
	.y(y_tb)
);

//Testbench...
initial
begin
	a_tb = 3'b0;
	en_n_tb = 1'b1;

	#7
	en_n_tb = 1'b0;
	a_tb = $random;

	#8
	a_tb = $random;

	#9
	a_tb = $random;

	#6
	a_tb = $random;

	#13
	en_n_tb = 1'b1;
	a_tb = $random;

	#11
	a_tb = $random;

	#4
	en_n_tb = 1'b0;
end

initial
	$monitor ($time, "When a = %d, en_n = %b ----> y = %d (2 to the power 'a')", a_tb, en_n_tb, y_tb);

endmodule
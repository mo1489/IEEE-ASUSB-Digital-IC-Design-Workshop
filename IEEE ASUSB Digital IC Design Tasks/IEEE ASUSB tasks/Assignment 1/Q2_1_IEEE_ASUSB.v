module Q2_1
(
	input x, y,
	output d, b
);

//Assignments...

assign d = x ^ y;

assign b = (~x) & y;

endmodule
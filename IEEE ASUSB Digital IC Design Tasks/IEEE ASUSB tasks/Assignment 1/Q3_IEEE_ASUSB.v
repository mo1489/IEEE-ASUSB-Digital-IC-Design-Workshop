module Q3
(
	input in0, in1,
	input sel,
	output sum, carry
);

//Interconnects...

wire s_HS, s_HA, c_HS, c_HA;

//Module instantiations...

Q2_1 HS
(
	.x(in0),
	.y(in1),
	.d(s_HS),
	.b(c_HS)
);

Q2_2 HA
(
	.a(in0),
	.b(in1),
	.s(s_HA),
	.c(c_HA)
);

mux_2x1 sum_mux
(
	.i0(s_HS),
	.i1(s_HA),
	.sel(sel),
	.z(sum)
);

mux_2x1 carry_mux
(
	.i0(c_HS),
	.i1(c_HA),
	.sel(sel),
	.z(carry)
);

endmodule
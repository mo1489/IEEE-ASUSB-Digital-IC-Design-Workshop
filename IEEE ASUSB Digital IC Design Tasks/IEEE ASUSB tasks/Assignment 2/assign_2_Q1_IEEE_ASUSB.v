module assign_2_Q1
(
	input [2 : 0] a,
	input en_n,
	output reg [7 : 0] y
);

always @(*)
begin
	y = 8'b0;
	if (!en_n)
	begin
		case (a)
			3'd0 : y [0] = 1'b1;
			3'd1 : y [1] = 1'b1;
			3'd2 : y [2] = 1'b1;
			3'd3 : y [3] = 1'b1;
			3'd4 : y [4] = 1'b1;
			3'd5 : y [5] = 1'b1;
			3'd6 : y [6] = 1'b1;
			3'd7 : y [7] = 1'b1;
		endcase
	end

	else
		y = 'bz;
end

endmodule
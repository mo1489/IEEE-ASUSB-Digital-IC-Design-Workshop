module assign_2_Q2
#(parameter n = 4)
(
	input [n - 1 : 0] a, b, c,
	output reg [(2 * n) - 1 : 0] out1, out2
);

always @(*)
begin
	if ( (a > b) && (a > c) ) //If 'a' is the largest operand, conduct the following...
	begin
		if (a [n - 1]) //If the MSB of 'a' is 1, conduct the following...
			out1 = { {n{1'b1}} , a};
		else //If the MSB of 'a' is 0, conduct the following...
			out1 = { {n{1'b0}} , a};

		out2 = {b, c};
	end

	else if ( (b > a) && (b > c) ) //If 'b' is the largest operand, conduct the following...
	begin
		if (b [n - 1]) //If the MSB of 'b' is 1, conduct the following...
			out1 = { {n{1'b1}} , b};
		else //If the MSB of 'b' is 0, conduct the following...
			out1 = { {n{1'b0}} , b};

		out2 = {a, c};
	end

	else if ( (c > a) && (c > b) ) //If 'c' is the largest operand, conduct the following...
	begin
		if (c [n - 1]) //If the MSB of 'c' is 1, conduct the following...
			out1 = { {n{1'b1}} , c};
		else //If the MSB of 'c' is 0, conduct the following...
			out1 = { {n{1'b0}} , c};

		out2 = {a, b};
	end

	else if ( (a == b) && (b == c) && (a == c) ) //If all the operands are equal, conduct the following...
	begin
		out1 = a << 2;
		out2 = a >> 2;
	end


	else //Here, default statement is necessary, since the previous if / else if statements haven't covered all the possibilities (e.g. what to do when 2 operands are equal?).
	begin
		out1 = 'b0;
		out2 = 'b0;
	end
end

endmodule
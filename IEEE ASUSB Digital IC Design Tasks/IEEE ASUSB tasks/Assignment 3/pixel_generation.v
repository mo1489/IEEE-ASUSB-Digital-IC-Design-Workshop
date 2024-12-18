module pixel_generation
(
	input clk, en, clr_n,
	input [9 : 0] pixel_x, pixel_y,
	output reg [2 : 0] RGB
);

always @(posedge clk, posedge en, negedge en, negedge clr_n)
begin
	if (!clr_n)
		RGB <= 3'b000;
	else
	begin
		if (en)
			RGB <= 3'b110; //Generating a full screem of yellow color (R = 1, G = 1, B = 0 ---> yellow).
		else
			RGB <= 3'b0;
	end
end

endmodule
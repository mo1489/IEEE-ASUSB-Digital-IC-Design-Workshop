module VGA_controller
(
	input clk, clr_n,
	output [2 : 0] RGB,
	output H_sync, V_sync
);

//Interconnects...
wire video_on_en;
wire [9 : 0] pixel_x, pixel_y;

//Module instantiations...
VGA_sync M0
(
	.clk(clk),
	.clr_n(clr_n),
	.pixel_x(pixel_x),
	.pixel_y(pixel_y),
	.H_sync(H_sync),
	.V_sync(V_sync),
	.video_on(video_on_en)
);

pixel_generation M1
(
	.clk(clk),
	.pixel_x(pixel_x),
	.pixel_y(pixel_y),
	.en(video_on_en),
	.clr_n(clr_n),
	.RGB(RGB)
);

endmodule
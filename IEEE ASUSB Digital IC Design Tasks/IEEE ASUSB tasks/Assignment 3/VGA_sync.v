module VGA_sync
(
	input clk, clr_n,
	output reg [9 : 0] pixel_x, pixel_y,
	output reg H_sync, V_sync, video_on
);

//Manipulating registers...
reg [9 : 0] pixel_x_present = 'b0, pixel_x_next, pixel_y_present = 'b0, pixel_y_next;

//Present state logic...
always @(posedge clk, negedge clr_n)
begin
	if (!clr_n)
	begin
		pixel_x_present <= 10'b0;
		pixel_y_present <= 10'b0;
	end

	else
	begin
		pixel_x_present <= pixel_x_next;
		pixel_y_present <= pixel_y_next;
	end
end

//Next state logic...
always @(*)
begin
	//pixel_x, pixel_y...
	pixel_x_next = (pixel_x_present == 799) ? 10'b0 : pixel_x_present + 1;

	if (pixel_x_present == 799)
		pixel_y_next = (pixel_y_present == 524) ? 10'b0 : pixel_y_present + 1;
	else
		pixel_y_next = pixel_y_present;

end

//Output logic...
assign pixel_x = pixel_x_present;
assign pixel_y = pixel_y_present;

//H sync...
assign H_sync = (pixel_x_present >= 656 && pixel_x_present <= 751) ? 1'b0 : 1'b1;

//V sync...
assign V_sync = (pixel_y_present >= 513 && pixel_y_present <= 514) ? 1'b0 : 1'b1;

//video on...
assign video_on = (pixel_x_present <= 639 && pixel_y_present <= 479) ? 1'b1 : 1'b0;

endmodule
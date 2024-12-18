module UART_Tx
(
	input clk, clr_n,
	output reg Tx
);

//Manipulating data...
reg [7 : 0] data_in_present = 8'b0, data_in_next;
reg [3 : 0] sel_present = 4'b0, sel_next;
wire done = (sel_present == 9);

//data_in_present logic...
always @(posedge done, negedge clr_n)
begin
	if (clr_n == 0)
		data_in_present <= 8'b0;
	else
		data_in_present <= data_in_next;
end

//sel_present logic...
always @(posedge clk)
	sel_present <= sel_next;

//data_in_next logic...
always @(*)
	data_in_next = data_in_present + 1;

//sel_next logic...
always @(*)
	sel_next = done ? 4'b0 : sel_present + 1;

//MUX...
always @(*)
begin
	case (sel_present)
		4'd0 : Tx = 1'b0;	//Start bit.
		4'd1 : Tx = data_in_present [0];
		4'd2 : Tx = data_in_present [1];
		4'd3 : Tx = data_in_present [2];
		4'd4 : Tx = data_in_present [3];
		4'd5 : Tx = data_in_present [4];
		4'd6 : Tx = data_in_present [5];
		4'd7 : Tx = data_in_present [6];
		4'd8 : Tx = data_in_present [7];
		4'd9 : Tx = 1'b1;	//End bit.
	endcase
end

endmodule
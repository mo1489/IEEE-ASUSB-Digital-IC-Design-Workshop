module UART_Rx
(
	input clk, Rx,
	output reg [7 : 0] data_out
);

//Manipulating variables...
reg [3 : 0] sel_present = 4'b0, sel_next;
reg [0 : 1] start_end;

//sel_present logic...
always @(posedge clk)
	sel_present <= sel_next;

//sel_next logic...
always @(*)
	sel_next = (sel_present == 9) ? 4'b0 : sel_present + 1;

//DeMux...
always @(*)
begin
	case (sel_present)
		4'd0 : start_end [0] = Rx;	//Start bit.
		4'd1 : data_out [0] = Rx;
		4'd2 : data_out [1] = Rx;
		4'd3 : data_out [2] = Rx;
		4'd4 : data_out [3] = Rx;
		4'd5 : data_out [4] = Rx;
		4'd6 : data_out [5] = Rx;
		4'd7 : data_out [6] = Rx;
		4'd8 : data_out [7] = Rx;
		4'd9 : start_end [1] = Rx;	//End bit.
	endcase
end

endmodule
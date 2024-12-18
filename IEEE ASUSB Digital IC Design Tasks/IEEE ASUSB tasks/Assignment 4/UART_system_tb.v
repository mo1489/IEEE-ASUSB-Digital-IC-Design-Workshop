module UART_system_tb
();

//Controls and monitors...
reg clk_tb, clr_n_tb;
wire [7 : 0] data_out_tb;

//Module instantiation...
UART_system DUT
(
	.clk(clk_tb),
	.clr_n(clr_n_tb),
	.data_out(data_out_tb)
);

//Clock generation...
initial
	clk_tb = 1'b0;

always
	#25
	clk_tb = ~clk_tb;

//Testbench
initial
begin
	clr_n_tb = 1'b1;

	#700
	clr_n_tb = 1'b0;

	#50
	clr_n_tb = 1'b1;
end

endmodule
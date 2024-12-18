module UART_system
(
	input clk, clr_n, transmit,
	output  [7 : 0] data_out
);

//Interconnects...
wire Tx_Rx, receive;

//Module instantiations...
UART_Tx M0
(
	.clk(clk),
	.clr_n(clr_n),
	.transmit(transmit),
	.Tx(Tx_Rx)
);

UART_Rx M1
(
	.clk(clk),
	.Rx(Tx_Rx),
	.data_out(data_out)
);

endmodule
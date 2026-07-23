module baud_gen (
    input  wire clk,
    input  wire rst,
    output wire tx_enb,
    output wire rx_enb
);

    // TX Counter (50 MHz -> 115200 baud)
    reg [8:0] tx_counter;

    // RX Counter (50 MHz -> 16x Oversampling)
    reg [4:0] rx_counter;

    // TX Counter
    always @(posedge clk) begin
        if (rst)
            tx_counter <= 9'd0;
        else if (tx_counter == 9'd434)
            tx_counter <= 9'd0;
        else
            tx_counter <= tx_counter + 1'b1;
    end

    // RX Counter
    always @(posedge clk) begin
        if (rst)
            rx_counter <= 5'd0;
        else if (rx_counter == 5'd27)
            rx_counter <= 5'd0;
        else
            rx_counter <= rx_counter + 1'b1;
    end

    // One-clock-cycle enable pulses
    assign tx_enb = (tx_counter == 9'd434);
    assign rx_enb = (rx_counter == 5'd27);

endmodule

		

	     
		

	     


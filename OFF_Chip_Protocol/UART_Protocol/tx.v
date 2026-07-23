module trasmitter(
input clk, wr_enb, rst, tx_en // wr_testbench
input [7:0]data_in,
output reg tx,
output busy);

parameter idle=2'b00;
parameter start=2'b01;
parameter data=2'b10;
parameter stop=2'b11;

reg[7:0] data;
reg[2:0] index;
reg[1:0] state, nxt_state;

always@(posedge clk) begin
if(rst)
tx


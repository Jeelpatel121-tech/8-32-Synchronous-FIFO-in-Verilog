`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2025 14:37:53
// Design Name: 
// Module Name: tb_fifo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_fifo();
reg rst,clk,cs,wr_en,rd_en;
reg [31:0] data_in;
wire [31:0] data_out;
wire empty,full;
integer i;
fifo_sync dut(.rst(rst),
                .clk(clk),
                .cs(cs),
                .wr_en(wr_en),
                .rd_en(rd_en),
                .data_in(data_in),
                .data_out(data_out),
                .empty(empty),
                .full(full)
                );
initial
begin
clk=0;
forever #5 clk=~clk;
end

task write_data(input [31:0]din);
begin
@(posedge clk);
cs=1;wr_en=1;
data_in = din;
$display($time,"write_data data_in = %0d",data_in);
@(posedge clk);
cs=1;wr_en=0;
end
endtask

task read_data();
begin
@(posedge clk);
cs=1;rd_en=1;
@(posedge clk);
$display($time,"read_data data_out = %0d",data_out);
end
endtask

initial
begin
rst=0;rd_en=0;wr_en=0;

@(posedge clk)
rst=1;
$display($time,"\n SCENARIO 1");
write_data(1);
write_data(10);
write_data(100);

read_data();
read_data();
read_data();

$display($time,"\n SCENARIO 2");
for(i=0;i<7;i=i+1)
begin
write_data(2**i);
read_data();
end

$display($time,"\n SCENARIO 3");
for(i=0;i<7;i=i+1)
begin
write_data(2**i);
end
for(i=0;i<7;i=i+1)
begin
read_data();
end
#40 $finish;
end

endmodule

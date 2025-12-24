`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2025 13:52:38
// Design Name: 
// Module Name: fifo_sync
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


module fifo_sync
    (input rst,clk,cs,wr_en,rd_en,
    input [31:0] data_in,
    output reg [31:0] data_out,
    output empty,
    output full
    );
    reg [31:0] fifo [0:7];
    reg [3:0] rd_ptr;
    reg [3:0] wr_ptr;
    
    always@(posedge clk or negedge rst)
    begin
        if(!rst)
            wr_ptr <= 0;
        else if(cs && wr_en && !full)
        begin
            fifo[wr_ptr[2:0]] <= data_in;
            wr_ptr <= wr_ptr + 1'b1;
        end
    end
    
    always@(posedge clk or negedge rst)
    begin
        if(!rst)begin
            rd_ptr <= 0;
        end
        else if(cs && rd_en && !empty)
        begin
            data_out <= fifo[rd_ptr[2:0]];
            rd_ptr <= rd_ptr + 1'b1;
        end
    end
    
    assign empty = (wr_ptr == rd_ptr);
    assign full = (rd_ptr == {~wr_ptr[3],wr_ptr[2:0]});
endmodule

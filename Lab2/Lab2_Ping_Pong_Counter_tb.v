`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/30 23:24:31
// Design Name: 
// Module Name: Ping_Pong_Counter_tb
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


module Ping_Pong_Counter_tb;

reg CLK,RESET_n,enable;
wire direction;
wire [3:0] out;

Ping_Pong_Counter p(CLK, RESET_n, enable, direction, out);

always #5 CLK=~CLK;

initial begin
    CLK = 1'b0;
    RESET_n = 1'b1;
    enable = 1'b1;
    #1;
    RESET_n = 1'b0;
    #10;
    RESET_n = 1'b1;
    #30;
    enable = 1'b0;
    #40;
    enable = 1'b1;
    
    #2000;
    $finish;

end
always@(posedge CLK) begin
    #2;
    $display("out = %d  ||  direction = %b",out,direction);
end
endmodule

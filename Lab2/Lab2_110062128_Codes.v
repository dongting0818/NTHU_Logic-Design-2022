module Ping_Pong_Counter (CLK, RESET_n, enable, direction, out);
input CLK, RESET_n;
input enable;
output reg direction;
output reg[4-1:0] out = 4'b0000;
always @(posedge CLK) begin
    if(RESET_n == 1'b0)begin
        out <= 4'b0000;
        direction <= 0;
    end
    else begin 
    if (enable == 1'b1) begin
        if(out == 0)begin
            out <= out+1;
            direction = 0;
        end
        else if(out == 15)begin 
            out <= out-1;
            direction = 1; 
        end
        else if(direction == 0)
            out<=out+1;
        else if(direction == 1)
            out<=out-1;
    end
    end
end
endmodule
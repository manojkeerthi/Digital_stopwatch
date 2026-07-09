module clock_divider(
    input wire clk,
    input wire reset,
    output reg slow_clk
    );
    
    localparam LIMIT = 4; // toggle for every x clocks
    
    reg [7:0] divider_count; // can count 255 
    
    always@(posedge clk) begin
        
      if(reset) begin // if reset is high, divider count is 0 and slow clock is 0
            divider_count <= 0;
            slow_clk <= 0;
        end
        
        else begin
            divider_count = divider_count+1;
            
          if(divider_count==LIMIT) begin // if divider count reaches limit, reset divider count and toggle slow clock
                divider_count=0;
                slow_clk = ~slow_clk;
            end
        end
    end
    
endmodule

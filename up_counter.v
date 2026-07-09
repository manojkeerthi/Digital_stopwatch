module up_counter(
    input wire clk,
    input wire reset,
    input wire enable,
    output reg [7:0]count
    );
    
    always @(posedge clk or posedge reset)begin
        if (reset) begin
            count <= 4'b00000000;
        end else if (enable) begin
            count <= count + 1'b1;
        end else 
            count = count;
     end
endmodule

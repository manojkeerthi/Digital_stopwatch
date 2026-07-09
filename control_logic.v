module control_logic(
    input  wire clk,
    input  wire reset,
    input  wire start,
    input  wire stop,
    output reg  enable
);

always @(posedge clk or posedge reset)
begin
    if (reset)
        enable <= 1'b0;

    else if (stop)
        enable <= 1'b0;

    else if (start)
        enable <= 1'b1;
end

endmodule

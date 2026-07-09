module digital_stopwatch(
    input  wire clk,
    input  wire reset,
    input  wire start,
    input  wire stop,
    output wire [7:0] count
);
    // Internal signals
    wire slow_clk;
    wire enable;
    // Clock Divider Instance
    clock_divider u_clock_divider (
        .clk(clk),
        .reset(reset),
        .slow_clk(slow_clk)
    );
    // Control Logic Instance
    control_logic u_control_logic (
        .clk(clk),
        .reset(reset),
        .start(start),
        .stop(stop),
        .enable(enable)
    );
    // Up Counter Instance
    up_counter u_up_counter (
        .clk(slow_clk),
        .reset(reset),
        .enable(enable),
        .count(count)
    );

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.07.2026 16:54:45
// Design Name: 
// Module Name: digital_stopwatch_tb
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


module digital_stopwatch_tb();
reg clk;
reg reset;
reg start;
reg stop;
wire [7:0]count;
digital_stopwatch t_digital_stopwatch(
    .clk(clk),
    .reset(reset),
    .start(start),
    .stop(stop),
    .count(count)
    );
    always #5 clk=~clk;
    initial begin       
        //initial inputs
        clk = 0;
        reset = 0;
        start = 0;
        stop = 0;
        //Test case 1 - reset
        //---------
        #10;
        reset = 1;        
        #10;
        reset = 0;        
        //Test case 2 - start counting
        //-----------
        #20;
        start = 1;        
        #10;
        start = 0;        
        //let the counter run
        #200;   
        
        
             
        //Test case 3 - stop counting
        //---------------
        stop = 1;        
        #20;
        stop = 0;        
        //couter should stop
        #100;        
        //Test case 4 - resume counting
        //----------------------------
        start = 1;        
        #20;
        start = 0;        
        #200;        
        //Test cae 5 - reset again
        //-----------------------        
        reset = 1;        
        #10;
        reset = 0;        
        #100;        
        $finish;
    end
endmodule

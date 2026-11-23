`timescale 1ns/1ps

module tb_traffic_light_controller;

reg clock = 0;
reg reset = 0;
wire red, yellow, green;

traffic_light_controller uut (
    .clock(clock),
    .reset(reset),
    .red(red),
    .yellow(yellow),
    .green(green)
);

always #10 clock = ~clock;

initial begin
    reset = 1;
    #20 reset = 0;

    #200;
    $finish;
end

initial begin
    $monitor("Time=%0t | Reset=%b | Red=%b Yellow=%b Green=%b",
             $time, reset, red, yellow, green);
end

endmodule
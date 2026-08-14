`timescale 1ns/1ps

module tb_universal_shift_register;

reg clk;
reg reset;
reg [1:0] mode;
reg serial_left;
reg serial_right;
reg [3:0] parallel_in;
wire [3:0] q;

universal_shift_register uut (
    .clk(clk),
    .reset(reset),
    .mode(mode),
    .serial_left(serial_left),
    .serial_right(serial_right),
    .parallel_in(parallel_in),
    .q(q)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("universal_shift_register.vcd");
    $dumpvars(0, tb_universal_shift_register);

    $monitor("Time=%0t | Mode=%b | Parallel_In=%b | Serial_L=%b | Serial_R=%b | Q=%b",
             $time, mode, parallel_in, serial_left, serial_right, q);

    clk = 0;
    reset = 1;
    mode = 2'b00;
    serial_left = 0;
    serial_right = 0;
    parallel_in = 4'b0000;

    #10 reset = 0;

    // Parallel Load
    #10 mode = 2'b11;
        parallel_in = 4'b1010;

    // Hold
    #10 mode = 2'b00;

    // Shift Right
    #10 mode = 2'b01;
        serial_right = 1;

    // Shift Right
    #10 serial_right = 0;

    // Shift Left
    #10 mode = 2'b10;
        serial_left = 1;

    // Shift Left
    #10 serial_left = 0;

    #10 $finish;
end

endmodule
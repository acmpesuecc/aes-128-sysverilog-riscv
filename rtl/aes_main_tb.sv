`timescale 1ns/1ps

module tb_aes_main;

  // Define constants
  reg logic clk;
  reg logic [127:0] input_data;
  reg logic [127:0] key;
  wire logic [7:0] dataout;

  // Instantiate the AES Main module
  aes_main uut (
    .clk(clk),
    .input_data(input_data),
    .key(key),
    .dataout(dataout)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle the clock every 5 time units
  end

  // Test vectors
  initial begin
    clk = 0;
    input_data = 128'h0123456789ABCDEF0123456789ABCDEF;
    key = 128'h000102030405060708090A0B0C0D0E0F;
    
    // Wait for a few clock cycles for the initialization
    #10;

    // Monitor the output
    $display("Input Data: 0x%h", input_data);
    $display("Key: 0x%h", key);
    $display("Data Out: 0x%h", dataout);

    // Add more test cases or functionality as needed

    // Terminate the simulation
    $finish;
  end

endmodule

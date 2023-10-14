module lastround(
    input logic clk,
    input logic [3:0] rc,
    input logic [127:0] round_in,
    input logic [127:0] last_key_in,
    output logic [127:0] final_out
);

logic [127:0] s1, s2, s3, out_key;

key_gen k1 (rc, last_key_in, out_key);
sub_bytes k2 (round_in, s1);
shift_row k3 (s1, s2);

assign final_out = out_key ^ s2;

endmodule

module lastround_tb(
  reg clk,
  reg [3:0] rc,
  reg [127:0] round_in,
  reg [127:0] last_key_in,
  wire [127:0] final_out;
)
  lastround dut (
    .clk(clk),
    .rc(rc),
    .round_in(round_in),
    .last_key_in(last_key_in),
    .final_out(final_out)
  );

  
  always begin
     clk = ~clk;
  end

  
  initial begin
    
    clk = 0;
    rc = 4'b1010;  
    round_in = 128'h0123456789ABCDEF0123456789ABCDEF; 
    last_key_in = 128'hFEDCBA9876543210FEDCBA9876543210;

    
    #10;

    
    if (final_out == 128'hEXPECTED_RESULT) begin
      $display("Test PASSED");
    end else begin
      $display("Test FAILED");
    end

    
    $finish;
  end
endmodule

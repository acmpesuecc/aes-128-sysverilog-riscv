module tb_round();
    logic clk;
    logic [3:0] rc;
    logic [127:0] data;
    logic [127:0] in_key;
    logic [127:0] out_key;
    logic [127:0] round_out;
    round uut (
        .clk(clk),
        .rc(rc),
        .data(data),
        .in_key(in_key),
        .out_key(out_key),
        .round_out(round_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rc = 4'b0000;
        data = 128'h0123456789ABCDEF0123456789ABCDEF;
        in_key = 128'h0FEDCBA9876543210FEDCBA98765432;
        
        // Wait a few clock cycles
        #10;

        // Display outputs
        $display("rc = %b", rc);
        $display("data = %h", data);
        $display("in_key = %h", in_key);
        $display("out_key = %h", out_key);
        $display("round_out = %h", round_out);
        
        // Finish simulation
        $finish;
    end

endmodule

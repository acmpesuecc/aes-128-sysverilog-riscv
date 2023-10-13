module tb_mix_column();
    // Define signals
    logic [127:0] in1;
    logic [127:0] s3;

    // Instantiate mix_column module
    mix_column uut (
        .in1(in1),
        .s3(s3)
    );

    // Stimulus
    initial begin
        // Initialize inputs
        in1 = 128'h0123456789ABCDEF0123456789ABCDEF;

        // Wait a few simulation cycles for stability
        #10;

        // Display output
        $display("Input: %h", in1);
        $display("Output: %h", s3);

        // Finish simulation
        $finish;
    end
endmodule
[

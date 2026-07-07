module tb_tlc;

reg clk;
reg rst;
wire [1:0] state;
wire [3:0] cnt;

tlc dut (
    .clk(clk),
    .rst(rst),
    .state(state),
    .cnt(cnt)
);

always #5 clk = ~clk;

// Dump file
initial begin
    $dumpfile("tlc.vcd");
    $dumpvars(0, tb_tlc);
end

// Stimulus
initial begin
    clk = 0;
    rst = 1;

    #10 rst = 0;      // Release reset

    #150 rst = 1;     // Assert reset again

    #100 rst = 0;      // Release reset


  
    #500 $finish;
end

// Monitor
initial begin
    $monitor("Time=%0t rst=%b state=%b cnt=%d",
              $time, rst, state, cnt);
end

endmodule

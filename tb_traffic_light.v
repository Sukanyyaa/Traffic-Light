module testbench();

    
    parameter CLK_PERIOD = 10;  

    reg clk;
    reg rst;
    wire [3:0] north;
    wire [3:0] east;
    wire [3:0] south;
    wire [3:0] west;

    traffic_light_controller traffic_light_inst (
        .clk(clk),
        .rst(rst),
        .north(north),
        .east(east),
        .south(south),
        .west(west));
 
    always begin
      
        clk = 0;
        #((CLK_PERIOD / 2));
        clk = 1;
        #((CLK_PERIOD / 2));
    end

    initial begin
        rst = 1;
        #50; 
        rst = 0;
        #50; 
        #500;
        $finish;
    end

    always @(posedge clk) begin
        $display("Time = %0t ns: North = %b, East = %b, South = %b, West = %b", $time, north, east, south, west);
      $dumpfile("testbench.vcd");
  $dumpvars(1,testbench);
    end

endmodule

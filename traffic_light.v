module traffic_light_controller (
    input wire clk,        
    input wire rst,         
    output reg [3:0] north, 
    output reg [3:0] east,  
    output reg [3:0] south, 
    output reg [3:0] west   );


parameter GREEN_TIME = 8; 
parameter YELLOW_TIME = 4; 


reg [3:0] state_north;  
reg [3:0] state_east;   
reg [3:0] state_south;  
reg [3:0] state_west;   

reg [3:0] counter;      
reg [3:0] timer;        


localparam GREEN = 2'b00;
localparam YELLOW = 2'b01;
localparam RED = 2'b10;


initial begin
    state_north = GREEN;
    state_east = RED;
    state_south = RED;
    state_west = RED;
    counter = 4'b0000;
    timer = GREEN_TIME;
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        
        state_north <= GREEN;
        state_east <= RED;
        state_south <= RED;
        state_west <= RED;
        counter <= 4'b0000;
        timer <= GREEN_TIME;
    end else begin
        
        case(counter)
            4'b0000: begin 
                if (timer == 0) begin
                    timer <= YELLOW_TIME;
                    state_north <= YELLOW;
                    state_east <= RED;
                    state_south <= RED;
                    state_west <= RED;
                    counter <= counter + 1;
                end else begin
                    timer <= timer - 1;
                end
            end
            4'b0001: begin 
                if (timer == 0) begin
                    timer <= GREEN_TIME;
                    state_north <= RED;
                    state_east <= GREEN;
                    state_south <= RED;
                    state_west <= RED;
                    counter <= counter + 1;
                end else begin
                    timer <= timer - 1;
                end
            end
            4'b0010: begin 
                if (timer == 0) begin
                    timer <= YELLOW_TIME;
                    state_north <= RED;
                    state_east <= RED;
                    state_south <= YELLOW;
                    state_west <= RED;
                    counter <= counter + 1;
                end else begin
                    timer <= timer - 1;
                end
            end
            4'b0011: begin 
                if (timer == 0) begin
                    timer <= GREEN_TIME;
                    state_north <= RED;
                    state_east <= RED;
                    state_south <= RED;
                    state_west <= GREEN;
                    counter <= 4'b0000;
                end else begin
                    timer <= timer - 1;
                end
            end
            default: counter <= 4'b0000;
        endcase
    end
end


assign north = state_north;
assign east = state_east;
assign south = state_south;
assign west = state_west;

endmodule

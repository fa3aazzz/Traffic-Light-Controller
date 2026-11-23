module traffic_light_controller(
	input clock,reset,
	output reg red,yellow,green
	);
	
	localparam ST_INIT=2'b00, ST_GREEN=2'b01, ST_YELLOW=2'b10, ST_RED=2'b11;
	
	reg [1:0] state,next_state;
	
	always @(posedge clock or posedge reset)
		if (reset)
			state <= ST_INIT;
		else
			state <= next_state;
	
	always @(*)
		begin
			red=0; yellow=0; green=0;
			
			case (state)
				ST_INIT: begin
					next_state = ST_GREEN;
				end
				ST_GREEN: begin
					next_state = ST_YELLOW;
					green = 1;
				end
				ST_YELLOW: begin
					next_state = ST_RED;
					yellow = 1;
				end
				ST_RED: begin
					next_state = ST_GREEN;
					red = 1;
				end
				default: next_state = ST_INIT;
			endcase
		end
endmodule

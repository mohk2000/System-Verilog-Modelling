module shift_register (input logic clk, input logic reset, input logic [1:0] mode, input logic [7:0] data_in, output logic [7:0] data_out);

always @(posedge clk or posedge reset) begin
	if (reset) begin
		data_out <= 8'b00000000;
	end
	else begin
		case (mode)
		2'b00: data_out <= 8'b00000000;			//Reset mode
		2'b01: data_out <= data_in;			//Parallel load of data
		2'b10: data_out <= {data_out [6:0], 1'b0}; 	//Shift left mode discarding MSB
		2'b11: data_out <= {1'b0, data_out [7:1]}; 	//Shift right mode discarding LSB
		default: data_out <= data_out;		//Hold value
	endcase
	end
	end
endmodule

		


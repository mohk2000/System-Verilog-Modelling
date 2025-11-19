module counter2to4 ( 
   input logic clk,
   output logic [2:0] out);

   integer n;

   always_ff @ (posedge clk)
   begin
      for (n = 2; n >= 0; n = n-1) 
      begin
         if (n == 2) begin
            out <=3'b010;
         end
         else if (n == 1) begin
            out <=3'b011;         
         end
         else if (n == 0) begin
            out <=3'b100;
         end
   	end
   end
endmodule





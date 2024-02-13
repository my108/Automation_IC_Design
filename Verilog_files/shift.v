module shift(                 
        input clk, // clock input                 
         input rst, // reset input                 
         input din, // data input  
         input [1:0] sel, //for case statement               
         output reg [3:0] d_out // data output                    
           );                       
    always @(posedge clk or posedge rst) begin                 
          if (rst) begin                    
              d_out <= 4'b0000;                    
                   end               
          else    
            case (sel)
                 2'b00: d_out <= 4'b0;
                 2'b01: d_out<={d_out[3:1], din}; //left shift
                 2'b10: d_out<={din, d_out[2:0]}; //right shift
                 2'b11:  d_out <= 4'b0;
            default:  d_out <= din;
            endcase
         end
endmodule

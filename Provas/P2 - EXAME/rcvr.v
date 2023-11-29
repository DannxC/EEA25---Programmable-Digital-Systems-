module rcvr
#(
  parameter [7:0] MATCH = 8'hA5 // This is just a password to start reading the message
 )
 (
  input  wire      clock   ,
  input  wire      reset   ,
  input  wire      data_in ,
  input  wire      reading ,
  output reg       ready   ,
  output reg       overrun ,
  output reg [7:0] data_out
 );

  localparam SHIFT_HEAD = 0 ,
             SHIFT_BODY = 1 ;

  reg [6:0] head_reg ;
  reg [6:0] body_reg ;
  reg [2:0] count ;
  reg phase ;

  always @(posedge clock)

    if (reset) begin

        // INITIALIZE PHASE TO SHIFTING HEADER
        phase <= SHIFT_HEAD;
        

        // INITIALIZE HEADER TO OPPOSITE OF LEFTMOST MATCH BIT

        head_reg <= ~MATCH[7]; // ~A5[7] = ~10100101[7] = ~1 = 0
        //body_reg <= 7'b0;


        // INITIALIZE CONTROL REGISTERS TO INACTIVE STATE (IGNORE DATA PATH)
        count <= 0;
        ready <= 0;
        overrun <= 0;


      end

    else begin

        // IF PHASE IS SHIFT_BODY THEN CLEAR HEAD REGISTER, ELSE
        // IF PHASE IS SHIFT_HEAD THEN SHIFT INPUT DATA LEFT INTO HEAD REGISTER
        if (phase == SHIFT_BODY) begin
          head_reg <= 0;
        end
        else if (phase == SHIFT_HEAD) begin
          head_reg <= {head_reg[5:0], data_in};
        end
        


        // IF CONCATENATION OF HEAD REG AND INPUT DATA IS MATCH CHARACTER THEN
        // SET PHASE TO SHIFT_BODY, ELSE
        // IF COUNT IS 7 THEN SET PHASE BACK TO SHIFT_HEAD
        if ({head_reg, data_in} == MATCH) begin
          phase <= SHIFT_BODY;
          count <= 0;
        end
        else if (count == 7) begin
          phase <= SHIFT_HEAD;
        end



        // IF PHASE IS SHIFT_BODY THEN INCREMENT COUNT
        // IF PHASE IS SHIFT_BODY THEN SHIFT INPUT DATA LEFT INTO BODY REGISTER
        if (phase == SHIFT_BODY) begin
          count <= count + 1;
          body_reg <= {body_reg[5:0], data_in};
        end



        // IF COUNT IS 7 THEN COPY CONCATENATION OF BODY REGISTER AND INPUT DATA
        // TO OUTPUT DATA
        // IF COUNT IS 7 THEN SET READY ELSE IF READING THEN CLEAR READY
        if (count == 7) begin
          data_out <= {body_reg, data_in};
          ready <= 1;
        end
        else if (reading) begin
          ready <= 0;
        end





        // IF READING THEN CLEAR OVERRUN, ELSE
        // IF COUNT IS 7 AND STILL READY THEN SET OVERRUN
        if (reading) begin
          overrun <= 0;
        end
        else if (count == 7 && ready) begin
          overrun <= 1;
        end

      end

endmodule

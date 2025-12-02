// 1011 Sequence Detector (Moore, overlapping)
// Output 'z' goes high when last 4 bits are 1011

module seq_1011_detector (
    input  wire clk,
    input  wire rst,   // active-high synchronous reset
    input  wire x,     // serial input bit
    output reg  z      // output = 1 when "1011" detected
);

    // State encoding
    localparam S0 = 3'b000;  // no match yet
    localparam S1 = 3'b001;  // seen '1'
    localparam S2 = 3'b010;  // seen '10'
    localparam S3 = 3'b011;  // seen '101'
    localparam S4 = 3'b100;  // seen '1011' (detected)

    reg [2:0] state, next_state;

    // State register
    always @(posedge clk) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            S0: begin
                if (x)  next_state = S1; // got '1'
                else    next_state = S0; // stay
            end

            S1: begin // seen '1'
                if (x)  next_state = S1; // '11' -> still last seen '1'
                else    next_state = S2; // '10'
            end

            S2: begin // seen '10'
                if (x)  next_state = S3; // '101'
                else    next_state = S0; // '100' -> reset
            end

            S3: begin // seen '101'
                if (x)  next_state = S4; // '1011' detected
                else    next_state = S2; // '1010' -> last '10'
            end

            S4: begin // '1011' detected (overlap allowed)
                if (x)  next_state = S1; // last '1'
                else    next_state = S2; // last '10' from '...10110'
            end

            default:    next_state = S0;
        endcase
    end

    // Output logic (Moore)
    always @(*) begin
        z = (state == S4);
    end

endmodule

// Copyright (c) 2024 Sungkyunkwan University
//
// Authors:
// - Sanghyun Park <psh2018314072@gmail.com>


module FSM
(
    input   wire                    clk,
    input   wire                    rst_n,

    input   wire    [3:0]           count_i,
    input   wire                    count_valid_i,
    input   wire                    start_i,
    input   wire                    _repeat_i,
    input   wire                    _repeat_valid_i,

    output  wire                    ready_o,
    output  wire                    run_o,
    output  wire                    done_o
);

    localparam  S_IDLE          = 3'b000;
    localparam  S_CONF          = 3'b001;
    localparam  S_RUN           = 3'b010;
    localparam  S_DONE          = 3'b011;
    localparam  S_ASK           = 3'b100;


    // Declaring  Signals
    //  - Feel free to add any additional signals you think are necessary.
    reg     [2:0]               state,      state_n;
    reg     [3:0]               count,       count_n;
    reg                         done;
    reg                         run;
    reg                         ready;
    
    // Sequential Logic
    // - Feel free to add any additional Logic you think are necessary.
    always_ff @(posedge clk) begin
        if(!rst_n) begin
            state               <= S_IDLE;
            count               <= 4'h0;
        end else begin
            state               <= state_n;
            count               <= count_n;
        end
    end

    // Combinational Logic
    // - Feel free to add any additional Logic you think are necessary.
    always_comb begin
        ready                   = 1'b0;
        run                     = 1'b0;
        done                    = 1'b0;
        state_n                 = state;
        count_n                 = count;

        case(state)
        // TODO: Fill your code here
        endcase
    end

    assign  done_o                  = done;
    assign  run_o                   = run;
    assign  ready_o                 = ready;

endmodule
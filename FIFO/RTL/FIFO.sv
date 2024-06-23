// Copyright (c) 2022 Sungkyunkwan University
//
// Authors:
// - Jungrea Kim <dale40@skku.edu>

module FIFO #(
    parameter       FIFO_DEPTH          = 16,
    parameter       DATA_WIDTH          = 32,
    parameter       AFULL_THRESHOLD     = 16,
    parameter       AEMPTY_THRESHOLD    = 0
)
(
    input   wire                        clk,
    input   wire                        rst_n,

    output  wire                        full_o,
    input   wire                        wren_i,
    input   wire    [DATA_WIDTH-1:0]    wdata_i,

    output  wire                        empty_o,
    input   wire                        rden_i,
    output  wire    [DATA_WIDTH-1:0]    rdata_o
);

    localparam  DEPTH_LG2               = $clog2(FIFO_DEPTH);

    reg     [DATA_WIDTH-1:0]            data[FIFO_DEPTH];

    reg                                 full,       full_n,
                                        empty,      empty_n;
    reg     [DEPTH_LG2:0]               wrptr,      wrptr_n,
                                        rdptr,      rdptr_n;
    reg     [DEPTH_LG2:0]               counter,    counter_n;

    // reset entries to all 0s
    always_ff @(posedge clk)
        if (!rst_n) begin
            full                        <= 1'b0;
            empty                       <= 1'b1;    // empty after as reset

            wrptr                       <= {(DEPTH_LG2+1){1'b0}};
            rdptr                       <= {(DEPTH_LG2+1){1'b0}};

            counter                     <= {(DEPTH_LG2+1){1'b0}};

            for (int i=0; i<FIFO_DEPTH; i++) begin
                data[i]                     <= {DATA_WIDTH{1'b0}};
            end
        end
        else begin
            // TODO : fill your code here
        end

    always_comb begin
        // TODO : fill your code here
    end

   // synthesis translate_off
   always @(posedge clk) begin
       if (full_o & wren_i) begin
           $display("FIFO overflow");
           @(posedge clk);
           $finish;
       end
   end

   always @(posedge clk) begin
       if (empty_o & rden_i) begin
           $display("FIFO underflow");
           @(posedge clk);
           $finish;
       end
   end
   // synthesis translate_on

    assign  full_o                      = full;
    assign  empty_o                     = empty;
    // TODO: fill your code here
    //      assign rdata_o = ??;

endmodule

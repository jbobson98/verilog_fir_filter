/*  ------------------------------------------------
    Module:     fir_filter
    Developer:  Jacob Bobson
    Date:       8/22/2024
    ------------------------------------------------
    Description:
    This module implements a pipelined Transposed Form FIR filter. Filter coefficients
    should be externally calculated based on filtering needs and then added to the module. 
    This module implements the AXI-Stream specification for interfacing with other cores. The 
    filter accepts 16-bit signed samples as input and outputs 32-bit signed filtered values.


    Direct Form FIR Filter Issues:
        The output delay grows linearlly with the order of the filter. Therefore, it can
        be difficult to meet timing requirements when implementing higher order filters.

            Output delay = Delay_Multiplication + (Filter_order - 1)*Delay_Addition

    AXI-4 Stream:
        [Master] --> [Slave]
        Valid = Master to Slave
        Ready (ack/busy) = Slave to Master
        Golden Rule: Data is sent only when both valid and ready are high.

    Pipeline Example:
                   ______________________________________
                  | Slave Side               Master Side |
    (raw data) -->|                                      |--> (filtered data)
               -->|             FIR FILTER               |-->
               <--|                                      |<--
                  |______________________________________|

    Filter Path:
        [Y_n]-->[Reg]-->[Mul_Coeffs]-->[Mul_Reg]-->[Sum]

*/



(* use_dsp = "yes" *)
module fir_filter #(

)(
    input wire i_clk,
    input wire i_rst,

    /* Slave Side IO (ss = slave side) */
    input wire signed [15:0] ss_i_tdata,
    input wire               ss_i_tvalid,
    input wire               ss_i_tlast,
    output reg               ss_o_tready,

    /* Master Side IO (ms = master side) */
    output reg signed [31:0] ms_o_tdata,
    output wire              ms_o_tvalid,
    output wire              ms_o_tlast,
    input wire               ms_i_tready
);





endmodule
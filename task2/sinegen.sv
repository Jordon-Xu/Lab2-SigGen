module sinegen (
    input logic clk,  
    input logic rst,  
    input  logic  en,       
    input logic incr,
    output logic [7:0] sine_value1,
    output logic [7:0] sine_value2
);

    logic [7:0] counter_value, offset, addr2;

    counter #(
        .WIDTH(8)
    ) counter_inst (
        .clk(clk),
        .rst(rst),
        .en(en),
        .count(counter_value)
    );

    assign offset = incr;  // Note: Consider any necessary conversion from incr
    assign addr2 = counter_value + offset; 

    rom rom_inst (
        .clk(clk),
        .addr1(counter_value),
        .addr2(addr2),
        .dout1(sine_value1),
        .dout2(sine_value2)
    );

endmodule

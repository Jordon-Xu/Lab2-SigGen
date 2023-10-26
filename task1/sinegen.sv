module sinegen (
    input logic clk,  // Clock input
    input logic rst,  // Reset input
    input  logic  en,       // enable
    input logic incr,
    output logic [7:0] sine_value  // Output the ROM value
);

    // Counter signals
    logic [7:0] counter_value;

    // Instantiate counter
    counter #(
        .WIDTH(8)
    ) counter_inst (
        .clk(clk),
        .rst(rst),
        .en(en),
        .count(counter_value)
    );

    // Instantiate ROM
    rom rom_inst (
        .clk(clk),
        .addr(counter_value),
        .dout(sine_value)
    );


endmodule

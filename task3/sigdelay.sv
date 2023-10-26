module sigdelay (
    input logic clk,
    input logic rst,
    input logic wr, // write enable for the RAM
    input logic rd, // read enable for the RAM
    input logic [8:0] offset, // Offset for reading from the RAM
    input logic [7:0] mic_signal, // Input signal from the microphone
    output logic [7:0] delayed_signal // Delayed output signal
);

    // The write address will be managed by a simple counter that wraps around.
    logic [8:0] wr_addr;
    logic [8:0] rd_addr; // Read address is the write address minus the offset
    logic [7:0] ram_dout; // Data output from the RAM

    // Instantiate the 2-port RAM
    ram2ports #(.ADDRESS_WIDTH(9), .DATA_WIDTH(8)) ram_inst (
        .clk(clk),
        .wr_en(wr),
        .rd_en(rd),
        .wr_addr(wr_addr),
        .rd_addr(rd_addr),
        .din(mic_signal),
        .dout(ram_dout)
    );

    // Instantiate the counter for the write address
    counter #(.WIDTH(9)) counter_inst (
        .clk(clk),
        .rst(rst),
        .en(wr), // Increment the counter on every write cycle
        .count(wr_addr)
    );

    // Calculate the read address based on the write address and the provided offset
    // always_comb begin
    //     rd_addr = (wr_addr >= offset) ? (wr_addr - offset) : (512 + wr_addr - offset);
    // end

    assign rd_addr = wr_addr - offset;

    // The output of the module is the data output from the RAM
    assign delayed_signal = ram_dout;

endmodule



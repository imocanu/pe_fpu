`timescale 1ps/1ps

module PE_CTRL_8IP_QUARTUS_tb;

reg  clock, reset;
reg  [31:0] io_Xi_0_in_0;
reg  [31:0] io_Yi_0_in_0;
reg  [31:0] io_Xi_0_in_1;
reg  [31:0] io_Yi_0_in_1;
reg  [1:0]  io_op_type;
reg         io_use_int;
reg         io_tininess;
reg  [2:0]  io_rounding;
wire [31:0] io_out;
	  
// PERIOD
localparam period = 5;

PE_CTRL_8IP_QUARTUS UUT(
.clock(clock),
.reset(reset),
.io_Xi_0_in_0(io_Xi_0_in_0),
.io_Yi_0_in_0(io_Yi_0_in_0),
.io_Xi_0_in_1(io_Xi_0_in_1),
.io_Yi_0_in_1(io_Yi_0_in_1),
.io_op_type(io_op_type),
.io_use_int(io_use_int),
.io_tininess(io_tininess),
.io_rounding(io_rounding),
.io_out(io_out)
);

/*  generating dump file to visualise waveforms  */
initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, PE_CTRL_8IP_QUARTUS_tb);
        //other variables to dump (arrays/memories) go here
end

// CLOCK
always 
begin
	 clock = 1'b1; 
	 #1;

	 clock = 1'b0;
	 #1;
end

// RESET
initial 
begin 
	reset = 1;
	#(period);
	reset = 0;
end

	 
initial 
	begin
			#(period);
			$display($time, " << start simulation >>");
			@(posedge clock);
			io_op_type=1'b0;
			io_use_int=1'b1;
			io_rounding=3'b100;
			io_Xi_0_in_0=32'b00000000000000000000000000010111;
			io_Yi_0_in_0=32'b00000000000000000000000000001011;
			io_Xi_0_in_1=32'b11111111111111111111111111001001;
			io_Yi_0_in_1=32'b11111111111111111111111111110101;
			$display($time, " << end input data >>");
			#500;
			$display($time, " << end simulation >>");

			//$stop;
			$finish;
	end

// CHECKER
//always 
//begin
//			#5;
//			$monitor("[monitor] time = %g : io_out(binary)=%b && io_out(decimal)=%d\n", $time, io_out, io_out);
//			//$display("[debug] io_out (hex) = %h && io_out (decimal) = %d", io_out, io_out);
//			//$display("[debug] simulation time = %t", $time);
//end

endmodule
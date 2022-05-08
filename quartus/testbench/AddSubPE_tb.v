`timescale 1ns/1ns

module AddSubPE_tb;

reg  clock, reset;
reg  [31:0] in_0;
reg  [31:0] in_1;
reg         op_type;
reg         use_int;
reg         tininess;
reg  [2:0]  rounding;
wire [31:0] out;  
	  
// PERIOD
localparam period = 5;

AddSubPE UUT(
.clock(clock),
.reset(reset),
.io_use_int(use_int),
.io_op(op_type),
.io_rounding(rounding),
.io_tininess(tininess),
.io_in_0(in_0),
.io_in_1(in_1),
.io_out(out)
);

// DUMPFILE
initial 
begin
		$dumpfile("AddSubPE_tb.vcd");
		$dumpvars(0, AddSubPE_tb);
end

// CLOCK
always 
begin
		clock = 1'b1; 
		#1;
		clock = 1'b0;
		#1;
end

// task for RESET
task init_RESET;
begin
		reset = 1;
		#1;
		reset = 0;
		#1;
end
endtask

// task for INT32
task check_INT;
begin
		op_type=1'b1;
		use_int=1'b1;
		tininess=1'b0;
		rounding=3'b100;
		in_0=32'b00000000000000000000000000010111;  // 23
		in_1=32'b00000000000000000000000000001011;  // 11
		#(period);
end
endtask

// task for FP32
task check_FP;
begin
		op_type=1'b1;
		use_int=1'b0;
		tininess=1'b1;
		rounding=3'b100;
		in_0=32'b01000001101110000000000000000000;  // 23
		in_1=32'b01000001001100000000000000000000;  // 11
		#(period);
end
endtask

// task for OUT
task check_OUT;
input [31:0] out_data;
begin
		$display($time, "[debug]   check output ......");
		if ( out == out_data ) begin
			$display($time, "[debug]   TEST PASS !");
		end else begin
			$display($time, "[debug]   TEST FAIL !");
		end
		$display("[debug]   out(binary) = %b && out(decimal) = %d", out, out);
end
endtask


// MONITOR
initial //always 
begin
		#(period);
		$monitor("[monitor] time = %g\n", $time);
		$display("[debug]   out(binary) = %b && out(decimal) = %d", out, out);
end

// RUN TEST	 
initial 
begin
		$display($time, " << start simulation >>");

		init_RESET();

		@(posedge clock);

		check_INT();
		check_OUT(32'b00000000000000000000000000001100);
					
		@(posedge clock);

		check_FP();
		check_OUT(32'b01000001010000000000000000000000);

		#30; $display($time, " << end simulation >>");

		//$stop;
		$finish;
end

endmodule
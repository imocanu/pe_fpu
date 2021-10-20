`timescale 1ns/1ns

module PE_CTRL_8IP_QUARTUS_tb;

reg  clock, reset;
reg  [31:0] Xi_0_in_0;
reg  [31:0] Yi_0_in_0;
reg  [31:0] Xi_0_in_1;
reg  [31:0] Yi_0_in_1;
reg  [1:0]  op_type;
reg         use_int;
reg         tininess;
reg  [2:0]  rounding;
wire [31:0] out;
wire [31:0] dbg_fsm;   

// PERIOD
localparam period = 5;  

PE_CTRL_8IP_QUARTUS UUT(
.clock(clock),
.reset(reset),
.io_Xi_0_in_0(Xi_0_in_0),
.io_Yi_0_in_0(Yi_0_in_0),
.io_Xi_0_in_1(Xi_0_in_1),
.io_Yi_0_in_1(Yi_0_in_1),
.io_op_type(op_type),
.io_use_int(use_int),
.io_tininess(tininess),
.io_rounding(rounding),
.io_out(out),
.io_dbg_fsm(dbg_fsm)
);

// DUMPFILE
initial 
begin
		$dumpfile("PE_CTRL_8IP_QUARTUS_tb.vcd");
		$dumpvars(0, PE_CTRL_8IP_QUARTUS_tb);
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
task input_INT;
begin
		use_int = 1'b1;
		tininess= 1'b1;
		rounding= 3'b111;
		op_type = 2'b00;
		
//		m_0_sel= 2'b00;
//		m_1_sel= 2'b00;
//		m_2_sel= 2'b00;
//		m_3_sel= 2'b00;
//		m_4_sel= 2'b00;
//		m_5_sel= 2'b00;
//		m_6_sel= 2'b00;
//		m_7_sel= 2'b00;
//		m_8_sel= 2'b01;
//		m_9_sel= 2'b01;
//		
//		addsub_0_op = 2'b00;
//		addsub_1_op = 2'b00;
		
		Xi_0_in_0=32'b00000000000000000000000000010111;  //  23
		Yi_0_in_0=32'b00000000000000000000000000001011;  //  11
		Xi_0_in_1=32'b11111111111111111111111111001001;  // -55
		Yi_0_in_1=32'b11111111111111111111111111110101;  // -11
end
endtask



	 
// RUN TEST	 
initial 
begin
		$display($time, " << start simulation >>");

		init_RESET();

		@(posedge clock);

		input_INT();
		//check_OUT(32'b00000000000000000000000000001100);
					
		//@(posedge clock);

		//check_FP();
		//check_OUT(32'b01000001010000000000000000000000);

		#1000; $display($time, " << end simulation >>");

		//$stop;
		$finish;
end

endmodule
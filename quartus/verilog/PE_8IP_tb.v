`timescale 1ns/1ns

module PE_8IP_tb;

reg  clock, reset;

reg  [1:0]  m_0_sel;
reg  [1:0]  m_1_sel;
reg  [1:0]  m_2_sel;
reg  [1:0]  m_3_sel;
reg  [1:0]  m_4_sel;
reg  [1:0]  m_5_sel;
reg  [1:0]  m_6_sel;
reg  [1:0]  m_7_sel;
reg  [1:0]  m_8_sel;
reg  [1:0]  m_9_sel;
reg  [1:0]  addsub_0_op;
reg  [1:0]  addsub_1_op;

reg         use_int;
reg         tininess;
reg  [2:0]  rounding;

reg  [31:0]  Xi_0_in_0;
reg  [31:0]  Yi_0_in_0;
reg  [31:0]  Xi_0_in_1;
reg  [31:0]  Yi_0_in_1;

wire [31:0] out;
wire [31:0] dbg_aggr0;   
wire [31:0] dbg_aggr1;   
	  
// PERIOD
localparam period = 5;

PE_8IP UUT(
.clock(clock),
.reset(reset),
.io_Xi_0_in_0(Xi_0_in_0),
.io_Yi_0_in_0(Yi_0_in_0),
.io_Xi_0_in_1(Xi_0_in_1),
.io_Yi_0_in_1(Yi_0_in_1),
.io_Xi_1_in_0(Xi_0_in_0),
.io_Yi_1_in_0(Yi_0_in_0),
.io_Xi_1_in_1(Xi_0_in_1),
.io_Yi_1_in_1(Yi_0_in_1),
.io_Xi_2_in_0(Xi_0_in_0),
.io_Yi_2_in_0(Yi_0_in_0),
.io_Xi_2_in_1(Xi_0_in_1),
.io_Yi_2_in_1(Yi_0_in_1),
.io_Xi_3_in_0(Xi_0_in_0),
.io_Yi_3_in_0(Yi_0_in_0),
.io_Xi_3_in_1(Xi_0_in_1),
.io_Yi_3_in_1(Yi_0_in_1),
.io_Xi_4_in_0(Xi_0_in_0),
.io_Yi_4_in_0(Yi_0_in_0),
.io_Xi_4_in_1(Xi_0_in_1),
.io_Yi_4_in_1(Yi_0_in_1),
.io_Xi_5_in_0(Xi_0_in_0),
.io_Yi_5_in_0(Yi_0_in_0),
.io_Xi_5_in_1(Xi_0_in_1),
.io_Yi_5_in_1(Yi_0_in_1),
.io_Xi_6_in_0(Xi_0_in_0),
.io_Yi_6_in_0(Yi_0_in_0),
.io_Xi_6_in_1(Xi_0_in_1),
.io_Yi_6_in_1(Yi_0_in_1),
.io_Xi_7_in_0(Xi_0_in_0),
.io_Yi_7_in_0(Yi_0_in_0),
.io_Xi_7_in_1(Xi_0_in_1),
.io_Yi_7_in_1(Yi_0_in_1),
.io_m_0_sel(m_0_sel),
.io_m_1_sel(m_1_sel),
.io_m_2_sel(m_2_sel),
.io_m_3_sel(m_3_sel),
.io_m_4_sel(m_4_sel),
.io_m_5_sel(m_5_sel),
.io_m_6_sel(m_6_sel),
.io_m_7_sel(m_7_sel),
.io_m_8_sel(m_8_sel),
.io_m_9_sel(m_9_sel),
.io_addsub_0_op(addsub_0_op),
.io_addsub_1_op(addsub_1_op),
.io_use_int(use_int),
.io_rounding(rounding),
.io_tininess(tininess),
.io_dbg_aggr0(dbg_aggr0),
.io_dbg_aggr1(dbg_aggr1),
.io_out(out)
);

// DUMPFILE
initial 
begin
		$dumpfile("PE_8IP_tb.vcd");
		$dumpvars(0, PE_8IP_tb);
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
		$display($time, " << input_INT >>");
		
		use_int = 1'b1;
		tininess= 1'b1;
		rounding= 3'b111;
		
		Xi_0_in_0=32'b00000000000000000000000000010111;  //  23
		Yi_0_in_0=32'b00000000000000000000000000001011;  //  11
		Xi_0_in_1=32'b11111111111111111111111111001001;  // -55
		Yi_0_in_1=32'b11111111111111111111111111110101;  // -11
end
endtask

// task for L2
task start_L2;
begin
		$display($time, " << start_L2 >>");
		
		m_0_sel= 2'b01;
		m_1_sel= 2'b01;
		m_2_sel= 2'b01;
		m_3_sel= 2'b01;
		m_4_sel= 2'b00;
		m_5_sel= 2'b00;
		m_6_sel= 2'b00;
		m_7_sel= 2'b00;
		m_8_sel= 2'b01;
		m_9_sel= 2'b01;
		
		addsub_0_op = 2'b01;
		addsub_1_op = 2'b01;
end
endtask

// task for Aggregation
task start_Aggregation;
begin		
		$display($time, " << start_Aggregation >>");
		
		m_0_sel= 2'b01;
		m_1_sel= 2'b01;
		m_2_sel= 2'b01;
		m_3_sel= 2'b01;
		m_4_sel= 2'b10;
		m_5_sel= 2'b10;
		m_6_sel= 2'b10;
		m_7_sel= 2'b10;
		m_8_sel= 2'b00;
		m_9_sel= 2'b00;
		
		addsub_0_op = 2'b00;
		addsub_1_op = 2'b00;		
end
endtask

// task for Aggregation
task stop_Aggregation;
begin	
		$display($time, " << stop_Aggregation >>");	
		m_0_sel= 2'b11;
		m_1_sel= 2'b11;
		m_2_sel= 2'b11;
		m_3_sel= 2'b11;
		m_4_sel= 2'b11;
		m_5_sel= 2'b11;
		m_6_sel= 2'b11;
		m_7_sel= 2'b11;
		m_8_sel= 2'b10;
		m_9_sel= 2'b10;	
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


// RUN TEST	 
initial 
begin
		$display($time, " << start simulation >>");
		init_RESET();
		@(posedge clock);

		input_INT();
		start_L2();
		#42;
		start_Aggregation();
		#75;
		stop_Aggregation();
		check_OUT(32'b00000000000000000100000100000000);

		#50; 
		$display($time, " << end simulation >>");
		$finish;
end

endmodule
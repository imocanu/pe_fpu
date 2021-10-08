module PE_CTRL(
  input        clock,
  input        reset,
  output [1:0] io_m_0_sel,
  output [1:0] io_m_1_sel,
  output [1:0] io_m_2_sel,
  output [1:0] io_m_3_sel,
  output [1:0] io_m_4_sel,
  output [1:0] io_m_5_sel,
  output [1:0] io_m_6_sel,
  output [1:0] io_m_7_sel,
  output [1:0] io_m_8_sel,
  output [1:0] io_m_9_sel,
  output [1:0] io_addsub_0_op,
  output [1:0] io_addsub_1_op,
  input  [1:0] io_op_type
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] m_0_sel; // @[PE_CTRL.scala 36:25]
  reg [1:0] m_1_sel; // @[PE_CTRL.scala 37:25]
  reg [1:0] m_2_sel; // @[PE_CTRL.scala 38:25]
  reg [1:0] m_3_sel; // @[PE_CTRL.scala 39:25]
  reg [1:0] m_4_sel; // @[PE_CTRL.scala 40:25]
  reg [1:0] m_5_sel; // @[PE_CTRL.scala 41:25]
  reg [1:0] m_6_sel; // @[PE_CTRL.scala 42:25]
  reg [1:0] m_7_sel; // @[PE_CTRL.scala 43:25]
  reg [1:0] m_8_sel; // @[PE_CTRL.scala 44:25]
  reg [1:0] m_9_sel; // @[PE_CTRL.scala 45:25]
  reg [1:0] op_type; // @[PE_CTRL.scala 47:25]
  reg [1:0] addsub_0_op; // @[PE_CTRL.scala 50:30]
  reg [1:0] addsub_1_op; // @[PE_CTRL.scala 51:30]
  reg [3:0] value; // @[Counter.scala 60:40]
  reg [3:0] value_1; // @[Counter.scala 60:40]
  reg [3:0] value_2; // @[Counter.scala 60:40]
  reg [3:0] value_3; // @[Counter.scala 60:40]
  reg [5:0] value_4; // @[Counter.scala 60:40]
  reg  value_5; // @[Counter.scala 60:40]
  reg [3:0] pe_step; // @[PE_CTRL.scala 102:25]
  wire [1:0] _GEN_0 = 2'h3 == op_type ? 2'h0 : addsub_0_op; // @[PE_CTRL.scala 117:9 207:25 50:30]
  wire [1:0] _GEN_1 = 2'h3 == op_type ? 2'h0 : addsub_1_op; // @[PE_CTRL.scala 117:9 208:25 51:30]
  wire [1:0] _GEN_2 = 2'h3 == op_type ? 2'h0 : m_0_sel; // @[PE_CTRL.scala 117:9 212:21 36:25]
  wire [1:0] _GEN_3 = 2'h3 == op_type ? 2'h0 : m_1_sel; // @[PE_CTRL.scala 117:9 213:21 37:25]
  wire [1:0] _GEN_4 = 2'h3 == op_type ? 2'h0 : m_2_sel; // @[PE_CTRL.scala 117:9 214:21 38:25]
  wire [1:0] _GEN_5 = 2'h3 == op_type ? 2'h0 : m_3_sel; // @[PE_CTRL.scala 117:9 215:21 39:25]
  wire [1:0] _GEN_6 = 2'h3 == op_type ? 2'h1 : m_4_sel; // @[PE_CTRL.scala 117:9 219:21 40:25]
  wire [1:0] _GEN_7 = 2'h3 == op_type ? 2'h1 : m_5_sel; // @[PE_CTRL.scala 117:9 220:21 41:25]
  wire [1:0] _GEN_8 = 2'h3 == op_type ? 2'h3 : m_6_sel; // @[PE_CTRL.scala 117:9 221:21 42:25]
  wire [1:0] _GEN_9 = 2'h3 == op_type ? 2'h3 : m_7_sel; // @[PE_CTRL.scala 117:9 222:21 43:25]
  wire [1:0] _GEN_10 = 2'h3 == op_type ? 2'h0 : m_8_sel; // @[PE_CTRL.scala 117:9 226:21 44:25]
  wire [1:0] _GEN_11 = 2'h3 == op_type ? 2'h3 : m_9_sel; // @[PE_CTRL.scala 117:9 227:21 45:25]
  wire [3:0] _GEN_12 = 2'h3 == op_type ? 4'h5 : pe_step; // @[PE_CTRL.scala 117:9 229:21 102:25]
  wire [1:0] _GEN_13 = 2'h2 == op_type ? 2'h1 : _GEN_0; // @[PE_CTRL.scala 117:9 177:25]
  wire [1:0] _GEN_14 = 2'h2 == op_type ? 2'h1 : _GEN_1; // @[PE_CTRL.scala 117:9 178:25]
  wire [1:0] _GEN_15 = 2'h2 == op_type ? 2'h0 : _GEN_2; // @[PE_CTRL.scala 117:9 182:21]
  wire [1:0] _GEN_16 = 2'h2 == op_type ? 2'h0 : _GEN_3; // @[PE_CTRL.scala 117:9 183:21]
  wire [1:0] _GEN_17 = 2'h2 == op_type ? 2'h0 : _GEN_4; // @[PE_CTRL.scala 117:9 184:21]
  wire [1:0] _GEN_18 = 2'h2 == op_type ? 2'h0 : _GEN_5; // @[PE_CTRL.scala 117:9 185:21]
  wire [1:0] _GEN_19 = 2'h2 == op_type ? 2'h0 : _GEN_6; // @[PE_CTRL.scala 117:9 189:21]
  wire [1:0] _GEN_20 = 2'h2 == op_type ? 2'h0 : _GEN_7; // @[PE_CTRL.scala 117:9 190:21]
  wire [1:0] _GEN_21 = 2'h2 == op_type ? 2'h0 : _GEN_8; // @[PE_CTRL.scala 117:9 191:21]
  wire [1:0] _GEN_22 = 2'h2 == op_type ? 2'h0 : _GEN_9; // @[PE_CTRL.scala 117:9 192:21]
  wire [1:0] _GEN_23 = 2'h2 == op_type ? 2'h1 : _GEN_10; // @[PE_CTRL.scala 117:9 196:21]
  wire [1:0] _GEN_24 = 2'h2 == op_type ? 2'h1 : _GEN_11; // @[PE_CTRL.scala 117:9 197:21]
  wire [3:0] _GEN_25 = 2'h2 == op_type ? 4'h4 : _GEN_12; // @[PE_CTRL.scala 117:9 199:21]
  wire [1:0] _GEN_26 = 2'h1 == op_type ? 2'h1 : _GEN_13; // @[PE_CTRL.scala 117:9 154:25]
  wire [1:0] _GEN_27 = 2'h1 == op_type ? 2'h1 : _GEN_14; // @[PE_CTRL.scala 117:9 155:25]
  wire [1:0] _GEN_28 = 2'h1 == op_type ? 2'h0 : _GEN_19; // @[PE_CTRL.scala 117:9 159:21]
  wire [1:0] _GEN_29 = 2'h1 == op_type ? 2'h0 : _GEN_20; // @[PE_CTRL.scala 117:9 160:21]
  wire [1:0] _GEN_30 = 2'h1 == op_type ? 2'h0 : _GEN_21; // @[PE_CTRL.scala 117:9 161:21]
  wire [1:0] _GEN_31 = 2'h1 == op_type ? 2'h0 : _GEN_22; // @[PE_CTRL.scala 117:9 162:21]
  wire [1:0] _GEN_32 = 2'h1 == op_type ? 2'h0 : _GEN_23; // @[PE_CTRL.scala 117:9 166:21]
  wire [1:0] _GEN_33 = 2'h1 == op_type ? 2'h0 : _GEN_24; // @[PE_CTRL.scala 117:9 167:21]
  wire [3:0] _GEN_34 = 2'h1 == op_type ? 4'h3 : _GEN_25; // @[PE_CTRL.scala 117:9 169:21]
  wire [1:0] _GEN_35 = 2'h1 == op_type ? m_0_sel : _GEN_15; // @[PE_CTRL.scala 117:9 36:25]
  wire [1:0] _GEN_36 = 2'h1 == op_type ? m_1_sel : _GEN_16; // @[PE_CTRL.scala 117:9 37:25]
  wire [1:0] _GEN_37 = 2'h1 == op_type ? m_2_sel : _GEN_17; // @[PE_CTRL.scala 117:9 38:25]
  wire [1:0] _GEN_38 = 2'h1 == op_type ? m_3_sel : _GEN_18; // @[PE_CTRL.scala 117:9 39:25]
  wire  wrap = value_1 == 4'he; // @[Counter.scala 72:24]
  wire [3:0] _value_T_1 = value_1 + 4'h1; // @[Counter.scala 76:24]
  wire [3:0] _GEN_52 = wrap ? 4'h0 : _value_T_1; // @[Counter.scala 76:15 86:{20,28}]
  wire [3:0] _GEN_53 = wrap ? 4'h6 : pe_step; // @[PE_CTRL.scala 237:53 238:17 102:25]
  wire [3:0] _GEN_54 = wrap ? 4'h0 : _GEN_52; // @[PE_CTRL.scala 237:53 Counter.scala 97:11]
  wire  wrap_1 = value == 4'h9; // @[Counter.scala 72:24]
  wire [3:0] _value_T_3 = value + 4'h1; // @[Counter.scala 76:24]
  wire [3:0] _GEN_55 = wrap_1 ? 4'h0 : _value_T_3; // @[Counter.scala 76:15 86:{20,28}]
  wire [3:0] _GEN_56 = wrap_1 ? 4'h6 : pe_step; // @[PE_CTRL.scala 247:53 248:17 102:25]
  wire [3:0] _GEN_57 = wrap_1 ? 4'h0 : _GEN_55; // @[PE_CTRL.scala 247:53 Counter.scala 97:11]
  wire  wrap_2 = value_2 == 4'h9; // @[Counter.scala 72:24]
  wire [3:0] _value_T_5 = value_2 + 4'h1; // @[Counter.scala 76:24]
  wire [3:0] _GEN_58 = wrap_2 ? 4'h0 : _value_T_5; // @[Counter.scala 76:15 86:{20,28}]
  wire [3:0] _GEN_59 = wrap_2 ? 4'h6 : pe_step; // @[PE_CTRL.scala 257:55 258:17 102:25]
  wire [3:0] _GEN_60 = wrap_2 ? 4'h0 : _GEN_58; // @[PE_CTRL.scala 257:55 Counter.scala 97:11]
  wire  wrap_3 = value_3 == 4'he; // @[Counter.scala 72:24]
  wire [3:0] _value_T_7 = value_3 + 4'h1; // @[Counter.scala 76:24]
  wire [3:0] _GEN_61 = wrap_3 ? 4'h0 : _value_T_7; // @[Counter.scala 76:15 86:{20,28}]
  wire [3:0] _GEN_62 = wrap_3 ? 4'h6 : pe_step; // @[PE_CTRL.scala 267:55 268:17 102:25]
  wire [3:0] _GEN_63 = wrap_3 ? 4'h0 : _GEN_61; // @[PE_CTRL.scala 267:55 Counter.scala 97:11]
  wire  wrap_4 = value_4 == 6'h25; // @[Counter.scala 72:24]
  wire [5:0] _value_T_9 = value_4 + 6'h1; // @[Counter.scala 76:24]
  wire [5:0] _GEN_64 = wrap_4 ? 6'h0 : _value_T_9; // @[Counter.scala 76:15 86:{20,28}]
  wire [1:0] _GEN_65 = wrap_4 ? 2'h3 : m_0_sel; // @[PE_CTRL.scala 298:57 302:17 36:25]
  wire [1:0] _GEN_66 = wrap_4 ? 2'h3 : m_1_sel; // @[PE_CTRL.scala 298:57 303:17 37:25]
  wire [1:0] _GEN_67 = wrap_4 ? 2'h3 : m_2_sel; // @[PE_CTRL.scala 298:57 304:17 38:25]
  wire [1:0] _GEN_68 = wrap_4 ? 2'h3 : m_3_sel; // @[PE_CTRL.scala 298:57 305:17 39:25]
  wire [1:0] _GEN_69 = wrap_4 ? 2'h3 : m_4_sel; // @[PE_CTRL.scala 298:57 309:17 40:25]
  wire [1:0] _GEN_70 = wrap_4 ? 2'h3 : m_5_sel; // @[PE_CTRL.scala 298:57 310:17 41:25]
  wire [1:0] _GEN_71 = wrap_4 ? 2'h3 : m_6_sel; // @[PE_CTRL.scala 298:57 311:17 42:25]
  wire [1:0] _GEN_72 = wrap_4 ? 2'h3 : m_7_sel; // @[PE_CTRL.scala 298:57 312:17 43:25]
  wire [1:0] _GEN_73 = wrap_4 ? 2'h2 : m_8_sel; // @[PE_CTRL.scala 298:57 316:17 44:25]
  wire [1:0] _GEN_74 = wrap_4 ? 2'h2 : m_9_sel; // @[PE_CTRL.scala 298:57 317:17 45:25]
  wire [3:0] _GEN_75 = wrap_4 ? 4'h8 : pe_step; // @[PE_CTRL.scala 298:57 319:17 102:25]
  wire [5:0] _GEN_76 = wrap_4 ? 6'h0 : _GEN_64; // @[PE_CTRL.scala 298:57 Counter.scala 97:11]
  wire [3:0] _GEN_77 = value_5 ? 4'h9 : pe_step; // @[PE_CTRL.scala 327:56 328:18 102:25]
  wire  _GEN_78 = value_5 ? 1'h0 : value_5 + 1'h1; // @[PE_CTRL.scala 327:56 Counter.scala 97:11 76:15]
  wire [3:0] _GEN_80 = 4'h9 == pe_step ? 4'h1 : pe_step; // @[PE_CTRL.scala 105:3 335:15 102:25]
  wire  _GEN_82 = 4'h8 == pe_step ? _GEN_78 : value_5; // @[PE_CTRL.scala 105:3 Counter.scala 60:40]
  wire [3:0] _GEN_83 = 4'h8 == pe_step ? _GEN_77 : _GEN_80; // @[PE_CTRL.scala 105:3]
  wire [5:0] _GEN_85 = 4'h7 == pe_step ? _GEN_76 : value_4; // @[PE_CTRL.scala 105:3 Counter.scala 60:40]
  wire [1:0] _GEN_86 = 4'h7 == pe_step ? _GEN_65 : m_0_sel; // @[PE_CTRL.scala 105:3 36:25]
  wire [1:0] _GEN_87 = 4'h7 == pe_step ? _GEN_66 : m_1_sel; // @[PE_CTRL.scala 105:3 37:25]
  wire [1:0] _GEN_88 = 4'h7 == pe_step ? _GEN_67 : m_2_sel; // @[PE_CTRL.scala 105:3 38:25]
  wire [1:0] _GEN_89 = 4'h7 == pe_step ? _GEN_68 : m_3_sel; // @[PE_CTRL.scala 105:3 39:25]
  wire [1:0] _GEN_90 = 4'h7 == pe_step ? _GEN_69 : m_4_sel; // @[PE_CTRL.scala 105:3 40:25]
  wire [1:0] _GEN_91 = 4'h7 == pe_step ? _GEN_70 : m_5_sel; // @[PE_CTRL.scala 105:3 41:25]
  wire [1:0] _GEN_92 = 4'h7 == pe_step ? _GEN_71 : m_6_sel; // @[PE_CTRL.scala 105:3 42:25]
  wire [1:0] _GEN_93 = 4'h7 == pe_step ? _GEN_72 : m_7_sel; // @[PE_CTRL.scala 105:3 43:25]
  wire [1:0] _GEN_94 = 4'h7 == pe_step ? _GEN_73 : m_8_sel; // @[PE_CTRL.scala 105:3 44:25]
  wire [1:0] _GEN_95 = 4'h7 == pe_step ? _GEN_74 : m_9_sel; // @[PE_CTRL.scala 105:3 45:25]
  wire [3:0] _GEN_96 = 4'h7 == pe_step ? _GEN_75 : _GEN_83; // @[PE_CTRL.scala 105:3]
  wire  _GEN_97 = 4'h7 == pe_step ? value_5 : _GEN_82; // @[PE_CTRL.scala 105:3 Counter.scala 60:40]
  wire [1:0] _GEN_99 = 4'h6 == pe_step ? 2'h0 : addsub_0_op; // @[PE_CTRL.scala 105:3 276:21 50:30]
  wire [1:0] _GEN_100 = 4'h6 == pe_step ? 2'h0 : addsub_1_op; // @[PE_CTRL.scala 105:3 277:21 51:30]
  wire [1:0] _GEN_101 = 4'h6 == pe_step ? 2'h2 : _GEN_90; // @[PE_CTRL.scala 105:3 281:17]
  wire [1:0] _GEN_102 = 4'h6 == pe_step ? 2'h2 : _GEN_91; // @[PE_CTRL.scala 105:3 282:17]
  wire [1:0] _GEN_103 = 4'h6 == pe_step ? 2'h2 : _GEN_92; // @[PE_CTRL.scala 105:3 283:17]
  wire [1:0] _GEN_104 = 4'h6 == pe_step ? 2'h2 : _GEN_93; // @[PE_CTRL.scala 105:3 284:17]
  wire [1:0] _GEN_105 = 4'h6 == pe_step ? 2'h0 : _GEN_94; // @[PE_CTRL.scala 105:3 288:17]
  wire [1:0] _GEN_106 = 4'h6 == pe_step ? 2'h0 : _GEN_95; // @[PE_CTRL.scala 105:3 289:17]
  wire [3:0] _GEN_107 = 4'h6 == pe_step ? 4'h7 : _GEN_96; // @[PE_CTRL.scala 105:3 291:17]
  wire [5:0] _GEN_108 = 4'h6 == pe_step ? value_4 : _GEN_85; // @[PE_CTRL.scala 105:3 Counter.scala 60:40]
  wire [1:0] _GEN_109 = 4'h6 == pe_step ? m_0_sel : _GEN_86; // @[PE_CTRL.scala 105:3 36:25]
  wire [1:0] _GEN_110 = 4'h6 == pe_step ? m_1_sel : _GEN_87; // @[PE_CTRL.scala 105:3 37:25]
  wire [1:0] _GEN_111 = 4'h6 == pe_step ? m_2_sel : _GEN_88; // @[PE_CTRL.scala 105:3 38:25]
  wire [1:0] _GEN_112 = 4'h6 == pe_step ? m_3_sel : _GEN_89; // @[PE_CTRL.scala 105:3 39:25]
  wire  _GEN_113 = 4'h6 == pe_step ? value_5 : _GEN_97; // @[PE_CTRL.scala 105:3 Counter.scala 60:40]
  wire [3:0] _GEN_115 = 4'h5 == pe_step ? _GEN_63 : value_3; // @[PE_CTRL.scala 105:3 Counter.scala 60:40]
  wire [3:0] _GEN_116 = 4'h5 == pe_step ? _GEN_62 : _GEN_107; // @[PE_CTRL.scala 105:3]
  wire [1:0] _GEN_117 = 4'h5 == pe_step ? addsub_0_op : _GEN_99; // @[PE_CTRL.scala 105:3 50:30]
  wire [1:0] _GEN_118 = 4'h5 == pe_step ? addsub_1_op : _GEN_100; // @[PE_CTRL.scala 105:3 51:30]
  wire [1:0] _GEN_119 = 4'h5 == pe_step ? m_4_sel : _GEN_101; // @[PE_CTRL.scala 105:3 40:25]
  wire [1:0] _GEN_120 = 4'h5 == pe_step ? m_5_sel : _GEN_102; // @[PE_CTRL.scala 105:3 41:25]
  wire [1:0] _GEN_121 = 4'h5 == pe_step ? m_6_sel : _GEN_103; // @[PE_CTRL.scala 105:3 42:25]
  wire [1:0] _GEN_122 = 4'h5 == pe_step ? m_7_sel : _GEN_104; // @[PE_CTRL.scala 105:3 43:25]
  wire [1:0] _GEN_123 = 4'h5 == pe_step ? m_8_sel : _GEN_105; // @[PE_CTRL.scala 105:3 44:25]
  wire [1:0] _GEN_124 = 4'h5 == pe_step ? m_9_sel : _GEN_106; // @[PE_CTRL.scala 105:3 45:25]
  wire [5:0] _GEN_125 = 4'h5 == pe_step ? value_4 : _GEN_108; // @[PE_CTRL.scala 105:3 Counter.scala 60:40]
  wire [1:0] _GEN_126 = 4'h5 == pe_step ? m_0_sel : _GEN_109; // @[PE_CTRL.scala 105:3 36:25]
  wire [1:0] _GEN_127 = 4'h5 == pe_step ? m_1_sel : _GEN_110; // @[PE_CTRL.scala 105:3 37:25]
  wire [1:0] _GEN_128 = 4'h5 == pe_step ? m_2_sel : _GEN_111; // @[PE_CTRL.scala 105:3 38:25]
  wire [1:0] _GEN_129 = 4'h5 == pe_step ? m_3_sel : _GEN_112; // @[PE_CTRL.scala 105:3 39:25]
  wire  _GEN_130 = 4'h5 == pe_step ? value_5 : _GEN_113; // @[PE_CTRL.scala 105:3 Counter.scala 60:40]
  wire [3:0] _GEN_132 = 4'h4 == pe_step ? _GEN_60 : value_2; // @[PE_CTRL.scala 105:3 Counter.scala 60:40]
  wire [3:0] _GEN_133 = 4'h4 == pe_step ? _GEN_59 : _GEN_116; // @[PE_CTRL.scala 105:3]
  wire [3:0] _GEN_134 = 4'h4 == pe_step ? value_3 : _GEN_115; // @[PE_CTRL.scala 105:3 Counter.scala 60:40]
  wire [1:0] _GEN_135 = 4'h4 == pe_step ? addsub_0_op : _GEN_117; // @[PE_CTRL.scala 105:3 50:30]
  wire [1:0] _GEN_136 = 4'h4 == pe_step ? addsub_1_op : _GEN_118; // @[PE_CTRL.scala 105:3 51:30]
  wire [1:0] _GEN_137 = 4'h4 == pe_step ? m_4_sel : _GEN_119; // @[PE_CTRL.scala 105:3 40:25]
  wire [1:0] _GEN_138 = 4'h4 == pe_step ? m_5_sel : _GEN_120; // @[PE_CTRL.scala 105:3 41:25]
  wire [1:0] _GEN_139 = 4'h4 == pe_step ? m_6_sel : _GEN_121; // @[PE_CTRL.scala 105:3 42:25]
  wire [1:0] _GEN_140 = 4'h4 == pe_step ? m_7_sel : _GEN_122; // @[PE_CTRL.scala 105:3 43:25]
  wire [1:0] _GEN_141 = 4'h4 == pe_step ? m_8_sel : _GEN_123; // @[PE_CTRL.scala 105:3 44:25]
  wire [1:0] _GEN_142 = 4'h4 == pe_step ? m_9_sel : _GEN_124; // @[PE_CTRL.scala 105:3 45:25]
  wire [5:0] _GEN_143 = 4'h4 == pe_step ? value_4 : _GEN_125; // @[PE_CTRL.scala 105:3 Counter.scala 60:40]
  wire [1:0] _GEN_144 = 4'h4 == pe_step ? m_0_sel : _GEN_126; // @[PE_CTRL.scala 105:3 36:25]
  wire [1:0] _GEN_145 = 4'h4 == pe_step ? m_1_sel : _GEN_127; // @[PE_CTRL.scala 105:3 37:25]
  wire [1:0] _GEN_146 = 4'h4 == pe_step ? m_2_sel : _GEN_128; // @[PE_CTRL.scala 105:3 38:25]
  wire [1:0] _GEN_147 = 4'h4 == pe_step ? m_3_sel : _GEN_129; // @[PE_CTRL.scala 105:3 39:25]
  wire  _GEN_148 = 4'h4 == pe_step ? value_5 : _GEN_130; // @[PE_CTRL.scala 105:3 Counter.scala 60:40]
  wire [3:0] _GEN_150 = 4'h3 == pe_step ? _GEN_57 : value; // @[PE_CTRL.scala 105:3 Counter.scala 60:40]
  wire [3:0] _GEN_151 = 4'h3 == pe_step ? _GEN_56 : _GEN_133; // @[PE_CTRL.scala 105:3]
  wire [3:0] _GEN_152 = 4'h3 == pe_step ? value_2 : _GEN_132; // @[PE_CTRL.scala 105:3 Counter.scala 60:40]
  wire [3:0] _GEN_153 = 4'h3 == pe_step ? value_3 : _GEN_134; // @[PE_CTRL.scala 105:3 Counter.scala 60:40]
  wire [1:0] _GEN_154 = 4'h3 == pe_step ? addsub_0_op : _GEN_135; // @[PE_CTRL.scala 105:3 50:30]
  wire [1:0] _GEN_155 = 4'h3 == pe_step ? addsub_1_op : _GEN_136; // @[PE_CTRL.scala 105:3 51:30]
  wire [1:0] _GEN_156 = 4'h3 == pe_step ? m_4_sel : _GEN_137; // @[PE_CTRL.scala 105:3 40:25]
  wire [1:0] _GEN_157 = 4'h3 == pe_step ? m_5_sel : _GEN_138; // @[PE_CTRL.scala 105:3 41:25]
  wire [1:0] _GEN_158 = 4'h3 == pe_step ? m_6_sel : _GEN_139; // @[PE_CTRL.scala 105:3 42:25]
  wire [1:0] _GEN_159 = 4'h3 == pe_step ? m_7_sel : _GEN_140; // @[PE_CTRL.scala 105:3 43:25]
  wire [1:0] _GEN_160 = 4'h3 == pe_step ? m_8_sel : _GEN_141; // @[PE_CTRL.scala 105:3 44:25]
  wire [1:0] _GEN_161 = 4'h3 == pe_step ? m_9_sel : _GEN_142; // @[PE_CTRL.scala 105:3 45:25]
  wire [5:0] _GEN_162 = 4'h3 == pe_step ? value_4 : _GEN_143; // @[PE_CTRL.scala 105:3 Counter.scala 60:40]
  wire [1:0] _GEN_163 = 4'h3 == pe_step ? m_0_sel : _GEN_144; // @[PE_CTRL.scala 105:3 36:25]
  wire [1:0] _GEN_164 = 4'h3 == pe_step ? m_1_sel : _GEN_145; // @[PE_CTRL.scala 105:3 37:25]
  wire [1:0] _GEN_165 = 4'h3 == pe_step ? m_2_sel : _GEN_146; // @[PE_CTRL.scala 105:3 38:25]
  wire [1:0] _GEN_166 = 4'h3 == pe_step ? m_3_sel : _GEN_147; // @[PE_CTRL.scala 105:3 39:25]
  wire  _GEN_167 = 4'h3 == pe_step ? value_5 : _GEN_148; // @[PE_CTRL.scala 105:3 Counter.scala 60:40]
  assign io_m_0_sel = m_0_sel; // @[PE_CTRL.scala 61:14]
  assign io_m_1_sel = m_1_sel; // @[PE_CTRL.scala 62:14]
  assign io_m_2_sel = m_2_sel; // @[PE_CTRL.scala 63:14]
  assign io_m_3_sel = m_3_sel; // @[PE_CTRL.scala 64:14]
  assign io_m_4_sel = m_4_sel; // @[PE_CTRL.scala 65:14]
  assign io_m_5_sel = m_5_sel; // @[PE_CTRL.scala 66:14]
  assign io_m_6_sel = m_6_sel; // @[PE_CTRL.scala 67:14]
  assign io_m_7_sel = m_7_sel; // @[PE_CTRL.scala 68:14]
  assign io_m_8_sel = m_8_sel; // @[PE_CTRL.scala 69:14]
  assign io_m_9_sel = m_9_sel; // @[PE_CTRL.scala 70:14]
  assign io_addsub_0_op = addsub_0_op; // @[PE_CTRL.scala 72:18]
  assign io_addsub_1_op = addsub_1_op; // @[PE_CTRL.scala 73:18]
  always @(posedge clock) begin
    if (reset) begin // @[PE_CTRL.scala 36:25]
      m_0_sel <= 2'h0; // @[PE_CTRL.scala 36:25]
    end else if (!(4'h0 == pe_step)) begin // @[PE_CTRL.scala 105:3]
      if (4'h1 == pe_step) begin // @[PE_CTRL.scala 105:3]
        if (2'h0 == op_type) begin // @[PE_CTRL.scala 117:9]
          m_0_sel <= 2'h1; // @[PE_CTRL.scala 129:21]
        end else begin
          m_0_sel <= _GEN_35;
        end
      end else if (!(4'h2 == pe_step)) begin // @[PE_CTRL.scala 105:3]
        m_0_sel <= _GEN_163;
      end
    end
    if (reset) begin // @[PE_CTRL.scala 37:25]
      m_1_sel <= 2'h0; // @[PE_CTRL.scala 37:25]
    end else if (!(4'h0 == pe_step)) begin // @[PE_CTRL.scala 105:3]
      if (4'h1 == pe_step) begin // @[PE_CTRL.scala 105:3]
        if (2'h0 == op_type) begin // @[PE_CTRL.scala 117:9]
          m_1_sel <= 2'h1; // @[PE_CTRL.scala 130:21]
        end else begin
          m_1_sel <= _GEN_36;
        end
      end else if (!(4'h2 == pe_step)) begin // @[PE_CTRL.scala 105:3]
        m_1_sel <= _GEN_164;
      end
    end
    if (reset) begin // @[PE_CTRL.scala 38:25]
      m_2_sel <= 2'h0; // @[PE_CTRL.scala 38:25]
    end else if (!(4'h0 == pe_step)) begin // @[PE_CTRL.scala 105:3]
      if (4'h1 == pe_step) begin // @[PE_CTRL.scala 105:3]
        if (2'h0 == op_type) begin // @[PE_CTRL.scala 117:9]
          m_2_sel <= 2'h1; // @[PE_CTRL.scala 131:21]
        end else begin
          m_2_sel <= _GEN_37;
        end
      end else if (!(4'h2 == pe_step)) begin // @[PE_CTRL.scala 105:3]
        m_2_sel <= _GEN_165;
      end
    end
    if (reset) begin // @[PE_CTRL.scala 39:25]
      m_3_sel <= 2'h0; // @[PE_CTRL.scala 39:25]
    end else if (!(4'h0 == pe_step)) begin // @[PE_CTRL.scala 105:3]
      if (4'h1 == pe_step) begin // @[PE_CTRL.scala 105:3]
        if (2'h0 == op_type) begin // @[PE_CTRL.scala 117:9]
          m_3_sel <= 2'h1; // @[PE_CTRL.scala 132:21]
        end else begin
          m_3_sel <= _GEN_38;
        end
      end else if (!(4'h2 == pe_step)) begin // @[PE_CTRL.scala 105:3]
        m_3_sel <= _GEN_166;
      end
    end
    if (reset) begin // @[PE_CTRL.scala 40:25]
      m_4_sel <= 2'h0; // @[PE_CTRL.scala 40:25]
    end else if (!(4'h0 == pe_step)) begin // @[PE_CTRL.scala 105:3]
      if (4'h1 == pe_step) begin // @[PE_CTRL.scala 105:3]
        if (2'h0 == op_type) begin // @[PE_CTRL.scala 117:9]
          m_4_sel <= 2'h0; // @[PE_CTRL.scala 136:21]
        end else begin
          m_4_sel <= _GEN_28;
        end
      end else if (!(4'h2 == pe_step)) begin // @[PE_CTRL.scala 105:3]
        m_4_sel <= _GEN_156;
      end
    end
    if (reset) begin // @[PE_CTRL.scala 41:25]
      m_5_sel <= 2'h0; // @[PE_CTRL.scala 41:25]
    end else if (!(4'h0 == pe_step)) begin // @[PE_CTRL.scala 105:3]
      if (4'h1 == pe_step) begin // @[PE_CTRL.scala 105:3]
        if (2'h0 == op_type) begin // @[PE_CTRL.scala 117:9]
          m_5_sel <= 2'h0; // @[PE_CTRL.scala 137:21]
        end else begin
          m_5_sel <= _GEN_29;
        end
      end else if (!(4'h2 == pe_step)) begin // @[PE_CTRL.scala 105:3]
        m_5_sel <= _GEN_157;
      end
    end
    if (reset) begin // @[PE_CTRL.scala 42:25]
      m_6_sel <= 2'h0; // @[PE_CTRL.scala 42:25]
    end else if (!(4'h0 == pe_step)) begin // @[PE_CTRL.scala 105:3]
      if (4'h1 == pe_step) begin // @[PE_CTRL.scala 105:3]
        if (2'h0 == op_type) begin // @[PE_CTRL.scala 117:9]
          m_6_sel <= 2'h0; // @[PE_CTRL.scala 138:21]
        end else begin
          m_6_sel <= _GEN_30;
        end
      end else if (!(4'h2 == pe_step)) begin // @[PE_CTRL.scala 105:3]
        m_6_sel <= _GEN_158;
      end
    end
    if (reset) begin // @[PE_CTRL.scala 43:25]
      m_7_sel <= 2'h0; // @[PE_CTRL.scala 43:25]
    end else if (!(4'h0 == pe_step)) begin // @[PE_CTRL.scala 105:3]
      if (4'h1 == pe_step) begin // @[PE_CTRL.scala 105:3]
        if (2'h0 == op_type) begin // @[PE_CTRL.scala 117:9]
          m_7_sel <= 2'h0; // @[PE_CTRL.scala 139:21]
        end else begin
          m_7_sel <= _GEN_31;
        end
      end else if (!(4'h2 == pe_step)) begin // @[PE_CTRL.scala 105:3]
        m_7_sel <= _GEN_159;
      end
    end
    if (reset) begin // @[PE_CTRL.scala 44:25]
      m_8_sel <= 2'h0; // @[PE_CTRL.scala 44:25]
    end else if (!(4'h0 == pe_step)) begin // @[PE_CTRL.scala 105:3]
      if (4'h1 == pe_step) begin // @[PE_CTRL.scala 105:3]
        if (2'h0 == op_type) begin // @[PE_CTRL.scala 117:9]
          m_8_sel <= 2'h1; // @[PE_CTRL.scala 143:21]
        end else begin
          m_8_sel <= _GEN_32;
        end
      end else if (!(4'h2 == pe_step)) begin // @[PE_CTRL.scala 105:3]
        m_8_sel <= _GEN_160;
      end
    end
    if (reset) begin // @[PE_CTRL.scala 45:25]
      m_9_sel <= 2'h0; // @[PE_CTRL.scala 45:25]
    end else if (!(4'h0 == pe_step)) begin // @[PE_CTRL.scala 105:3]
      if (4'h1 == pe_step) begin // @[PE_CTRL.scala 105:3]
        if (2'h0 == op_type) begin // @[PE_CTRL.scala 117:9]
          m_9_sel <= 2'h1; // @[PE_CTRL.scala 144:21]
        end else begin
          m_9_sel <= _GEN_33;
        end
      end else if (!(4'h2 == pe_step)) begin // @[PE_CTRL.scala 105:3]
        m_9_sel <= _GEN_161;
      end
    end
    op_type <= io_op_type; // @[PE_CTRL.scala 47:25]
    if (reset) begin // @[PE_CTRL.scala 50:30]
      addsub_0_op <= 2'h3; // @[PE_CTRL.scala 50:30]
    end else if (!(4'h0 == pe_step)) begin // @[PE_CTRL.scala 105:3]
      if (4'h1 == pe_step) begin // @[PE_CTRL.scala 105:3]
        if (2'h0 == op_type) begin // @[PE_CTRL.scala 117:9]
          addsub_0_op <= 2'h1; // @[PE_CTRL.scala 124:25]
        end else begin
          addsub_0_op <= _GEN_26;
        end
      end else if (!(4'h2 == pe_step)) begin // @[PE_CTRL.scala 105:3]
        addsub_0_op <= _GEN_154;
      end
    end
    if (reset) begin // @[PE_CTRL.scala 51:30]
      addsub_1_op <= 2'h3; // @[PE_CTRL.scala 51:30]
    end else if (!(4'h0 == pe_step)) begin // @[PE_CTRL.scala 105:3]
      if (4'h1 == pe_step) begin // @[PE_CTRL.scala 105:3]
        if (2'h0 == op_type) begin // @[PE_CTRL.scala 117:9]
          addsub_1_op <= 2'h1; // @[PE_CTRL.scala 125:25]
        end else begin
          addsub_1_op <= _GEN_27;
        end
      end else if (!(4'h2 == pe_step)) begin // @[PE_CTRL.scala 105:3]
        addsub_1_op <= _GEN_155;
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value <= 4'h0; // @[Counter.scala 60:40]
    end else if (!(4'h0 == pe_step)) begin // @[PE_CTRL.scala 105:3]
      if (!(4'h1 == pe_step)) begin // @[PE_CTRL.scala 105:3]
        if (!(4'h2 == pe_step)) begin // @[PE_CTRL.scala 105:3]
          value <= _GEN_150;
        end
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_1 <= 4'h0; // @[Counter.scala 60:40]
    end else if (!(4'h0 == pe_step)) begin // @[PE_CTRL.scala 105:3]
      if (!(4'h1 == pe_step)) begin // @[PE_CTRL.scala 105:3]
        if (4'h2 == pe_step) begin // @[PE_CTRL.scala 105:3]
          value_1 <= _GEN_54;
        end
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_2 <= 4'h0; // @[Counter.scala 60:40]
    end else if (!(4'h0 == pe_step)) begin // @[PE_CTRL.scala 105:3]
      if (!(4'h1 == pe_step)) begin // @[PE_CTRL.scala 105:3]
        if (!(4'h2 == pe_step)) begin // @[PE_CTRL.scala 105:3]
          value_2 <= _GEN_152;
        end
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_3 <= 4'h0; // @[Counter.scala 60:40]
    end else if (!(4'h0 == pe_step)) begin // @[PE_CTRL.scala 105:3]
      if (!(4'h1 == pe_step)) begin // @[PE_CTRL.scala 105:3]
        if (!(4'h2 == pe_step)) begin // @[PE_CTRL.scala 105:3]
          value_3 <= _GEN_153;
        end
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_4 <= 6'h0; // @[Counter.scala 60:40]
    end else if (!(4'h0 == pe_step)) begin // @[PE_CTRL.scala 105:3]
      if (!(4'h1 == pe_step)) begin // @[PE_CTRL.scala 105:3]
        if (!(4'h2 == pe_step)) begin // @[PE_CTRL.scala 105:3]
          value_4 <= _GEN_162;
        end
      end
    end
    if (reset) begin // @[Counter.scala 60:40]
      value_5 <= 1'h0; // @[Counter.scala 60:40]
    end else if (!(4'h0 == pe_step)) begin // @[PE_CTRL.scala 105:3]
      if (!(4'h1 == pe_step)) begin // @[PE_CTRL.scala 105:3]
        if (!(4'h2 == pe_step)) begin // @[PE_CTRL.scala 105:3]
          value_5 <= _GEN_167;
        end
      end
    end
    if (reset) begin // @[PE_CTRL.scala 102:25]
      pe_step <= 4'h0; // @[PE_CTRL.scala 102:25]
    end else if (4'h0 == pe_step) begin // @[PE_CTRL.scala 105:3]
      pe_step <= 4'h1; // @[PE_CTRL.scala 109:15]
    end else if (4'h1 == pe_step) begin // @[PE_CTRL.scala 105:3]
      if (2'h0 == op_type) begin // @[PE_CTRL.scala 117:9]
        pe_step <= 4'h2; // @[PE_CTRL.scala 146:21]
      end else begin
        pe_step <= _GEN_34;
      end
    end else if (4'h2 == pe_step) begin // @[PE_CTRL.scala 105:3]
      pe_step <= _GEN_53;
    end else begin
      pe_step <= _GEN_151;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  m_0_sel = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  m_1_sel = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  m_2_sel = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  m_3_sel = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  m_4_sel = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  m_5_sel = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  m_6_sel = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  m_7_sel = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  m_8_sel = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  m_9_sel = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  op_type = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  addsub_0_op = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  addsub_1_op = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  value = _RAND_13[3:0];
  _RAND_14 = {1{`RANDOM}};
  value_1 = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  value_2 = _RAND_15[3:0];
  _RAND_16 = {1{`RANDOM}};
  value_3 = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  value_4 = _RAND_17[5:0];
  _RAND_18 = {1{`RANDOM}};
  value_5 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  pe_step = _RAND_19[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MuxPE(
  input         clock,
  input         reset,
  input  [1:0]  io_sel,
  input  [31:0] io_in_0,
  input  [31:0] io_in_1,
  input  [31:0] io_in_2,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] in_0; // @[MuxPE.scala 21:21]
  reg [31:0] in_1; // @[MuxPE.scala 22:21]
  reg [31:0] in_2; // @[MuxPE.scala 23:21]
  reg [31:0] out; // @[MuxPE.scala 25:21]
  wire  _T = io_sel == 2'h0; // @[MuxPE.scala 27:17]
  wire  _T_1 = io_sel == 2'h1; // @[MuxPE.scala 31:23]
  wire  _T_2 = io_sel == 2'h2; // @[MuxPE.scala 35:23]
  assign io_out = out; // @[MuxPE.scala 44:10]
  always @(posedge clock) begin
    in_0 <= io_in_0; // @[MuxPE.scala 21:21]
    in_1 <= io_in_1; // @[MuxPE.scala 22:21]
    in_2 <= io_in_2; // @[MuxPE.scala 23:21]
    if (reset) begin // @[MuxPE.scala 25:21]
      out <= 32'h0; // @[MuxPE.scala 25:21]
    end else if (_T) begin // @[MuxPE.scala 28:3]
      out <= in_0; // @[MuxPE.scala 29:9]
    end else if (_T_1) begin // @[MuxPE.scala 32:3]
      out <= in_1; // @[MuxPE.scala 33:9]
    end else if (_T_2) begin // @[MuxPE.scala 36:3]
      out <= in_2; // @[MuxPE.scala 37:9]
    end else begin
      out <= 32'h0; // @[MuxPE.scala 41:9]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  in_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  in_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  in_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  out = _RAND_3[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MulFullRawFN(
  input         io_a_isNaN,
  input         io_a_isInf,
  input         io_a_isZero,
  input         io_a_sign,
  input  [9:0]  io_a_sExp,
  input  [24:0] io_a_sig,
  input         io_b_isNaN,
  input         io_b_isInf,
  input         io_b_isZero,
  input         io_b_sign,
  input  [9:0]  io_b_sExp,
  input  [24:0] io_b_sig,
  output        io_invalidExc,
  output        io_rawOut_isNaN,
  output        io_rawOut_isInf,
  output        io_rawOut_isZero,
  output        io_rawOut_sign,
  output [9:0]  io_rawOut_sExp,
  output [47:0] io_rawOut_sig
);
  wire  notSigNaN_invalidExc = io_a_isInf & io_b_isZero | io_a_isZero & io_b_isInf; // @[MulRecFN.scala 58:60]
  wire [9:0] _common_sExpOut_T_2 = $signed(io_a_sExp) + $signed(io_b_sExp); // @[MulRecFN.scala 62:36]
  wire [49:0] _common_sigOut_T = io_a_sig * io_b_sig; // @[MulRecFN.scala 63:35]
  wire  _io_invalidExc_T_2 = io_a_isNaN & ~io_a_sig[22]; // @[common.scala 84:46]
  wire  _io_invalidExc_T_5 = io_b_isNaN & ~io_b_sig[22]; // @[common.scala 84:46]
  assign io_invalidExc = _io_invalidExc_T_2 | _io_invalidExc_T_5 | notSigNaN_invalidExc; // @[MulRecFN.scala 66:71]
  assign io_rawOut_isNaN = io_a_isNaN | io_b_isNaN; // @[MulRecFN.scala 70:35]
  assign io_rawOut_isInf = io_a_isInf | io_b_isInf; // @[MulRecFN.scala 59:38]
  assign io_rawOut_isZero = io_a_isZero | io_b_isZero; // @[MulRecFN.scala 60:40]
  assign io_rawOut_sign = io_a_sign ^ io_b_sign; // @[MulRecFN.scala 61:36]
  assign io_rawOut_sExp = $signed(_common_sExpOut_T_2) - 10'sh100; // @[MulRecFN.scala 62:48]
  assign io_rawOut_sig = _common_sigOut_T[47:0]; // @[MulRecFN.scala 63:46]
endmodule
module MulRawFN(
  input         io_a_isNaN,
  input         io_a_isInf,
  input         io_a_isZero,
  input         io_a_sign,
  input  [9:0]  io_a_sExp,
  input  [24:0] io_a_sig,
  input         io_b_isNaN,
  input         io_b_isInf,
  input         io_b_isZero,
  input         io_b_sign,
  input  [9:0]  io_b_sExp,
  input  [24:0] io_b_sig,
  output        io_invalidExc,
  output        io_rawOut_isNaN,
  output        io_rawOut_isInf,
  output        io_rawOut_isZero,
  output        io_rawOut_sign,
  output [9:0]  io_rawOut_sExp,
  output [26:0] io_rawOut_sig
);
  wire  mulFullRaw_io_a_isNaN; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_a_isInf; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_a_isZero; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_a_sign; // @[MulRecFN.scala 84:28]
  wire [9:0] mulFullRaw_io_a_sExp; // @[MulRecFN.scala 84:28]
  wire [24:0] mulFullRaw_io_a_sig; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_b_isNaN; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_b_isInf; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_b_isZero; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_b_sign; // @[MulRecFN.scala 84:28]
  wire [9:0] mulFullRaw_io_b_sExp; // @[MulRecFN.scala 84:28]
  wire [24:0] mulFullRaw_io_b_sig; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_invalidExc; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_rawOut_isNaN; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_rawOut_isInf; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_rawOut_isZero; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_rawOut_sign; // @[MulRecFN.scala 84:28]
  wire [9:0] mulFullRaw_io_rawOut_sExp; // @[MulRecFN.scala 84:28]
  wire [47:0] mulFullRaw_io_rawOut_sig; // @[MulRecFN.scala 84:28]
  wire  _io_rawOut_sig_T_2 = |mulFullRaw_io_rawOut_sig[21:0]; // @[MulRecFN.scala 93:55]
  MulFullRawFN mulFullRaw ( // @[MulRecFN.scala 84:28]
    .io_a_isNaN(mulFullRaw_io_a_isNaN),
    .io_a_isInf(mulFullRaw_io_a_isInf),
    .io_a_isZero(mulFullRaw_io_a_isZero),
    .io_a_sign(mulFullRaw_io_a_sign),
    .io_a_sExp(mulFullRaw_io_a_sExp),
    .io_a_sig(mulFullRaw_io_a_sig),
    .io_b_isNaN(mulFullRaw_io_b_isNaN),
    .io_b_isInf(mulFullRaw_io_b_isInf),
    .io_b_isZero(mulFullRaw_io_b_isZero),
    .io_b_sign(mulFullRaw_io_b_sign),
    .io_b_sExp(mulFullRaw_io_b_sExp),
    .io_b_sig(mulFullRaw_io_b_sig),
    .io_invalidExc(mulFullRaw_io_invalidExc),
    .io_rawOut_isNaN(mulFullRaw_io_rawOut_isNaN),
    .io_rawOut_isInf(mulFullRaw_io_rawOut_isInf),
    .io_rawOut_isZero(mulFullRaw_io_rawOut_isZero),
    .io_rawOut_sign(mulFullRaw_io_rawOut_sign),
    .io_rawOut_sExp(mulFullRaw_io_rawOut_sExp),
    .io_rawOut_sig(mulFullRaw_io_rawOut_sig)
  );
  assign io_invalidExc = mulFullRaw_io_invalidExc; // @[MulRecFN.scala 89:19]
  assign io_rawOut_isNaN = mulFullRaw_io_rawOut_isNaN; // @[MulRecFN.scala 90:15]
  assign io_rawOut_isInf = mulFullRaw_io_rawOut_isInf; // @[MulRecFN.scala 90:15]
  assign io_rawOut_isZero = mulFullRaw_io_rawOut_isZero; // @[MulRecFN.scala 90:15]
  assign io_rawOut_sign = mulFullRaw_io_rawOut_sign; // @[MulRecFN.scala 90:15]
  assign io_rawOut_sExp = mulFullRaw_io_rawOut_sExp; // @[MulRecFN.scala 90:15]
  assign io_rawOut_sig = {mulFullRaw_io_rawOut_sig[47:22],_io_rawOut_sig_T_2}; // @[Cat.scala 30:58]
  assign mulFullRaw_io_a_isNaN = io_a_isNaN; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_a_isInf = io_a_isInf; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_a_isZero = io_a_isZero; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_a_sign = io_a_sign; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_a_sExp = io_a_sExp; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_a_sig = io_a_sig; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_b_isNaN = io_b_isNaN; // @[MulRecFN.scala 87:21]
  assign mulFullRaw_io_b_isInf = io_b_isInf; // @[MulRecFN.scala 87:21]
  assign mulFullRaw_io_b_isZero = io_b_isZero; // @[MulRecFN.scala 87:21]
  assign mulFullRaw_io_b_sign = io_b_sign; // @[MulRecFN.scala 87:21]
  assign mulFullRaw_io_b_sExp = io_b_sExp; // @[MulRecFN.scala 87:21]
  assign mulFullRaw_io_b_sig = io_b_sig; // @[MulRecFN.scala 87:21]
endmodule
module RoundAnyRawFNToRecFN(
  input         io_invalidExc,
  input         io_in_isNaN,
  input         io_in_isInf,
  input         io_in_isZero,
  input         io_in_sign,
  input  [9:0]  io_in_sExp,
  input  [26:0] io_in_sig,
  input  [2:0]  io_roundingMode,
  output [32:0] io_out
);
  wire  roundingMode_near_even = io_roundingMode == 3'h0; // @[RoundAnyRawFNToRecFN.scala 88:53]
  wire  roundingMode_min = io_roundingMode == 3'h2; // @[RoundAnyRawFNToRecFN.scala 90:53]
  wire  roundingMode_max = io_roundingMode == 3'h3; // @[RoundAnyRawFNToRecFN.scala 91:53]
  wire  roundingMode_near_maxMag = io_roundingMode == 3'h4; // @[RoundAnyRawFNToRecFN.scala 92:53]
  wire  roundingMode_odd = io_roundingMode == 3'h6; // @[RoundAnyRawFNToRecFN.scala 93:53]
  wire  roundMagUp = roundingMode_min & io_in_sign | roundingMode_max & ~io_in_sign; // @[RoundAnyRawFNToRecFN.scala 96:42]
  wire  doShiftSigDown1 = io_in_sig[26]; // @[RoundAnyRawFNToRecFN.scala 118:61]
  wire [8:0] _roundMask_T_1 = ~io_in_sExp[8:0]; // @[primitives.scala 51:21]
  wire  roundMask_msb = _roundMask_T_1[8]; // @[primitives.scala 57:25]
  wire [7:0] roundMask_lsbs = _roundMask_T_1[7:0]; // @[primitives.scala 58:26]
  wire  roundMask_msb_1 = roundMask_lsbs[7]; // @[primitives.scala 57:25]
  wire [6:0] roundMask_lsbs_1 = roundMask_lsbs[6:0]; // @[primitives.scala 58:26]
  wire  roundMask_msb_2 = roundMask_lsbs_1[6]; // @[primitives.scala 57:25]
  wire [5:0] roundMask_lsbs_2 = roundMask_lsbs_1[5:0]; // @[primitives.scala 58:26]
  wire [64:0] roundMask_shift = 65'sh10000000000000000 >>> roundMask_lsbs_2; // @[primitives.scala 77:58]
  wire [15:0] _GEN_0 = {{8'd0}, roundMask_shift[57:50]}; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_7 = _GEN_0 & 16'hff; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_9 = {roundMask_shift[49:42], 8'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _roundMask_T_11 = _roundMask_T_9 & 16'hff00; // @[Bitwise.scala 103:75]
  wire [15:0] _roundMask_T_12 = _roundMask_T_7 | _roundMask_T_11; // @[Bitwise.scala 103:39]
  wire [15:0] _GEN_1 = {{4'd0}, _roundMask_T_12[15:4]}; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_17 = _GEN_1 & 16'hf0f; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_19 = {_roundMask_T_12[11:0], 4'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _roundMask_T_21 = _roundMask_T_19 & 16'hf0f0; // @[Bitwise.scala 103:75]
  wire [15:0] _roundMask_T_22 = _roundMask_T_17 | _roundMask_T_21; // @[Bitwise.scala 103:39]
  wire [15:0] _GEN_2 = {{2'd0}, _roundMask_T_22[15:2]}; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_27 = _GEN_2 & 16'h3333; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_29 = {_roundMask_T_22[13:0], 2'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _roundMask_T_31 = _roundMask_T_29 & 16'hcccc; // @[Bitwise.scala 103:75]
  wire [15:0] _roundMask_T_32 = _roundMask_T_27 | _roundMask_T_31; // @[Bitwise.scala 103:39]
  wire [15:0] _GEN_3 = {{1'd0}, _roundMask_T_32[15:1]}; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_37 = _GEN_3 & 16'h5555; // @[Bitwise.scala 103:31]
  wire [15:0] _roundMask_T_39 = {_roundMask_T_32[14:0], 1'h0}; // @[Bitwise.scala 103:65]
  wire [15:0] _roundMask_T_41 = _roundMask_T_39 & 16'haaaa; // @[Bitwise.scala 103:75]
  wire [15:0] _roundMask_T_42 = _roundMask_T_37 | _roundMask_T_41; // @[Bitwise.scala 103:39]
  wire [21:0] _roundMask_T_59 = {_roundMask_T_42,roundMask_shift[58],roundMask_shift[59],roundMask_shift[60],
    roundMask_shift[61],roundMask_shift[62],roundMask_shift[63]}; // @[Cat.scala 30:58]
  wire [21:0] _roundMask_T_60 = ~_roundMask_T_59; // @[primitives.scala 74:36]
  wire [21:0] _roundMask_T_61 = roundMask_msb_2 ? 22'h0 : _roundMask_T_60; // @[primitives.scala 74:21]
  wire [21:0] _roundMask_T_62 = ~_roundMask_T_61; // @[primitives.scala 74:17]
  wire [24:0] _roundMask_T_63 = {_roundMask_T_62,3'h7}; // @[Cat.scala 30:58]
  wire [2:0] _roundMask_T_70 = {roundMask_shift[0],roundMask_shift[1],roundMask_shift[2]}; // @[Cat.scala 30:58]
  wire [2:0] _roundMask_T_71 = roundMask_msb_2 ? _roundMask_T_70 : 3'h0; // @[primitives.scala 61:24]
  wire [24:0] _roundMask_T_72 = roundMask_msb_1 ? _roundMask_T_63 : {{22'd0}, _roundMask_T_71}; // @[primitives.scala 66:24]
  wire [24:0] _roundMask_T_73 = roundMask_msb ? _roundMask_T_72 : 25'h0; // @[primitives.scala 61:24]
  wire [24:0] _GEN_4 = {{24'd0}, doShiftSigDown1}; // @[RoundAnyRawFNToRecFN.scala 157:23]
  wire [24:0] _roundMask_T_74 = _roundMask_T_73 | _GEN_4; // @[RoundAnyRawFNToRecFN.scala 157:23]
  wire [26:0] roundMask = {_roundMask_T_74,2'h3}; // @[Cat.scala 30:58]
  wire [26:0] shiftedRoundMask = {1'h0,roundMask[26:1]}; // @[Cat.scala 30:58]
  wire [26:0] _roundPosMask_T = ~shiftedRoundMask; // @[RoundAnyRawFNToRecFN.scala 161:28]
  wire [26:0] roundPosMask = _roundPosMask_T & roundMask; // @[RoundAnyRawFNToRecFN.scala 161:46]
  wire [26:0] _roundPosBit_T = io_in_sig & roundPosMask; // @[RoundAnyRawFNToRecFN.scala 162:40]
  wire  roundPosBit = |_roundPosBit_T; // @[RoundAnyRawFNToRecFN.scala 162:56]
  wire [26:0] _anyRoundExtra_T = io_in_sig & shiftedRoundMask; // @[RoundAnyRawFNToRecFN.scala 163:42]
  wire  anyRoundExtra = |_anyRoundExtra_T; // @[RoundAnyRawFNToRecFN.scala 163:62]
  wire  anyRound = roundPosBit | anyRoundExtra; // @[RoundAnyRawFNToRecFN.scala 164:36]
  wire  _roundIncr_T = roundingMode_near_even | roundingMode_near_maxMag; // @[RoundAnyRawFNToRecFN.scala 167:38]
  wire  _roundIncr_T_1 = (roundingMode_near_even | roundingMode_near_maxMag) & roundPosBit; // @[RoundAnyRawFNToRecFN.scala 167:67]
  wire  _roundIncr_T_2 = roundMagUp & anyRound; // @[RoundAnyRawFNToRecFN.scala 169:29]
  wire  roundIncr = _roundIncr_T_1 | _roundIncr_T_2; // @[RoundAnyRawFNToRecFN.scala 168:31]
  wire [26:0] _roundedSig_T = io_in_sig | roundMask; // @[RoundAnyRawFNToRecFN.scala 172:32]
  wire [25:0] _roundedSig_T_2 = _roundedSig_T[26:2] + 25'h1; // @[RoundAnyRawFNToRecFN.scala 172:49]
  wire  _roundedSig_T_4 = ~anyRoundExtra; // @[RoundAnyRawFNToRecFN.scala 174:30]
  wire [25:0] _roundedSig_T_7 = roundingMode_near_even & roundPosBit & _roundedSig_T_4 ? roundMask[26:1] : 26'h0; // @[RoundAnyRawFNToRecFN.scala 173:25]
  wire [25:0] _roundedSig_T_8 = ~_roundedSig_T_7; // @[RoundAnyRawFNToRecFN.scala 173:21]
  wire [25:0] _roundedSig_T_9 = _roundedSig_T_2 & _roundedSig_T_8; // @[RoundAnyRawFNToRecFN.scala 172:61]
  wire [26:0] _roundedSig_T_10 = ~roundMask; // @[RoundAnyRawFNToRecFN.scala 178:32]
  wire [26:0] _roundedSig_T_11 = io_in_sig & _roundedSig_T_10; // @[RoundAnyRawFNToRecFN.scala 178:30]
  wire [25:0] _roundedSig_T_15 = roundingMode_odd & anyRound ? roundPosMask[26:1] : 26'h0; // @[RoundAnyRawFNToRecFN.scala 179:24]
  wire [25:0] _GEN_5 = {{1'd0}, _roundedSig_T_11[26:2]}; // @[RoundAnyRawFNToRecFN.scala 178:47]
  wire [25:0] _roundedSig_T_16 = _GEN_5 | _roundedSig_T_15; // @[RoundAnyRawFNToRecFN.scala 178:47]
  wire [25:0] roundedSig = roundIncr ? _roundedSig_T_9 : _roundedSig_T_16; // @[RoundAnyRawFNToRecFN.scala 171:16]
  wire [2:0] _sRoundedExp_T_1 = {1'b0,$signed(roundedSig[25:24])}; // @[RoundAnyRawFNToRecFN.scala 183:69]
  wire [9:0] _GEN_6 = {{7{_sRoundedExp_T_1[2]}},_sRoundedExp_T_1}; // @[RoundAnyRawFNToRecFN.scala 183:40]
  wire [10:0] sRoundedExp = $signed(io_in_sExp) + $signed(_GEN_6); // @[RoundAnyRawFNToRecFN.scala 183:40]
  wire [8:0] common_expOut = sRoundedExp[8:0]; // @[RoundAnyRawFNToRecFN.scala 185:37]
  wire [22:0] common_fractOut = doShiftSigDown1 ? roundedSig[23:1] : roundedSig[22:0]; // @[RoundAnyRawFNToRecFN.scala 187:16]
  wire [3:0] _common_overflow_T = sRoundedExp[10:7]; // @[RoundAnyRawFNToRecFN.scala 194:30]
  wire  common_overflow = $signed(_common_overflow_T) >= 4'sh3; // @[RoundAnyRawFNToRecFN.scala 194:50]
  wire  common_totalUnderflow = $signed(sRoundedExp) < 11'sh6b; // @[RoundAnyRawFNToRecFN.scala 198:31]
  wire  isNaNOut = io_invalidExc | io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 233:34]
  wire  commonCase = ~isNaNOut & ~io_in_isInf & ~io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 235:61]
  wire  overflow = commonCase & common_overflow; // @[RoundAnyRawFNToRecFN.scala 236:32]
  wire  overflow_roundMagUp = _roundIncr_T | roundMagUp; // @[RoundAnyRawFNToRecFN.scala 241:60]
  wire  pegMinNonzeroMagOut = commonCase & common_totalUnderflow & (roundMagUp | roundingMode_odd); // @[RoundAnyRawFNToRecFN.scala 243:45]
  wire  pegMaxFiniteMagOut = overflow & ~overflow_roundMagUp; // @[RoundAnyRawFNToRecFN.scala 244:39]
  wire  notNaN_isInfOut = io_in_isInf | overflow & overflow_roundMagUp; // @[RoundAnyRawFNToRecFN.scala 246:32]
  wire  signOut = isNaNOut ? 1'h0 : io_in_sign; // @[RoundAnyRawFNToRecFN.scala 248:22]
  wire [8:0] _expOut_T_1 = io_in_isZero | common_totalUnderflow ? 9'h1c0 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 251:18]
  wire [8:0] _expOut_T_2 = ~_expOut_T_1; // @[RoundAnyRawFNToRecFN.scala 251:14]
  wire [8:0] _expOut_T_3 = common_expOut & _expOut_T_2; // @[RoundAnyRawFNToRecFN.scala 250:24]
  wire [8:0] _expOut_T_5 = pegMinNonzeroMagOut ? 9'h194 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 255:18]
  wire [8:0] _expOut_T_6 = ~_expOut_T_5; // @[RoundAnyRawFNToRecFN.scala 255:14]
  wire [8:0] _expOut_T_7 = _expOut_T_3 & _expOut_T_6; // @[RoundAnyRawFNToRecFN.scala 254:17]
  wire [8:0] _expOut_T_8 = pegMaxFiniteMagOut ? 9'h80 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 259:18]
  wire [8:0] _expOut_T_9 = ~_expOut_T_8; // @[RoundAnyRawFNToRecFN.scala 259:14]
  wire [8:0] _expOut_T_10 = _expOut_T_7 & _expOut_T_9; // @[RoundAnyRawFNToRecFN.scala 258:17]
  wire [8:0] _expOut_T_11 = notNaN_isInfOut ? 9'h40 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 263:18]
  wire [8:0] _expOut_T_12 = ~_expOut_T_11; // @[RoundAnyRawFNToRecFN.scala 263:14]
  wire [8:0] _expOut_T_13 = _expOut_T_10 & _expOut_T_12; // @[RoundAnyRawFNToRecFN.scala 262:17]
  wire [8:0] _expOut_T_14 = pegMinNonzeroMagOut ? 9'h6b : 9'h0; // @[RoundAnyRawFNToRecFN.scala 267:16]
  wire [8:0] _expOut_T_15 = _expOut_T_13 | _expOut_T_14; // @[RoundAnyRawFNToRecFN.scala 266:18]
  wire [8:0] _expOut_T_16 = pegMaxFiniteMagOut ? 9'h17f : 9'h0; // @[RoundAnyRawFNToRecFN.scala 271:16]
  wire [8:0] _expOut_T_17 = _expOut_T_15 | _expOut_T_16; // @[RoundAnyRawFNToRecFN.scala 270:15]
  wire [8:0] _expOut_T_18 = notNaN_isInfOut ? 9'h180 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 275:16]
  wire [8:0] _expOut_T_19 = _expOut_T_17 | _expOut_T_18; // @[RoundAnyRawFNToRecFN.scala 274:15]
  wire [8:0] _expOut_T_20 = isNaNOut ? 9'h1c0 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 276:16]
  wire [8:0] expOut = _expOut_T_19 | _expOut_T_20; // @[RoundAnyRawFNToRecFN.scala 275:77]
  wire [22:0] _fractOut_T_2 = isNaNOut ? 23'h400000 : 23'h0; // @[RoundAnyRawFNToRecFN.scala 279:16]
  wire [22:0] _fractOut_T_3 = isNaNOut | io_in_isZero | common_totalUnderflow ? _fractOut_T_2 : common_fractOut; // @[RoundAnyRawFNToRecFN.scala 278:12]
  wire [22:0] _fractOut_T_5 = pegMaxFiniteMagOut ? 23'h7fffff : 23'h0; // @[Bitwise.scala 72:12]
  wire [22:0] fractOut = _fractOut_T_3 | _fractOut_T_5; // @[RoundAnyRawFNToRecFN.scala 281:11]
  wire [9:0] io_out_hi = {signOut,expOut}; // @[Cat.scala 30:58]
  assign io_out = {io_out_hi,fractOut}; // @[Cat.scala 30:58]
endmodule
module RoundRawFNToRecFN(
  input         io_invalidExc,
  input         io_in_isNaN,
  input         io_in_isInf,
  input         io_in_isZero,
  input         io_in_sign,
  input  [9:0]  io_in_sExp,
  input  [26:0] io_in_sig,
  input  [2:0]  io_roundingMode,
  output [32:0] io_out
);
  wire  roundAnyRawFNToRecFN_io_invalidExc; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire  roundAnyRawFNToRecFN_io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire  roundAnyRawFNToRecFN_io_in_isInf; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire  roundAnyRawFNToRecFN_io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire  roundAnyRawFNToRecFN_io_in_sign; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire [9:0] roundAnyRawFNToRecFN_io_in_sExp; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire [26:0] roundAnyRawFNToRecFN_io_in_sig; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire [2:0] roundAnyRawFNToRecFN_io_roundingMode; // @[RoundAnyRawFNToRecFN.scala 307:15]
  wire [32:0] roundAnyRawFNToRecFN_io_out; // @[RoundAnyRawFNToRecFN.scala 307:15]
  RoundAnyRawFNToRecFN roundAnyRawFNToRecFN ( // @[RoundAnyRawFNToRecFN.scala 307:15]
    .io_invalidExc(roundAnyRawFNToRecFN_io_invalidExc),
    .io_in_isNaN(roundAnyRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(roundAnyRawFNToRecFN_io_in_isInf),
    .io_in_isZero(roundAnyRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundAnyRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundAnyRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundAnyRawFNToRecFN_io_in_sig),
    .io_roundingMode(roundAnyRawFNToRecFN_io_roundingMode),
    .io_out(roundAnyRawFNToRecFN_io_out)
  );
  assign io_out = roundAnyRawFNToRecFN_io_out; // @[RoundAnyRawFNToRecFN.scala 315:23]
  assign roundAnyRawFNToRecFN_io_invalidExc = io_invalidExc; // @[RoundAnyRawFNToRecFN.scala 310:44]
  assign roundAnyRawFNToRecFN_io_in_isNaN = io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 312:44]
  assign roundAnyRawFNToRecFN_io_in_isInf = io_in_isInf; // @[RoundAnyRawFNToRecFN.scala 312:44]
  assign roundAnyRawFNToRecFN_io_in_isZero = io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 312:44]
  assign roundAnyRawFNToRecFN_io_in_sign = io_in_sign; // @[RoundAnyRawFNToRecFN.scala 312:44]
  assign roundAnyRawFNToRecFN_io_in_sExp = io_in_sExp; // @[RoundAnyRawFNToRecFN.scala 312:44]
  assign roundAnyRawFNToRecFN_io_in_sig = io_in_sig; // @[RoundAnyRawFNToRecFN.scala 312:44]
  assign roundAnyRawFNToRecFN_io_roundingMode = io_roundingMode; // @[RoundAnyRawFNToRecFN.scala 313:44]
endmodule
module MulRecFN(
  input  [32:0] io_a,
  input  [32:0] io_b,
  input  [2:0]  io_roundingMode,
  output [32:0] io_out
);
  wire  mulRawFN__io_a_isNaN; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_a_isInf; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_a_isZero; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_a_sign; // @[MulRecFN.scala 113:26]
  wire [9:0] mulRawFN__io_a_sExp; // @[MulRecFN.scala 113:26]
  wire [24:0] mulRawFN__io_a_sig; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_b_isNaN; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_b_isInf; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_b_isZero; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_b_sign; // @[MulRecFN.scala 113:26]
  wire [9:0] mulRawFN__io_b_sExp; // @[MulRecFN.scala 113:26]
  wire [24:0] mulRawFN__io_b_sig; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_invalidExc; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_rawOut_isNaN; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_rawOut_isInf; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_rawOut_isZero; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_rawOut_sign; // @[MulRecFN.scala 113:26]
  wire [9:0] mulRawFN__io_rawOut_sExp; // @[MulRecFN.scala 113:26]
  wire [26:0] mulRawFN__io_rawOut_sig; // @[MulRecFN.scala 113:26]
  wire  roundRawFNToRecFN_io_invalidExc; // @[MulRecFN.scala 121:15]
  wire  roundRawFNToRecFN_io_in_isNaN; // @[MulRecFN.scala 121:15]
  wire  roundRawFNToRecFN_io_in_isInf; // @[MulRecFN.scala 121:15]
  wire  roundRawFNToRecFN_io_in_isZero; // @[MulRecFN.scala 121:15]
  wire  roundRawFNToRecFN_io_in_sign; // @[MulRecFN.scala 121:15]
  wire [9:0] roundRawFNToRecFN_io_in_sExp; // @[MulRecFN.scala 121:15]
  wire [26:0] roundRawFNToRecFN_io_in_sig; // @[MulRecFN.scala 121:15]
  wire [2:0] roundRawFNToRecFN_io_roundingMode; // @[MulRecFN.scala 121:15]
  wire [32:0] roundRawFNToRecFN_io_out; // @[MulRecFN.scala 121:15]
  wire [8:0] mulRawFN_io_a_exp = io_a[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  mulRawFN_io_a_isZero = mulRawFN_io_a_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  mulRawFN_io_a_isSpecial = mulRawFN_io_a_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  _mulRawFN_io_a_out_sig_T = ~mulRawFN_io_a_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [1:0] mulRawFN_io_a_out_sig_hi = {1'h0,_mulRawFN_io_a_out_sig_T}; // @[Cat.scala 30:58]
  wire [8:0] mulRawFN_io_b_exp = io_b[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  mulRawFN_io_b_isZero = mulRawFN_io_b_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  mulRawFN_io_b_isSpecial = mulRawFN_io_b_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  _mulRawFN_io_b_out_sig_T = ~mulRawFN_io_b_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [1:0] mulRawFN_io_b_out_sig_hi = {1'h0,_mulRawFN_io_b_out_sig_T}; // @[Cat.scala 30:58]
  MulRawFN mulRawFN_ ( // @[MulRecFN.scala 113:26]
    .io_a_isNaN(mulRawFN__io_a_isNaN),
    .io_a_isInf(mulRawFN__io_a_isInf),
    .io_a_isZero(mulRawFN__io_a_isZero),
    .io_a_sign(mulRawFN__io_a_sign),
    .io_a_sExp(mulRawFN__io_a_sExp),
    .io_a_sig(mulRawFN__io_a_sig),
    .io_b_isNaN(mulRawFN__io_b_isNaN),
    .io_b_isInf(mulRawFN__io_b_isInf),
    .io_b_isZero(mulRawFN__io_b_isZero),
    .io_b_sign(mulRawFN__io_b_sign),
    .io_b_sExp(mulRawFN__io_b_sExp),
    .io_b_sig(mulRawFN__io_b_sig),
    .io_invalidExc(mulRawFN__io_invalidExc),
    .io_rawOut_isNaN(mulRawFN__io_rawOut_isNaN),
    .io_rawOut_isInf(mulRawFN__io_rawOut_isInf),
    .io_rawOut_isZero(mulRawFN__io_rawOut_isZero),
    .io_rawOut_sign(mulRawFN__io_rawOut_sign),
    .io_rawOut_sExp(mulRawFN__io_rawOut_sExp),
    .io_rawOut_sig(mulRawFN__io_rawOut_sig)
  );
  RoundRawFNToRecFN roundRawFNToRecFN ( // @[MulRecFN.scala 121:15]
    .io_invalidExc(roundRawFNToRecFN_io_invalidExc),
    .io_in_isNaN(roundRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(roundRawFNToRecFN_io_in_isInf),
    .io_in_isZero(roundRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundRawFNToRecFN_io_in_sig),
    .io_roundingMode(roundRawFNToRecFN_io_roundingMode),
    .io_out(roundRawFNToRecFN_io_out)
  );
  assign io_out = roundRawFNToRecFN_io_out; // @[MulRecFN.scala 127:23]
  assign mulRawFN__io_a_isNaN = mulRawFN_io_a_isSpecial & mulRawFN_io_a_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  assign mulRawFN__io_a_isInf = mulRawFN_io_a_isSpecial & ~mulRawFN_io_a_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  assign mulRawFN__io_a_isZero = mulRawFN_io_a_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign mulRawFN__io_a_sign = io_a[32]; // @[rawFloatFromRecFN.scala 58:25]
  assign mulRawFN__io_a_sExp = {1'b0,$signed(mulRawFN_io_a_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  assign mulRawFN__io_a_sig = {mulRawFN_io_a_out_sig_hi,io_a[22:0]}; // @[Cat.scala 30:58]
  assign mulRawFN__io_b_isNaN = mulRawFN_io_b_isSpecial & mulRawFN_io_b_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  assign mulRawFN__io_b_isInf = mulRawFN_io_b_isSpecial & ~mulRawFN_io_b_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  assign mulRawFN__io_b_isZero = mulRawFN_io_b_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign mulRawFN__io_b_sign = io_b[32]; // @[rawFloatFromRecFN.scala 58:25]
  assign mulRawFN__io_b_sExp = {1'b0,$signed(mulRawFN_io_b_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  assign mulRawFN__io_b_sig = {mulRawFN_io_b_out_sig_hi,io_b[22:0]}; // @[Cat.scala 30:58]
  assign roundRawFNToRecFN_io_invalidExc = mulRawFN__io_invalidExc; // @[MulRecFN.scala 122:39]
  assign roundRawFNToRecFN_io_in_isNaN = mulRawFN__io_rawOut_isNaN; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_isInf = mulRawFN__io_rawOut_isInf; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_isZero = mulRawFN__io_rawOut_isZero; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_sign = mulRawFN__io_rawOut_sign; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_sExp = mulRawFN__io_rawOut_sExp; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_sig = mulRawFN__io_rawOut_sig; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_roundingMode = io_roundingMode; // @[MulRecFN.scala 125:39]
endmodule
module MultPE(
  input         clock,
  input         reset,
  input         io_use_int,
  input  [2:0]  io_rounding,
  input  [31:0] io_in_0,
  input  [31:0] io_in_1,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  wire [32:0] mulRecFN_io_a; // @[MultPE.scala 50:26]
  wire [32:0] mulRecFN_io_b; // @[MultPE.scala 50:26]
  wire [2:0] mulRecFN_io_roundingMode; // @[MultPE.scala 50:26]
  wire [32:0] mulRecFN_io_out; // @[MultPE.scala 50:26]
  reg [2:0] rounding; // @[MultPE.scala 21:26]
  reg  use_int; // @[MultPE.scala 25:26]
  reg [32:0] module_out; // @[MultPE.scala 27:27]
  reg [31:0] sign_in_0; // @[MultPE.scala 31:29]
  reg [31:0] sign_in_1; // @[MultPE.scala 32:29]
  wire [63:0] _module_out_T_1 = $signed(sign_in_0) * $signed(sign_in_1); // @[MultPE.scala 35:49]
  reg [31:0] fN_in_0; // @[MultPE.scala 42:27]
  reg [31:0] fN_in_1; // @[MultPE.scala 43:27]
  wire  recFN_from_fN_in_0_rawIn_sign = fN_in_0[31]; // @[rawFloatFromFN.scala 46:22]
  wire [7:0] recFN_from_fN_in_0_rawIn_expIn = fN_in_0[30:23]; // @[rawFloatFromFN.scala 47:23]
  wire [22:0] recFN_from_fN_in_0_rawIn_fractIn = fN_in_0[22:0]; // @[rawFloatFromFN.scala 48:25]
  wire  recFN_from_fN_in_0_rawIn_isZeroExpIn = recFN_from_fN_in_0_rawIn_expIn == 8'h0; // @[rawFloatFromFN.scala 50:34]
  wire  recFN_from_fN_in_0_rawIn_isZeroFractIn = recFN_from_fN_in_0_rawIn_fractIn == 23'h0; // @[rawFloatFromFN.scala 51:38]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_23 = recFN_from_fN_in_0_rawIn_fractIn[1] ? 5'h15 : 5'h16; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_24 = recFN_from_fN_in_0_rawIn_fractIn[2] ? 5'h14 :
    _recFN_from_fN_in_0_rawIn_normDist_T_23; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_25 = recFN_from_fN_in_0_rawIn_fractIn[3] ? 5'h13 :
    _recFN_from_fN_in_0_rawIn_normDist_T_24; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_26 = recFN_from_fN_in_0_rawIn_fractIn[4] ? 5'h12 :
    _recFN_from_fN_in_0_rawIn_normDist_T_25; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_27 = recFN_from_fN_in_0_rawIn_fractIn[5] ? 5'h11 :
    _recFN_from_fN_in_0_rawIn_normDist_T_26; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_28 = recFN_from_fN_in_0_rawIn_fractIn[6] ? 5'h10 :
    _recFN_from_fN_in_0_rawIn_normDist_T_27; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_29 = recFN_from_fN_in_0_rawIn_fractIn[7] ? 5'hf :
    _recFN_from_fN_in_0_rawIn_normDist_T_28; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_30 = recFN_from_fN_in_0_rawIn_fractIn[8] ? 5'he :
    _recFN_from_fN_in_0_rawIn_normDist_T_29; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_31 = recFN_from_fN_in_0_rawIn_fractIn[9] ? 5'hd :
    _recFN_from_fN_in_0_rawIn_normDist_T_30; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_32 = recFN_from_fN_in_0_rawIn_fractIn[10] ? 5'hc :
    _recFN_from_fN_in_0_rawIn_normDist_T_31; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_33 = recFN_from_fN_in_0_rawIn_fractIn[11] ? 5'hb :
    _recFN_from_fN_in_0_rawIn_normDist_T_32; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_34 = recFN_from_fN_in_0_rawIn_fractIn[12] ? 5'ha :
    _recFN_from_fN_in_0_rawIn_normDist_T_33; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_35 = recFN_from_fN_in_0_rawIn_fractIn[13] ? 5'h9 :
    _recFN_from_fN_in_0_rawIn_normDist_T_34; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_36 = recFN_from_fN_in_0_rawIn_fractIn[14] ? 5'h8 :
    _recFN_from_fN_in_0_rawIn_normDist_T_35; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_37 = recFN_from_fN_in_0_rawIn_fractIn[15] ? 5'h7 :
    _recFN_from_fN_in_0_rawIn_normDist_T_36; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_38 = recFN_from_fN_in_0_rawIn_fractIn[16] ? 5'h6 :
    _recFN_from_fN_in_0_rawIn_normDist_T_37; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_39 = recFN_from_fN_in_0_rawIn_fractIn[17] ? 5'h5 :
    _recFN_from_fN_in_0_rawIn_normDist_T_38; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_40 = recFN_from_fN_in_0_rawIn_fractIn[18] ? 5'h4 :
    _recFN_from_fN_in_0_rawIn_normDist_T_39; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_41 = recFN_from_fN_in_0_rawIn_fractIn[19] ? 5'h3 :
    _recFN_from_fN_in_0_rawIn_normDist_T_40; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_42 = recFN_from_fN_in_0_rawIn_fractIn[20] ? 5'h2 :
    _recFN_from_fN_in_0_rawIn_normDist_T_41; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_43 = recFN_from_fN_in_0_rawIn_fractIn[21] ? 5'h1 :
    _recFN_from_fN_in_0_rawIn_normDist_T_42; // @[Mux.scala 47:69]
  wire [4:0] recFN_from_fN_in_0_rawIn_normDist = recFN_from_fN_in_0_rawIn_fractIn[22] ? 5'h0 :
    _recFN_from_fN_in_0_rawIn_normDist_T_43; // @[Mux.scala 47:69]
  wire [53:0] _GEN_11 = {{31'd0}, recFN_from_fN_in_0_rawIn_fractIn}; // @[rawFloatFromFN.scala 54:36]
  wire [53:0] _recFN_from_fN_in_0_rawIn_subnormFract_T = _GEN_11 << recFN_from_fN_in_0_rawIn_normDist; // @[rawFloatFromFN.scala 54:36]
  wire [22:0] recFN_from_fN_in_0_rawIn_subnormFract = {_recFN_from_fN_in_0_rawIn_subnormFract_T[21:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [8:0] _GEN_2 = {{4'd0}, recFN_from_fN_in_0_rawIn_normDist}; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _recFN_from_fN_in_0_rawIn_adjustedExp_T = _GEN_2 ^ 9'h1ff; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _recFN_from_fN_in_0_rawIn_adjustedExp_T_1 = recFN_from_fN_in_0_rawIn_isZeroExpIn ?
    _recFN_from_fN_in_0_rawIn_adjustedExp_T : {{1'd0}, recFN_from_fN_in_0_rawIn_expIn}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _recFN_from_fN_in_0_rawIn_adjustedExp_T_2 = recFN_from_fN_in_0_rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [7:0] _GEN_3 = {{6'd0}, _recFN_from_fN_in_0_rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 60:22]
  wire [7:0] _recFN_from_fN_in_0_rawIn_adjustedExp_T_3 = 8'h80 | _GEN_3; // @[rawFloatFromFN.scala 60:22]
  wire [8:0] _GEN_4 = {{1'd0}, _recFN_from_fN_in_0_rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 59:15]
  wire [8:0] recFN_from_fN_in_0_rawIn_adjustedExp = _recFN_from_fN_in_0_rawIn_adjustedExp_T_1 + _GEN_4; // @[rawFloatFromFN.scala 59:15]
  wire  recFN_from_fN_in_0_rawIn_isZero = recFN_from_fN_in_0_rawIn_isZeroExpIn & recFN_from_fN_in_0_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 62:34]
  wire  recFN_from_fN_in_0_rawIn_isSpecial = recFN_from_fN_in_0_rawIn_adjustedExp[8:7] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  recFN_from_fN_in_0_rawIn__isNaN = recFN_from_fN_in_0_rawIn_isSpecial & ~recFN_from_fN_in_0_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 66:33]
  wire [9:0] recFN_from_fN_in_0_rawIn__sExp = {1'b0,$signed(recFN_from_fN_in_0_rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 70:48]
  wire  _recFN_from_fN_in_0_rawIn_out_sig_T = ~recFN_from_fN_in_0_rawIn_isZero; // @[rawFloatFromFN.scala 72:29]
  wire [22:0] _recFN_from_fN_in_0_rawIn_out_sig_T_1 = recFN_from_fN_in_0_rawIn_isZeroExpIn ?
    recFN_from_fN_in_0_rawIn_subnormFract : recFN_from_fN_in_0_rawIn_fractIn; // @[rawFloatFromFN.scala 72:42]
  wire [24:0] recFN_from_fN_in_0_rawIn__sig = {1'h0,_recFN_from_fN_in_0_rawIn_out_sig_T,
    _recFN_from_fN_in_0_rawIn_out_sig_T_1}; // @[Cat.scala 30:58]
  wire [2:0] _recFN_from_fN_in_0_T_1 = recFN_from_fN_in_0_rawIn_isZero ? 3'h0 : recFN_from_fN_in_0_rawIn__sExp[8:6]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_5 = {{2'd0}, recFN_from_fN_in_0_rawIn__isNaN}; // @[recFNFromFN.scala 48:79]
  wire [2:0] _recFN_from_fN_in_0_T_3 = _recFN_from_fN_in_0_T_1 | _GEN_5; // @[recFNFromFN.scala 48:79]
  wire [28:0] recFN_from_fN_in_0_lo = {recFN_from_fN_in_0_rawIn__sExp[5:0],recFN_from_fN_in_0_rawIn__sig[22:0]}; // @[Cat.scala 30:58]
  wire [3:0] recFN_from_fN_in_0_hi = {recFN_from_fN_in_0_rawIn_sign,_recFN_from_fN_in_0_T_3}; // @[Cat.scala 30:58]
  reg [32:0] recFN_from_fN_in_0; // @[MultPE.scala 46:37]
  wire  recFN_from_fN_in_1_rawIn_sign = fN_in_1[31]; // @[rawFloatFromFN.scala 46:22]
  wire [7:0] recFN_from_fN_in_1_rawIn_expIn = fN_in_1[30:23]; // @[rawFloatFromFN.scala 47:23]
  wire [22:0] recFN_from_fN_in_1_rawIn_fractIn = fN_in_1[22:0]; // @[rawFloatFromFN.scala 48:25]
  wire  recFN_from_fN_in_1_rawIn_isZeroExpIn = recFN_from_fN_in_1_rawIn_expIn == 8'h0; // @[rawFloatFromFN.scala 50:34]
  wire  recFN_from_fN_in_1_rawIn_isZeroFractIn = recFN_from_fN_in_1_rawIn_fractIn == 23'h0; // @[rawFloatFromFN.scala 51:38]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_23 = recFN_from_fN_in_1_rawIn_fractIn[1] ? 5'h15 : 5'h16; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_24 = recFN_from_fN_in_1_rawIn_fractIn[2] ? 5'h14 :
    _recFN_from_fN_in_1_rawIn_normDist_T_23; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_25 = recFN_from_fN_in_1_rawIn_fractIn[3] ? 5'h13 :
    _recFN_from_fN_in_1_rawIn_normDist_T_24; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_26 = recFN_from_fN_in_1_rawIn_fractIn[4] ? 5'h12 :
    _recFN_from_fN_in_1_rawIn_normDist_T_25; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_27 = recFN_from_fN_in_1_rawIn_fractIn[5] ? 5'h11 :
    _recFN_from_fN_in_1_rawIn_normDist_T_26; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_28 = recFN_from_fN_in_1_rawIn_fractIn[6] ? 5'h10 :
    _recFN_from_fN_in_1_rawIn_normDist_T_27; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_29 = recFN_from_fN_in_1_rawIn_fractIn[7] ? 5'hf :
    _recFN_from_fN_in_1_rawIn_normDist_T_28; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_30 = recFN_from_fN_in_1_rawIn_fractIn[8] ? 5'he :
    _recFN_from_fN_in_1_rawIn_normDist_T_29; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_31 = recFN_from_fN_in_1_rawIn_fractIn[9] ? 5'hd :
    _recFN_from_fN_in_1_rawIn_normDist_T_30; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_32 = recFN_from_fN_in_1_rawIn_fractIn[10] ? 5'hc :
    _recFN_from_fN_in_1_rawIn_normDist_T_31; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_33 = recFN_from_fN_in_1_rawIn_fractIn[11] ? 5'hb :
    _recFN_from_fN_in_1_rawIn_normDist_T_32; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_34 = recFN_from_fN_in_1_rawIn_fractIn[12] ? 5'ha :
    _recFN_from_fN_in_1_rawIn_normDist_T_33; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_35 = recFN_from_fN_in_1_rawIn_fractIn[13] ? 5'h9 :
    _recFN_from_fN_in_1_rawIn_normDist_T_34; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_36 = recFN_from_fN_in_1_rawIn_fractIn[14] ? 5'h8 :
    _recFN_from_fN_in_1_rawIn_normDist_T_35; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_37 = recFN_from_fN_in_1_rawIn_fractIn[15] ? 5'h7 :
    _recFN_from_fN_in_1_rawIn_normDist_T_36; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_38 = recFN_from_fN_in_1_rawIn_fractIn[16] ? 5'h6 :
    _recFN_from_fN_in_1_rawIn_normDist_T_37; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_39 = recFN_from_fN_in_1_rawIn_fractIn[17] ? 5'h5 :
    _recFN_from_fN_in_1_rawIn_normDist_T_38; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_40 = recFN_from_fN_in_1_rawIn_fractIn[18] ? 5'h4 :
    _recFN_from_fN_in_1_rawIn_normDist_T_39; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_41 = recFN_from_fN_in_1_rawIn_fractIn[19] ? 5'h3 :
    _recFN_from_fN_in_1_rawIn_normDist_T_40; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_42 = recFN_from_fN_in_1_rawIn_fractIn[20] ? 5'h2 :
    _recFN_from_fN_in_1_rawIn_normDist_T_41; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_43 = recFN_from_fN_in_1_rawIn_fractIn[21] ? 5'h1 :
    _recFN_from_fN_in_1_rawIn_normDist_T_42; // @[Mux.scala 47:69]
  wire [4:0] recFN_from_fN_in_1_rawIn_normDist = recFN_from_fN_in_1_rawIn_fractIn[22] ? 5'h0 :
    _recFN_from_fN_in_1_rawIn_normDist_T_43; // @[Mux.scala 47:69]
  wire [53:0] _GEN_12 = {{31'd0}, recFN_from_fN_in_1_rawIn_fractIn}; // @[rawFloatFromFN.scala 54:36]
  wire [53:0] _recFN_from_fN_in_1_rawIn_subnormFract_T = _GEN_12 << recFN_from_fN_in_1_rawIn_normDist; // @[rawFloatFromFN.scala 54:36]
  wire [22:0] recFN_from_fN_in_1_rawIn_subnormFract = {_recFN_from_fN_in_1_rawIn_subnormFract_T[21:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [8:0] _GEN_6 = {{4'd0}, recFN_from_fN_in_1_rawIn_normDist}; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _recFN_from_fN_in_1_rawIn_adjustedExp_T = _GEN_6 ^ 9'h1ff; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _recFN_from_fN_in_1_rawIn_adjustedExp_T_1 = recFN_from_fN_in_1_rawIn_isZeroExpIn ?
    _recFN_from_fN_in_1_rawIn_adjustedExp_T : {{1'd0}, recFN_from_fN_in_1_rawIn_expIn}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _recFN_from_fN_in_1_rawIn_adjustedExp_T_2 = recFN_from_fN_in_1_rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [7:0] _GEN_7 = {{6'd0}, _recFN_from_fN_in_1_rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 60:22]
  wire [7:0] _recFN_from_fN_in_1_rawIn_adjustedExp_T_3 = 8'h80 | _GEN_7; // @[rawFloatFromFN.scala 60:22]
  wire [8:0] _GEN_8 = {{1'd0}, _recFN_from_fN_in_1_rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 59:15]
  wire [8:0] recFN_from_fN_in_1_rawIn_adjustedExp = _recFN_from_fN_in_1_rawIn_adjustedExp_T_1 + _GEN_8; // @[rawFloatFromFN.scala 59:15]
  wire  recFN_from_fN_in_1_rawIn_isZero = recFN_from_fN_in_1_rawIn_isZeroExpIn & recFN_from_fN_in_1_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 62:34]
  wire  recFN_from_fN_in_1_rawIn_isSpecial = recFN_from_fN_in_1_rawIn_adjustedExp[8:7] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  recFN_from_fN_in_1_rawIn__isNaN = recFN_from_fN_in_1_rawIn_isSpecial & ~recFN_from_fN_in_1_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 66:33]
  wire [9:0] recFN_from_fN_in_1_rawIn__sExp = {1'b0,$signed(recFN_from_fN_in_1_rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 70:48]
  wire  _recFN_from_fN_in_1_rawIn_out_sig_T = ~recFN_from_fN_in_1_rawIn_isZero; // @[rawFloatFromFN.scala 72:29]
  wire [22:0] _recFN_from_fN_in_1_rawIn_out_sig_T_1 = recFN_from_fN_in_1_rawIn_isZeroExpIn ?
    recFN_from_fN_in_1_rawIn_subnormFract : recFN_from_fN_in_1_rawIn_fractIn; // @[rawFloatFromFN.scala 72:42]
  wire [24:0] recFN_from_fN_in_1_rawIn__sig = {1'h0,_recFN_from_fN_in_1_rawIn_out_sig_T,
    _recFN_from_fN_in_1_rawIn_out_sig_T_1}; // @[Cat.scala 30:58]
  wire [2:0] _recFN_from_fN_in_1_T_1 = recFN_from_fN_in_1_rawIn_isZero ? 3'h0 : recFN_from_fN_in_1_rawIn__sExp[8:6]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_9 = {{2'd0}, recFN_from_fN_in_1_rawIn__isNaN}; // @[recFNFromFN.scala 48:79]
  wire [2:0] _recFN_from_fN_in_1_T_3 = _recFN_from_fN_in_1_T_1 | _GEN_9; // @[recFNFromFN.scala 48:79]
  wire [28:0] recFN_from_fN_in_1_lo = {recFN_from_fN_in_1_rawIn__sExp[5:0],recFN_from_fN_in_1_rawIn__sig[22:0]}; // @[Cat.scala 30:58]
  wire [3:0] recFN_from_fN_in_1_hi = {recFN_from_fN_in_1_rawIn_sign,_recFN_from_fN_in_1_T_3}; // @[Cat.scala 30:58]
  reg [32:0] recFN_from_fN_in_1; // @[MultPE.scala 47:37]
  wire [8:0] io_out_rawIn_exp = mulRecFN_io_out[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  io_out_rawIn_isZero = io_out_rawIn_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  io_out_rawIn_isSpecial = io_out_rawIn_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  io_out_rawIn__isNaN = io_out_rawIn_isSpecial & io_out_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  wire  io_out_rawIn__isInf = io_out_rawIn_isSpecial & ~io_out_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  wire  io_out_rawIn__sign = mulRecFN_io_out[32]; // @[rawFloatFromRecFN.scala 58:25]
  wire [9:0] io_out_rawIn__sExp = {1'b0,$signed(io_out_rawIn_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  _io_out_rawIn_out_sig_T = ~io_out_rawIn_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [24:0] io_out_rawIn__sig = {1'h0,_io_out_rawIn_out_sig_T,mulRecFN_io_out[22:0]}; // @[Cat.scala 30:58]
  wire  io_out_isSubnormal = $signed(io_out_rawIn__sExp) < 10'sh82; // @[fNFromRecFN.scala 50:39]
  wire [4:0] io_out_denormShiftDist = 5'h1 - io_out_rawIn__sExp[4:0]; // @[fNFromRecFN.scala 51:39]
  wire [23:0] _io_out_denormFract_T_1 = io_out_rawIn__sig[24:1] >> io_out_denormShiftDist; // @[fNFromRecFN.scala 52:42]
  wire [22:0] io_out_denormFract = _io_out_denormFract_T_1[22:0]; // @[fNFromRecFN.scala 52:60]
  wire [7:0] _io_out_expOut_T_2 = io_out_rawIn__sExp[7:0] - 8'h81; // @[fNFromRecFN.scala 57:45]
  wire [7:0] _io_out_expOut_T_3 = io_out_isSubnormal ? 8'h0 : _io_out_expOut_T_2; // @[fNFromRecFN.scala 55:16]
  wire  _io_out_expOut_T_4 = io_out_rawIn__isNaN | io_out_rawIn__isInf; // @[fNFromRecFN.scala 59:44]
  wire [7:0] _io_out_expOut_T_6 = _io_out_expOut_T_4 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] io_out_expOut = _io_out_expOut_T_3 | _io_out_expOut_T_6; // @[fNFromRecFN.scala 59:15]
  wire [22:0] _io_out_fractOut_T_1 = io_out_rawIn__isInf ? 23'h0 : io_out_rawIn__sig[22:0]; // @[fNFromRecFN.scala 63:20]
  wire [22:0] io_out_fractOut = io_out_isSubnormal ? io_out_denormFract : _io_out_fractOut_T_1; // @[fNFromRecFN.scala 61:16]
  wire [31:0] _io_out_T = {io_out_rawIn__sign,io_out_expOut,io_out_fractOut}; // @[Cat.scala 30:58]
  wire [63:0] _GEN_0 = use_int ? _module_out_T_1 : {{31'd0}, module_out}; // @[MultPE.scala 29:16 35:16 27:27]
  wire [32:0] _GEN_1 = use_int ? module_out : {{1'd0}, _io_out_T}; // @[MultPE.scala 29:16 37:12 57:12]
  wire [63:0] _GEN_10 = reset ? 64'h0 : _GEN_0; // @[MultPE.scala 27:{27,27}]
  MulRecFN mulRecFN ( // @[MultPE.scala 50:26]
    .io_a(mulRecFN_io_a),
    .io_b(mulRecFN_io_b),
    .io_roundingMode(mulRecFN_io_roundingMode),
    .io_out(mulRecFN_io_out)
  );
  assign io_out = _GEN_1[31:0];
  assign mulRecFN_io_a = recFN_from_fN_in_0; // @[MultPE.scala 53:19]
  assign mulRecFN_io_b = recFN_from_fN_in_1; // @[MultPE.scala 54:19]
  assign mulRecFN_io_roundingMode = rounding; // @[MultPE.scala 51:32]
  always @(posedge clock) begin
    rounding <= io_rounding; // @[MultPE.scala 21:26]
    use_int <= io_use_int; // @[MultPE.scala 25:26]
    module_out <= _GEN_10[32:0]; // @[MultPE.scala 27:{27,27}]
    sign_in_0 <= io_in_0; // @[MultPE.scala 31:44]
    sign_in_1 <= io_in_1; // @[MultPE.scala 32:44]
    fN_in_0 <= io_in_0; // @[MultPE.scala 42:27]
    fN_in_1 <= io_in_1; // @[MultPE.scala 43:27]
    recFN_from_fN_in_0 <= {recFN_from_fN_in_0_hi,recFN_from_fN_in_0_lo}; // @[Cat.scala 30:58]
    recFN_from_fN_in_1 <= {recFN_from_fN_in_1_hi,recFN_from_fN_in_1_lo}; // @[Cat.scala 30:58]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  rounding = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  use_int = _RAND_1[0:0];
  _RAND_2 = {2{`RANDOM}};
  module_out = _RAND_2[32:0];
  _RAND_3 = {1{`RANDOM}};
  sign_in_0 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  sign_in_1 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  fN_in_0 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  fN_in_1 = _RAND_6[31:0];
  _RAND_7 = {2{`RANDOM}};
  recFN_from_fN_in_0 = _RAND_7[32:0];
  _RAND_8 = {2{`RANDOM}};
  recFN_from_fN_in_1 = _RAND_8[32:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AddRawFN(
  input         io_subOp,
  input         io_a_isNaN,
  input         io_a_isInf,
  input         io_a_isZero,
  input         io_a_sign,
  input  [9:0]  io_a_sExp,
  input  [24:0] io_a_sig,
  input         io_b_isNaN,
  input         io_b_isInf,
  input         io_b_isZero,
  input         io_b_sign,
  input  [9:0]  io_b_sExp,
  input  [24:0] io_b_sig,
  input  [2:0]  io_roundingMode,
  output        io_invalidExc,
  output        io_rawOut_isNaN,
  output        io_rawOut_isInf,
  output        io_rawOut_isZero,
  output        io_rawOut_sign,
  output [9:0]  io_rawOut_sExp,
  output [26:0] io_rawOut_sig
);
  wire  effSignB = io_b_sign ^ io_subOp; // @[AddRecFN.scala 60:30]
  wire  eqSigns = io_a_sign == effSignB; // @[AddRecFN.scala 61:29]
  wire  notEqSigns_signZero = io_roundingMode == 3'h2; // @[AddRecFN.scala 62:47]
  wire [9:0] sDiffExps = $signed(io_a_sExp) - $signed(io_b_sExp); // @[AddRecFN.scala 63:31]
  wire  _modNatAlignDist_T = $signed(sDiffExps) < 10'sh0; // @[AddRecFN.scala 64:41]
  wire [9:0] _modNatAlignDist_T_3 = $signed(io_b_sExp) - $signed(io_a_sExp); // @[AddRecFN.scala 64:58]
  wire [9:0] _modNatAlignDist_T_4 = $signed(sDiffExps) < 10'sh0 ? $signed(_modNatAlignDist_T_3) : $signed(sDiffExps); // @[AddRecFN.scala 64:30]
  wire [4:0] modNatAlignDist = _modNatAlignDist_T_4[4:0]; // @[AddRecFN.scala 64:81]
  wire [4:0] _isMaxAlign_T = sDiffExps[9:5]; // @[AddRecFN.scala 66:19]
  wire  _isMaxAlign_T_6 = $signed(_isMaxAlign_T) != -5'sh1 | sDiffExps[4:0] == 5'h0; // @[AddRecFN.scala 67:51]
  wire  isMaxAlign = $signed(_isMaxAlign_T) != 5'sh0 & _isMaxAlign_T_6; // @[AddRecFN.scala 66:45]
  wire [4:0] alignDist = isMaxAlign ? 5'h1f : modNatAlignDist; // @[AddRecFN.scala 68:24]
  wire  _closeSubMags_T = ~eqSigns; // @[AddRecFN.scala 69:24]
  wire  closeSubMags = ~eqSigns & ~isMaxAlign & modNatAlignDist <= 5'h1; // @[AddRecFN.scala 69:48]
  wire  _close_alignedSigA_T = 10'sh0 <= $signed(sDiffExps); // @[AddRecFN.scala 73:18]
  wire [26:0] _close_alignedSigA_T_3 = {io_a_sig, 2'h0}; // @[AddRecFN.scala 73:58]
  wire [26:0] _close_alignedSigA_T_4 = 10'sh0 <= $signed(sDiffExps) & sDiffExps[0] ? _close_alignedSigA_T_3 : 27'h0; // @[AddRecFN.scala 73:12]
  wire [25:0] _close_alignedSigA_T_9 = {io_a_sig, 1'h0}; // @[AddRecFN.scala 74:58]
  wire [25:0] _close_alignedSigA_T_10 = _close_alignedSigA_T & ~sDiffExps[0] ? _close_alignedSigA_T_9 : 26'h0; // @[AddRecFN.scala 74:12]
  wire [26:0] _GEN_0 = {{1'd0}, _close_alignedSigA_T_10}; // @[AddRecFN.scala 73:68]
  wire [26:0] _close_alignedSigA_T_11 = _close_alignedSigA_T_4 | _GEN_0; // @[AddRecFN.scala 73:68]
  wire [24:0] _close_alignedSigA_T_13 = _modNatAlignDist_T ? io_a_sig : 25'h0; // @[AddRecFN.scala 75:12]
  wire [26:0] _GEN_1 = {{2'd0}, _close_alignedSigA_T_13}; // @[AddRecFN.scala 74:68]
  wire [26:0] _close_sSigSum_T = _close_alignedSigA_T_11 | _GEN_1; // @[AddRecFN.scala 76:43]
  wire [25:0] _close_sSigSum_T_2 = {io_b_sig, 1'h0}; // @[AddRecFN.scala 76:66]
  wire [26:0] _GEN_2 = {{1{_close_sSigSum_T_2[25]}},_close_sSigSum_T_2}; // @[AddRecFN.scala 76:50]
  wire [26:0] close_sSigSum = $signed(_close_sSigSum_T) - $signed(_GEN_2); // @[AddRecFN.scala 76:50]
  wire  _close_sigSum_T = $signed(close_sSigSum) < 27'sh0; // @[AddRecFN.scala 77:42]
  wire [26:0] _close_sigSum_T_3 = 27'sh0 - $signed(close_sSigSum); // @[AddRecFN.scala 77:49]
  wire [26:0] _close_sigSum_T_4 = $signed(close_sSigSum) < 27'sh0 ? $signed(_close_sigSum_T_3) : $signed(close_sSigSum); // @[AddRecFN.scala 77:27]
  wire [25:0] close_sigSum = _close_sigSum_T_4[25:0]; // @[AddRecFN.scala 77:79]
  wire  close_reduced2SigSum_reducedVec_0 = |close_sigSum[1:0]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_1 = |close_sigSum[3:2]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_2 = |close_sigSum[5:4]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_3 = |close_sigSum[7:6]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_4 = |close_sigSum[9:8]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_5 = |close_sigSum[11:10]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_6 = |close_sigSum[13:12]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_7 = |close_sigSum[15:14]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_8 = |close_sigSum[17:16]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_9 = |close_sigSum[19:18]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_10 = |close_sigSum[21:20]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_11 = |close_sigSum[23:22]; // @[primitives.scala 104:54]
  wire  close_reduced2SigSum_reducedVec_12 = |close_sigSum[25:24]; // @[primitives.scala 107:57]
  wire [5:0] close_reduced2SigSum_lo = {close_reduced2SigSum_reducedVec_5,close_reduced2SigSum_reducedVec_4,
    close_reduced2SigSum_reducedVec_3,close_reduced2SigSum_reducedVec_2,close_reduced2SigSum_reducedVec_1,
    close_reduced2SigSum_reducedVec_0}; // @[primitives.scala 108:20]
  wire [12:0] close_reduced2SigSum = {close_reduced2SigSum_reducedVec_12,close_reduced2SigSum_reducedVec_11,
    close_reduced2SigSum_reducedVec_10,close_reduced2SigSum_reducedVec_9,close_reduced2SigSum_reducedVec_8,
    close_reduced2SigSum_reducedVec_7,close_reduced2SigSum_reducedVec_6,close_reduced2SigSum_lo}; // @[primitives.scala 108:20]
  wire [3:0] _close_normDistReduced2_T_13 = close_reduced2SigSum[1] ? 4'hb : 4'hc; // @[Mux.scala 47:69]
  wire [3:0] _close_normDistReduced2_T_14 = close_reduced2SigSum[2] ? 4'ha : _close_normDistReduced2_T_13; // @[Mux.scala 47:69]
  wire [3:0] _close_normDistReduced2_T_15 = close_reduced2SigSum[3] ? 4'h9 : _close_normDistReduced2_T_14; // @[Mux.scala 47:69]
  wire [3:0] _close_normDistReduced2_T_16 = close_reduced2SigSum[4] ? 4'h8 : _close_normDistReduced2_T_15; // @[Mux.scala 47:69]
  wire [3:0] _close_normDistReduced2_T_17 = close_reduced2SigSum[5] ? 4'h7 : _close_normDistReduced2_T_16; // @[Mux.scala 47:69]
  wire [3:0] _close_normDistReduced2_T_18 = close_reduced2SigSum[6] ? 4'h6 : _close_normDistReduced2_T_17; // @[Mux.scala 47:69]
  wire [3:0] _close_normDistReduced2_T_19 = close_reduced2SigSum[7] ? 4'h5 : _close_normDistReduced2_T_18; // @[Mux.scala 47:69]
  wire [3:0] _close_normDistReduced2_T_20 = close_reduced2SigSum[8] ? 4'h4 : _close_normDistReduced2_T_19; // @[Mux.scala 47:69]
  wire [3:0] _close_normDistReduced2_T_21 = close_reduced2SigSum[9] ? 4'h3 : _close_normDistReduced2_T_20; // @[Mux.scala 47:69]
  wire [3:0] _close_normDistReduced2_T_22 = close_reduced2SigSum[10] ? 4'h2 : _close_normDistReduced2_T_21; // @[Mux.scala 47:69]
  wire [3:0] _close_normDistReduced2_T_23 = close_reduced2SigSum[11] ? 4'h1 : _close_normDistReduced2_T_22; // @[Mux.scala 47:69]
  wire [3:0] close_normDistReduced2 = close_reduced2SigSum[12] ? 4'h0 : _close_normDistReduced2_T_23; // @[Mux.scala 47:69]
  wire [4:0] close_nearNormDist = {close_normDistReduced2, 1'h0}; // @[AddRecFN.scala 81:53]
  wire [56:0] _GEN_7 = {{31'd0}, close_sigSum}; // @[AddRecFN.scala 82:38]
  wire [56:0] _close_sigOut_T = _GEN_7 << close_nearNormDist; // @[AddRecFN.scala 82:38]
  wire [57:0] _close_sigOut_T_1 = {_close_sigOut_T, 1'h0}; // @[AddRecFN.scala 82:59]
  wire [26:0] close_sigOut = _close_sigOut_T_1[26:0]; // @[AddRecFN.scala 82:63]
  wire  close_totalCancellation = ~(|close_sigOut[26:25]); // @[AddRecFN.scala 83:35]
  wire  close_notTotalCancellation_signOut = io_a_sign ^ _close_sigSum_T; // @[AddRecFN.scala 84:56]
  wire  far_signOut = _modNatAlignDist_T ? effSignB : io_a_sign; // @[AddRecFN.scala 87:26]
  wire [24:0] _far_sigLarger_T_1 = _modNatAlignDist_T ? io_b_sig : io_a_sig; // @[AddRecFN.scala 88:29]
  wire [23:0] far_sigLarger = _far_sigLarger_T_1[23:0]; // @[AddRecFN.scala 88:66]
  wire [24:0] _far_sigSmaller_T_1 = _modNatAlignDist_T ? io_a_sig : io_b_sig; // @[AddRecFN.scala 89:29]
  wire [23:0] far_sigSmaller = _far_sigSmaller_T_1[23:0]; // @[AddRecFN.scala 89:66]
  wire [28:0] _far_mainAlignedSigSmaller_T = {far_sigSmaller, 5'h0}; // @[AddRecFN.scala 90:52]
  wire [28:0] far_mainAlignedSigSmaller = _far_mainAlignedSigSmaller_T >> alignDist; // @[AddRecFN.scala 90:56]
  wire [25:0] _far_reduced4SigSmaller_T = {far_sigSmaller, 2'h0}; // @[AddRecFN.scala 91:60]
  wire  far_reduced4SigSmaller_reducedVec_0 = |_far_reduced4SigSmaller_T[3:0]; // @[primitives.scala 121:54]
  wire  far_reduced4SigSmaller_reducedVec_1 = |_far_reduced4SigSmaller_T[7:4]; // @[primitives.scala 121:54]
  wire  far_reduced4SigSmaller_reducedVec_2 = |_far_reduced4SigSmaller_T[11:8]; // @[primitives.scala 121:54]
  wire  far_reduced4SigSmaller_reducedVec_3 = |_far_reduced4SigSmaller_T[15:12]; // @[primitives.scala 121:54]
  wire  far_reduced4SigSmaller_reducedVec_4 = |_far_reduced4SigSmaller_T[19:16]; // @[primitives.scala 121:54]
  wire  far_reduced4SigSmaller_reducedVec_5 = |_far_reduced4SigSmaller_T[23:20]; // @[primitives.scala 121:54]
  wire  far_reduced4SigSmaller_reducedVec_6 = |_far_reduced4SigSmaller_T[25:24]; // @[primitives.scala 124:57]
  wire [6:0] far_reduced4SigSmaller = {far_reduced4SigSmaller_reducedVec_6,far_reduced4SigSmaller_reducedVec_5,
    far_reduced4SigSmaller_reducedVec_4,far_reduced4SigSmaller_reducedVec_3,far_reduced4SigSmaller_reducedVec_2,
    far_reduced4SigSmaller_reducedVec_1,far_reduced4SigSmaller_reducedVec_0}; // @[primitives.scala 125:20]
  wire [8:0] far_roundExtraMask_shift = 9'sh100 >>> alignDist[4:2]; // @[primitives.scala 77:58]
  wire [6:0] far_roundExtraMask = {far_roundExtraMask_shift[1],far_roundExtraMask_shift[2],far_roundExtraMask_shift[3],
    far_roundExtraMask_shift[4],far_roundExtraMask_shift[5],far_roundExtraMask_shift[6],far_roundExtraMask_shift[7]}; // @[Cat.scala 30:58]
  wire [6:0] _far_alignedSigSmaller_T_3 = far_reduced4SigSmaller & far_roundExtraMask; // @[AddRecFN.scala 95:76]
  wire  _far_alignedSigSmaller_T_5 = |far_mainAlignedSigSmaller[2:0] | |_far_alignedSigSmaller_T_3; // @[AddRecFN.scala 95:49]
  wire [26:0] far_alignedSigSmaller = {far_mainAlignedSigSmaller[28:3],_far_alignedSigSmaller_T_5}; // @[Cat.scala 30:58]
  wire [26:0] _far_negAlignedSigSmaller_T = ~far_alignedSigSmaller; // @[AddRecFN.scala 97:62]
  wire [27:0] _far_negAlignedSigSmaller_T_1 = {1'h1,_far_negAlignedSigSmaller_T}; // @[Cat.scala 30:58]
  wire [27:0] far_negAlignedSigSmaller = _closeSubMags_T ? _far_negAlignedSigSmaller_T_1 : {{1'd0},
    far_alignedSigSmaller}; // @[AddRecFN.scala 97:39]
  wire [26:0] _far_sigSum_T = {far_sigLarger, 3'h0}; // @[AddRecFN.scala 98:36]
  wire [27:0] _GEN_3 = {{1'd0}, _far_sigSum_T}; // @[AddRecFN.scala 98:41]
  wire [27:0] _far_sigSum_T_2 = _GEN_3 + far_negAlignedSigSmaller; // @[AddRecFN.scala 98:41]
  wire [27:0] _GEN_4 = {{27'd0}, _closeSubMags_T}; // @[AddRecFN.scala 98:68]
  wire [27:0] far_sigSum = _far_sigSum_T_2 + _GEN_4; // @[AddRecFN.scala 98:68]
  wire [26:0] _GEN_5 = {{26'd0}, far_sigSum[0]}; // @[AddRecFN.scala 99:67]
  wire [26:0] _far_sigOut_T_2 = far_sigSum[27:1] | _GEN_5; // @[AddRecFN.scala 99:67]
  wire [27:0] _far_sigOut_T_3 = _closeSubMags_T ? far_sigSum : {{1'd0}, _far_sigOut_T_2}; // @[AddRecFN.scala 99:25]
  wire [26:0] far_sigOut = _far_sigOut_T_3[26:0]; // @[AddRecFN.scala 99:83]
  wire  notSigNaN_invalidExc = io_a_isInf & io_b_isInf & _closeSubMags_T; // @[AddRecFN.scala 102:57]
  wire  notNaN_isInfOut = io_a_isInf | io_b_isInf; // @[AddRecFN.scala 103:38]
  wire  addZeros = io_a_isZero & io_b_isZero; // @[AddRecFN.scala 104:32]
  wire  notNaN_specialCase = notNaN_isInfOut | addZeros; // @[AddRecFN.scala 105:46]
  wire  notNaN_isZeroOut = addZeros | ~notNaN_isInfOut & closeSubMags & close_totalCancellation; // @[AddRecFN.scala 106:37]
  wire  _notNaN_signOut_T_1 = io_a_isInf & io_a_sign; // @[AddRecFN.scala 109:39]
  wire  _notNaN_signOut_T_2 = eqSigns & io_a_sign | _notNaN_signOut_T_1; // @[AddRecFN.scala 108:63]
  wire  _notNaN_signOut_T_3 = io_b_isInf & effSignB; // @[AddRecFN.scala 110:39]
  wire  _notNaN_signOut_T_4 = _notNaN_signOut_T_2 | _notNaN_signOut_T_3; // @[AddRecFN.scala 109:63]
  wire  _notNaN_signOut_T_7 = notNaN_isZeroOut & _closeSubMags_T & notEqSigns_signZero; // @[AddRecFN.scala 111:39]
  wire  _notNaN_signOut_T_8 = _notNaN_signOut_T_4 | _notNaN_signOut_T_7; // @[AddRecFN.scala 110:63]
  wire  _notNaN_signOut_T_9 = ~notNaN_specialCase; // @[AddRecFN.scala 112:10]
  wire  _notNaN_signOut_T_12 = ~notNaN_specialCase & closeSubMags & ~close_totalCancellation; // @[AddRecFN.scala 112:46]
  wire  _notNaN_signOut_T_13 = _notNaN_signOut_T_12 & close_notTotalCancellation_signOut; // @[AddRecFN.scala 113:38]
  wire  _notNaN_signOut_T_14 = _notNaN_signOut_T_8 | _notNaN_signOut_T_13; // @[AddRecFN.scala 111:63]
  wire  _notNaN_signOut_T_18 = _notNaN_signOut_T_9 & ~closeSubMags & far_signOut; // @[AddRecFN.scala 114:47]
  wire [9:0] _common_sExpOut_T_2 = closeSubMags | _modNatAlignDist_T ? $signed(io_b_sExp) : $signed(io_a_sExp); // @[AddRecFN.scala 116:13]
  wire [4:0] _common_sExpOut_T_3 = closeSubMags ? close_nearNormDist : {{4'd0}, _closeSubMags_T}; // @[AddRecFN.scala 117:18]
  wire [5:0] _common_sExpOut_T_4 = {1'b0,$signed(_common_sExpOut_T_3)}; // @[AddRecFN.scala 117:66]
  wire [9:0] _GEN_6 = {{4{_common_sExpOut_T_4[5]}},_common_sExpOut_T_4}; // @[AddRecFN.scala 117:13]
  wire  _io_invalidExc_T_2 = io_a_isNaN & ~io_a_sig[22]; // @[common.scala 84:46]
  wire  _io_invalidExc_T_5 = io_b_isNaN & ~io_b_sig[22]; // @[common.scala 84:46]
  assign io_invalidExc = _io_invalidExc_T_2 | _io_invalidExc_T_5 | notSigNaN_invalidExc; // @[AddRecFN.scala 121:71]
  assign io_rawOut_isNaN = io_a_isNaN | io_b_isNaN; // @[AddRecFN.scala 125:35]
  assign io_rawOut_isInf = io_a_isInf | io_b_isInf; // @[AddRecFN.scala 103:38]
  assign io_rawOut_isZero = addZeros | ~notNaN_isInfOut & closeSubMags & close_totalCancellation; // @[AddRecFN.scala 106:37]
  assign io_rawOut_sign = _notNaN_signOut_T_14 | _notNaN_signOut_T_18; // @[AddRecFN.scala 113:77]
  assign io_rawOut_sExp = $signed(_common_sExpOut_T_2) - $signed(_GEN_6); // @[AddRecFN.scala 117:13]
  assign io_rawOut_sig = closeSubMags ? close_sigOut : far_sigOut; // @[AddRecFN.scala 118:28]
endmodule
module AddRecFN(
  input         io_subOp,
  input  [32:0] io_a,
  input  [32:0] io_b,
  input  [2:0]  io_roundingMode,
  output [32:0] io_out
);
  wire  addRawFN__io_subOp; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_a_isNaN; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_a_isInf; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_a_isZero; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_a_sign; // @[AddRecFN.scala 147:26]
  wire [9:0] addRawFN__io_a_sExp; // @[AddRecFN.scala 147:26]
  wire [24:0] addRawFN__io_a_sig; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_b_isNaN; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_b_isInf; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_b_isZero; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_b_sign; // @[AddRecFN.scala 147:26]
  wire [9:0] addRawFN__io_b_sExp; // @[AddRecFN.scala 147:26]
  wire [24:0] addRawFN__io_b_sig; // @[AddRecFN.scala 147:26]
  wire [2:0] addRawFN__io_roundingMode; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_invalidExc; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_rawOut_isNaN; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_rawOut_isInf; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_rawOut_isZero; // @[AddRecFN.scala 147:26]
  wire  addRawFN__io_rawOut_sign; // @[AddRecFN.scala 147:26]
  wire [9:0] addRawFN__io_rawOut_sExp; // @[AddRecFN.scala 147:26]
  wire [26:0] addRawFN__io_rawOut_sig; // @[AddRecFN.scala 147:26]
  wire  roundRawFNToRecFN_io_invalidExc; // @[AddRecFN.scala 157:15]
  wire  roundRawFNToRecFN_io_in_isNaN; // @[AddRecFN.scala 157:15]
  wire  roundRawFNToRecFN_io_in_isInf; // @[AddRecFN.scala 157:15]
  wire  roundRawFNToRecFN_io_in_isZero; // @[AddRecFN.scala 157:15]
  wire  roundRawFNToRecFN_io_in_sign; // @[AddRecFN.scala 157:15]
  wire [9:0] roundRawFNToRecFN_io_in_sExp; // @[AddRecFN.scala 157:15]
  wire [26:0] roundRawFNToRecFN_io_in_sig; // @[AddRecFN.scala 157:15]
  wire [2:0] roundRawFNToRecFN_io_roundingMode; // @[AddRecFN.scala 157:15]
  wire [32:0] roundRawFNToRecFN_io_out; // @[AddRecFN.scala 157:15]
  wire [8:0] addRawFN_io_a_exp = io_a[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  addRawFN_io_a_isZero = addRawFN_io_a_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  addRawFN_io_a_isSpecial = addRawFN_io_a_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  _addRawFN_io_a_out_sig_T = ~addRawFN_io_a_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [1:0] addRawFN_io_a_out_sig_hi = {1'h0,_addRawFN_io_a_out_sig_T}; // @[Cat.scala 30:58]
  wire [8:0] addRawFN_io_b_exp = io_b[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  addRawFN_io_b_isZero = addRawFN_io_b_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  addRawFN_io_b_isSpecial = addRawFN_io_b_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  _addRawFN_io_b_out_sig_T = ~addRawFN_io_b_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [1:0] addRawFN_io_b_out_sig_hi = {1'h0,_addRawFN_io_b_out_sig_T}; // @[Cat.scala 30:58]
  AddRawFN addRawFN_ ( // @[AddRecFN.scala 147:26]
    .io_subOp(addRawFN__io_subOp),
    .io_a_isNaN(addRawFN__io_a_isNaN),
    .io_a_isInf(addRawFN__io_a_isInf),
    .io_a_isZero(addRawFN__io_a_isZero),
    .io_a_sign(addRawFN__io_a_sign),
    .io_a_sExp(addRawFN__io_a_sExp),
    .io_a_sig(addRawFN__io_a_sig),
    .io_b_isNaN(addRawFN__io_b_isNaN),
    .io_b_isInf(addRawFN__io_b_isInf),
    .io_b_isZero(addRawFN__io_b_isZero),
    .io_b_sign(addRawFN__io_b_sign),
    .io_b_sExp(addRawFN__io_b_sExp),
    .io_b_sig(addRawFN__io_b_sig),
    .io_roundingMode(addRawFN__io_roundingMode),
    .io_invalidExc(addRawFN__io_invalidExc),
    .io_rawOut_isNaN(addRawFN__io_rawOut_isNaN),
    .io_rawOut_isInf(addRawFN__io_rawOut_isInf),
    .io_rawOut_isZero(addRawFN__io_rawOut_isZero),
    .io_rawOut_sign(addRawFN__io_rawOut_sign),
    .io_rawOut_sExp(addRawFN__io_rawOut_sExp),
    .io_rawOut_sig(addRawFN__io_rawOut_sig)
  );
  RoundRawFNToRecFN roundRawFNToRecFN ( // @[AddRecFN.scala 157:15]
    .io_invalidExc(roundRawFNToRecFN_io_invalidExc),
    .io_in_isNaN(roundRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(roundRawFNToRecFN_io_in_isInf),
    .io_in_isZero(roundRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundRawFNToRecFN_io_in_sig),
    .io_roundingMode(roundRawFNToRecFN_io_roundingMode),
    .io_out(roundRawFNToRecFN_io_out)
  );
  assign io_out = roundRawFNToRecFN_io_out; // @[AddRecFN.scala 163:23]
  assign addRawFN__io_subOp = io_subOp; // @[AddRecFN.scala 149:30]
  assign addRawFN__io_a_isNaN = addRawFN_io_a_isSpecial & addRawFN_io_a_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  assign addRawFN__io_a_isInf = addRawFN_io_a_isSpecial & ~addRawFN_io_a_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  assign addRawFN__io_a_isZero = addRawFN_io_a_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign addRawFN__io_a_sign = io_a[32]; // @[rawFloatFromRecFN.scala 58:25]
  assign addRawFN__io_a_sExp = {1'b0,$signed(addRawFN_io_a_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  assign addRawFN__io_a_sig = {addRawFN_io_a_out_sig_hi,io_a[22:0]}; // @[Cat.scala 30:58]
  assign addRawFN__io_b_isNaN = addRawFN_io_b_isSpecial & addRawFN_io_b_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  assign addRawFN__io_b_isInf = addRawFN_io_b_isSpecial & ~addRawFN_io_b_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  assign addRawFN__io_b_isZero = addRawFN_io_b_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign addRawFN__io_b_sign = io_b[32]; // @[rawFloatFromRecFN.scala 58:25]
  assign addRawFN__io_b_sExp = {1'b0,$signed(addRawFN_io_b_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  assign addRawFN__io_b_sig = {addRawFN_io_b_out_sig_hi,io_b[22:0]}; // @[Cat.scala 30:58]
  assign addRawFN__io_roundingMode = io_roundingMode; // @[AddRecFN.scala 152:30]
  assign roundRawFNToRecFN_io_invalidExc = addRawFN__io_invalidExc; // @[AddRecFN.scala 158:39]
  assign roundRawFNToRecFN_io_in_isNaN = addRawFN__io_rawOut_isNaN; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_in_isInf = addRawFN__io_rawOut_isInf; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_in_isZero = addRawFN__io_rawOut_isZero; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_in_sign = addRawFN__io_rawOut_sign; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_in_sExp = addRawFN__io_rawOut_sExp; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_in_sig = addRawFN__io_rawOut_sig; // @[AddRecFN.scala 160:39]
  assign roundRawFNToRecFN_io_roundingMode = io_roundingMode; // @[AddRecFN.scala 161:39]
endmodule
module AddSubPE(
  input         clock,
  input         reset,
  input         io_use_int,
  input         io_op,
  input  [2:0]  io_rounding,
  input  [31:0] io_in_0,
  input  [31:0] io_in_1,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  wire  addRecFN_io_subOp; // @[AddSubPE.scala 57:26]
  wire [32:0] addRecFN_io_a; // @[AddSubPE.scala 57:26]
  wire [32:0] addRecFN_io_b; // @[AddSubPE.scala 57:26]
  wire [2:0] addRecFN_io_roundingMode; // @[AddSubPE.scala 57:26]
  wire [32:0] addRecFN_io_out; // @[AddSubPE.scala 57:26]
  reg [2:0] rounding; // @[AddSubPE.scala 22:26]
  reg  op; // @[AddSubPE.scala 26:27]
  reg  use_int; // @[AddSubPE.scala 28:27]
  reg [32:0] module_out; // @[AddSubPE.scala 30:27]
  reg [31:0] sign_in_0; // @[AddSubPE.scala 34:29]
  reg [31:0] sign_in_1; // @[AddSubPE.scala 35:29]
  wire [31:0] _module_out_T_3 = $signed(sign_in_0) - $signed(sign_in_1); // @[AddSubPE.scala 39:51]
  wire [31:0] _module_out_T_7 = $signed(sign_in_0) + $signed(sign_in_1); // @[AddSubPE.scala 41:51]
  wire [31:0] _GEN_0 = op ? _module_out_T_3 : _module_out_T_7; // @[AddSubPE.scala 38:17 39:18 41:18]
  reg [31:0] fN_in_0; // @[AddSubPE.scala 49:27]
  reg [31:0] fN_in_1; // @[AddSubPE.scala 50:27]
  wire  recFN_from_fN_in_0_rawIn_sign = fN_in_0[31]; // @[rawFloatFromFN.scala 46:22]
  wire [7:0] recFN_from_fN_in_0_rawIn_expIn = fN_in_0[30:23]; // @[rawFloatFromFN.scala 47:23]
  wire [22:0] recFN_from_fN_in_0_rawIn_fractIn = fN_in_0[22:0]; // @[rawFloatFromFN.scala 48:25]
  wire  recFN_from_fN_in_0_rawIn_isZeroExpIn = recFN_from_fN_in_0_rawIn_expIn == 8'h0; // @[rawFloatFromFN.scala 50:34]
  wire  recFN_from_fN_in_0_rawIn_isZeroFractIn = recFN_from_fN_in_0_rawIn_fractIn == 23'h0; // @[rawFloatFromFN.scala 51:38]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_23 = recFN_from_fN_in_0_rawIn_fractIn[1] ? 5'h15 : 5'h16; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_24 = recFN_from_fN_in_0_rawIn_fractIn[2] ? 5'h14 :
    _recFN_from_fN_in_0_rawIn_normDist_T_23; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_25 = recFN_from_fN_in_0_rawIn_fractIn[3] ? 5'h13 :
    _recFN_from_fN_in_0_rawIn_normDist_T_24; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_26 = recFN_from_fN_in_0_rawIn_fractIn[4] ? 5'h12 :
    _recFN_from_fN_in_0_rawIn_normDist_T_25; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_27 = recFN_from_fN_in_0_rawIn_fractIn[5] ? 5'h11 :
    _recFN_from_fN_in_0_rawIn_normDist_T_26; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_28 = recFN_from_fN_in_0_rawIn_fractIn[6] ? 5'h10 :
    _recFN_from_fN_in_0_rawIn_normDist_T_27; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_29 = recFN_from_fN_in_0_rawIn_fractIn[7] ? 5'hf :
    _recFN_from_fN_in_0_rawIn_normDist_T_28; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_30 = recFN_from_fN_in_0_rawIn_fractIn[8] ? 5'he :
    _recFN_from_fN_in_0_rawIn_normDist_T_29; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_31 = recFN_from_fN_in_0_rawIn_fractIn[9] ? 5'hd :
    _recFN_from_fN_in_0_rawIn_normDist_T_30; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_32 = recFN_from_fN_in_0_rawIn_fractIn[10] ? 5'hc :
    _recFN_from_fN_in_0_rawIn_normDist_T_31; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_33 = recFN_from_fN_in_0_rawIn_fractIn[11] ? 5'hb :
    _recFN_from_fN_in_0_rawIn_normDist_T_32; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_34 = recFN_from_fN_in_0_rawIn_fractIn[12] ? 5'ha :
    _recFN_from_fN_in_0_rawIn_normDist_T_33; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_35 = recFN_from_fN_in_0_rawIn_fractIn[13] ? 5'h9 :
    _recFN_from_fN_in_0_rawIn_normDist_T_34; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_36 = recFN_from_fN_in_0_rawIn_fractIn[14] ? 5'h8 :
    _recFN_from_fN_in_0_rawIn_normDist_T_35; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_37 = recFN_from_fN_in_0_rawIn_fractIn[15] ? 5'h7 :
    _recFN_from_fN_in_0_rawIn_normDist_T_36; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_38 = recFN_from_fN_in_0_rawIn_fractIn[16] ? 5'h6 :
    _recFN_from_fN_in_0_rawIn_normDist_T_37; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_39 = recFN_from_fN_in_0_rawIn_fractIn[17] ? 5'h5 :
    _recFN_from_fN_in_0_rawIn_normDist_T_38; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_40 = recFN_from_fN_in_0_rawIn_fractIn[18] ? 5'h4 :
    _recFN_from_fN_in_0_rawIn_normDist_T_39; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_41 = recFN_from_fN_in_0_rawIn_fractIn[19] ? 5'h3 :
    _recFN_from_fN_in_0_rawIn_normDist_T_40; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_42 = recFN_from_fN_in_0_rawIn_fractIn[20] ? 5'h2 :
    _recFN_from_fN_in_0_rawIn_normDist_T_41; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_0_rawIn_normDist_T_43 = recFN_from_fN_in_0_rawIn_fractIn[21] ? 5'h1 :
    _recFN_from_fN_in_0_rawIn_normDist_T_42; // @[Mux.scala 47:69]
  wire [4:0] recFN_from_fN_in_0_rawIn_normDist = recFN_from_fN_in_0_rawIn_fractIn[22] ? 5'h0 :
    _recFN_from_fN_in_0_rawIn_normDist_T_43; // @[Mux.scala 47:69]
  wire [53:0] _GEN_11 = {{31'd0}, recFN_from_fN_in_0_rawIn_fractIn}; // @[rawFloatFromFN.scala 54:36]
  wire [53:0] _recFN_from_fN_in_0_rawIn_subnormFract_T = _GEN_11 << recFN_from_fN_in_0_rawIn_normDist; // @[rawFloatFromFN.scala 54:36]
  wire [22:0] recFN_from_fN_in_0_rawIn_subnormFract = {_recFN_from_fN_in_0_rawIn_subnormFract_T[21:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [8:0] _GEN_3 = {{4'd0}, recFN_from_fN_in_0_rawIn_normDist}; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _recFN_from_fN_in_0_rawIn_adjustedExp_T = _GEN_3 ^ 9'h1ff; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _recFN_from_fN_in_0_rawIn_adjustedExp_T_1 = recFN_from_fN_in_0_rawIn_isZeroExpIn ?
    _recFN_from_fN_in_0_rawIn_adjustedExp_T : {{1'd0}, recFN_from_fN_in_0_rawIn_expIn}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _recFN_from_fN_in_0_rawIn_adjustedExp_T_2 = recFN_from_fN_in_0_rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [7:0] _GEN_4 = {{6'd0}, _recFN_from_fN_in_0_rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 60:22]
  wire [7:0] _recFN_from_fN_in_0_rawIn_adjustedExp_T_3 = 8'h80 | _GEN_4; // @[rawFloatFromFN.scala 60:22]
  wire [8:0] _GEN_5 = {{1'd0}, _recFN_from_fN_in_0_rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 59:15]
  wire [8:0] recFN_from_fN_in_0_rawIn_adjustedExp = _recFN_from_fN_in_0_rawIn_adjustedExp_T_1 + _GEN_5; // @[rawFloatFromFN.scala 59:15]
  wire  recFN_from_fN_in_0_rawIn_isZero = recFN_from_fN_in_0_rawIn_isZeroExpIn & recFN_from_fN_in_0_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 62:34]
  wire  recFN_from_fN_in_0_rawIn_isSpecial = recFN_from_fN_in_0_rawIn_adjustedExp[8:7] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  recFN_from_fN_in_0_rawIn__isNaN = recFN_from_fN_in_0_rawIn_isSpecial & ~recFN_from_fN_in_0_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 66:33]
  wire [9:0] recFN_from_fN_in_0_rawIn__sExp = {1'b0,$signed(recFN_from_fN_in_0_rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 70:48]
  wire  _recFN_from_fN_in_0_rawIn_out_sig_T = ~recFN_from_fN_in_0_rawIn_isZero; // @[rawFloatFromFN.scala 72:29]
  wire [22:0] _recFN_from_fN_in_0_rawIn_out_sig_T_1 = recFN_from_fN_in_0_rawIn_isZeroExpIn ?
    recFN_from_fN_in_0_rawIn_subnormFract : recFN_from_fN_in_0_rawIn_fractIn; // @[rawFloatFromFN.scala 72:42]
  wire [24:0] recFN_from_fN_in_0_rawIn__sig = {1'h0,_recFN_from_fN_in_0_rawIn_out_sig_T,
    _recFN_from_fN_in_0_rawIn_out_sig_T_1}; // @[Cat.scala 30:58]
  wire [2:0] _recFN_from_fN_in_0_T_1 = recFN_from_fN_in_0_rawIn_isZero ? 3'h0 : recFN_from_fN_in_0_rawIn__sExp[8:6]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_6 = {{2'd0}, recFN_from_fN_in_0_rawIn__isNaN}; // @[recFNFromFN.scala 48:79]
  wire [2:0] _recFN_from_fN_in_0_T_3 = _recFN_from_fN_in_0_T_1 | _GEN_6; // @[recFNFromFN.scala 48:79]
  wire [28:0] recFN_from_fN_in_0_lo = {recFN_from_fN_in_0_rawIn__sExp[5:0],recFN_from_fN_in_0_rawIn__sig[22:0]}; // @[Cat.scala 30:58]
  wire [3:0] recFN_from_fN_in_0_hi = {recFN_from_fN_in_0_rawIn_sign,_recFN_from_fN_in_0_T_3}; // @[Cat.scala 30:58]
  reg [32:0] recFN_from_fN_in_0; // @[AddSubPE.scala 53:37]
  wire  recFN_from_fN_in_1_rawIn_sign = fN_in_1[31]; // @[rawFloatFromFN.scala 46:22]
  wire [7:0] recFN_from_fN_in_1_rawIn_expIn = fN_in_1[30:23]; // @[rawFloatFromFN.scala 47:23]
  wire [22:0] recFN_from_fN_in_1_rawIn_fractIn = fN_in_1[22:0]; // @[rawFloatFromFN.scala 48:25]
  wire  recFN_from_fN_in_1_rawIn_isZeroExpIn = recFN_from_fN_in_1_rawIn_expIn == 8'h0; // @[rawFloatFromFN.scala 50:34]
  wire  recFN_from_fN_in_1_rawIn_isZeroFractIn = recFN_from_fN_in_1_rawIn_fractIn == 23'h0; // @[rawFloatFromFN.scala 51:38]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_23 = recFN_from_fN_in_1_rawIn_fractIn[1] ? 5'h15 : 5'h16; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_24 = recFN_from_fN_in_1_rawIn_fractIn[2] ? 5'h14 :
    _recFN_from_fN_in_1_rawIn_normDist_T_23; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_25 = recFN_from_fN_in_1_rawIn_fractIn[3] ? 5'h13 :
    _recFN_from_fN_in_1_rawIn_normDist_T_24; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_26 = recFN_from_fN_in_1_rawIn_fractIn[4] ? 5'h12 :
    _recFN_from_fN_in_1_rawIn_normDist_T_25; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_27 = recFN_from_fN_in_1_rawIn_fractIn[5] ? 5'h11 :
    _recFN_from_fN_in_1_rawIn_normDist_T_26; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_28 = recFN_from_fN_in_1_rawIn_fractIn[6] ? 5'h10 :
    _recFN_from_fN_in_1_rawIn_normDist_T_27; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_29 = recFN_from_fN_in_1_rawIn_fractIn[7] ? 5'hf :
    _recFN_from_fN_in_1_rawIn_normDist_T_28; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_30 = recFN_from_fN_in_1_rawIn_fractIn[8] ? 5'he :
    _recFN_from_fN_in_1_rawIn_normDist_T_29; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_31 = recFN_from_fN_in_1_rawIn_fractIn[9] ? 5'hd :
    _recFN_from_fN_in_1_rawIn_normDist_T_30; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_32 = recFN_from_fN_in_1_rawIn_fractIn[10] ? 5'hc :
    _recFN_from_fN_in_1_rawIn_normDist_T_31; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_33 = recFN_from_fN_in_1_rawIn_fractIn[11] ? 5'hb :
    _recFN_from_fN_in_1_rawIn_normDist_T_32; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_34 = recFN_from_fN_in_1_rawIn_fractIn[12] ? 5'ha :
    _recFN_from_fN_in_1_rawIn_normDist_T_33; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_35 = recFN_from_fN_in_1_rawIn_fractIn[13] ? 5'h9 :
    _recFN_from_fN_in_1_rawIn_normDist_T_34; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_36 = recFN_from_fN_in_1_rawIn_fractIn[14] ? 5'h8 :
    _recFN_from_fN_in_1_rawIn_normDist_T_35; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_37 = recFN_from_fN_in_1_rawIn_fractIn[15] ? 5'h7 :
    _recFN_from_fN_in_1_rawIn_normDist_T_36; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_38 = recFN_from_fN_in_1_rawIn_fractIn[16] ? 5'h6 :
    _recFN_from_fN_in_1_rawIn_normDist_T_37; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_39 = recFN_from_fN_in_1_rawIn_fractIn[17] ? 5'h5 :
    _recFN_from_fN_in_1_rawIn_normDist_T_38; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_40 = recFN_from_fN_in_1_rawIn_fractIn[18] ? 5'h4 :
    _recFN_from_fN_in_1_rawIn_normDist_T_39; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_41 = recFN_from_fN_in_1_rawIn_fractIn[19] ? 5'h3 :
    _recFN_from_fN_in_1_rawIn_normDist_T_40; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_42 = recFN_from_fN_in_1_rawIn_fractIn[20] ? 5'h2 :
    _recFN_from_fN_in_1_rawIn_normDist_T_41; // @[Mux.scala 47:69]
  wire [4:0] _recFN_from_fN_in_1_rawIn_normDist_T_43 = recFN_from_fN_in_1_rawIn_fractIn[21] ? 5'h1 :
    _recFN_from_fN_in_1_rawIn_normDist_T_42; // @[Mux.scala 47:69]
  wire [4:0] recFN_from_fN_in_1_rawIn_normDist = recFN_from_fN_in_1_rawIn_fractIn[22] ? 5'h0 :
    _recFN_from_fN_in_1_rawIn_normDist_T_43; // @[Mux.scala 47:69]
  wire [53:0] _GEN_12 = {{31'd0}, recFN_from_fN_in_1_rawIn_fractIn}; // @[rawFloatFromFN.scala 54:36]
  wire [53:0] _recFN_from_fN_in_1_rawIn_subnormFract_T = _GEN_12 << recFN_from_fN_in_1_rawIn_normDist; // @[rawFloatFromFN.scala 54:36]
  wire [22:0] recFN_from_fN_in_1_rawIn_subnormFract = {_recFN_from_fN_in_1_rawIn_subnormFract_T[21:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [8:0] _GEN_7 = {{4'd0}, recFN_from_fN_in_1_rawIn_normDist}; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _recFN_from_fN_in_1_rawIn_adjustedExp_T = _GEN_7 ^ 9'h1ff; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _recFN_from_fN_in_1_rawIn_adjustedExp_T_1 = recFN_from_fN_in_1_rawIn_isZeroExpIn ?
    _recFN_from_fN_in_1_rawIn_adjustedExp_T : {{1'd0}, recFN_from_fN_in_1_rawIn_expIn}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _recFN_from_fN_in_1_rawIn_adjustedExp_T_2 = recFN_from_fN_in_1_rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [7:0] _GEN_8 = {{6'd0}, _recFN_from_fN_in_1_rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 60:22]
  wire [7:0] _recFN_from_fN_in_1_rawIn_adjustedExp_T_3 = 8'h80 | _GEN_8; // @[rawFloatFromFN.scala 60:22]
  wire [8:0] _GEN_9 = {{1'd0}, _recFN_from_fN_in_1_rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 59:15]
  wire [8:0] recFN_from_fN_in_1_rawIn_adjustedExp = _recFN_from_fN_in_1_rawIn_adjustedExp_T_1 + _GEN_9; // @[rawFloatFromFN.scala 59:15]
  wire  recFN_from_fN_in_1_rawIn_isZero = recFN_from_fN_in_1_rawIn_isZeroExpIn & recFN_from_fN_in_1_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 62:34]
  wire  recFN_from_fN_in_1_rawIn_isSpecial = recFN_from_fN_in_1_rawIn_adjustedExp[8:7] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  recFN_from_fN_in_1_rawIn__isNaN = recFN_from_fN_in_1_rawIn_isSpecial & ~recFN_from_fN_in_1_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 66:33]
  wire [9:0] recFN_from_fN_in_1_rawIn__sExp = {1'b0,$signed(recFN_from_fN_in_1_rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 70:48]
  wire  _recFN_from_fN_in_1_rawIn_out_sig_T = ~recFN_from_fN_in_1_rawIn_isZero; // @[rawFloatFromFN.scala 72:29]
  wire [22:0] _recFN_from_fN_in_1_rawIn_out_sig_T_1 = recFN_from_fN_in_1_rawIn_isZeroExpIn ?
    recFN_from_fN_in_1_rawIn_subnormFract : recFN_from_fN_in_1_rawIn_fractIn; // @[rawFloatFromFN.scala 72:42]
  wire [24:0] recFN_from_fN_in_1_rawIn__sig = {1'h0,_recFN_from_fN_in_1_rawIn_out_sig_T,
    _recFN_from_fN_in_1_rawIn_out_sig_T_1}; // @[Cat.scala 30:58]
  wire [2:0] _recFN_from_fN_in_1_T_1 = recFN_from_fN_in_1_rawIn_isZero ? 3'h0 : recFN_from_fN_in_1_rawIn__sExp[8:6]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_10 = {{2'd0}, recFN_from_fN_in_1_rawIn__isNaN}; // @[recFNFromFN.scala 48:79]
  wire [2:0] _recFN_from_fN_in_1_T_3 = _recFN_from_fN_in_1_T_1 | _GEN_10; // @[recFNFromFN.scala 48:79]
  wire [28:0] recFN_from_fN_in_1_lo = {recFN_from_fN_in_1_rawIn__sExp[5:0],recFN_from_fN_in_1_rawIn__sig[22:0]}; // @[Cat.scala 30:58]
  wire [3:0] recFN_from_fN_in_1_hi = {recFN_from_fN_in_1_rawIn_sign,_recFN_from_fN_in_1_T_3}; // @[Cat.scala 30:58]
  reg [32:0] recFN_from_fN_in_1; // @[AddSubPE.scala 54:37]
  wire [8:0] io_out_rawIn_exp = addRecFN_io_out[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  io_out_rawIn_isZero = io_out_rawIn_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  io_out_rawIn_isSpecial = io_out_rawIn_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  io_out_rawIn__isNaN = io_out_rawIn_isSpecial & io_out_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  wire  io_out_rawIn__isInf = io_out_rawIn_isSpecial & ~io_out_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  wire  io_out_rawIn__sign = addRecFN_io_out[32]; // @[rawFloatFromRecFN.scala 58:25]
  wire [9:0] io_out_rawIn__sExp = {1'b0,$signed(io_out_rawIn_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  _io_out_rawIn_out_sig_T = ~io_out_rawIn_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [24:0] io_out_rawIn__sig = {1'h0,_io_out_rawIn_out_sig_T,addRecFN_io_out[22:0]}; // @[Cat.scala 30:58]
  wire  io_out_isSubnormal = $signed(io_out_rawIn__sExp) < 10'sh82; // @[fNFromRecFN.scala 50:39]
  wire [4:0] io_out_denormShiftDist = 5'h1 - io_out_rawIn__sExp[4:0]; // @[fNFromRecFN.scala 51:39]
  wire [23:0] _io_out_denormFract_T_1 = io_out_rawIn__sig[24:1] >> io_out_denormShiftDist; // @[fNFromRecFN.scala 52:42]
  wire [22:0] io_out_denormFract = _io_out_denormFract_T_1[22:0]; // @[fNFromRecFN.scala 52:60]
  wire [7:0] _io_out_expOut_T_2 = io_out_rawIn__sExp[7:0] - 8'h81; // @[fNFromRecFN.scala 57:45]
  wire [7:0] _io_out_expOut_T_3 = io_out_isSubnormal ? 8'h0 : _io_out_expOut_T_2; // @[fNFromRecFN.scala 55:16]
  wire  _io_out_expOut_T_4 = io_out_rawIn__isNaN | io_out_rawIn__isInf; // @[fNFromRecFN.scala 59:44]
  wire [7:0] _io_out_expOut_T_6 = _io_out_expOut_T_4 ? 8'hff : 8'h0; // @[Bitwise.scala 72:12]
  wire [7:0] io_out_expOut = _io_out_expOut_T_3 | _io_out_expOut_T_6; // @[fNFromRecFN.scala 59:15]
  wire [22:0] _io_out_fractOut_T_1 = io_out_rawIn__isInf ? 23'h0 : io_out_rawIn__sig[22:0]; // @[fNFromRecFN.scala 63:20]
  wire [22:0] io_out_fractOut = io_out_isSubnormal ? io_out_denormFract : _io_out_fractOut_T_1; // @[fNFromRecFN.scala 61:16]
  wire [31:0] _io_out_T = {io_out_rawIn__sign,io_out_expOut,io_out_fractOut}; // @[Cat.scala 30:58]
  wire [32:0] _GEN_2 = use_int ? module_out : {{1'd0}, _io_out_T}; // @[AddSubPE.scala 32:16 44:12 65:12]
  AddRecFN addRecFN ( // @[AddSubPE.scala 57:26]
    .io_subOp(addRecFN_io_subOp),
    .io_a(addRecFN_io_a),
    .io_b(addRecFN_io_b),
    .io_roundingMode(addRecFN_io_roundingMode),
    .io_out(addRecFN_io_out)
  );
  assign io_out = _GEN_2[31:0];
  assign addRecFN_io_subOp = op; // @[AddSubPE.scala 58:23]
  assign addRecFN_io_a = recFN_from_fN_in_0; // @[AddSubPE.scala 61:19]
  assign addRecFN_io_b = recFN_from_fN_in_1; // @[AddSubPE.scala 62:19]
  assign addRecFN_io_roundingMode = rounding; // @[AddSubPE.scala 59:32]
  always @(posedge clock) begin
    rounding <= io_rounding; // @[AddSubPE.scala 22:26]
    op <= io_op; // @[AddSubPE.scala 26:27]
    use_int <= io_use_int; // @[AddSubPE.scala 28:27]
    if (reset) begin // @[AddSubPE.scala 30:27]
      module_out <= 33'h0; // @[AddSubPE.scala 30:27]
    end else if (use_int) begin // @[AddSubPE.scala 32:16]
      module_out <= {{1'd0}, _GEN_0};
    end
    sign_in_0 <= io_in_0; // @[AddSubPE.scala 34:44]
    sign_in_1 <= io_in_1; // @[AddSubPE.scala 35:44]
    fN_in_0 <= io_in_0; // @[AddSubPE.scala 49:27]
    fN_in_1 <= io_in_1; // @[AddSubPE.scala 50:27]
    recFN_from_fN_in_0 <= {recFN_from_fN_in_0_hi,recFN_from_fN_in_0_lo}; // @[Cat.scala 30:58]
    recFN_from_fN_in_1 <= {recFN_from_fN_in_1_hi,recFN_from_fN_in_1_lo}; // @[Cat.scala 30:58]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  rounding = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  op = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  use_int = _RAND_2[0:0];
  _RAND_3 = {2{`RANDOM}};
  module_out = _RAND_3[32:0];
  _RAND_4 = {1{`RANDOM}};
  sign_in_0 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  sign_in_1 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  fN_in_0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  fN_in_1 = _RAND_7[31:0];
  _RAND_8 = {2{`RANDOM}};
  recFN_from_fN_in_0 = _RAND_8[32:0];
  _RAND_9 = {2{`RANDOM}};
  recFN_from_fN_in_1 = _RAND_9[32:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE(
  input         clock,
  input         reset,
  input  [31:0] io_Xi_0,
  input  [31:0] io_Yi_0,
  input  [31:0] io_Xi_1,
  input  [31:0] io_Yi_1,
  input  [31:0] io_aggr_0,
  input  [31:0] io_aggr_1,
  input  [31:0] io_aggr_2,
  input  [31:0] io_aggr_3,
  input  [1:0]  io_m_0_sel,
  input  [1:0]  io_m_1_sel,
  input  [1:0]  io_m_2_sel,
  input  [1:0]  io_m_3_sel,
  input  [1:0]  io_m_4_sel,
  input  [1:0]  io_m_5_sel,
  input  [1:0]  io_m_6_sel,
  input  [1:0]  io_m_7_sel,
  input  [1:0]  io_m_8_sel,
  input  [1:0]  io_m_9_sel,
  input         io_addsub_0_op,
  input         io_addsub_1_op,
  input  [2:0]  io_rounding,
  input         io_use_int,
  output [31:0] io_out_0,
  output [31:0] io_out_1
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [63:0] _RAND_23;
  reg [63:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
`endif // RANDOMIZE_REG_INIT
  wire  m_0_clock; // @[PE.scala 106:19]
  wire  m_0_reset; // @[PE.scala 106:19]
  wire [1:0] m_0_io_sel; // @[PE.scala 106:19]
  wire [31:0] m_0_io_in_0; // @[PE.scala 106:19]
  wire [31:0] m_0_io_in_1; // @[PE.scala 106:19]
  wire [31:0] m_0_io_in_2; // @[PE.scala 106:19]
  wire [31:0] m_0_io_out; // @[PE.scala 106:19]
  wire  m_1_clock; // @[PE.scala 107:19]
  wire  m_1_reset; // @[PE.scala 107:19]
  wire [1:0] m_1_io_sel; // @[PE.scala 107:19]
  wire [31:0] m_1_io_in_0; // @[PE.scala 107:19]
  wire [31:0] m_1_io_in_1; // @[PE.scala 107:19]
  wire [31:0] m_1_io_in_2; // @[PE.scala 107:19]
  wire [31:0] m_1_io_out; // @[PE.scala 107:19]
  wire  m_2_clock; // @[PE.scala 108:19]
  wire  m_2_reset; // @[PE.scala 108:19]
  wire [1:0] m_2_io_sel; // @[PE.scala 108:19]
  wire [31:0] m_2_io_in_0; // @[PE.scala 108:19]
  wire [31:0] m_2_io_in_1; // @[PE.scala 108:19]
  wire [31:0] m_2_io_in_2; // @[PE.scala 108:19]
  wire [31:0] m_2_io_out; // @[PE.scala 108:19]
  wire  m_3_clock; // @[PE.scala 109:19]
  wire  m_3_reset; // @[PE.scala 109:19]
  wire [1:0] m_3_io_sel; // @[PE.scala 109:19]
  wire [31:0] m_3_io_in_0; // @[PE.scala 109:19]
  wire [31:0] m_3_io_in_1; // @[PE.scala 109:19]
  wire [31:0] m_3_io_in_2; // @[PE.scala 109:19]
  wire [31:0] m_3_io_out; // @[PE.scala 109:19]
  wire  m_4_clock; // @[PE.scala 110:19]
  wire  m_4_reset; // @[PE.scala 110:19]
  wire [1:0] m_4_io_sel; // @[PE.scala 110:19]
  wire [31:0] m_4_io_in_0; // @[PE.scala 110:19]
  wire [31:0] m_4_io_in_1; // @[PE.scala 110:19]
  wire [31:0] m_4_io_in_2; // @[PE.scala 110:19]
  wire [31:0] m_4_io_out; // @[PE.scala 110:19]
  wire  m_5_clock; // @[PE.scala 111:19]
  wire  m_5_reset; // @[PE.scala 111:19]
  wire [1:0] m_5_io_sel; // @[PE.scala 111:19]
  wire [31:0] m_5_io_in_0; // @[PE.scala 111:19]
  wire [31:0] m_5_io_in_1; // @[PE.scala 111:19]
  wire [31:0] m_5_io_in_2; // @[PE.scala 111:19]
  wire [31:0] m_5_io_out; // @[PE.scala 111:19]
  wire  m_6_clock; // @[PE.scala 112:19]
  wire  m_6_reset; // @[PE.scala 112:19]
  wire [1:0] m_6_io_sel; // @[PE.scala 112:19]
  wire [31:0] m_6_io_in_0; // @[PE.scala 112:19]
  wire [31:0] m_6_io_in_1; // @[PE.scala 112:19]
  wire [31:0] m_6_io_in_2; // @[PE.scala 112:19]
  wire [31:0] m_6_io_out; // @[PE.scala 112:19]
  wire  m_7_clock; // @[PE.scala 113:19]
  wire  m_7_reset; // @[PE.scala 113:19]
  wire [1:0] m_7_io_sel; // @[PE.scala 113:19]
  wire [31:0] m_7_io_in_0; // @[PE.scala 113:19]
  wire [31:0] m_7_io_in_1; // @[PE.scala 113:19]
  wire [31:0] m_7_io_in_2; // @[PE.scala 113:19]
  wire [31:0] m_7_io_out; // @[PE.scala 113:19]
  wire  m_8_clock; // @[PE.scala 114:19]
  wire  m_8_reset; // @[PE.scala 114:19]
  wire [1:0] m_8_io_sel; // @[PE.scala 114:19]
  wire [31:0] m_8_io_in_0; // @[PE.scala 114:19]
  wire [31:0] m_8_io_in_1; // @[PE.scala 114:19]
  wire [31:0] m_8_io_in_2; // @[PE.scala 114:19]
  wire [31:0] m_8_io_out; // @[PE.scala 114:19]
  wire  m_9_clock; // @[PE.scala 115:19]
  wire  m_9_reset; // @[PE.scala 115:19]
  wire [1:0] m_9_io_sel; // @[PE.scala 115:19]
  wire [31:0] m_9_io_in_0; // @[PE.scala 115:19]
  wire [31:0] m_9_io_in_1; // @[PE.scala 115:19]
  wire [31:0] m_9_io_in_2; // @[PE.scala 115:19]
  wire [31:0] m_9_io_out; // @[PE.scala 115:19]
  wire  multModule_0_clock; // @[PE.scala 117:28]
  wire  multModule_0_reset; // @[PE.scala 117:28]
  wire  multModule_0_io_use_int; // @[PE.scala 117:28]
  wire [2:0] multModule_0_io_rounding; // @[PE.scala 117:28]
  wire [31:0] multModule_0_io_in_0; // @[PE.scala 117:28]
  wire [31:0] multModule_0_io_in_1; // @[PE.scala 117:28]
  wire [31:0] multModule_0_io_out; // @[PE.scala 117:28]
  wire  multModule_1_clock; // @[PE.scala 118:28]
  wire  multModule_1_reset; // @[PE.scala 118:28]
  wire  multModule_1_io_use_int; // @[PE.scala 118:28]
  wire [2:0] multModule_1_io_rounding; // @[PE.scala 118:28]
  wire [31:0] multModule_1_io_in_0; // @[PE.scala 118:28]
  wire [31:0] multModule_1_io_in_1; // @[PE.scala 118:28]
  wire [31:0] multModule_1_io_out; // @[PE.scala 118:28]
  wire  addsubModule_0_clock; // @[PE.scala 120:30]
  wire  addsubModule_0_reset; // @[PE.scala 120:30]
  wire  addsubModule_0_io_use_int; // @[PE.scala 120:30]
  wire  addsubModule_0_io_op; // @[PE.scala 120:30]
  wire [2:0] addsubModule_0_io_rounding; // @[PE.scala 120:30]
  wire [31:0] addsubModule_0_io_in_0; // @[PE.scala 120:30]
  wire [31:0] addsubModule_0_io_in_1; // @[PE.scala 120:30]
  wire [31:0] addsubModule_0_io_out; // @[PE.scala 120:30]
  wire  addsubModule_1_clock; // @[PE.scala 121:30]
  wire  addsubModule_1_reset; // @[PE.scala 121:30]
  wire  addsubModule_1_io_use_int; // @[PE.scala 121:30]
  wire  addsubModule_1_io_op; // @[PE.scala 121:30]
  wire [2:0] addsubModule_1_io_rounding; // @[PE.scala 121:30]
  wire [31:0] addsubModule_1_io_in_0; // @[PE.scala 121:30]
  wire [31:0] addsubModule_1_io_in_1; // @[PE.scala 121:30]
  wire [31:0] addsubModule_1_io_out; // @[PE.scala 121:30]
  reg [31:0] Xi_0; // @[PE.scala 47:22]
  reg [31:0] Yi_0; // @[PE.scala 48:22]
  reg [31:0] Xi_1; // @[PE.scala 49:22]
  reg [31:0] Yi_1; // @[PE.scala 50:22]
  reg [31:0] aggr_0; // @[PE.scala 55:24]
  reg [31:0] aggr_1; // @[PE.scala 56:24]
  reg [31:0] aggr_2; // @[PE.scala 57:24]
  reg [31:0] aggr_3; // @[PE.scala 58:24]
  reg [1:0] m_0_sel; // @[PE.scala 63:25]
  reg [1:0] m_1_sel; // @[PE.scala 64:25]
  reg [1:0] m_2_sel; // @[PE.scala 65:25]
  reg [1:0] m_3_sel; // @[PE.scala 66:25]
  reg [1:0] m_4_sel; // @[PE.scala 67:25]
  reg [1:0] m_5_sel; // @[PE.scala 68:25]
  reg [1:0] m_6_sel; // @[PE.scala 69:25]
  reg [1:0] m_7_sel; // @[PE.scala 70:25]
  reg [1:0] m_8_sel; // @[PE.scala 71:25]
  reg [1:0] m_9_sel; // @[PE.scala 72:25]
  reg  addsub_0_op; // @[PE.scala 74:29]
  reg  addsub_1_op; // @[PE.scala 75:29]
  reg [2:0] rounding; // @[PE.scala 78:29]
  reg  use_int; // @[PE.scala 82:29]
  reg [32:0] addsubModule_0_out; // @[PE.scala 87:36]
  reg [32:0] addsubModule_1_out; // @[PE.scala 88:36]
  reg [32:0] multModule_0_out; // @[PE.scala 89:36]
  reg [32:0] multModule_1_out; // @[PE.scala 90:36]
  reg [31:0] m_0_out; // @[PE.scala 92:24]
  reg [31:0] m_1_out; // @[PE.scala 93:24]
  reg [31:0] m_2_out; // @[PE.scala 94:24]
  reg [31:0] m_3_out; // @[PE.scala 95:24]
  reg [31:0] m_4_out; // @[PE.scala 96:24]
  reg [31:0] m_5_out; // @[PE.scala 97:24]
  reg [31:0] m_6_out; // @[PE.scala 98:24]
  reg [31:0] m_7_out; // @[PE.scala 99:24]
  reg [31:0] m_8_out; // @[PE.scala 100:24]
  reg [31:0] m_9_out; // @[PE.scala 101:24]
  MuxPE m_0 ( // @[PE.scala 106:19]
    .clock(m_0_clock),
    .reset(m_0_reset),
    .io_sel(m_0_io_sel),
    .io_in_0(m_0_io_in_0),
    .io_in_1(m_0_io_in_1),
    .io_in_2(m_0_io_in_2),
    .io_out(m_0_io_out)
  );
  MuxPE m_1 ( // @[PE.scala 107:19]
    .clock(m_1_clock),
    .reset(m_1_reset),
    .io_sel(m_1_io_sel),
    .io_in_0(m_1_io_in_0),
    .io_in_1(m_1_io_in_1),
    .io_in_2(m_1_io_in_2),
    .io_out(m_1_io_out)
  );
  MuxPE m_2 ( // @[PE.scala 108:19]
    .clock(m_2_clock),
    .reset(m_2_reset),
    .io_sel(m_2_io_sel),
    .io_in_0(m_2_io_in_0),
    .io_in_1(m_2_io_in_1),
    .io_in_2(m_2_io_in_2),
    .io_out(m_2_io_out)
  );
  MuxPE m_3 ( // @[PE.scala 109:19]
    .clock(m_3_clock),
    .reset(m_3_reset),
    .io_sel(m_3_io_sel),
    .io_in_0(m_3_io_in_0),
    .io_in_1(m_3_io_in_1),
    .io_in_2(m_3_io_in_2),
    .io_out(m_3_io_out)
  );
  MuxPE m_4 ( // @[PE.scala 110:19]
    .clock(m_4_clock),
    .reset(m_4_reset),
    .io_sel(m_4_io_sel),
    .io_in_0(m_4_io_in_0),
    .io_in_1(m_4_io_in_1),
    .io_in_2(m_4_io_in_2),
    .io_out(m_4_io_out)
  );
  MuxPE m_5 ( // @[PE.scala 111:19]
    .clock(m_5_clock),
    .reset(m_5_reset),
    .io_sel(m_5_io_sel),
    .io_in_0(m_5_io_in_0),
    .io_in_1(m_5_io_in_1),
    .io_in_2(m_5_io_in_2),
    .io_out(m_5_io_out)
  );
  MuxPE m_6 ( // @[PE.scala 112:19]
    .clock(m_6_clock),
    .reset(m_6_reset),
    .io_sel(m_6_io_sel),
    .io_in_0(m_6_io_in_0),
    .io_in_1(m_6_io_in_1),
    .io_in_2(m_6_io_in_2),
    .io_out(m_6_io_out)
  );
  MuxPE m_7 ( // @[PE.scala 113:19]
    .clock(m_7_clock),
    .reset(m_7_reset),
    .io_sel(m_7_io_sel),
    .io_in_0(m_7_io_in_0),
    .io_in_1(m_7_io_in_1),
    .io_in_2(m_7_io_in_2),
    .io_out(m_7_io_out)
  );
  MuxPE m_8 ( // @[PE.scala 114:19]
    .clock(m_8_clock),
    .reset(m_8_reset),
    .io_sel(m_8_io_sel),
    .io_in_0(m_8_io_in_0),
    .io_in_1(m_8_io_in_1),
    .io_in_2(m_8_io_in_2),
    .io_out(m_8_io_out)
  );
  MuxPE m_9 ( // @[PE.scala 115:19]
    .clock(m_9_clock),
    .reset(m_9_reset),
    .io_sel(m_9_io_sel),
    .io_in_0(m_9_io_in_0),
    .io_in_1(m_9_io_in_1),
    .io_in_2(m_9_io_in_2),
    .io_out(m_9_io_out)
  );
  MultPE multModule_0 ( // @[PE.scala 117:28]
    .clock(multModule_0_clock),
    .reset(multModule_0_reset),
    .io_use_int(multModule_0_io_use_int),
    .io_rounding(multModule_0_io_rounding),
    .io_in_0(multModule_0_io_in_0),
    .io_in_1(multModule_0_io_in_1),
    .io_out(multModule_0_io_out)
  );
  MultPE multModule_1 ( // @[PE.scala 118:28]
    .clock(multModule_1_clock),
    .reset(multModule_1_reset),
    .io_use_int(multModule_1_io_use_int),
    .io_rounding(multModule_1_io_rounding),
    .io_in_0(multModule_1_io_in_0),
    .io_in_1(multModule_1_io_in_1),
    .io_out(multModule_1_io_out)
  );
  AddSubPE addsubModule_0 ( // @[PE.scala 120:30]
    .clock(addsubModule_0_clock),
    .reset(addsubModule_0_reset),
    .io_use_int(addsubModule_0_io_use_int),
    .io_op(addsubModule_0_io_op),
    .io_rounding(addsubModule_0_io_rounding),
    .io_in_0(addsubModule_0_io_in_0),
    .io_in_1(addsubModule_0_io_in_1),
    .io_out(addsubModule_0_io_out)
  );
  AddSubPE addsubModule_1 ( // @[PE.scala 121:30]
    .clock(addsubModule_1_clock),
    .reset(addsubModule_1_reset),
    .io_use_int(addsubModule_1_io_use_int),
    .io_op(addsubModule_1_io_op),
    .io_rounding(addsubModule_1_io_rounding),
    .io_in_0(addsubModule_1_io_in_0),
    .io_in_1(addsubModule_1_io_in_1),
    .io_out(addsubModule_1_io_out)
  );
  assign io_out_0 = m_8_out; // @[PE.scala 245:12]
  assign io_out_1 = m_9_out; // @[PE.scala 246:12]
  assign m_0_clock = clock;
  assign m_0_reset = reset;
  assign m_0_io_sel = m_0_sel; // @[PE.scala 126:14]
  assign m_0_io_in_0 = Xi_0; // @[PE.scala 138:15]
  assign m_0_io_in_1 = addsubModule_0_out[31:0]; // @[PE.scala 139:15]
  assign m_0_io_in_2 = 32'h0; // @[PE.scala 140:15]
  assign m_1_clock = clock;
  assign m_1_reset = reset;
  assign m_1_io_sel = m_1_sel; // @[PE.scala 127:14]
  assign m_1_io_in_0 = Yi_0; // @[PE.scala 144:15]
  assign m_1_io_in_1 = addsubModule_0_out[31:0]; // @[PE.scala 145:15]
  assign m_1_io_in_2 = 32'h0; // @[PE.scala 146:15]
  assign m_2_clock = clock;
  assign m_2_reset = reset;
  assign m_2_io_sel = m_2_sel; // @[PE.scala 128:14]
  assign m_2_io_in_0 = Xi_1; // @[PE.scala 150:15]
  assign m_2_io_in_1 = addsubModule_1_out[31:0]; // @[PE.scala 151:15]
  assign m_2_io_in_2 = 32'h0; // @[PE.scala 152:15]
  assign m_3_clock = clock;
  assign m_3_reset = reset;
  assign m_3_io_sel = m_3_sel; // @[PE.scala 129:14]
  assign m_3_io_in_0 = Yi_1; // @[PE.scala 156:15]
  assign m_3_io_in_1 = addsubModule_1_out[31:0]; // @[PE.scala 157:15]
  assign m_3_io_in_2 = 32'h0; // @[PE.scala 158:15]
  assign m_4_clock = clock;
  assign m_4_reset = reset;
  assign m_4_io_sel = m_4_sel; // @[PE.scala 130:14]
  assign m_4_io_in_0 = Xi_0; // @[PE.scala 183:15]
  assign m_4_io_in_1 = multModule_0_out[31:0]; // @[PE.scala 184:15]
  assign m_4_io_in_2 = aggr_0; // @[PE.scala 185:15]
  assign m_5_clock = clock;
  assign m_5_reset = reset;
  assign m_5_io_sel = m_5_sel; // @[PE.scala 131:14]
  assign m_5_io_in_0 = Yi_0; // @[PE.scala 189:15]
  assign m_5_io_in_1 = multModule_1_out[31:0]; // @[PE.scala 190:15]
  assign m_5_io_in_2 = aggr_1; // @[PE.scala 191:15]
  assign m_6_clock = clock;
  assign m_6_reset = reset;
  assign m_6_io_sel = m_6_sel; // @[PE.scala 132:14]
  assign m_6_io_in_0 = Xi_1; // @[PE.scala 195:15]
  assign m_6_io_in_1 = multModule_1_out[31:0]; // @[PE.scala 196:15]
  assign m_6_io_in_2 = aggr_2; // @[PE.scala 197:15]
  assign m_7_clock = clock;
  assign m_7_reset = reset;
  assign m_7_io_sel = m_7_sel; // @[PE.scala 133:14]
  assign m_7_io_in_0 = Yi_1; // @[PE.scala 201:15]
  assign m_7_io_in_1 = 32'h0; // @[PE.scala 202:15]
  assign m_7_io_in_2 = aggr_3; // @[PE.scala 203:15]
  assign m_8_clock = clock;
  assign m_8_reset = reset;
  assign m_8_io_sel = m_8_sel; // @[PE.scala 134:14]
  assign m_8_io_in_0 = addsubModule_0_out[31:0]; // @[PE.scala 230:15]
  assign m_8_io_in_1 = multModule_0_out[31:0]; // @[PE.scala 231:15]
  assign m_8_io_in_2 = 32'h0; // @[PE.scala 232:15]
  assign m_9_clock = clock;
  assign m_9_reset = reset;
  assign m_9_io_sel = m_9_sel; // @[PE.scala 135:14]
  assign m_9_io_in_0 = addsubModule_1_out[31:0]; // @[PE.scala 236:15]
  assign m_9_io_in_1 = multModule_1_out[31:0]; // @[PE.scala 237:15]
  assign m_9_io_in_2 = 32'h0; // @[PE.scala 238:15]
  assign multModule_0_clock = clock;
  assign multModule_0_reset = reset;
  assign multModule_0_io_use_int = use_int; // @[PE.scala 167:30]
  assign multModule_0_io_rounding = rounding; // @[PE.scala 165:30]
  assign multModule_0_io_in_0 = m_0_out; // @[PE.scala 168:24]
  assign multModule_0_io_in_1 = m_1_out; // @[PE.scala 169:24]
  assign multModule_1_clock = clock;
  assign multModule_1_reset = reset;
  assign multModule_1_io_use_int = use_int; // @[PE.scala 175:30]
  assign multModule_1_io_rounding = rounding; // @[PE.scala 173:30]
  assign multModule_1_io_in_0 = m_2_out; // @[PE.scala 176:24]
  assign multModule_1_io_in_1 = m_3_out; // @[PE.scala 177:24]
  assign addsubModule_0_clock = clock;
  assign addsubModule_0_reset = reset;
  assign addsubModule_0_io_use_int = use_int; // @[PE.scala 213:32]
  assign addsubModule_0_io_op = addsub_0_op; // @[PE.scala 210:32]
  assign addsubModule_0_io_rounding = rounding; // @[PE.scala 211:32]
  assign addsubModule_0_io_in_0 = m_4_out; // @[PE.scala 214:32]
  assign addsubModule_0_io_in_1 = m_5_out; // @[PE.scala 215:32]
  assign addsubModule_1_clock = clock;
  assign addsubModule_1_reset = reset;
  assign addsubModule_1_io_use_int = use_int; // @[PE.scala 222:32]
  assign addsubModule_1_io_op = addsub_1_op; // @[PE.scala 219:32]
  assign addsubModule_1_io_rounding = rounding; // @[PE.scala 220:32]
  assign addsubModule_1_io_in_0 = m_6_out; // @[PE.scala 223:32]
  assign addsubModule_1_io_in_1 = m_7_out; // @[PE.scala 224:32]
  always @(posedge clock) begin
    Xi_0 <= io_Xi_0; // @[PE.scala 47:22]
    Yi_0 <= io_Yi_0; // @[PE.scala 48:22]
    Xi_1 <= io_Xi_1; // @[PE.scala 49:22]
    Yi_1 <= io_Yi_1; // @[PE.scala 50:22]
    aggr_0 <= io_aggr_0; // @[PE.scala 55:24]
    aggr_1 <= io_aggr_1; // @[PE.scala 56:24]
    aggr_2 <= io_aggr_2; // @[PE.scala 57:24]
    aggr_3 <= io_aggr_3; // @[PE.scala 58:24]
    m_0_sel <= io_m_0_sel; // @[PE.scala 63:25]
    m_1_sel <= io_m_1_sel; // @[PE.scala 64:25]
    m_2_sel <= io_m_2_sel; // @[PE.scala 65:25]
    m_3_sel <= io_m_3_sel; // @[PE.scala 66:25]
    m_4_sel <= io_m_4_sel; // @[PE.scala 67:25]
    m_5_sel <= io_m_5_sel; // @[PE.scala 68:25]
    m_6_sel <= io_m_6_sel; // @[PE.scala 69:25]
    m_7_sel <= io_m_7_sel; // @[PE.scala 70:25]
    m_8_sel <= io_m_8_sel; // @[PE.scala 71:25]
    m_9_sel <= io_m_9_sel; // @[PE.scala 72:25]
    addsub_0_op <= io_addsub_0_op; // @[PE.scala 74:29]
    addsub_1_op <= io_addsub_1_op; // @[PE.scala 75:29]
    rounding <= io_rounding; // @[PE.scala 78:29]
    use_int <= io_use_int; // @[PE.scala 82:29]
    if (reset) begin // @[PE.scala 87:36]
      addsubModule_0_out <= 33'h0; // @[PE.scala 87:36]
    end else begin
      addsubModule_0_out <= {{1'd0}, addsubModule_0_io_out}; // @[PE.scala 216:23]
    end
    if (reset) begin // @[PE.scala 88:36]
      addsubModule_1_out <= 33'h0; // @[PE.scala 88:36]
    end else begin
      addsubModule_1_out <= {{1'd0}, addsubModule_1_io_out}; // @[PE.scala 225:23]
    end
    if (reset) begin // @[PE.scala 89:36]
      multModule_0_out <= 33'h0; // @[PE.scala 89:36]
    end else begin
      multModule_0_out <= {{1'd0}, multModule_0_io_out}; // @[PE.scala 170:21]
    end
    if (reset) begin // @[PE.scala 90:36]
      multModule_1_out <= 33'h0; // @[PE.scala 90:36]
    end else begin
      multModule_1_out <= {{1'd0}, multModule_1_io_out}; // @[PE.scala 178:21]
    end
    if (reset) begin // @[PE.scala 92:24]
      m_0_out <= 32'h0; // @[PE.scala 92:24]
    end else begin
      m_0_out <= m_0_io_out; // @[PE.scala 142:11]
    end
    if (reset) begin // @[PE.scala 93:24]
      m_1_out <= 32'h0; // @[PE.scala 93:24]
    end else begin
      m_1_out <= m_1_io_out; // @[PE.scala 148:11]
    end
    if (reset) begin // @[PE.scala 94:24]
      m_2_out <= 32'h0; // @[PE.scala 94:24]
    end else begin
      m_2_out <= m_2_io_out; // @[PE.scala 154:11]
    end
    if (reset) begin // @[PE.scala 95:24]
      m_3_out <= 32'h0; // @[PE.scala 95:24]
    end else begin
      m_3_out <= m_3_io_out; // @[PE.scala 160:11]
    end
    if (reset) begin // @[PE.scala 96:24]
      m_4_out <= 32'h0; // @[PE.scala 96:24]
    end else begin
      m_4_out <= m_4_io_out; // @[PE.scala 187:15]
    end
    if (reset) begin // @[PE.scala 97:24]
      m_5_out <= 32'h0; // @[PE.scala 97:24]
    end else begin
      m_5_out <= m_5_io_out; // @[PE.scala 193:15]
    end
    if (reset) begin // @[PE.scala 98:24]
      m_6_out <= 32'h0; // @[PE.scala 98:24]
    end else begin
      m_6_out <= m_6_io_out; // @[PE.scala 199:15]
    end
    if (reset) begin // @[PE.scala 99:24]
      m_7_out <= 32'h0; // @[PE.scala 99:24]
    end else begin
      m_7_out <= m_7_io_out; // @[PE.scala 205:15]
    end
    if (reset) begin // @[PE.scala 100:24]
      m_8_out <= 32'h0; // @[PE.scala 100:24]
    end else begin
      m_8_out <= m_8_io_out; // @[PE.scala 234:15]
    end
    if (reset) begin // @[PE.scala 101:24]
      m_9_out <= 32'h0; // @[PE.scala 101:24]
    end else begin
      m_9_out <= m_9_io_out; // @[PE.scala 240:15]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  Xi_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  Yi_0 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  Xi_1 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  Yi_1 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  aggr_0 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  aggr_1 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  aggr_2 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  aggr_3 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  m_0_sel = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  m_1_sel = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  m_2_sel = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  m_3_sel = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  m_4_sel = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  m_5_sel = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  m_6_sel = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  m_7_sel = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  m_8_sel = _RAND_16[1:0];
  _RAND_17 = {1{`RANDOM}};
  m_9_sel = _RAND_17[1:0];
  _RAND_18 = {1{`RANDOM}};
  addsub_0_op = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  addsub_1_op = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  rounding = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  use_int = _RAND_21[0:0];
  _RAND_22 = {2{`RANDOM}};
  addsubModule_0_out = _RAND_22[32:0];
  _RAND_23 = {2{`RANDOM}};
  addsubModule_1_out = _RAND_23[32:0];
  _RAND_24 = {2{`RANDOM}};
  multModule_0_out = _RAND_24[32:0];
  _RAND_25 = {2{`RANDOM}};
  multModule_1_out = _RAND_25[32:0];
  _RAND_26 = {1{`RANDOM}};
  m_0_out = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  m_1_out = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  m_2_out = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  m_3_out = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  m_4_out = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  m_5_out = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  m_6_out = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  m_7_out = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  m_8_out = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  m_9_out = _RAND_35[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_8IP(
  input         clock,
  input         reset,
  input  [31:0] io_Xi_0_in_0,
  input  [31:0] io_Yi_0_in_0,
  input  [31:0] io_Xi_0_in_1,
  input  [31:0] io_Yi_0_in_1,
  input  [31:0] io_Xi_1_in_0,
  input  [31:0] io_Yi_1_in_0,
  input  [31:0] io_Xi_1_in_1,
  input  [31:0] io_Yi_1_in_1,
  input  [31:0] io_Xi_2_in_0,
  input  [31:0] io_Yi_2_in_0,
  input  [31:0] io_Xi_2_in_1,
  input  [31:0] io_Yi_2_in_1,
  input  [31:0] io_Xi_3_in_0,
  input  [31:0] io_Yi_3_in_0,
  input  [31:0] io_Xi_3_in_1,
  input  [31:0] io_Yi_3_in_1,
  input  [31:0] io_Xi_4_in_0,
  input  [31:0] io_Yi_4_in_0,
  input  [31:0] io_Xi_4_in_1,
  input  [31:0] io_Yi_4_in_1,
  input  [31:0] io_Xi_5_in_0,
  input  [31:0] io_Yi_5_in_0,
  input  [31:0] io_Xi_5_in_1,
  input  [31:0] io_Yi_5_in_1,
  input  [31:0] io_Xi_6_in_0,
  input  [31:0] io_Yi_6_in_0,
  input  [31:0] io_Xi_6_in_1,
  input  [31:0] io_Yi_6_in_1,
  input  [31:0] io_Xi_7_in_0,
  input  [31:0] io_Yi_7_in_0,
  input  [31:0] io_Xi_7_in_1,
  input  [31:0] io_Yi_7_in_1,
  input  [1:0]  io_m_0_sel,
  input  [1:0]  io_m_1_sel,
  input  [1:0]  io_m_2_sel,
  input  [1:0]  io_m_3_sel,
  input  [1:0]  io_m_4_sel,
  input  [1:0]  io_m_5_sel,
  input  [1:0]  io_m_6_sel,
  input  [1:0]  io_m_7_sel,
  input  [1:0]  io_m_8_sel,
  input  [1:0]  io_m_9_sel,
  input  [1:0]  io_addsub_0_op,
  input  [1:0]  io_addsub_1_op,
  input         io_use_int,
  input  [2:0]  io_rounding,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
`endif // RANDOMIZE_REG_INIT
  wire  pe_0_clock; // @[PE_8IP.scala 208:20]
  wire  pe_0_reset; // @[PE_8IP.scala 208:20]
  wire [31:0] pe_0_io_Xi_0; // @[PE_8IP.scala 208:20]
  wire [31:0] pe_0_io_Yi_0; // @[PE_8IP.scala 208:20]
  wire [31:0] pe_0_io_Xi_1; // @[PE_8IP.scala 208:20]
  wire [31:0] pe_0_io_Yi_1; // @[PE_8IP.scala 208:20]
  wire [31:0] pe_0_io_aggr_0; // @[PE_8IP.scala 208:20]
  wire [31:0] pe_0_io_aggr_1; // @[PE_8IP.scala 208:20]
  wire [31:0] pe_0_io_aggr_2; // @[PE_8IP.scala 208:20]
  wire [31:0] pe_0_io_aggr_3; // @[PE_8IP.scala 208:20]
  wire [1:0] pe_0_io_m_0_sel; // @[PE_8IP.scala 208:20]
  wire [1:0] pe_0_io_m_1_sel; // @[PE_8IP.scala 208:20]
  wire [1:0] pe_0_io_m_2_sel; // @[PE_8IP.scala 208:20]
  wire [1:0] pe_0_io_m_3_sel; // @[PE_8IP.scala 208:20]
  wire [1:0] pe_0_io_m_4_sel; // @[PE_8IP.scala 208:20]
  wire [1:0] pe_0_io_m_5_sel; // @[PE_8IP.scala 208:20]
  wire [1:0] pe_0_io_m_6_sel; // @[PE_8IP.scala 208:20]
  wire [1:0] pe_0_io_m_7_sel; // @[PE_8IP.scala 208:20]
  wire [1:0] pe_0_io_m_8_sel; // @[PE_8IP.scala 208:20]
  wire [1:0] pe_0_io_m_9_sel; // @[PE_8IP.scala 208:20]
  wire  pe_0_io_addsub_0_op; // @[PE_8IP.scala 208:20]
  wire  pe_0_io_addsub_1_op; // @[PE_8IP.scala 208:20]
  wire [2:0] pe_0_io_rounding; // @[PE_8IP.scala 208:20]
  wire  pe_0_io_use_int; // @[PE_8IP.scala 208:20]
  wire [31:0] pe_0_io_out_0; // @[PE_8IP.scala 208:20]
  wire [31:0] pe_0_io_out_1; // @[PE_8IP.scala 208:20]
  wire  pe_1_clock; // @[PE_8IP.scala 236:20]
  wire  pe_1_reset; // @[PE_8IP.scala 236:20]
  wire [31:0] pe_1_io_Xi_0; // @[PE_8IP.scala 236:20]
  wire [31:0] pe_1_io_Yi_0; // @[PE_8IP.scala 236:20]
  wire [31:0] pe_1_io_Xi_1; // @[PE_8IP.scala 236:20]
  wire [31:0] pe_1_io_Yi_1; // @[PE_8IP.scala 236:20]
  wire [31:0] pe_1_io_aggr_0; // @[PE_8IP.scala 236:20]
  wire [31:0] pe_1_io_aggr_1; // @[PE_8IP.scala 236:20]
  wire [31:0] pe_1_io_aggr_2; // @[PE_8IP.scala 236:20]
  wire [31:0] pe_1_io_aggr_3; // @[PE_8IP.scala 236:20]
  wire [1:0] pe_1_io_m_0_sel; // @[PE_8IP.scala 236:20]
  wire [1:0] pe_1_io_m_1_sel; // @[PE_8IP.scala 236:20]
  wire [1:0] pe_1_io_m_2_sel; // @[PE_8IP.scala 236:20]
  wire [1:0] pe_1_io_m_3_sel; // @[PE_8IP.scala 236:20]
  wire [1:0] pe_1_io_m_4_sel; // @[PE_8IP.scala 236:20]
  wire [1:0] pe_1_io_m_5_sel; // @[PE_8IP.scala 236:20]
  wire [1:0] pe_1_io_m_6_sel; // @[PE_8IP.scala 236:20]
  wire [1:0] pe_1_io_m_7_sel; // @[PE_8IP.scala 236:20]
  wire [1:0] pe_1_io_m_8_sel; // @[PE_8IP.scala 236:20]
  wire [1:0] pe_1_io_m_9_sel; // @[PE_8IP.scala 236:20]
  wire  pe_1_io_addsub_0_op; // @[PE_8IP.scala 236:20]
  wire  pe_1_io_addsub_1_op; // @[PE_8IP.scala 236:20]
  wire [2:0] pe_1_io_rounding; // @[PE_8IP.scala 236:20]
  wire  pe_1_io_use_int; // @[PE_8IP.scala 236:20]
  wire [31:0] pe_1_io_out_0; // @[PE_8IP.scala 236:20]
  wire [31:0] pe_1_io_out_1; // @[PE_8IP.scala 236:20]
  wire  pe_2_clock; // @[PE_8IP.scala 264:20]
  wire  pe_2_reset; // @[PE_8IP.scala 264:20]
  wire [31:0] pe_2_io_Xi_0; // @[PE_8IP.scala 264:20]
  wire [31:0] pe_2_io_Yi_0; // @[PE_8IP.scala 264:20]
  wire [31:0] pe_2_io_Xi_1; // @[PE_8IP.scala 264:20]
  wire [31:0] pe_2_io_Yi_1; // @[PE_8IP.scala 264:20]
  wire [31:0] pe_2_io_aggr_0; // @[PE_8IP.scala 264:20]
  wire [31:0] pe_2_io_aggr_1; // @[PE_8IP.scala 264:20]
  wire [31:0] pe_2_io_aggr_2; // @[PE_8IP.scala 264:20]
  wire [31:0] pe_2_io_aggr_3; // @[PE_8IP.scala 264:20]
  wire [1:0] pe_2_io_m_0_sel; // @[PE_8IP.scala 264:20]
  wire [1:0] pe_2_io_m_1_sel; // @[PE_8IP.scala 264:20]
  wire [1:0] pe_2_io_m_2_sel; // @[PE_8IP.scala 264:20]
  wire [1:0] pe_2_io_m_3_sel; // @[PE_8IP.scala 264:20]
  wire [1:0] pe_2_io_m_4_sel; // @[PE_8IP.scala 264:20]
  wire [1:0] pe_2_io_m_5_sel; // @[PE_8IP.scala 264:20]
  wire [1:0] pe_2_io_m_6_sel; // @[PE_8IP.scala 264:20]
  wire [1:0] pe_2_io_m_7_sel; // @[PE_8IP.scala 264:20]
  wire [1:0] pe_2_io_m_8_sel; // @[PE_8IP.scala 264:20]
  wire [1:0] pe_2_io_m_9_sel; // @[PE_8IP.scala 264:20]
  wire  pe_2_io_addsub_0_op; // @[PE_8IP.scala 264:20]
  wire  pe_2_io_addsub_1_op; // @[PE_8IP.scala 264:20]
  wire [2:0] pe_2_io_rounding; // @[PE_8IP.scala 264:20]
  wire  pe_2_io_use_int; // @[PE_8IP.scala 264:20]
  wire [31:0] pe_2_io_out_0; // @[PE_8IP.scala 264:20]
  wire [31:0] pe_2_io_out_1; // @[PE_8IP.scala 264:20]
  wire  pe_3_clock; // @[PE_8IP.scala 291:20]
  wire  pe_3_reset; // @[PE_8IP.scala 291:20]
  wire [31:0] pe_3_io_Xi_0; // @[PE_8IP.scala 291:20]
  wire [31:0] pe_3_io_Yi_0; // @[PE_8IP.scala 291:20]
  wire [31:0] pe_3_io_Xi_1; // @[PE_8IP.scala 291:20]
  wire [31:0] pe_3_io_Yi_1; // @[PE_8IP.scala 291:20]
  wire [31:0] pe_3_io_aggr_0; // @[PE_8IP.scala 291:20]
  wire [31:0] pe_3_io_aggr_1; // @[PE_8IP.scala 291:20]
  wire [31:0] pe_3_io_aggr_2; // @[PE_8IP.scala 291:20]
  wire [31:0] pe_3_io_aggr_3; // @[PE_8IP.scala 291:20]
  wire [1:0] pe_3_io_m_0_sel; // @[PE_8IP.scala 291:20]
  wire [1:0] pe_3_io_m_1_sel; // @[PE_8IP.scala 291:20]
  wire [1:0] pe_3_io_m_2_sel; // @[PE_8IP.scala 291:20]
  wire [1:0] pe_3_io_m_3_sel; // @[PE_8IP.scala 291:20]
  wire [1:0] pe_3_io_m_4_sel; // @[PE_8IP.scala 291:20]
  wire [1:0] pe_3_io_m_5_sel; // @[PE_8IP.scala 291:20]
  wire [1:0] pe_3_io_m_6_sel; // @[PE_8IP.scala 291:20]
  wire [1:0] pe_3_io_m_7_sel; // @[PE_8IP.scala 291:20]
  wire [1:0] pe_3_io_m_8_sel; // @[PE_8IP.scala 291:20]
  wire [1:0] pe_3_io_m_9_sel; // @[PE_8IP.scala 291:20]
  wire  pe_3_io_addsub_0_op; // @[PE_8IP.scala 291:20]
  wire  pe_3_io_addsub_1_op; // @[PE_8IP.scala 291:20]
  wire [2:0] pe_3_io_rounding; // @[PE_8IP.scala 291:20]
  wire  pe_3_io_use_int; // @[PE_8IP.scala 291:20]
  wire [31:0] pe_3_io_out_0; // @[PE_8IP.scala 291:20]
  wire [31:0] pe_3_io_out_1; // @[PE_8IP.scala 291:20]
  wire  pe_4_clock; // @[PE_8IP.scala 319:20]
  wire  pe_4_reset; // @[PE_8IP.scala 319:20]
  wire [31:0] pe_4_io_Xi_0; // @[PE_8IP.scala 319:20]
  wire [31:0] pe_4_io_Yi_0; // @[PE_8IP.scala 319:20]
  wire [31:0] pe_4_io_Xi_1; // @[PE_8IP.scala 319:20]
  wire [31:0] pe_4_io_Yi_1; // @[PE_8IP.scala 319:20]
  wire [31:0] pe_4_io_aggr_0; // @[PE_8IP.scala 319:20]
  wire [31:0] pe_4_io_aggr_1; // @[PE_8IP.scala 319:20]
  wire [31:0] pe_4_io_aggr_2; // @[PE_8IP.scala 319:20]
  wire [31:0] pe_4_io_aggr_3; // @[PE_8IP.scala 319:20]
  wire [1:0] pe_4_io_m_0_sel; // @[PE_8IP.scala 319:20]
  wire [1:0] pe_4_io_m_1_sel; // @[PE_8IP.scala 319:20]
  wire [1:0] pe_4_io_m_2_sel; // @[PE_8IP.scala 319:20]
  wire [1:0] pe_4_io_m_3_sel; // @[PE_8IP.scala 319:20]
  wire [1:0] pe_4_io_m_4_sel; // @[PE_8IP.scala 319:20]
  wire [1:0] pe_4_io_m_5_sel; // @[PE_8IP.scala 319:20]
  wire [1:0] pe_4_io_m_6_sel; // @[PE_8IP.scala 319:20]
  wire [1:0] pe_4_io_m_7_sel; // @[PE_8IP.scala 319:20]
  wire [1:0] pe_4_io_m_8_sel; // @[PE_8IP.scala 319:20]
  wire [1:0] pe_4_io_m_9_sel; // @[PE_8IP.scala 319:20]
  wire  pe_4_io_addsub_0_op; // @[PE_8IP.scala 319:20]
  wire  pe_4_io_addsub_1_op; // @[PE_8IP.scala 319:20]
  wire [2:0] pe_4_io_rounding; // @[PE_8IP.scala 319:20]
  wire  pe_4_io_use_int; // @[PE_8IP.scala 319:20]
  wire [31:0] pe_4_io_out_0; // @[PE_8IP.scala 319:20]
  wire [31:0] pe_4_io_out_1; // @[PE_8IP.scala 319:20]
  wire  pe_5_clock; // @[PE_8IP.scala 347:20]
  wire  pe_5_reset; // @[PE_8IP.scala 347:20]
  wire [31:0] pe_5_io_Xi_0; // @[PE_8IP.scala 347:20]
  wire [31:0] pe_5_io_Yi_0; // @[PE_8IP.scala 347:20]
  wire [31:0] pe_5_io_Xi_1; // @[PE_8IP.scala 347:20]
  wire [31:0] pe_5_io_Yi_1; // @[PE_8IP.scala 347:20]
  wire [31:0] pe_5_io_aggr_0; // @[PE_8IP.scala 347:20]
  wire [31:0] pe_5_io_aggr_1; // @[PE_8IP.scala 347:20]
  wire [31:0] pe_5_io_aggr_2; // @[PE_8IP.scala 347:20]
  wire [31:0] pe_5_io_aggr_3; // @[PE_8IP.scala 347:20]
  wire [1:0] pe_5_io_m_0_sel; // @[PE_8IP.scala 347:20]
  wire [1:0] pe_5_io_m_1_sel; // @[PE_8IP.scala 347:20]
  wire [1:0] pe_5_io_m_2_sel; // @[PE_8IP.scala 347:20]
  wire [1:0] pe_5_io_m_3_sel; // @[PE_8IP.scala 347:20]
  wire [1:0] pe_5_io_m_4_sel; // @[PE_8IP.scala 347:20]
  wire [1:0] pe_5_io_m_5_sel; // @[PE_8IP.scala 347:20]
  wire [1:0] pe_5_io_m_6_sel; // @[PE_8IP.scala 347:20]
  wire [1:0] pe_5_io_m_7_sel; // @[PE_8IP.scala 347:20]
  wire [1:0] pe_5_io_m_8_sel; // @[PE_8IP.scala 347:20]
  wire [1:0] pe_5_io_m_9_sel; // @[PE_8IP.scala 347:20]
  wire  pe_5_io_addsub_0_op; // @[PE_8IP.scala 347:20]
  wire  pe_5_io_addsub_1_op; // @[PE_8IP.scala 347:20]
  wire [2:0] pe_5_io_rounding; // @[PE_8IP.scala 347:20]
  wire  pe_5_io_use_int; // @[PE_8IP.scala 347:20]
  wire [31:0] pe_5_io_out_0; // @[PE_8IP.scala 347:20]
  wire [31:0] pe_5_io_out_1; // @[PE_8IP.scala 347:20]
  wire  pe_6_clock; // @[PE_8IP.scala 375:20]
  wire  pe_6_reset; // @[PE_8IP.scala 375:20]
  wire [31:0] pe_6_io_Xi_0; // @[PE_8IP.scala 375:20]
  wire [31:0] pe_6_io_Yi_0; // @[PE_8IP.scala 375:20]
  wire [31:0] pe_6_io_Xi_1; // @[PE_8IP.scala 375:20]
  wire [31:0] pe_6_io_Yi_1; // @[PE_8IP.scala 375:20]
  wire [31:0] pe_6_io_aggr_0; // @[PE_8IP.scala 375:20]
  wire [31:0] pe_6_io_aggr_1; // @[PE_8IP.scala 375:20]
  wire [31:0] pe_6_io_aggr_2; // @[PE_8IP.scala 375:20]
  wire [31:0] pe_6_io_aggr_3; // @[PE_8IP.scala 375:20]
  wire [1:0] pe_6_io_m_0_sel; // @[PE_8IP.scala 375:20]
  wire [1:0] pe_6_io_m_1_sel; // @[PE_8IP.scala 375:20]
  wire [1:0] pe_6_io_m_2_sel; // @[PE_8IP.scala 375:20]
  wire [1:0] pe_6_io_m_3_sel; // @[PE_8IP.scala 375:20]
  wire [1:0] pe_6_io_m_4_sel; // @[PE_8IP.scala 375:20]
  wire [1:0] pe_6_io_m_5_sel; // @[PE_8IP.scala 375:20]
  wire [1:0] pe_6_io_m_6_sel; // @[PE_8IP.scala 375:20]
  wire [1:0] pe_6_io_m_7_sel; // @[PE_8IP.scala 375:20]
  wire [1:0] pe_6_io_m_8_sel; // @[PE_8IP.scala 375:20]
  wire [1:0] pe_6_io_m_9_sel; // @[PE_8IP.scala 375:20]
  wire  pe_6_io_addsub_0_op; // @[PE_8IP.scala 375:20]
  wire  pe_6_io_addsub_1_op; // @[PE_8IP.scala 375:20]
  wire [2:0] pe_6_io_rounding; // @[PE_8IP.scala 375:20]
  wire  pe_6_io_use_int; // @[PE_8IP.scala 375:20]
  wire [31:0] pe_6_io_out_0; // @[PE_8IP.scala 375:20]
  wire [31:0] pe_6_io_out_1; // @[PE_8IP.scala 375:20]
  wire  pe_7_clock; // @[PE_8IP.scala 402:20]
  wire  pe_7_reset; // @[PE_8IP.scala 402:20]
  wire [31:0] pe_7_io_Xi_0; // @[PE_8IP.scala 402:20]
  wire [31:0] pe_7_io_Yi_0; // @[PE_8IP.scala 402:20]
  wire [31:0] pe_7_io_Xi_1; // @[PE_8IP.scala 402:20]
  wire [31:0] pe_7_io_Yi_1; // @[PE_8IP.scala 402:20]
  wire [31:0] pe_7_io_aggr_0; // @[PE_8IP.scala 402:20]
  wire [31:0] pe_7_io_aggr_1; // @[PE_8IP.scala 402:20]
  wire [31:0] pe_7_io_aggr_2; // @[PE_8IP.scala 402:20]
  wire [31:0] pe_7_io_aggr_3; // @[PE_8IP.scala 402:20]
  wire [1:0] pe_7_io_m_0_sel; // @[PE_8IP.scala 402:20]
  wire [1:0] pe_7_io_m_1_sel; // @[PE_8IP.scala 402:20]
  wire [1:0] pe_7_io_m_2_sel; // @[PE_8IP.scala 402:20]
  wire [1:0] pe_7_io_m_3_sel; // @[PE_8IP.scala 402:20]
  wire [1:0] pe_7_io_m_4_sel; // @[PE_8IP.scala 402:20]
  wire [1:0] pe_7_io_m_5_sel; // @[PE_8IP.scala 402:20]
  wire [1:0] pe_7_io_m_6_sel; // @[PE_8IP.scala 402:20]
  wire [1:0] pe_7_io_m_7_sel; // @[PE_8IP.scala 402:20]
  wire [1:0] pe_7_io_m_8_sel; // @[PE_8IP.scala 402:20]
  wire [1:0] pe_7_io_m_9_sel; // @[PE_8IP.scala 402:20]
  wire  pe_7_io_addsub_0_op; // @[PE_8IP.scala 402:20]
  wire  pe_7_io_addsub_1_op; // @[PE_8IP.scala 402:20]
  wire [2:0] pe_7_io_rounding; // @[PE_8IP.scala 402:20]
  wire  pe_7_io_use_int; // @[PE_8IP.scala 402:20]
  wire [31:0] pe_7_io_out_0; // @[PE_8IP.scala 402:20]
  wire [31:0] pe_7_io_out_1; // @[PE_8IP.scala 402:20]
  wire  addsubModule_0_clock; // @[PE_8IP.scala 461:30]
  wire  addsubModule_0_reset; // @[PE_8IP.scala 461:30]
  wire  addsubModule_0_io_use_int; // @[PE_8IP.scala 461:30]
  wire  addsubModule_0_io_op; // @[PE_8IP.scala 461:30]
  wire [2:0] addsubModule_0_io_rounding; // @[PE_8IP.scala 461:30]
  wire [31:0] addsubModule_0_io_in_0; // @[PE_8IP.scala 461:30]
  wire [31:0] addsubModule_0_io_in_1; // @[PE_8IP.scala 461:30]
  wire [31:0] addsubModule_0_io_out; // @[PE_8IP.scala 461:30]
  reg [31:0] Xi_0_in_0; // @[PE_8IP.scala 79:27]
  reg [31:0] Yi_0_in_0; // @[PE_8IP.scala 80:27]
  reg [31:0] Xi_0_in_1; // @[PE_8IP.scala 81:27]
  reg [31:0] Yi_0_in_1; // @[PE_8IP.scala 82:27]
  reg [31:0] aggr_0_in_0; // @[PE_8IP.scala 83:29]
  reg [31:0] aggr_0_in_1; // @[PE_8IP.scala 84:29]
  reg [31:0] aggr_0_in_2; // @[PE_8IP.scala 85:29]
  reg [31:0] aggr_0_in_3; // @[PE_8IP.scala 86:29]
  reg [31:0] Xi_1_in_0; // @[PE_8IP.scala 88:27]
  reg [31:0] Yi_1_in_0; // @[PE_8IP.scala 89:27]
  reg [31:0] Xi_1_in_1; // @[PE_8IP.scala 90:27]
  reg [31:0] Yi_1_in_1; // @[PE_8IP.scala 91:27]
  reg [31:0] aggr_1_in_0; // @[PE_8IP.scala 92:29]
  reg [31:0] aggr_1_in_1; // @[PE_8IP.scala 93:29]
  reg [31:0] aggr_1_in_2; // @[PE_8IP.scala 94:29]
  reg [31:0] aggr_1_in_3; // @[PE_8IP.scala 95:29]
  reg [31:0] Xi_2_in_0; // @[PE_8IP.scala 97:27]
  reg [31:0] Yi_2_in_0; // @[PE_8IP.scala 98:27]
  reg [31:0] Xi_2_in_1; // @[PE_8IP.scala 99:27]
  reg [31:0] Yi_2_in_1; // @[PE_8IP.scala 100:27]
  reg [31:0] aggr_2_in_0; // @[PE_8IP.scala 101:29]
  reg [31:0] aggr_2_in_1; // @[PE_8IP.scala 102:29]
  reg [31:0] aggr_2_in_2; // @[PE_8IP.scala 103:29]
  reg [31:0] aggr_2_in_3; // @[PE_8IP.scala 104:29]
  reg [31:0] Xi_3_in_0; // @[PE_8IP.scala 106:27]
  reg [31:0] Yi_3_in_0; // @[PE_8IP.scala 107:27]
  reg [31:0] Xi_3_in_1; // @[PE_8IP.scala 108:27]
  reg [31:0] Yi_3_in_1; // @[PE_8IP.scala 109:27]
  reg [31:0] aggr_3_in_0; // @[PE_8IP.scala 110:29]
  reg [31:0] aggr_3_in_1; // @[PE_8IP.scala 111:29]
  reg [31:0] aggr_3_in_2; // @[PE_8IP.scala 112:29]
  reg [31:0] aggr_3_in_3; // @[PE_8IP.scala 113:29]
  reg [31:0] Xi_4_in_0; // @[PE_8IP.scala 115:27]
  reg [31:0] Yi_4_in_0; // @[PE_8IP.scala 116:27]
  reg [31:0] Xi_4_in_1; // @[PE_8IP.scala 117:27]
  reg [31:0] Yi_4_in_1; // @[PE_8IP.scala 118:27]
  reg [31:0] Xi_5_in_0; // @[PE_8IP.scala 124:27]
  reg [31:0] Yi_5_in_0; // @[PE_8IP.scala 125:27]
  reg [31:0] Xi_5_in_1; // @[PE_8IP.scala 126:27]
  reg [31:0] Yi_5_in_1; // @[PE_8IP.scala 127:27]
  reg [31:0] Xi_6_in_0; // @[PE_8IP.scala 133:27]
  reg [31:0] Yi_6_in_0; // @[PE_8IP.scala 134:27]
  reg [31:0] Xi_6_in_1; // @[PE_8IP.scala 135:27]
  reg [31:0] Yi_6_in_1; // @[PE_8IP.scala 136:27]
  reg [31:0] Xi_7_in_0; // @[PE_8IP.scala 142:27]
  reg [31:0] Yi_7_in_0; // @[PE_8IP.scala 143:27]
  reg [31:0] Xi_7_in_1; // @[PE_8IP.scala 144:27]
  reg [31:0] Yi_7_in_1; // @[PE_8IP.scala 145:27]
  reg [1:0] m_0_sel; // @[PE_8IP.scala 154:25]
  reg [1:0] m_1_sel; // @[PE_8IP.scala 155:25]
  reg [1:0] m_2_sel; // @[PE_8IP.scala 156:25]
  reg [1:0] m_3_sel; // @[PE_8IP.scala 157:25]
  reg [1:0] m_4_sel; // @[PE_8IP.scala 158:25]
  reg [1:0] m_5_sel; // @[PE_8IP.scala 159:25]
  reg [1:0] m_6_sel; // @[PE_8IP.scala 160:25]
  reg [1:0] m_7_sel; // @[PE_8IP.scala 161:25]
  reg [1:0] m_8_sel; // @[PE_8IP.scala 162:25]
  reg [1:0] m_9_sel; // @[PE_8IP.scala 163:25]
  reg [1:0] addsub_0_op; // @[PE_8IP.scala 166:30]
  reg [1:0] addsub_1_op; // @[PE_8IP.scala 167:30]
  reg [2:0] rounding; // @[PE_8IP.scala 170:29]
  reg  use_int; // @[PE_8IP.scala 174:29]
  reg [31:0] pe_0_out_0; // @[PE_8IP.scala 179:29]
  reg [31:0] pe_0_out_1; // @[PE_8IP.scala 180:29]
  reg [31:0] pe_1_out_0; // @[PE_8IP.scala 181:29]
  reg [31:0] pe_1_out_1; // @[PE_8IP.scala 182:29]
  reg [31:0] pe_2_out_0; // @[PE_8IP.scala 183:29]
  reg [31:0] pe_2_out_1; // @[PE_8IP.scala 184:29]
  reg [31:0] pe_3_out_0; // @[PE_8IP.scala 185:29]
  reg [31:0] pe_3_out_1; // @[PE_8IP.scala 186:29]
  reg [31:0] pe_4_out_0; // @[PE_8IP.scala 187:29]
  reg [31:0] pe_4_out_1; // @[PE_8IP.scala 188:29]
  reg [31:0] pe_5_out_0; // @[PE_8IP.scala 189:29]
  reg [31:0] pe_5_out_1; // @[PE_8IP.scala 190:29]
  reg [31:0] pe_6_out_0; // @[PE_8IP.scala 191:29]
  reg [31:0] pe_6_out_1; // @[PE_8IP.scala 192:29]
  reg [31:0] pe_7_out_0; // @[PE_8IP.scala 193:29]
  reg [31:0] pe_7_out_1; // @[PE_8IP.scala 194:29]
  reg [31:0] addsum_in_0; // @[PE_8IP.scala 202:28]
  reg [31:0] addsum_in_1; // @[PE_8IP.scala 203:28]
  PE pe_0 ( // @[PE_8IP.scala 208:20]
    .clock(pe_0_clock),
    .reset(pe_0_reset),
    .io_Xi_0(pe_0_io_Xi_0),
    .io_Yi_0(pe_0_io_Yi_0),
    .io_Xi_1(pe_0_io_Xi_1),
    .io_Yi_1(pe_0_io_Yi_1),
    .io_aggr_0(pe_0_io_aggr_0),
    .io_aggr_1(pe_0_io_aggr_1),
    .io_aggr_2(pe_0_io_aggr_2),
    .io_aggr_3(pe_0_io_aggr_3),
    .io_m_0_sel(pe_0_io_m_0_sel),
    .io_m_1_sel(pe_0_io_m_1_sel),
    .io_m_2_sel(pe_0_io_m_2_sel),
    .io_m_3_sel(pe_0_io_m_3_sel),
    .io_m_4_sel(pe_0_io_m_4_sel),
    .io_m_5_sel(pe_0_io_m_5_sel),
    .io_m_6_sel(pe_0_io_m_6_sel),
    .io_m_7_sel(pe_0_io_m_7_sel),
    .io_m_8_sel(pe_0_io_m_8_sel),
    .io_m_9_sel(pe_0_io_m_9_sel),
    .io_addsub_0_op(pe_0_io_addsub_0_op),
    .io_addsub_1_op(pe_0_io_addsub_1_op),
    .io_rounding(pe_0_io_rounding),
    .io_use_int(pe_0_io_use_int),
    .io_out_0(pe_0_io_out_0),
    .io_out_1(pe_0_io_out_1)
  );
  PE pe_1 ( // @[PE_8IP.scala 236:20]
    .clock(pe_1_clock),
    .reset(pe_1_reset),
    .io_Xi_0(pe_1_io_Xi_0),
    .io_Yi_0(pe_1_io_Yi_0),
    .io_Xi_1(pe_1_io_Xi_1),
    .io_Yi_1(pe_1_io_Yi_1),
    .io_aggr_0(pe_1_io_aggr_0),
    .io_aggr_1(pe_1_io_aggr_1),
    .io_aggr_2(pe_1_io_aggr_2),
    .io_aggr_3(pe_1_io_aggr_3),
    .io_m_0_sel(pe_1_io_m_0_sel),
    .io_m_1_sel(pe_1_io_m_1_sel),
    .io_m_2_sel(pe_1_io_m_2_sel),
    .io_m_3_sel(pe_1_io_m_3_sel),
    .io_m_4_sel(pe_1_io_m_4_sel),
    .io_m_5_sel(pe_1_io_m_5_sel),
    .io_m_6_sel(pe_1_io_m_6_sel),
    .io_m_7_sel(pe_1_io_m_7_sel),
    .io_m_8_sel(pe_1_io_m_8_sel),
    .io_m_9_sel(pe_1_io_m_9_sel),
    .io_addsub_0_op(pe_1_io_addsub_0_op),
    .io_addsub_1_op(pe_1_io_addsub_1_op),
    .io_rounding(pe_1_io_rounding),
    .io_use_int(pe_1_io_use_int),
    .io_out_0(pe_1_io_out_0),
    .io_out_1(pe_1_io_out_1)
  );
  PE pe_2 ( // @[PE_8IP.scala 264:20]
    .clock(pe_2_clock),
    .reset(pe_2_reset),
    .io_Xi_0(pe_2_io_Xi_0),
    .io_Yi_0(pe_2_io_Yi_0),
    .io_Xi_1(pe_2_io_Xi_1),
    .io_Yi_1(pe_2_io_Yi_1),
    .io_aggr_0(pe_2_io_aggr_0),
    .io_aggr_1(pe_2_io_aggr_1),
    .io_aggr_2(pe_2_io_aggr_2),
    .io_aggr_3(pe_2_io_aggr_3),
    .io_m_0_sel(pe_2_io_m_0_sel),
    .io_m_1_sel(pe_2_io_m_1_sel),
    .io_m_2_sel(pe_2_io_m_2_sel),
    .io_m_3_sel(pe_2_io_m_3_sel),
    .io_m_4_sel(pe_2_io_m_4_sel),
    .io_m_5_sel(pe_2_io_m_5_sel),
    .io_m_6_sel(pe_2_io_m_6_sel),
    .io_m_7_sel(pe_2_io_m_7_sel),
    .io_m_8_sel(pe_2_io_m_8_sel),
    .io_m_9_sel(pe_2_io_m_9_sel),
    .io_addsub_0_op(pe_2_io_addsub_0_op),
    .io_addsub_1_op(pe_2_io_addsub_1_op),
    .io_rounding(pe_2_io_rounding),
    .io_use_int(pe_2_io_use_int),
    .io_out_0(pe_2_io_out_0),
    .io_out_1(pe_2_io_out_1)
  );
  PE pe_3 ( // @[PE_8IP.scala 291:20]
    .clock(pe_3_clock),
    .reset(pe_3_reset),
    .io_Xi_0(pe_3_io_Xi_0),
    .io_Yi_0(pe_3_io_Yi_0),
    .io_Xi_1(pe_3_io_Xi_1),
    .io_Yi_1(pe_3_io_Yi_1),
    .io_aggr_0(pe_3_io_aggr_0),
    .io_aggr_1(pe_3_io_aggr_1),
    .io_aggr_2(pe_3_io_aggr_2),
    .io_aggr_3(pe_3_io_aggr_3),
    .io_m_0_sel(pe_3_io_m_0_sel),
    .io_m_1_sel(pe_3_io_m_1_sel),
    .io_m_2_sel(pe_3_io_m_2_sel),
    .io_m_3_sel(pe_3_io_m_3_sel),
    .io_m_4_sel(pe_3_io_m_4_sel),
    .io_m_5_sel(pe_3_io_m_5_sel),
    .io_m_6_sel(pe_3_io_m_6_sel),
    .io_m_7_sel(pe_3_io_m_7_sel),
    .io_m_8_sel(pe_3_io_m_8_sel),
    .io_m_9_sel(pe_3_io_m_9_sel),
    .io_addsub_0_op(pe_3_io_addsub_0_op),
    .io_addsub_1_op(pe_3_io_addsub_1_op),
    .io_rounding(pe_3_io_rounding),
    .io_use_int(pe_3_io_use_int),
    .io_out_0(pe_3_io_out_0),
    .io_out_1(pe_3_io_out_1)
  );
  PE pe_4 ( // @[PE_8IP.scala 319:20]
    .clock(pe_4_clock),
    .reset(pe_4_reset),
    .io_Xi_0(pe_4_io_Xi_0),
    .io_Yi_0(pe_4_io_Yi_0),
    .io_Xi_1(pe_4_io_Xi_1),
    .io_Yi_1(pe_4_io_Yi_1),
    .io_aggr_0(pe_4_io_aggr_0),
    .io_aggr_1(pe_4_io_aggr_1),
    .io_aggr_2(pe_4_io_aggr_2),
    .io_aggr_3(pe_4_io_aggr_3),
    .io_m_0_sel(pe_4_io_m_0_sel),
    .io_m_1_sel(pe_4_io_m_1_sel),
    .io_m_2_sel(pe_4_io_m_2_sel),
    .io_m_3_sel(pe_4_io_m_3_sel),
    .io_m_4_sel(pe_4_io_m_4_sel),
    .io_m_5_sel(pe_4_io_m_5_sel),
    .io_m_6_sel(pe_4_io_m_6_sel),
    .io_m_7_sel(pe_4_io_m_7_sel),
    .io_m_8_sel(pe_4_io_m_8_sel),
    .io_m_9_sel(pe_4_io_m_9_sel),
    .io_addsub_0_op(pe_4_io_addsub_0_op),
    .io_addsub_1_op(pe_4_io_addsub_1_op),
    .io_rounding(pe_4_io_rounding),
    .io_use_int(pe_4_io_use_int),
    .io_out_0(pe_4_io_out_0),
    .io_out_1(pe_4_io_out_1)
  );
  PE pe_5 ( // @[PE_8IP.scala 347:20]
    .clock(pe_5_clock),
    .reset(pe_5_reset),
    .io_Xi_0(pe_5_io_Xi_0),
    .io_Yi_0(pe_5_io_Yi_0),
    .io_Xi_1(pe_5_io_Xi_1),
    .io_Yi_1(pe_5_io_Yi_1),
    .io_aggr_0(pe_5_io_aggr_0),
    .io_aggr_1(pe_5_io_aggr_1),
    .io_aggr_2(pe_5_io_aggr_2),
    .io_aggr_3(pe_5_io_aggr_3),
    .io_m_0_sel(pe_5_io_m_0_sel),
    .io_m_1_sel(pe_5_io_m_1_sel),
    .io_m_2_sel(pe_5_io_m_2_sel),
    .io_m_3_sel(pe_5_io_m_3_sel),
    .io_m_4_sel(pe_5_io_m_4_sel),
    .io_m_5_sel(pe_5_io_m_5_sel),
    .io_m_6_sel(pe_5_io_m_6_sel),
    .io_m_7_sel(pe_5_io_m_7_sel),
    .io_m_8_sel(pe_5_io_m_8_sel),
    .io_m_9_sel(pe_5_io_m_9_sel),
    .io_addsub_0_op(pe_5_io_addsub_0_op),
    .io_addsub_1_op(pe_5_io_addsub_1_op),
    .io_rounding(pe_5_io_rounding),
    .io_use_int(pe_5_io_use_int),
    .io_out_0(pe_5_io_out_0),
    .io_out_1(pe_5_io_out_1)
  );
  PE pe_6 ( // @[PE_8IP.scala 375:20]
    .clock(pe_6_clock),
    .reset(pe_6_reset),
    .io_Xi_0(pe_6_io_Xi_0),
    .io_Yi_0(pe_6_io_Yi_0),
    .io_Xi_1(pe_6_io_Xi_1),
    .io_Yi_1(pe_6_io_Yi_1),
    .io_aggr_0(pe_6_io_aggr_0),
    .io_aggr_1(pe_6_io_aggr_1),
    .io_aggr_2(pe_6_io_aggr_2),
    .io_aggr_3(pe_6_io_aggr_3),
    .io_m_0_sel(pe_6_io_m_0_sel),
    .io_m_1_sel(pe_6_io_m_1_sel),
    .io_m_2_sel(pe_6_io_m_2_sel),
    .io_m_3_sel(pe_6_io_m_3_sel),
    .io_m_4_sel(pe_6_io_m_4_sel),
    .io_m_5_sel(pe_6_io_m_5_sel),
    .io_m_6_sel(pe_6_io_m_6_sel),
    .io_m_7_sel(pe_6_io_m_7_sel),
    .io_m_8_sel(pe_6_io_m_8_sel),
    .io_m_9_sel(pe_6_io_m_9_sel),
    .io_addsub_0_op(pe_6_io_addsub_0_op),
    .io_addsub_1_op(pe_6_io_addsub_1_op),
    .io_rounding(pe_6_io_rounding),
    .io_use_int(pe_6_io_use_int),
    .io_out_0(pe_6_io_out_0),
    .io_out_1(pe_6_io_out_1)
  );
  PE pe_7 ( // @[PE_8IP.scala 402:20]
    .clock(pe_7_clock),
    .reset(pe_7_reset),
    .io_Xi_0(pe_7_io_Xi_0),
    .io_Yi_0(pe_7_io_Yi_0),
    .io_Xi_1(pe_7_io_Xi_1),
    .io_Yi_1(pe_7_io_Yi_1),
    .io_aggr_0(pe_7_io_aggr_0),
    .io_aggr_1(pe_7_io_aggr_1),
    .io_aggr_2(pe_7_io_aggr_2),
    .io_aggr_3(pe_7_io_aggr_3),
    .io_m_0_sel(pe_7_io_m_0_sel),
    .io_m_1_sel(pe_7_io_m_1_sel),
    .io_m_2_sel(pe_7_io_m_2_sel),
    .io_m_3_sel(pe_7_io_m_3_sel),
    .io_m_4_sel(pe_7_io_m_4_sel),
    .io_m_5_sel(pe_7_io_m_5_sel),
    .io_m_6_sel(pe_7_io_m_6_sel),
    .io_m_7_sel(pe_7_io_m_7_sel),
    .io_m_8_sel(pe_7_io_m_8_sel),
    .io_m_9_sel(pe_7_io_m_9_sel),
    .io_addsub_0_op(pe_7_io_addsub_0_op),
    .io_addsub_1_op(pe_7_io_addsub_1_op),
    .io_rounding(pe_7_io_rounding),
    .io_use_int(pe_7_io_use_int),
    .io_out_0(pe_7_io_out_0),
    .io_out_1(pe_7_io_out_1)
  );
  AddSubPE addsubModule_0 ( // @[PE_8IP.scala 461:30]
    .clock(addsubModule_0_clock),
    .reset(addsubModule_0_reset),
    .io_use_int(addsubModule_0_io_use_int),
    .io_op(addsubModule_0_io_op),
    .io_rounding(addsubModule_0_io_rounding),
    .io_in_0(addsubModule_0_io_in_0),
    .io_in_1(addsubModule_0_io_in_1),
    .io_out(addsubModule_0_io_out)
  );
  assign io_out = addsubModule_0_io_out; // @[PE_8IP.scala 472:11]
  assign pe_0_clock = clock;
  assign pe_0_reset = reset;
  assign pe_0_io_Xi_0 = Xi_0_in_0; // @[PE_8IP.scala 209:16]
  assign pe_0_io_Yi_0 = Yi_0_in_0; // @[PE_8IP.scala 210:16]
  assign pe_0_io_Xi_1 = Xi_0_in_1; // @[PE_8IP.scala 211:16]
  assign pe_0_io_Yi_1 = Yi_0_in_1; // @[PE_8IP.scala 212:16]
  assign pe_0_io_aggr_0 = aggr_0_in_0; // @[PE_8IP.scala 213:22]
  assign pe_0_io_aggr_1 = aggr_0_in_1; // @[PE_8IP.scala 214:22]
  assign pe_0_io_aggr_2 = aggr_0_in_2; // @[PE_8IP.scala 215:22]
  assign pe_0_io_aggr_3 = aggr_0_in_3; // @[PE_8IP.scala 216:22]
  assign pe_0_io_m_0_sel = m_0_sel; // @[PE_8IP.scala 217:22]
  assign pe_0_io_m_1_sel = m_1_sel; // @[PE_8IP.scala 218:22]
  assign pe_0_io_m_2_sel = m_2_sel; // @[PE_8IP.scala 219:22]
  assign pe_0_io_m_3_sel = m_3_sel; // @[PE_8IP.scala 220:22]
  assign pe_0_io_m_4_sel = m_4_sel; // @[PE_8IP.scala 221:22]
  assign pe_0_io_m_5_sel = m_5_sel; // @[PE_8IP.scala 222:22]
  assign pe_0_io_m_6_sel = m_6_sel; // @[PE_8IP.scala 223:22]
  assign pe_0_io_m_7_sel = m_7_sel; // @[PE_8IP.scala 224:22]
  assign pe_0_io_m_8_sel = m_8_sel; // @[PE_8IP.scala 225:22]
  assign pe_0_io_m_9_sel = m_9_sel; // @[PE_8IP.scala 226:22]
  assign pe_0_io_addsub_0_op = addsub_0_op[0]; // @[PE_8IP.scala 227:23]
  assign pe_0_io_addsub_1_op = addsub_1_op[0]; // @[PE_8IP.scala 228:23]
  assign pe_0_io_rounding = rounding; // @[PE_8IP.scala 229:23]
  assign pe_0_io_use_int = use_int; // @[PE_8IP.scala 231:23]
  assign pe_1_clock = clock;
  assign pe_1_reset = reset;
  assign pe_1_io_Xi_0 = Xi_1_in_0; // @[PE_8IP.scala 237:16]
  assign pe_1_io_Yi_0 = Yi_1_in_0; // @[PE_8IP.scala 238:16]
  assign pe_1_io_Xi_1 = Xi_1_in_1; // @[PE_8IP.scala 239:16]
  assign pe_1_io_Yi_1 = Yi_1_in_1; // @[PE_8IP.scala 240:16]
  assign pe_1_io_aggr_0 = aggr_1_in_0; // @[PE_8IP.scala 241:22]
  assign pe_1_io_aggr_1 = aggr_1_in_1; // @[PE_8IP.scala 242:22]
  assign pe_1_io_aggr_2 = aggr_1_in_2; // @[PE_8IP.scala 243:22]
  assign pe_1_io_aggr_3 = aggr_1_in_3; // @[PE_8IP.scala 244:22]
  assign pe_1_io_m_0_sel = m_0_sel; // @[PE_8IP.scala 245:23]
  assign pe_1_io_m_1_sel = m_1_sel; // @[PE_8IP.scala 246:23]
  assign pe_1_io_m_2_sel = m_2_sel; // @[PE_8IP.scala 247:23]
  assign pe_1_io_m_3_sel = m_3_sel; // @[PE_8IP.scala 248:23]
  assign pe_1_io_m_4_sel = m_4_sel; // @[PE_8IP.scala 249:23]
  assign pe_1_io_m_5_sel = m_5_sel; // @[PE_8IP.scala 250:23]
  assign pe_1_io_m_6_sel = m_6_sel; // @[PE_8IP.scala 251:23]
  assign pe_1_io_m_7_sel = m_7_sel; // @[PE_8IP.scala 252:23]
  assign pe_1_io_m_8_sel = m_8_sel; // @[PE_8IP.scala 253:23]
  assign pe_1_io_m_9_sel = m_9_sel; // @[PE_8IP.scala 254:23]
  assign pe_1_io_addsub_0_op = addsub_0_op[0]; // @[PE_8IP.scala 255:23]
  assign pe_1_io_addsub_1_op = addsub_1_op[0]; // @[PE_8IP.scala 256:23]
  assign pe_1_io_rounding = rounding; // @[PE_8IP.scala 257:23]
  assign pe_1_io_use_int = use_int; // @[PE_8IP.scala 259:23]
  assign pe_2_clock = clock;
  assign pe_2_reset = reset;
  assign pe_2_io_Xi_0 = Xi_2_in_0; // @[PE_8IP.scala 265:16]
  assign pe_2_io_Yi_0 = Yi_2_in_0; // @[PE_8IP.scala 266:16]
  assign pe_2_io_Xi_1 = Xi_2_in_1; // @[PE_8IP.scala 267:16]
  assign pe_2_io_Yi_1 = Yi_2_in_1; // @[PE_8IP.scala 268:16]
  assign pe_2_io_aggr_0 = aggr_2_in_0; // @[PE_8IP.scala 269:22]
  assign pe_2_io_aggr_1 = aggr_2_in_1; // @[PE_8IP.scala 270:22]
  assign pe_2_io_aggr_2 = aggr_2_in_2; // @[PE_8IP.scala 271:22]
  assign pe_2_io_aggr_3 = aggr_2_in_3; // @[PE_8IP.scala 272:22]
  assign pe_2_io_m_0_sel = m_0_sel; // @[PE_8IP.scala 273:23]
  assign pe_2_io_m_1_sel = m_1_sel; // @[PE_8IP.scala 274:23]
  assign pe_2_io_m_2_sel = m_2_sel; // @[PE_8IP.scala 275:23]
  assign pe_2_io_m_3_sel = m_3_sel; // @[PE_8IP.scala 276:23]
  assign pe_2_io_m_4_sel = m_4_sel; // @[PE_8IP.scala 277:23]
  assign pe_2_io_m_5_sel = m_5_sel; // @[PE_8IP.scala 278:23]
  assign pe_2_io_m_6_sel = m_6_sel; // @[PE_8IP.scala 279:23]
  assign pe_2_io_m_7_sel = m_7_sel; // @[PE_8IP.scala 280:23]
  assign pe_2_io_m_8_sel = m_8_sel; // @[PE_8IP.scala 281:23]
  assign pe_2_io_m_9_sel = m_9_sel; // @[PE_8IP.scala 282:23]
  assign pe_2_io_addsub_0_op = addsub_0_op[0]; // @[PE_8IP.scala 283:23]
  assign pe_2_io_addsub_1_op = addsub_1_op[0]; // @[PE_8IP.scala 284:23]
  assign pe_2_io_rounding = rounding; // @[PE_8IP.scala 285:23]
  assign pe_2_io_use_int = use_int; // @[PE_8IP.scala 287:23]
  assign pe_3_clock = clock;
  assign pe_3_reset = reset;
  assign pe_3_io_Xi_0 = Xi_3_in_0; // @[PE_8IP.scala 292:16]
  assign pe_3_io_Yi_0 = Yi_3_in_0; // @[PE_8IP.scala 293:16]
  assign pe_3_io_Xi_1 = Xi_3_in_1; // @[PE_8IP.scala 294:16]
  assign pe_3_io_Yi_1 = Yi_3_in_1; // @[PE_8IP.scala 295:16]
  assign pe_3_io_aggr_0 = aggr_3_in_0; // @[PE_8IP.scala 296:22]
  assign pe_3_io_aggr_1 = aggr_3_in_1; // @[PE_8IP.scala 297:22]
  assign pe_3_io_aggr_2 = aggr_3_in_2; // @[PE_8IP.scala 298:22]
  assign pe_3_io_aggr_3 = aggr_3_in_3; // @[PE_8IP.scala 299:22]
  assign pe_3_io_m_0_sel = m_0_sel; // @[PE_8IP.scala 300:23]
  assign pe_3_io_m_1_sel = m_1_sel; // @[PE_8IP.scala 301:23]
  assign pe_3_io_m_2_sel = m_2_sel; // @[PE_8IP.scala 302:23]
  assign pe_3_io_m_3_sel = m_3_sel; // @[PE_8IP.scala 303:23]
  assign pe_3_io_m_4_sel = m_4_sel; // @[PE_8IP.scala 304:23]
  assign pe_3_io_m_5_sel = m_5_sel; // @[PE_8IP.scala 305:23]
  assign pe_3_io_m_6_sel = m_6_sel; // @[PE_8IP.scala 306:23]
  assign pe_3_io_m_7_sel = m_7_sel; // @[PE_8IP.scala 307:23]
  assign pe_3_io_m_8_sel = m_8_sel; // @[PE_8IP.scala 308:23]
  assign pe_3_io_m_9_sel = m_9_sel; // @[PE_8IP.scala 309:23]
  assign pe_3_io_addsub_0_op = addsub_0_op[0]; // @[PE_8IP.scala 310:23]
  assign pe_3_io_addsub_1_op = addsub_1_op[0]; // @[PE_8IP.scala 311:23]
  assign pe_3_io_rounding = rounding; // @[PE_8IP.scala 312:23]
  assign pe_3_io_use_int = use_int; // @[PE_8IP.scala 314:23]
  assign pe_4_clock = clock;
  assign pe_4_reset = reset;
  assign pe_4_io_Xi_0 = Xi_4_in_0; // @[PE_8IP.scala 320:16]
  assign pe_4_io_Yi_0 = Yi_4_in_0; // @[PE_8IP.scala 321:16]
  assign pe_4_io_Xi_1 = Xi_4_in_1; // @[PE_8IP.scala 322:16]
  assign pe_4_io_Yi_1 = Yi_4_in_1; // @[PE_8IP.scala 323:16]
  assign pe_4_io_aggr_0 = 32'h0; // @[PE_8IP.scala 324:22]
  assign pe_4_io_aggr_1 = 32'h0; // @[PE_8IP.scala 325:22]
  assign pe_4_io_aggr_2 = 32'h0; // @[PE_8IP.scala 326:22]
  assign pe_4_io_aggr_3 = 32'h0; // @[PE_8IP.scala 327:22]
  assign pe_4_io_m_0_sel = m_0_sel; // @[PE_8IP.scala 328:22]
  assign pe_4_io_m_1_sel = m_1_sel; // @[PE_8IP.scala 329:22]
  assign pe_4_io_m_2_sel = m_2_sel; // @[PE_8IP.scala 330:22]
  assign pe_4_io_m_3_sel = m_3_sel; // @[PE_8IP.scala 331:22]
  assign pe_4_io_m_4_sel = m_4_sel; // @[PE_8IP.scala 332:22]
  assign pe_4_io_m_5_sel = m_5_sel; // @[PE_8IP.scala 333:22]
  assign pe_4_io_m_6_sel = m_6_sel; // @[PE_8IP.scala 334:22]
  assign pe_4_io_m_7_sel = m_7_sel; // @[PE_8IP.scala 335:22]
  assign pe_4_io_m_8_sel = m_8_sel; // @[PE_8IP.scala 336:22]
  assign pe_4_io_m_9_sel = m_9_sel; // @[PE_8IP.scala 337:22]
  assign pe_4_io_addsub_0_op = addsub_0_op[0]; // @[PE_8IP.scala 338:23]
  assign pe_4_io_addsub_1_op = addsub_1_op[0]; // @[PE_8IP.scala 339:23]
  assign pe_4_io_rounding = rounding; // @[PE_8IP.scala 340:23]
  assign pe_4_io_use_int = use_int; // @[PE_8IP.scala 342:23]
  assign pe_5_clock = clock;
  assign pe_5_reset = reset;
  assign pe_5_io_Xi_0 = Xi_5_in_0; // @[PE_8IP.scala 348:16]
  assign pe_5_io_Yi_0 = Yi_5_in_0; // @[PE_8IP.scala 349:16]
  assign pe_5_io_Xi_1 = Xi_5_in_1; // @[PE_8IP.scala 350:16]
  assign pe_5_io_Yi_1 = Yi_5_in_1; // @[PE_8IP.scala 351:16]
  assign pe_5_io_aggr_0 = 32'h0; // @[PE_8IP.scala 352:22]
  assign pe_5_io_aggr_1 = 32'h0; // @[PE_8IP.scala 353:22]
  assign pe_5_io_aggr_2 = 32'h0; // @[PE_8IP.scala 354:22]
  assign pe_5_io_aggr_3 = 32'h0; // @[PE_8IP.scala 355:22]
  assign pe_5_io_m_0_sel = m_0_sel; // @[PE_8IP.scala 356:23]
  assign pe_5_io_m_1_sel = m_1_sel; // @[PE_8IP.scala 357:23]
  assign pe_5_io_m_2_sel = m_2_sel; // @[PE_8IP.scala 358:23]
  assign pe_5_io_m_3_sel = m_3_sel; // @[PE_8IP.scala 359:23]
  assign pe_5_io_m_4_sel = m_4_sel; // @[PE_8IP.scala 360:23]
  assign pe_5_io_m_5_sel = m_5_sel; // @[PE_8IP.scala 361:23]
  assign pe_5_io_m_6_sel = m_6_sel; // @[PE_8IP.scala 362:23]
  assign pe_5_io_m_7_sel = m_7_sel; // @[PE_8IP.scala 363:23]
  assign pe_5_io_m_8_sel = m_8_sel; // @[PE_8IP.scala 364:23]
  assign pe_5_io_m_9_sel = m_9_sel; // @[PE_8IP.scala 365:23]
  assign pe_5_io_addsub_0_op = addsub_0_op[0]; // @[PE_8IP.scala 366:23]
  assign pe_5_io_addsub_1_op = addsub_1_op[0]; // @[PE_8IP.scala 367:23]
  assign pe_5_io_rounding = rounding; // @[PE_8IP.scala 368:23]
  assign pe_5_io_use_int = use_int; // @[PE_8IP.scala 370:23]
  assign pe_6_clock = clock;
  assign pe_6_reset = reset;
  assign pe_6_io_Xi_0 = Xi_6_in_0; // @[PE_8IP.scala 376:16]
  assign pe_6_io_Yi_0 = Yi_6_in_0; // @[PE_8IP.scala 377:16]
  assign pe_6_io_Xi_1 = Xi_6_in_1; // @[PE_8IP.scala 378:16]
  assign pe_6_io_Yi_1 = Yi_6_in_1; // @[PE_8IP.scala 379:16]
  assign pe_6_io_aggr_0 = 32'h0; // @[PE_8IP.scala 380:22]
  assign pe_6_io_aggr_1 = 32'h0; // @[PE_8IP.scala 381:22]
  assign pe_6_io_aggr_2 = 32'h0; // @[PE_8IP.scala 382:22]
  assign pe_6_io_aggr_3 = 32'h0; // @[PE_8IP.scala 383:22]
  assign pe_6_io_m_0_sel = m_0_sel; // @[PE_8IP.scala 384:23]
  assign pe_6_io_m_1_sel = m_1_sel; // @[PE_8IP.scala 385:23]
  assign pe_6_io_m_2_sel = m_2_sel; // @[PE_8IP.scala 386:23]
  assign pe_6_io_m_3_sel = m_3_sel; // @[PE_8IP.scala 387:23]
  assign pe_6_io_m_4_sel = m_4_sel; // @[PE_8IP.scala 388:23]
  assign pe_6_io_m_5_sel = m_5_sel; // @[PE_8IP.scala 389:23]
  assign pe_6_io_m_6_sel = m_6_sel; // @[PE_8IP.scala 390:23]
  assign pe_6_io_m_7_sel = m_7_sel; // @[PE_8IP.scala 391:23]
  assign pe_6_io_m_8_sel = m_8_sel; // @[PE_8IP.scala 392:23]
  assign pe_6_io_m_9_sel = m_9_sel; // @[PE_8IP.scala 393:23]
  assign pe_6_io_addsub_0_op = addsub_0_op[0]; // @[PE_8IP.scala 394:23]
  assign pe_6_io_addsub_1_op = addsub_1_op[0]; // @[PE_8IP.scala 395:23]
  assign pe_6_io_rounding = rounding; // @[PE_8IP.scala 396:23]
  assign pe_6_io_use_int = use_int; // @[PE_8IP.scala 398:23]
  assign pe_7_clock = clock;
  assign pe_7_reset = reset;
  assign pe_7_io_Xi_0 = Xi_7_in_0; // @[PE_8IP.scala 403:16]
  assign pe_7_io_Yi_0 = Yi_7_in_0; // @[PE_8IP.scala 404:16]
  assign pe_7_io_Xi_1 = Xi_7_in_1; // @[PE_8IP.scala 405:16]
  assign pe_7_io_Yi_1 = Yi_7_in_1; // @[PE_8IP.scala 406:16]
  assign pe_7_io_aggr_0 = 32'h0; // @[PE_8IP.scala 407:22]
  assign pe_7_io_aggr_1 = 32'h0; // @[PE_8IP.scala 408:22]
  assign pe_7_io_aggr_2 = 32'h0; // @[PE_8IP.scala 409:22]
  assign pe_7_io_aggr_3 = 32'h0; // @[PE_8IP.scala 410:22]
  assign pe_7_io_m_0_sel = m_0_sel; // @[PE_8IP.scala 411:23]
  assign pe_7_io_m_1_sel = m_1_sel; // @[PE_8IP.scala 412:23]
  assign pe_7_io_m_2_sel = m_2_sel; // @[PE_8IP.scala 413:23]
  assign pe_7_io_m_3_sel = m_3_sel; // @[PE_8IP.scala 414:23]
  assign pe_7_io_m_4_sel = m_4_sel; // @[PE_8IP.scala 415:23]
  assign pe_7_io_m_5_sel = m_5_sel; // @[PE_8IP.scala 416:23]
  assign pe_7_io_m_6_sel = m_6_sel; // @[PE_8IP.scala 417:23]
  assign pe_7_io_m_7_sel = m_7_sel; // @[PE_8IP.scala 418:23]
  assign pe_7_io_m_8_sel = m_8_sel; // @[PE_8IP.scala 419:23]
  assign pe_7_io_m_9_sel = m_9_sel; // @[PE_8IP.scala 420:23]
  assign pe_7_io_addsub_0_op = addsub_0_op[0]; // @[PE_8IP.scala 421:23]
  assign pe_7_io_addsub_1_op = addsub_1_op[0]; // @[PE_8IP.scala 422:23]
  assign pe_7_io_rounding = rounding; // @[PE_8IP.scala 423:23]
  assign pe_7_io_use_int = use_int; // @[PE_8IP.scala 425:23]
  assign addsubModule_0_clock = clock;
  assign addsubModule_0_reset = reset;
  assign addsubModule_0_io_use_int = use_int; // @[PE_8IP.scala 465:32]
  assign addsubModule_0_io_op = 1'h0; // @[PE_8IP.scala 462:32]
  assign addsubModule_0_io_rounding = rounding; // @[PE_8IP.scala 463:32]
  assign addsubModule_0_io_in_0 = addsum_in_0; // @[PE_8IP.scala 466:32]
  assign addsubModule_0_io_in_1 = addsum_in_1; // @[PE_8IP.scala 467:32]
  always @(posedge clock) begin
    Xi_0_in_0 <= io_Xi_0_in_0; // @[PE_8IP.scala 79:27]
    Yi_0_in_0 <= io_Yi_0_in_0; // @[PE_8IP.scala 80:27]
    Xi_0_in_1 <= io_Xi_0_in_1; // @[PE_8IP.scala 81:27]
    Yi_0_in_1 <= io_Yi_0_in_1; // @[PE_8IP.scala 82:27]
    if (reset) begin // @[PE_8IP.scala 83:29]
      aggr_0_in_0 <= 32'h0; // @[PE_8IP.scala 83:29]
    end else begin
      aggr_0_in_0 <= pe_0_out_0; // @[PE_8IP.scala 433:15]
    end
    if (reset) begin // @[PE_8IP.scala 84:29]
      aggr_0_in_1 <= 32'h0; // @[PE_8IP.scala 84:29]
    end else begin
      aggr_0_in_1 <= pe_1_out_1; // @[PE_8IP.scala 434:15]
    end
    if (reset) begin // @[PE_8IP.scala 85:29]
      aggr_0_in_2 <= 32'h0; // @[PE_8IP.scala 85:29]
    end else begin
      aggr_0_in_2 <= pe_0_out_1; // @[PE_8IP.scala 435:15]
    end
    if (reset) begin // @[PE_8IP.scala 86:29]
      aggr_0_in_3 <= 32'h0; // @[PE_8IP.scala 86:29]
    end else begin
      aggr_0_in_3 <= pe_1_out_0; // @[PE_8IP.scala 436:15]
    end
    Xi_1_in_0 <= io_Xi_1_in_0; // @[PE_8IP.scala 88:27]
    Yi_1_in_0 <= io_Yi_1_in_0; // @[PE_8IP.scala 89:27]
    Xi_1_in_1 <= io_Xi_1_in_1; // @[PE_8IP.scala 90:27]
    Yi_1_in_1 <= io_Yi_1_in_1; // @[PE_8IP.scala 91:27]
    if (reset) begin // @[PE_8IP.scala 92:29]
      aggr_1_in_0 <= 32'h0; // @[PE_8IP.scala 92:29]
    end else begin
      aggr_1_in_0 <= pe_2_out_0; // @[PE_8IP.scala 442:15]
    end
    if (reset) begin // @[PE_8IP.scala 93:29]
      aggr_1_in_1 <= 32'h0; // @[PE_8IP.scala 93:29]
    end else begin
      aggr_1_in_1 <= pe_2_out_1; // @[PE_8IP.scala 443:15]
    end
    if (reset) begin // @[PE_8IP.scala 94:29]
      aggr_1_in_2 <= 32'h0; // @[PE_8IP.scala 94:29]
    end else begin
      aggr_1_in_2 <= pe_3_out_0; // @[PE_8IP.scala 444:15]
    end
    if (reset) begin // @[PE_8IP.scala 95:29]
      aggr_1_in_3 <= 32'h0; // @[PE_8IP.scala 95:29]
    end else begin
      aggr_1_in_3 <= pe_3_out_1; // @[PE_8IP.scala 445:15]
    end
    Xi_2_in_0 <= io_Xi_2_in_0; // @[PE_8IP.scala 97:27]
    Yi_2_in_0 <= io_Yi_2_in_0; // @[PE_8IP.scala 98:27]
    Xi_2_in_1 <= io_Xi_2_in_1; // @[PE_8IP.scala 99:27]
    Yi_2_in_1 <= io_Yi_2_in_1; // @[PE_8IP.scala 100:27]
    if (reset) begin // @[PE_8IP.scala 101:29]
      aggr_2_in_0 <= 32'h0; // @[PE_8IP.scala 101:29]
    end else begin
      aggr_2_in_0 <= pe_4_out_0; // @[PE_8IP.scala 447:15]
    end
    if (reset) begin // @[PE_8IP.scala 102:29]
      aggr_2_in_1 <= 32'h0; // @[PE_8IP.scala 102:29]
    end else begin
      aggr_2_in_1 <= pe_4_out_1; // @[PE_8IP.scala 448:15]
    end
    if (reset) begin // @[PE_8IP.scala 103:29]
      aggr_2_in_2 <= 32'h0; // @[PE_8IP.scala 103:29]
    end else begin
      aggr_2_in_2 <= pe_5_out_0; // @[PE_8IP.scala 449:15]
    end
    if (reset) begin // @[PE_8IP.scala 104:29]
      aggr_2_in_3 <= 32'h0; // @[PE_8IP.scala 104:29]
    end else begin
      aggr_2_in_3 <= pe_5_out_1; // @[PE_8IP.scala 450:15]
    end
    Xi_3_in_0 <= io_Xi_3_in_0; // @[PE_8IP.scala 106:27]
    Yi_3_in_0 <= io_Yi_3_in_0; // @[PE_8IP.scala 107:27]
    Xi_3_in_1 <= io_Xi_3_in_1; // @[PE_8IP.scala 108:27]
    Yi_3_in_1 <= io_Yi_3_in_1; // @[PE_8IP.scala 109:27]
    if (reset) begin // @[PE_8IP.scala 110:29]
      aggr_3_in_0 <= 32'h0; // @[PE_8IP.scala 110:29]
    end else begin
      aggr_3_in_0 <= pe_6_out_0; // @[PE_8IP.scala 452:15]
    end
    if (reset) begin // @[PE_8IP.scala 111:29]
      aggr_3_in_1 <= 32'h0; // @[PE_8IP.scala 111:29]
    end else begin
      aggr_3_in_1 <= pe_6_out_1; // @[PE_8IP.scala 453:15]
    end
    if (reset) begin // @[PE_8IP.scala 112:29]
      aggr_3_in_2 <= 32'h0; // @[PE_8IP.scala 112:29]
    end else begin
      aggr_3_in_2 <= pe_7_out_0; // @[PE_8IP.scala 454:15]
    end
    if (reset) begin // @[PE_8IP.scala 113:29]
      aggr_3_in_3 <= 32'h0; // @[PE_8IP.scala 113:29]
    end else begin
      aggr_3_in_3 <= pe_7_out_1; // @[PE_8IP.scala 455:15]
    end
    Xi_4_in_0 <= io_Xi_4_in_0; // @[PE_8IP.scala 115:27]
    Yi_4_in_0 <= io_Yi_4_in_0; // @[PE_8IP.scala 116:27]
    Xi_4_in_1 <= io_Xi_4_in_1; // @[PE_8IP.scala 117:27]
    Yi_4_in_1 <= io_Yi_4_in_1; // @[PE_8IP.scala 118:27]
    Xi_5_in_0 <= io_Xi_5_in_0; // @[PE_8IP.scala 124:27]
    Yi_5_in_0 <= io_Yi_5_in_0; // @[PE_8IP.scala 125:27]
    Xi_5_in_1 <= io_Xi_5_in_1; // @[PE_8IP.scala 126:27]
    Yi_5_in_1 <= io_Yi_5_in_1; // @[PE_8IP.scala 127:27]
    Xi_6_in_0 <= io_Xi_6_in_0; // @[PE_8IP.scala 133:27]
    Yi_6_in_0 <= io_Yi_6_in_0; // @[PE_8IP.scala 134:27]
    Xi_6_in_1 <= io_Xi_6_in_1; // @[PE_8IP.scala 135:27]
    Yi_6_in_1 <= io_Yi_6_in_1; // @[PE_8IP.scala 136:27]
    Xi_7_in_0 <= io_Xi_7_in_0; // @[PE_8IP.scala 142:27]
    Yi_7_in_0 <= io_Yi_7_in_0; // @[PE_8IP.scala 143:27]
    Xi_7_in_1 <= io_Xi_7_in_1; // @[PE_8IP.scala 144:27]
    Yi_7_in_1 <= io_Yi_7_in_1; // @[PE_8IP.scala 145:27]
    m_0_sel <= io_m_0_sel; // @[PE_8IP.scala 154:25]
    m_1_sel <= io_m_1_sel; // @[PE_8IP.scala 155:25]
    m_2_sel <= io_m_2_sel; // @[PE_8IP.scala 156:25]
    m_3_sel <= io_m_3_sel; // @[PE_8IP.scala 157:25]
    m_4_sel <= io_m_4_sel; // @[PE_8IP.scala 158:25]
    m_5_sel <= io_m_5_sel; // @[PE_8IP.scala 159:25]
    m_6_sel <= io_m_6_sel; // @[PE_8IP.scala 160:25]
    m_7_sel <= io_m_7_sel; // @[PE_8IP.scala 161:25]
    m_8_sel <= io_m_8_sel; // @[PE_8IP.scala 162:25]
    m_9_sel <= io_m_9_sel; // @[PE_8IP.scala 163:25]
    addsub_0_op <= io_addsub_0_op; // @[PE_8IP.scala 166:30]
    addsub_1_op <= io_addsub_1_op; // @[PE_8IP.scala 167:30]
    rounding <= io_rounding; // @[PE_8IP.scala 170:29]
    use_int <= io_use_int; // @[PE_8IP.scala 174:29]
    if (reset) begin // @[PE_8IP.scala 179:29]
      pe_0_out_0 <= 32'h0; // @[PE_8IP.scala 179:29]
    end else begin
      pe_0_out_0 <= pe_0_io_out_0; // @[PE_8IP.scala 232:14]
    end
    if (reset) begin // @[PE_8IP.scala 180:29]
      pe_0_out_1 <= 32'h0; // @[PE_8IP.scala 180:29]
    end else begin
      pe_0_out_1 <= pe_0_io_out_1; // @[PE_8IP.scala 233:14]
    end
    if (reset) begin // @[PE_8IP.scala 181:29]
      pe_1_out_0 <= 32'h0; // @[PE_8IP.scala 181:29]
    end else begin
      pe_1_out_0 <= pe_1_io_out_0; // @[PE_8IP.scala 260:14]
    end
    if (reset) begin // @[PE_8IP.scala 182:29]
      pe_1_out_1 <= 32'h0; // @[PE_8IP.scala 182:29]
    end else begin
      pe_1_out_1 <= pe_1_io_out_1; // @[PE_8IP.scala 261:14]
    end
    if (reset) begin // @[PE_8IP.scala 183:29]
      pe_2_out_0 <= 32'h0; // @[PE_8IP.scala 183:29]
    end else begin
      pe_2_out_0 <= pe_2_io_out_0; // @[PE_8IP.scala 288:14]
    end
    if (reset) begin // @[PE_8IP.scala 184:29]
      pe_2_out_1 <= 32'h0; // @[PE_8IP.scala 184:29]
    end else begin
      pe_2_out_1 <= pe_2_io_out_1; // @[PE_8IP.scala 289:14]
    end
    if (reset) begin // @[PE_8IP.scala 185:29]
      pe_3_out_0 <= 32'h0; // @[PE_8IP.scala 185:29]
    end else begin
      pe_3_out_0 <= pe_3_io_out_0; // @[PE_8IP.scala 315:14]
    end
    if (reset) begin // @[PE_8IP.scala 186:29]
      pe_3_out_1 <= 32'h0; // @[PE_8IP.scala 186:29]
    end else begin
      pe_3_out_1 <= pe_3_io_out_1; // @[PE_8IP.scala 316:14]
    end
    if (reset) begin // @[PE_8IP.scala 187:29]
      pe_4_out_0 <= 32'h0; // @[PE_8IP.scala 187:29]
    end else begin
      pe_4_out_0 <= pe_4_io_out_0; // @[PE_8IP.scala 343:14]
    end
    if (reset) begin // @[PE_8IP.scala 188:29]
      pe_4_out_1 <= 32'h0; // @[PE_8IP.scala 188:29]
    end else begin
      pe_4_out_1 <= pe_4_io_out_1; // @[PE_8IP.scala 344:14]
    end
    if (reset) begin // @[PE_8IP.scala 189:29]
      pe_5_out_0 <= 32'h0; // @[PE_8IP.scala 189:29]
    end else begin
      pe_5_out_0 <= pe_5_io_out_0; // @[PE_8IP.scala 371:14]
    end
    if (reset) begin // @[PE_8IP.scala 190:29]
      pe_5_out_1 <= 32'h0; // @[PE_8IP.scala 190:29]
    end else begin
      pe_5_out_1 <= pe_5_io_out_1; // @[PE_8IP.scala 372:14]
    end
    if (reset) begin // @[PE_8IP.scala 191:29]
      pe_6_out_0 <= 32'h0; // @[PE_8IP.scala 191:29]
    end else begin
      pe_6_out_0 <= pe_6_io_out_0; // @[PE_8IP.scala 399:14]
    end
    if (reset) begin // @[PE_8IP.scala 192:29]
      pe_6_out_1 <= 32'h0; // @[PE_8IP.scala 192:29]
    end else begin
      pe_6_out_1 <= pe_6_io_out_1; // @[PE_8IP.scala 400:14]
    end
    if (reset) begin // @[PE_8IP.scala 193:29]
      pe_7_out_0 <= 32'h0; // @[PE_8IP.scala 193:29]
    end else begin
      pe_7_out_0 <= pe_7_io_out_0; // @[PE_8IP.scala 426:14]
    end
    if (reset) begin // @[PE_8IP.scala 194:29]
      pe_7_out_1 <= 32'h0; // @[PE_8IP.scala 194:29]
    end else begin
      pe_7_out_1 <= pe_7_io_out_1; // @[PE_8IP.scala 427:14]
    end
    if (reset) begin // @[PE_8IP.scala 202:28]
      addsum_in_0 <= 32'h0; // @[PE_8IP.scala 202:28]
    end else begin
      addsum_in_0 <= pe_0_out_0; // @[PE_8IP.scala 469:15]
    end
    if (reset) begin // @[PE_8IP.scala 203:28]
      addsum_in_1 <= 32'h0; // @[PE_8IP.scala 203:28]
    end else begin
      addsum_in_1 <= pe_0_out_1; // @[PE_8IP.scala 470:15]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  Xi_0_in_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  Yi_0_in_0 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  Xi_0_in_1 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  Yi_0_in_1 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  aggr_0_in_0 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  aggr_0_in_1 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  aggr_0_in_2 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  aggr_0_in_3 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  Xi_1_in_0 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  Yi_1_in_0 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  Xi_1_in_1 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  Yi_1_in_1 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  aggr_1_in_0 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  aggr_1_in_1 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  aggr_1_in_2 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  aggr_1_in_3 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  Xi_2_in_0 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  Yi_2_in_0 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  Xi_2_in_1 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  Yi_2_in_1 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  aggr_2_in_0 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  aggr_2_in_1 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  aggr_2_in_2 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  aggr_2_in_3 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  Xi_3_in_0 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  Yi_3_in_0 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  Xi_3_in_1 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  Yi_3_in_1 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  aggr_3_in_0 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  aggr_3_in_1 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  aggr_3_in_2 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  aggr_3_in_3 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  Xi_4_in_0 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  Yi_4_in_0 = _RAND_33[31:0];
  _RAND_34 = {1{`RANDOM}};
  Xi_4_in_1 = _RAND_34[31:0];
  _RAND_35 = {1{`RANDOM}};
  Yi_4_in_1 = _RAND_35[31:0];
  _RAND_36 = {1{`RANDOM}};
  Xi_5_in_0 = _RAND_36[31:0];
  _RAND_37 = {1{`RANDOM}};
  Yi_5_in_0 = _RAND_37[31:0];
  _RAND_38 = {1{`RANDOM}};
  Xi_5_in_1 = _RAND_38[31:0];
  _RAND_39 = {1{`RANDOM}};
  Yi_5_in_1 = _RAND_39[31:0];
  _RAND_40 = {1{`RANDOM}};
  Xi_6_in_0 = _RAND_40[31:0];
  _RAND_41 = {1{`RANDOM}};
  Yi_6_in_0 = _RAND_41[31:0];
  _RAND_42 = {1{`RANDOM}};
  Xi_6_in_1 = _RAND_42[31:0];
  _RAND_43 = {1{`RANDOM}};
  Yi_6_in_1 = _RAND_43[31:0];
  _RAND_44 = {1{`RANDOM}};
  Xi_7_in_0 = _RAND_44[31:0];
  _RAND_45 = {1{`RANDOM}};
  Yi_7_in_0 = _RAND_45[31:0];
  _RAND_46 = {1{`RANDOM}};
  Xi_7_in_1 = _RAND_46[31:0];
  _RAND_47 = {1{`RANDOM}};
  Yi_7_in_1 = _RAND_47[31:0];
  _RAND_48 = {1{`RANDOM}};
  m_0_sel = _RAND_48[1:0];
  _RAND_49 = {1{`RANDOM}};
  m_1_sel = _RAND_49[1:0];
  _RAND_50 = {1{`RANDOM}};
  m_2_sel = _RAND_50[1:0];
  _RAND_51 = {1{`RANDOM}};
  m_3_sel = _RAND_51[1:0];
  _RAND_52 = {1{`RANDOM}};
  m_4_sel = _RAND_52[1:0];
  _RAND_53 = {1{`RANDOM}};
  m_5_sel = _RAND_53[1:0];
  _RAND_54 = {1{`RANDOM}};
  m_6_sel = _RAND_54[1:0];
  _RAND_55 = {1{`RANDOM}};
  m_7_sel = _RAND_55[1:0];
  _RAND_56 = {1{`RANDOM}};
  m_8_sel = _RAND_56[1:0];
  _RAND_57 = {1{`RANDOM}};
  m_9_sel = _RAND_57[1:0];
  _RAND_58 = {1{`RANDOM}};
  addsub_0_op = _RAND_58[1:0];
  _RAND_59 = {1{`RANDOM}};
  addsub_1_op = _RAND_59[1:0];
  _RAND_60 = {1{`RANDOM}};
  rounding = _RAND_60[2:0];
  _RAND_61 = {1{`RANDOM}};
  use_int = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  pe_0_out_0 = _RAND_62[31:0];
  _RAND_63 = {1{`RANDOM}};
  pe_0_out_1 = _RAND_63[31:0];
  _RAND_64 = {1{`RANDOM}};
  pe_1_out_0 = _RAND_64[31:0];
  _RAND_65 = {1{`RANDOM}};
  pe_1_out_1 = _RAND_65[31:0];
  _RAND_66 = {1{`RANDOM}};
  pe_2_out_0 = _RAND_66[31:0];
  _RAND_67 = {1{`RANDOM}};
  pe_2_out_1 = _RAND_67[31:0];
  _RAND_68 = {1{`RANDOM}};
  pe_3_out_0 = _RAND_68[31:0];
  _RAND_69 = {1{`RANDOM}};
  pe_3_out_1 = _RAND_69[31:0];
  _RAND_70 = {1{`RANDOM}};
  pe_4_out_0 = _RAND_70[31:0];
  _RAND_71 = {1{`RANDOM}};
  pe_4_out_1 = _RAND_71[31:0];
  _RAND_72 = {1{`RANDOM}};
  pe_5_out_0 = _RAND_72[31:0];
  _RAND_73 = {1{`RANDOM}};
  pe_5_out_1 = _RAND_73[31:0];
  _RAND_74 = {1{`RANDOM}};
  pe_6_out_0 = _RAND_74[31:0];
  _RAND_75 = {1{`RANDOM}};
  pe_6_out_1 = _RAND_75[31:0];
  _RAND_76 = {1{`RANDOM}};
  pe_7_out_0 = _RAND_76[31:0];
  _RAND_77 = {1{`RANDOM}};
  pe_7_out_1 = _RAND_77[31:0];
  _RAND_78 = {1{`RANDOM}};
  addsum_in_0 = _RAND_78[31:0];
  _RAND_79 = {1{`RANDOM}};
  addsum_in_1 = _RAND_79[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PE_CTRL_8IP_QUARTUS(
  input         clock,
  input         reset,
  input  [31:0] io_Xi_0_in_0,
  input  [1:0]  io_op_type,
  input         io_use_int,
  input         io_tininess,
  input  [2:0]  io_rounding,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  wire  ctrlPE_clock; // @[PE_CTRL_8IP_QUARTUS.scala 55:22]
  wire  ctrlPE_reset; // @[PE_CTRL_8IP_QUARTUS.scala 55:22]
  wire [1:0] ctrlPE_io_m_0_sel; // @[PE_CTRL_8IP_QUARTUS.scala 55:22]
  wire [1:0] ctrlPE_io_m_1_sel; // @[PE_CTRL_8IP_QUARTUS.scala 55:22]
  wire [1:0] ctrlPE_io_m_2_sel; // @[PE_CTRL_8IP_QUARTUS.scala 55:22]
  wire [1:0] ctrlPE_io_m_3_sel; // @[PE_CTRL_8IP_QUARTUS.scala 55:22]
  wire [1:0] ctrlPE_io_m_4_sel; // @[PE_CTRL_8IP_QUARTUS.scala 55:22]
  wire [1:0] ctrlPE_io_m_5_sel; // @[PE_CTRL_8IP_QUARTUS.scala 55:22]
  wire [1:0] ctrlPE_io_m_6_sel; // @[PE_CTRL_8IP_QUARTUS.scala 55:22]
  wire [1:0] ctrlPE_io_m_7_sel; // @[PE_CTRL_8IP_QUARTUS.scala 55:22]
  wire [1:0] ctrlPE_io_m_8_sel; // @[PE_CTRL_8IP_QUARTUS.scala 55:22]
  wire [1:0] ctrlPE_io_m_9_sel; // @[PE_CTRL_8IP_QUARTUS.scala 55:22]
  wire [1:0] ctrlPE_io_addsub_0_op; // @[PE_CTRL_8IP_QUARTUS.scala 55:22]
  wire [1:0] ctrlPE_io_addsub_1_op; // @[PE_CTRL_8IP_QUARTUS.scala 55:22]
  wire [1:0] ctrlPE_io_op_type; // @[PE_CTRL_8IP_QUARTUS.scala 55:22]
  wire  pe_8IP_clock; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire  pe_8IP_reset; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Xi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Yi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Xi_0_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Yi_0_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Xi_1_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Yi_1_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Xi_1_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Yi_1_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Xi_2_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Yi_2_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Xi_2_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Yi_2_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Xi_3_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Yi_3_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Xi_3_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Yi_3_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Xi_4_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Yi_4_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Xi_4_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Yi_4_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Xi_5_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Yi_5_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Xi_5_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Yi_5_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Xi_6_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Yi_6_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Xi_6_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Yi_6_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Xi_7_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Yi_7_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Xi_7_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_Yi_7_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [1:0] pe_8IP_io_m_0_sel; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [1:0] pe_8IP_io_m_1_sel; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [1:0] pe_8IP_io_m_2_sel; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [1:0] pe_8IP_io_m_3_sel; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [1:0] pe_8IP_io_m_4_sel; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [1:0] pe_8IP_io_m_5_sel; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [1:0] pe_8IP_io_m_6_sel; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [1:0] pe_8IP_io_m_7_sel; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [1:0] pe_8IP_io_m_8_sel; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [1:0] pe_8IP_io_m_9_sel; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [1:0] pe_8IP_io_addsub_0_op; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [1:0] pe_8IP_io_addsub_1_op; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire  pe_8IP_io_use_int; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [2:0] pe_8IP_io_rounding; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  wire [31:0] pe_8IP_io_out; // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
  reg [31:0] Xi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 30:27]
  reg [31:0] Yi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 31:27]
  reg [31:0] Xi_0_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 32:27]
  reg [31:0] Yi_0_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 33:27]
  reg [2:0] rounding; // @[PE_CTRL_8IP_QUARTUS.scala 39:29]
  reg  use_int; // @[PE_CTRL_8IP_QUARTUS.scala 43:29]
  PE_CTRL ctrlPE ( // @[PE_CTRL_8IP_QUARTUS.scala 55:22]
    .clock(ctrlPE_clock),
    .reset(ctrlPE_reset),
    .io_m_0_sel(ctrlPE_io_m_0_sel),
    .io_m_1_sel(ctrlPE_io_m_1_sel),
    .io_m_2_sel(ctrlPE_io_m_2_sel),
    .io_m_3_sel(ctrlPE_io_m_3_sel),
    .io_m_4_sel(ctrlPE_io_m_4_sel),
    .io_m_5_sel(ctrlPE_io_m_5_sel),
    .io_m_6_sel(ctrlPE_io_m_6_sel),
    .io_m_7_sel(ctrlPE_io_m_7_sel),
    .io_m_8_sel(ctrlPE_io_m_8_sel),
    .io_m_9_sel(ctrlPE_io_m_9_sel),
    .io_addsub_0_op(ctrlPE_io_addsub_0_op),
    .io_addsub_1_op(ctrlPE_io_addsub_1_op),
    .io_op_type(ctrlPE_io_op_type)
  );
  PE_8IP pe_8IP ( // @[PE_CTRL_8IP_QUARTUS.scala 62:22]
    .clock(pe_8IP_clock),
    .reset(pe_8IP_reset),
    .io_Xi_0_in_0(pe_8IP_io_Xi_0_in_0),
    .io_Yi_0_in_0(pe_8IP_io_Yi_0_in_0),
    .io_Xi_0_in_1(pe_8IP_io_Xi_0_in_1),
    .io_Yi_0_in_1(pe_8IP_io_Yi_0_in_1),
    .io_Xi_1_in_0(pe_8IP_io_Xi_1_in_0),
    .io_Yi_1_in_0(pe_8IP_io_Yi_1_in_0),
    .io_Xi_1_in_1(pe_8IP_io_Xi_1_in_1),
    .io_Yi_1_in_1(pe_8IP_io_Yi_1_in_1),
    .io_Xi_2_in_0(pe_8IP_io_Xi_2_in_0),
    .io_Yi_2_in_0(pe_8IP_io_Yi_2_in_0),
    .io_Xi_2_in_1(pe_8IP_io_Xi_2_in_1),
    .io_Yi_2_in_1(pe_8IP_io_Yi_2_in_1),
    .io_Xi_3_in_0(pe_8IP_io_Xi_3_in_0),
    .io_Yi_3_in_0(pe_8IP_io_Yi_3_in_0),
    .io_Xi_3_in_1(pe_8IP_io_Xi_3_in_1),
    .io_Yi_3_in_1(pe_8IP_io_Yi_3_in_1),
    .io_Xi_4_in_0(pe_8IP_io_Xi_4_in_0),
    .io_Yi_4_in_0(pe_8IP_io_Yi_4_in_0),
    .io_Xi_4_in_1(pe_8IP_io_Xi_4_in_1),
    .io_Yi_4_in_1(pe_8IP_io_Yi_4_in_1),
    .io_Xi_5_in_0(pe_8IP_io_Xi_5_in_0),
    .io_Yi_5_in_0(pe_8IP_io_Yi_5_in_0),
    .io_Xi_5_in_1(pe_8IP_io_Xi_5_in_1),
    .io_Yi_5_in_1(pe_8IP_io_Yi_5_in_1),
    .io_Xi_6_in_0(pe_8IP_io_Xi_6_in_0),
    .io_Yi_6_in_0(pe_8IP_io_Yi_6_in_0),
    .io_Xi_6_in_1(pe_8IP_io_Xi_6_in_1),
    .io_Yi_6_in_1(pe_8IP_io_Yi_6_in_1),
    .io_Xi_7_in_0(pe_8IP_io_Xi_7_in_0),
    .io_Yi_7_in_0(pe_8IP_io_Yi_7_in_0),
    .io_Xi_7_in_1(pe_8IP_io_Xi_7_in_1),
    .io_Yi_7_in_1(pe_8IP_io_Yi_7_in_1),
    .io_m_0_sel(pe_8IP_io_m_0_sel),
    .io_m_1_sel(pe_8IP_io_m_1_sel),
    .io_m_2_sel(pe_8IP_io_m_2_sel),
    .io_m_3_sel(pe_8IP_io_m_3_sel),
    .io_m_4_sel(pe_8IP_io_m_4_sel),
    .io_m_5_sel(pe_8IP_io_m_5_sel),
    .io_m_6_sel(pe_8IP_io_m_6_sel),
    .io_m_7_sel(pe_8IP_io_m_7_sel),
    .io_m_8_sel(pe_8IP_io_m_8_sel),
    .io_m_9_sel(pe_8IP_io_m_9_sel),
    .io_addsub_0_op(pe_8IP_io_addsub_0_op),
    .io_addsub_1_op(pe_8IP_io_addsub_1_op),
    .io_use_int(pe_8IP_io_use_int),
    .io_rounding(pe_8IP_io_rounding),
    .io_out(pe_8IP_io_out)
  );
  assign io_out = pe_8IP_io_out; // @[PE_CTRL_8IP_QUARTUS.scala 124:10]
  assign ctrlPE_clock = clock;
  assign ctrlPE_reset = reset;
  assign ctrlPE_io_op_type = io_op_type; // @[PE_CTRL_8IP_QUARTUS.scala 56:21]
  assign pe_8IP_clock = clock;
  assign pe_8IP_reset = reset;
  assign pe_8IP_io_Xi_0_in_0 = Xi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 67:23]
  assign pe_8IP_io_Yi_0_in_0 = Yi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 68:23]
  assign pe_8IP_io_Xi_0_in_1 = Xi_0_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 69:23]
  assign pe_8IP_io_Yi_0_in_1 = Yi_0_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 70:23]
  assign pe_8IP_io_Xi_1_in_0 = Xi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 72:23]
  assign pe_8IP_io_Yi_1_in_0 = Yi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 73:23]
  assign pe_8IP_io_Xi_1_in_1 = Xi_0_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 74:23]
  assign pe_8IP_io_Yi_1_in_1 = Yi_0_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 75:23]
  assign pe_8IP_io_Xi_2_in_0 = Xi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 77:23]
  assign pe_8IP_io_Yi_2_in_0 = Yi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 78:23]
  assign pe_8IP_io_Xi_2_in_1 = Xi_0_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 79:23]
  assign pe_8IP_io_Yi_2_in_1 = Yi_0_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 80:23]
  assign pe_8IP_io_Xi_3_in_0 = Xi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 82:23]
  assign pe_8IP_io_Yi_3_in_0 = Yi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 83:23]
  assign pe_8IP_io_Xi_3_in_1 = Xi_0_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 84:23]
  assign pe_8IP_io_Yi_3_in_1 = Yi_0_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 85:23]
  assign pe_8IP_io_Xi_4_in_0 = Xi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 87:23]
  assign pe_8IP_io_Yi_4_in_0 = Yi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 88:23]
  assign pe_8IP_io_Xi_4_in_1 = Xi_0_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 89:23]
  assign pe_8IP_io_Yi_4_in_1 = Yi_0_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 90:23]
  assign pe_8IP_io_Xi_5_in_0 = Xi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 92:23]
  assign pe_8IP_io_Yi_5_in_0 = Yi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 93:23]
  assign pe_8IP_io_Xi_5_in_1 = Xi_0_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 94:23]
  assign pe_8IP_io_Yi_5_in_1 = Yi_0_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 95:23]
  assign pe_8IP_io_Xi_6_in_0 = Xi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 97:23]
  assign pe_8IP_io_Yi_6_in_0 = Yi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 98:23]
  assign pe_8IP_io_Xi_6_in_1 = Xi_0_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 99:23]
  assign pe_8IP_io_Yi_6_in_1 = Yi_0_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 100:23]
  assign pe_8IP_io_Xi_7_in_0 = Xi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 102:23]
  assign pe_8IP_io_Yi_7_in_0 = Yi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 103:23]
  assign pe_8IP_io_Xi_7_in_1 = Xi_0_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 104:23]
  assign pe_8IP_io_Yi_7_in_1 = Yi_0_in_1; // @[PE_CTRL_8IP_QUARTUS.scala 105:23]
  assign pe_8IP_io_m_0_sel = ctrlPE_io_m_0_sel; // @[PE_CTRL_8IP_QUARTUS.scala 107:21]
  assign pe_8IP_io_m_1_sel = ctrlPE_io_m_1_sel; // @[PE_CTRL_8IP_QUARTUS.scala 108:21]
  assign pe_8IP_io_m_2_sel = ctrlPE_io_m_2_sel; // @[PE_CTRL_8IP_QUARTUS.scala 109:21]
  assign pe_8IP_io_m_3_sel = ctrlPE_io_m_3_sel; // @[PE_CTRL_8IP_QUARTUS.scala 110:21]
  assign pe_8IP_io_m_4_sel = ctrlPE_io_m_4_sel; // @[PE_CTRL_8IP_QUARTUS.scala 111:21]
  assign pe_8IP_io_m_5_sel = ctrlPE_io_m_5_sel; // @[PE_CTRL_8IP_QUARTUS.scala 112:21]
  assign pe_8IP_io_m_6_sel = ctrlPE_io_m_6_sel; // @[PE_CTRL_8IP_QUARTUS.scala 113:21]
  assign pe_8IP_io_m_7_sel = ctrlPE_io_m_7_sel; // @[PE_CTRL_8IP_QUARTUS.scala 114:21]
  assign pe_8IP_io_m_8_sel = ctrlPE_io_m_8_sel; // @[PE_CTRL_8IP_QUARTUS.scala 115:21]
  assign pe_8IP_io_m_9_sel = ctrlPE_io_m_9_sel; // @[PE_CTRL_8IP_QUARTUS.scala 116:21]
  assign pe_8IP_io_addsub_0_op = ctrlPE_io_addsub_0_op; // @[PE_CTRL_8IP_QUARTUS.scala 118:25]
  assign pe_8IP_io_addsub_1_op = ctrlPE_io_addsub_1_op; // @[PE_CTRL_8IP_QUARTUS.scala 119:25]
  assign pe_8IP_io_use_int = use_int; // @[PE_CTRL_8IP_QUARTUS.scala 63:22]
  assign pe_8IP_io_rounding = rounding; // @[PE_CTRL_8IP_QUARTUS.scala 65:22]
  always @(posedge clock) begin
    Xi_0_in_0 <= io_Xi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 30:27]
    Yi_0_in_0 <= io_Xi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 31:27]
    Xi_0_in_1 <= io_Xi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 32:27]
    Yi_0_in_1 <= io_Xi_0_in_0; // @[PE_CTRL_8IP_QUARTUS.scala 33:27]
    rounding <= io_rounding; // @[PE_CTRL_8IP_QUARTUS.scala 39:29]
    use_int <= io_use_int; // @[PE_CTRL_8IP_QUARTUS.scala 43:29]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  Xi_0_in_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  Yi_0_in_0 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  Xi_0_in_1 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  Yi_0_in_1 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  rounding = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  use_int = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule

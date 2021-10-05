circuit PE_CTRL_8IP :
  module PE_CTRL :
    input clock : Clock
    input reset : UInt<1>
    output io_m_0_sel : UInt<2>
    output io_m_1_sel : UInt<2>
    output io_m_2_sel : UInt<2>
    output io_m_3_sel : UInt<2>
    output io_m_4_sel : UInt<2>
    output io_m_5_sel : UInt<2>
    output io_m_6_sel : UInt<2>
    output io_m_7_sel : UInt<2>
    output io_m_8_sel : UInt<2>
    output io_m_9_sel : UInt<2>
    output io_addsub_0_op : UInt<2>
    output io_addsub_1_op : UInt<2>
    input io_op_type : UInt<2>
    input io_use_int : UInt<1>
    output io_dbg_fsm : UInt<4>

    reg m_0_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_0_sel) @[PE_CTRL.scala 37:25]
    reg m_1_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_1_sel) @[PE_CTRL.scala 38:25]
    reg m_2_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_2_sel) @[PE_CTRL.scala 39:25]
    reg m_3_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_3_sel) @[PE_CTRL.scala 40:25]
    reg m_4_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_4_sel) @[PE_CTRL.scala 41:25]
    reg m_5_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_5_sel) @[PE_CTRL.scala 42:25]
    reg m_6_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_6_sel) @[PE_CTRL.scala 43:25]
    reg m_7_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_7_sel) @[PE_CTRL.scala 44:25]
    reg m_8_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_8_sel) @[PE_CTRL.scala 45:25]
    reg m_9_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_9_sel) @[PE_CTRL.scala 46:25]
    reg op_type : UInt<2>, clock with :
      reset => (UInt<1>("h0"), op_type) @[PE_CTRL.scala 48:25]
    reg addsub_0_op : UInt<2>, clock with :
      reset => (UInt<1>("h0"), addsub_0_op) @[PE_CTRL.scala 51:30]
    reg addsub_1_op : UInt<2>, clock with :
      reset => (UInt<1>("h0"), addsub_1_op) @[PE_CTRL.scala 52:30]
    reg use_int : UInt<1>, clock with :
      reset => (UInt<1>("h0"), use_int) @[PE_CTRL.scala 55:29]
    reg dbg_fsm : UInt<4>, clock with :
      reset => (UInt<1>("h0"), dbg_fsm) @[PE_CTRL.scala 60:24]
    reg value : UInt<4>, clock with :
      reset => (UInt<1>("h0"), value) @[Counter.scala 60:40]
    reg value_1 : UInt<4>, clock with :
      reset => (UInt<1>("h0"), value_1) @[Counter.scala 60:40]
    reg value_2 : UInt<4>, clock with :
      reset => (UInt<1>("h0"), value_2) @[Counter.scala 60:40]
    reg value_3 : UInt<4>, clock with :
      reset => (UInt<1>("h0"), value_3) @[Counter.scala 60:40]
    reg value_4 : UInt<6>, clock with :
      reset => (UInt<1>("h0"), value_4) @[Counter.scala 60:40]
    reg value_5 : UInt<2>, clock with :
      reset => (UInt<1>("h0"), value_5) @[Counter.scala 60:40]
    reg pe_step : UInt<4>, clock with :
      reset => (UInt<1>("h0"), pe_step) @[PE_CTRL.scala 103:25]
    node _T = eq(UInt<4>("h0"), pe_step) @[PE_CTRL.scala 106:3]
    node _T_1 = eq(UInt<4>("h1"), pe_step) @[PE_CTRL.scala 106:3]
    node _T_2 = eq(UInt<2>("h0"), op_type) @[PE_CTRL.scala 118:9]
    node _T_3 = eq(UInt<2>("h1"), op_type) @[PE_CTRL.scala 118:9]
    node _T_4 = eq(UInt<2>("h2"), op_type) @[PE_CTRL.scala 118:9]
    node _T_5 = eq(UInt<2>("h3"), op_type) @[PE_CTRL.scala 118:9]
    node _GEN_0 = mux(_T_5, UInt<2>("h0"), addsub_0_op) @[PE_CTRL.scala 118:9 187:25 51:30]
    node _GEN_1 = mux(_T_5, UInt<2>("h0"), addsub_1_op) @[PE_CTRL.scala 118:9 188:25 52:30]
    node _GEN_2 = mux(_T_5, UInt<2>("h0"), m_0_sel) @[PE_CTRL.scala 118:9 190:21 37:25]
    node _GEN_3 = mux(_T_5, UInt<2>("h0"), m_1_sel) @[PE_CTRL.scala 118:9 191:21 38:25]
    node _GEN_4 = mux(_T_5, UInt<2>("h0"), m_2_sel) @[PE_CTRL.scala 118:9 192:21 39:25]
    node _GEN_5 = mux(_T_5, UInt<2>("h0"), m_3_sel) @[PE_CTRL.scala 118:9 193:21 40:25]
    node _GEN_6 = mux(_T_5, UInt<2>("h1"), m_4_sel) @[PE_CTRL.scala 118:9 195:21 41:25]
    node _GEN_7 = mux(_T_5, UInt<2>("h1"), m_5_sel) @[PE_CTRL.scala 118:9 196:21 42:25]
    node _GEN_8 = mux(_T_5, UInt<2>("h3"), m_6_sel) @[PE_CTRL.scala 118:9 197:21 43:25]
    node _GEN_9 = mux(_T_5, UInt<2>("h3"), m_7_sel) @[PE_CTRL.scala 118:9 198:21 44:25]
    node _GEN_10 = mux(_T_5, UInt<2>("h0"), m_8_sel) @[PE_CTRL.scala 118:9 201:21 45:25]
    node _GEN_11 = mux(_T_5, UInt<2>("h3"), m_9_sel) @[PE_CTRL.scala 118:9 202:21 46:25]
    node _GEN_12 = mux(_T_5, UInt<4>("h5"), pe_step) @[PE_CTRL.scala 118:9 204:21 103:25]
    node _GEN_13 = mux(_T_4, UInt<2>("h1"), _GEN_0) @[PE_CTRL.scala 118:9 164:25]
    node _GEN_14 = mux(_T_4, UInt<2>("h1"), _GEN_1) @[PE_CTRL.scala 118:9 165:25]
    node _GEN_15 = mux(_T_4, UInt<2>("h0"), _GEN_2) @[PE_CTRL.scala 118:9 167:21]
    node _GEN_16 = mux(_T_4, UInt<2>("h0"), _GEN_3) @[PE_CTRL.scala 118:9 168:21]
    node _GEN_17 = mux(_T_4, UInt<2>("h0"), _GEN_4) @[PE_CTRL.scala 118:9 169:21]
    node _GEN_18 = mux(_T_4, UInt<2>("h0"), _GEN_5) @[PE_CTRL.scala 118:9 170:21]
    node _GEN_19 = mux(_T_4, UInt<2>("h0"), _GEN_6) @[PE_CTRL.scala 118:9 172:21]
    node _GEN_20 = mux(_T_4, UInt<2>("h0"), _GEN_7) @[PE_CTRL.scala 118:9 173:21]
    node _GEN_21 = mux(_T_4, UInt<2>("h0"), _GEN_8) @[PE_CTRL.scala 118:9 174:21]
    node _GEN_22 = mux(_T_4, UInt<2>("h0"), _GEN_9) @[PE_CTRL.scala 118:9 175:21]
    node _GEN_23 = mux(_T_4, UInt<2>("h1"), _GEN_10) @[PE_CTRL.scala 118:9 178:21]
    node _GEN_24 = mux(_T_4, UInt<2>("h1"), _GEN_11) @[PE_CTRL.scala 118:9 179:21]
    node _GEN_25 = mux(_T_4, UInt<4>("h4"), _GEN_12) @[PE_CTRL.scala 118:9 181:21]
    node _GEN_26 = mux(_T_3, UInt<2>("h1"), _GEN_13) @[PE_CTRL.scala 118:9 146:25]
    node _GEN_27 = mux(_T_3, UInt<2>("h1"), _GEN_14) @[PE_CTRL.scala 118:9 147:25]
    node _GEN_28 = mux(_T_3, UInt<2>("h0"), _GEN_19) @[PE_CTRL.scala 118:9 149:21]
    node _GEN_29 = mux(_T_3, UInt<2>("h0"), _GEN_20) @[PE_CTRL.scala 118:9 150:21]
    node _GEN_30 = mux(_T_3, UInt<2>("h0"), _GEN_21) @[PE_CTRL.scala 118:9 151:21]
    node _GEN_31 = mux(_T_3, UInt<2>("h0"), _GEN_22) @[PE_CTRL.scala 118:9 152:21]
    node _GEN_32 = mux(_T_3, UInt<2>("h0"), _GEN_23) @[PE_CTRL.scala 118:9 155:21]
    node _GEN_33 = mux(_T_3, UInt<2>("h0"), _GEN_24) @[PE_CTRL.scala 118:9 156:21]
    node _GEN_34 = mux(_T_3, UInt<4>("h3"), _GEN_25) @[PE_CTRL.scala 118:9 158:21]
    node _GEN_35 = mux(_T_3, m_0_sel, _GEN_15) @[PE_CTRL.scala 118:9 37:25]
    node _GEN_36 = mux(_T_3, m_1_sel, _GEN_16) @[PE_CTRL.scala 118:9 38:25]
    node _GEN_37 = mux(_T_3, m_2_sel, _GEN_17) @[PE_CTRL.scala 118:9 39:25]
    node _GEN_38 = mux(_T_3, m_3_sel, _GEN_18) @[PE_CTRL.scala 118:9 40:25]
    node _GEN_39 = mux(_T_2, UInt<2>("h1"), _GEN_26) @[PE_CTRL.scala 118:9 123:25]
    node _GEN_40 = mux(_T_2, UInt<2>("h1"), _GEN_27) @[PE_CTRL.scala 118:9 124:25]
    node _GEN_41 = mux(_T_2, UInt<2>("h1"), _GEN_35) @[PE_CTRL.scala 118:9 126:21]
    node _GEN_42 = mux(_T_2, UInt<2>("h1"), _GEN_36) @[PE_CTRL.scala 118:9 127:21]
    node _GEN_43 = mux(_T_2, UInt<2>("h1"), _GEN_37) @[PE_CTRL.scala 118:9 128:21]
    node _GEN_44 = mux(_T_2, UInt<2>("h1"), _GEN_38) @[PE_CTRL.scala 118:9 129:21]
    node _GEN_45 = mux(_T_2, UInt<2>("h0"), _GEN_28) @[PE_CTRL.scala 118:9 131:21]
    node _GEN_46 = mux(_T_2, UInt<2>("h0"), _GEN_29) @[PE_CTRL.scala 118:9 132:21]
    node _GEN_47 = mux(_T_2, UInt<2>("h0"), _GEN_30) @[PE_CTRL.scala 118:9 133:21]
    node _GEN_48 = mux(_T_2, UInt<2>("h0"), _GEN_31) @[PE_CTRL.scala 118:9 134:21]
    node _GEN_49 = mux(_T_2, UInt<2>("h1"), _GEN_32) @[PE_CTRL.scala 118:9 137:21]
    node _GEN_50 = mux(_T_2, UInt<2>("h1"), _GEN_33) @[PE_CTRL.scala 118:9 138:21]
    node _GEN_51 = mux(_T_2, UInt<4>("h2"), _GEN_34) @[PE_CTRL.scala 118:9 140:21]
    node _T_6 = eq(UInt<4>("h2"), pe_step) @[PE_CTRL.scala 106:3]
    node wrap = eq(value_1, UInt<4>("he")) @[Counter.scala 72:24]
    node _value_T = add(value_1, UInt<1>("h1")) @[Counter.scala 76:24]
    node _value_T_1 = tail(_value_T, 1) @[Counter.scala 76:24]
    node _GEN_52 = mux(wrap, UInt<1>("h0"), _value_T_1) @[Counter.scala 76:15 86:{20,28}]
    node _T_7 = eq(value_1, UInt<4>("he")) @[PE_CTRL.scala 212:30]
    node _GEN_53 = mux(_T_7, UInt<4>("h6"), pe_step) @[PE_CTRL.scala 212:53 213:17 103:25]
    node _GEN_54 = mux(_T_7, UInt<1>("h0"), _GEN_52) @[PE_CTRL.scala 212:53 Counter.scala 97:11]
    node _T_8 = eq(UInt<4>("h3"), pe_step) @[PE_CTRL.scala 106:3]
    node wrap_1 = eq(value, UInt<4>("h9")) @[Counter.scala 72:24]
    node _value_T_2 = add(value, UInt<1>("h1")) @[Counter.scala 76:24]
    node _value_T_3 = tail(_value_T_2, 1) @[Counter.scala 76:24]
    node _GEN_55 = mux(wrap_1, UInt<1>("h0"), _value_T_3) @[Counter.scala 76:15 86:{20,28}]
    node _T_9 = eq(value, UInt<4>("h9")) @[PE_CTRL.scala 222:30]
    node _GEN_56 = mux(_T_9, UInt<4>("h6"), pe_step) @[PE_CTRL.scala 222:53 223:17 103:25]
    node _GEN_57 = mux(_T_9, UInt<1>("h0"), _GEN_55) @[PE_CTRL.scala 222:53 Counter.scala 97:11]
    node _T_10 = eq(UInt<4>("h4"), pe_step) @[PE_CTRL.scala 106:3]
    node wrap_2 = eq(value_2, UInt<4>("h9")) @[Counter.scala 72:24]
    node _value_T_4 = add(value_2, UInt<1>("h1")) @[Counter.scala 76:24]
    node _value_T_5 = tail(_value_T_4, 1) @[Counter.scala 76:24]
    node _GEN_58 = mux(wrap_2, UInt<1>("h0"), _value_T_5) @[Counter.scala 76:15 86:{20,28}]
    node _T_11 = eq(value_2, UInt<4>("h9")) @[PE_CTRL.scala 232:31]
    node _GEN_59 = mux(_T_11, UInt<4>("h6"), pe_step) @[PE_CTRL.scala 232:55 233:17 103:25]
    node _GEN_60 = mux(_T_11, UInt<1>("h0"), _GEN_58) @[PE_CTRL.scala 232:55 Counter.scala 97:11]
    node _T_12 = eq(UInt<4>("h5"), pe_step) @[PE_CTRL.scala 106:3]
    node wrap_3 = eq(value_3, UInt<4>("he")) @[Counter.scala 72:24]
    node _value_T_6 = add(value_3, UInt<1>("h1")) @[Counter.scala 76:24]
    node _value_T_7 = tail(_value_T_6, 1) @[Counter.scala 76:24]
    node _GEN_61 = mux(wrap_3, UInt<1>("h0"), _value_T_7) @[Counter.scala 76:15 86:{20,28}]
    node _T_13 = eq(value_3, UInt<4>("he")) @[PE_CTRL.scala 242:31]
    node _GEN_62 = mux(_T_13, UInt<4>("h6"), pe_step) @[PE_CTRL.scala 242:55 243:17 103:25]
    node _GEN_63 = mux(_T_13, UInt<1>("h0"), _GEN_61) @[PE_CTRL.scala 242:55 Counter.scala 97:11]
    node _T_14 = eq(UInt<4>("h6"), pe_step) @[PE_CTRL.scala 106:3]
    node _T_15 = eq(UInt<4>("h7"), pe_step) @[PE_CTRL.scala 106:3]
    node wrap_4 = eq(value_4, UInt<6>("h24")) @[Counter.scala 72:24]
    node _value_T_8 = add(value_4, UInt<1>("h1")) @[Counter.scala 76:24]
    node _value_T_9 = tail(_value_T_8, 1) @[Counter.scala 76:24]
    node _GEN_64 = mux(wrap_4, UInt<1>("h0"), _value_T_9) @[Counter.scala 76:15 86:{20,28}]
    node _T_16 = eq(value_4, UInt<6>("h24")) @[PE_CTRL.scala 269:32]
    node _GEN_65 = mux(_T_16, UInt<2>("h3"), m_0_sel) @[PE_CTRL.scala 269:57 271:17 37:25]
    node _GEN_66 = mux(_T_16, UInt<2>("h3"), m_1_sel) @[PE_CTRL.scala 269:57 272:17 38:25]
    node _GEN_67 = mux(_T_16, UInt<2>("h3"), m_2_sel) @[PE_CTRL.scala 269:57 273:17 39:25]
    node _GEN_68 = mux(_T_16, UInt<2>("h3"), m_3_sel) @[PE_CTRL.scala 269:57 274:17 40:25]
    node _GEN_69 = mux(_T_16, UInt<2>("h3"), m_4_sel) @[PE_CTRL.scala 269:57 275:17 41:25]
    node _GEN_70 = mux(_T_16, UInt<2>("h3"), m_5_sel) @[PE_CTRL.scala 269:57 276:17 42:25]
    node _GEN_71 = mux(_T_16, UInt<2>("h3"), m_6_sel) @[PE_CTRL.scala 269:57 277:17 43:25]
    node _GEN_72 = mux(_T_16, UInt<2>("h3"), m_7_sel) @[PE_CTRL.scala 269:57 278:17 44:25]
    node _GEN_73 = mux(_T_16, UInt<2>("h2"), m_8_sel) @[PE_CTRL.scala 269:57 279:17 45:25]
    node _GEN_74 = mux(_T_16, UInt<2>("h2"), m_9_sel) @[PE_CTRL.scala 269:57 280:17 46:25]
    node _GEN_75 = mux(_T_16, UInt<4>("h8"), pe_step) @[PE_CTRL.scala 269:57 282:17 103:25]
    node _GEN_76 = mux(_T_16, UInt<1>("h0"), _GEN_64) @[PE_CTRL.scala 269:57 Counter.scala 97:11]
    node _T_17 = eq(UInt<4>("h8"), pe_step) @[PE_CTRL.scala 106:3]
    node wrap_5 = eq(value_5, UInt<2>("h3")) @[Counter.scala 72:24]
    node _value_T_10 = add(value_5, UInt<1>("h1")) @[Counter.scala 76:24]
    node _value_T_11 = tail(_value_T_10, 1) @[Counter.scala 76:24]
    node _T_18 = eq(value_5, UInt<2>("h3")) @[PE_CTRL.scala 290:31]
    node _GEN_77 = mux(_T_18, UInt<4>("h1"), pe_step) @[PE_CTRL.scala 290:55 291:17 103:25]
    node _GEN_78 = mux(_T_18, UInt<1>("h0"), _value_T_11) @[PE_CTRL.scala 290:55 Counter.scala 97:11 76:15]
    node _GEN_79 = mux(_T_17, UInt<4>("ha"), dbg_fsm) @[PE_CTRL.scala 106:3 287:15 60:24]
    node _GEN_80 = mux(_T_17, _GEN_78, value_5) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_81 = mux(_T_17, _GEN_77, pe_step) @[PE_CTRL.scala 103:25 106:3]
    node _GEN_82 = mux(_T_15, UInt<4>("h8"), _GEN_79) @[PE_CTRL.scala 106:3 266:15]
    node _GEN_83 = mux(_T_15, _GEN_76, value_4) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_84 = mux(_T_15, _GEN_65, m_0_sel) @[PE_CTRL.scala 106:3 37:25]
    node _GEN_85 = mux(_T_15, _GEN_66, m_1_sel) @[PE_CTRL.scala 106:3 38:25]
    node _GEN_86 = mux(_T_15, _GEN_67, m_2_sel) @[PE_CTRL.scala 106:3 39:25]
    node _GEN_87 = mux(_T_15, _GEN_68, m_3_sel) @[PE_CTRL.scala 106:3 40:25]
    node _GEN_88 = mux(_T_15, _GEN_69, m_4_sel) @[PE_CTRL.scala 106:3 41:25]
    node _GEN_89 = mux(_T_15, _GEN_70, m_5_sel) @[PE_CTRL.scala 106:3 42:25]
    node _GEN_90 = mux(_T_15, _GEN_71, m_6_sel) @[PE_CTRL.scala 106:3 43:25]
    node _GEN_91 = mux(_T_15, _GEN_72, m_7_sel) @[PE_CTRL.scala 106:3 44:25]
    node _GEN_92 = mux(_T_15, _GEN_73, m_8_sel) @[PE_CTRL.scala 106:3 45:25]
    node _GEN_93 = mux(_T_15, _GEN_74, m_9_sel) @[PE_CTRL.scala 106:3 46:25]
    node _GEN_94 = mux(_T_15, _GEN_75, _GEN_81) @[PE_CTRL.scala 106:3]
    node _GEN_95 = mux(_T_15, value_5, _GEN_80) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_96 = mux(_T_14, UInt<4>("h7"), _GEN_82) @[PE_CTRL.scala 106:3 249:15]
    node _GEN_97 = mux(_T_14, UInt<2>("h0"), addsub_0_op) @[PE_CTRL.scala 106:3 251:21 51:30]
    node _GEN_98 = mux(_T_14, UInt<2>("h0"), addsub_1_op) @[PE_CTRL.scala 106:3 252:21 52:30]
    node _GEN_99 = mux(_T_14, UInt<2>("h2"), _GEN_88) @[PE_CTRL.scala 106:3 254:17]
    node _GEN_100 = mux(_T_14, UInt<2>("h2"), _GEN_89) @[PE_CTRL.scala 106:3 255:17]
    node _GEN_101 = mux(_T_14, UInt<2>("h2"), _GEN_90) @[PE_CTRL.scala 106:3 256:17]
    node _GEN_102 = mux(_T_14, UInt<2>("h2"), _GEN_91) @[PE_CTRL.scala 106:3 257:17]
    node _GEN_103 = mux(_T_14, UInt<2>("h0"), _GEN_92) @[PE_CTRL.scala 106:3 259:17]
    node _GEN_104 = mux(_T_14, UInt<2>("h0"), _GEN_93) @[PE_CTRL.scala 106:3 260:17]
    node _GEN_105 = mux(_T_14, UInt<4>("h7"), _GEN_94) @[PE_CTRL.scala 106:3 262:17]
    node _GEN_106 = mux(_T_14, value_4, _GEN_83) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_107 = mux(_T_14, m_0_sel, _GEN_84) @[PE_CTRL.scala 106:3 37:25]
    node _GEN_108 = mux(_T_14, m_1_sel, _GEN_85) @[PE_CTRL.scala 106:3 38:25]
    node _GEN_109 = mux(_T_14, m_2_sel, _GEN_86) @[PE_CTRL.scala 106:3 39:25]
    node _GEN_110 = mux(_T_14, m_3_sel, _GEN_87) @[PE_CTRL.scala 106:3 40:25]
    node _GEN_111 = mux(_T_14, value_5, _GEN_95) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_112 = mux(_T_12, UInt<4>("h5"), _GEN_96) @[PE_CTRL.scala 106:3 239:15]
    node _GEN_113 = mux(_T_12, _GEN_63, value_3) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_114 = mux(_T_12, _GEN_62, _GEN_105) @[PE_CTRL.scala 106:3]
    node _GEN_115 = mux(_T_12, addsub_0_op, _GEN_97) @[PE_CTRL.scala 106:3 51:30]
    node _GEN_116 = mux(_T_12, addsub_1_op, _GEN_98) @[PE_CTRL.scala 106:3 52:30]
    node _GEN_117 = mux(_T_12, m_4_sel, _GEN_99) @[PE_CTRL.scala 106:3 41:25]
    node _GEN_118 = mux(_T_12, m_5_sel, _GEN_100) @[PE_CTRL.scala 106:3 42:25]
    node _GEN_119 = mux(_T_12, m_6_sel, _GEN_101) @[PE_CTRL.scala 106:3 43:25]
    node _GEN_120 = mux(_T_12, m_7_sel, _GEN_102) @[PE_CTRL.scala 106:3 44:25]
    node _GEN_121 = mux(_T_12, m_8_sel, _GEN_103) @[PE_CTRL.scala 106:3 45:25]
    node _GEN_122 = mux(_T_12, m_9_sel, _GEN_104) @[PE_CTRL.scala 106:3 46:25]
    node _GEN_123 = mux(_T_12, value_4, _GEN_106) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_124 = mux(_T_12, m_0_sel, _GEN_107) @[PE_CTRL.scala 106:3 37:25]
    node _GEN_125 = mux(_T_12, m_1_sel, _GEN_108) @[PE_CTRL.scala 106:3 38:25]
    node _GEN_126 = mux(_T_12, m_2_sel, _GEN_109) @[PE_CTRL.scala 106:3 39:25]
    node _GEN_127 = mux(_T_12, m_3_sel, _GEN_110) @[PE_CTRL.scala 106:3 40:25]
    node _GEN_128 = mux(_T_12, value_5, _GEN_111) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_129 = mux(_T_10, UInt<4>("h4"), _GEN_112) @[PE_CTRL.scala 106:3 229:15]
    node _GEN_130 = mux(_T_10, _GEN_60, value_2) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_131 = mux(_T_10, _GEN_59, _GEN_114) @[PE_CTRL.scala 106:3]
    node _GEN_132 = mux(_T_10, value_3, _GEN_113) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_133 = mux(_T_10, addsub_0_op, _GEN_115) @[PE_CTRL.scala 106:3 51:30]
    node _GEN_134 = mux(_T_10, addsub_1_op, _GEN_116) @[PE_CTRL.scala 106:3 52:30]
    node _GEN_135 = mux(_T_10, m_4_sel, _GEN_117) @[PE_CTRL.scala 106:3 41:25]
    node _GEN_136 = mux(_T_10, m_5_sel, _GEN_118) @[PE_CTRL.scala 106:3 42:25]
    node _GEN_137 = mux(_T_10, m_6_sel, _GEN_119) @[PE_CTRL.scala 106:3 43:25]
    node _GEN_138 = mux(_T_10, m_7_sel, _GEN_120) @[PE_CTRL.scala 106:3 44:25]
    node _GEN_139 = mux(_T_10, m_8_sel, _GEN_121) @[PE_CTRL.scala 106:3 45:25]
    node _GEN_140 = mux(_T_10, m_9_sel, _GEN_122) @[PE_CTRL.scala 106:3 46:25]
    node _GEN_141 = mux(_T_10, value_4, _GEN_123) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_142 = mux(_T_10, m_0_sel, _GEN_124) @[PE_CTRL.scala 106:3 37:25]
    node _GEN_143 = mux(_T_10, m_1_sel, _GEN_125) @[PE_CTRL.scala 106:3 38:25]
    node _GEN_144 = mux(_T_10, m_2_sel, _GEN_126) @[PE_CTRL.scala 106:3 39:25]
    node _GEN_145 = mux(_T_10, m_3_sel, _GEN_127) @[PE_CTRL.scala 106:3 40:25]
    node _GEN_146 = mux(_T_10, value_5, _GEN_128) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_147 = mux(_T_8, UInt<4>("h3"), _GEN_129) @[PE_CTRL.scala 106:3 219:15]
    node _GEN_148 = mux(_T_8, _GEN_57, value) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_149 = mux(_T_8, _GEN_56, _GEN_131) @[PE_CTRL.scala 106:3]
    node _GEN_150 = mux(_T_8, value_2, _GEN_130) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_151 = mux(_T_8, value_3, _GEN_132) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_152 = mux(_T_8, addsub_0_op, _GEN_133) @[PE_CTRL.scala 106:3 51:30]
    node _GEN_153 = mux(_T_8, addsub_1_op, _GEN_134) @[PE_CTRL.scala 106:3 52:30]
    node _GEN_154 = mux(_T_8, m_4_sel, _GEN_135) @[PE_CTRL.scala 106:3 41:25]
    node _GEN_155 = mux(_T_8, m_5_sel, _GEN_136) @[PE_CTRL.scala 106:3 42:25]
    node _GEN_156 = mux(_T_8, m_6_sel, _GEN_137) @[PE_CTRL.scala 106:3 43:25]
    node _GEN_157 = mux(_T_8, m_7_sel, _GEN_138) @[PE_CTRL.scala 106:3 44:25]
    node _GEN_158 = mux(_T_8, m_8_sel, _GEN_139) @[PE_CTRL.scala 106:3 45:25]
    node _GEN_159 = mux(_T_8, m_9_sel, _GEN_140) @[PE_CTRL.scala 106:3 46:25]
    node _GEN_160 = mux(_T_8, value_4, _GEN_141) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_161 = mux(_T_8, m_0_sel, _GEN_142) @[PE_CTRL.scala 106:3 37:25]
    node _GEN_162 = mux(_T_8, m_1_sel, _GEN_143) @[PE_CTRL.scala 106:3 38:25]
    node _GEN_163 = mux(_T_8, m_2_sel, _GEN_144) @[PE_CTRL.scala 106:3 39:25]
    node _GEN_164 = mux(_T_8, m_3_sel, _GEN_145) @[PE_CTRL.scala 106:3 40:25]
    node _GEN_165 = mux(_T_8, value_5, _GEN_146) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_166 = mux(_T_6, UInt<4>("h2"), _GEN_147) @[PE_CTRL.scala 106:3 209:15]
    node _GEN_167 = mux(_T_6, _GEN_54, value_1) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_168 = mux(_T_6, _GEN_53, _GEN_149) @[PE_CTRL.scala 106:3]
    node _GEN_169 = mux(_T_6, value, _GEN_148) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_170 = mux(_T_6, value_2, _GEN_150) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_171 = mux(_T_6, value_3, _GEN_151) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_172 = mux(_T_6, addsub_0_op, _GEN_152) @[PE_CTRL.scala 106:3 51:30]
    node _GEN_173 = mux(_T_6, addsub_1_op, _GEN_153) @[PE_CTRL.scala 106:3 52:30]
    node _GEN_174 = mux(_T_6, m_4_sel, _GEN_154) @[PE_CTRL.scala 106:3 41:25]
    node _GEN_175 = mux(_T_6, m_5_sel, _GEN_155) @[PE_CTRL.scala 106:3 42:25]
    node _GEN_176 = mux(_T_6, m_6_sel, _GEN_156) @[PE_CTRL.scala 106:3 43:25]
    node _GEN_177 = mux(_T_6, m_7_sel, _GEN_157) @[PE_CTRL.scala 106:3 44:25]
    node _GEN_178 = mux(_T_6, m_8_sel, _GEN_158) @[PE_CTRL.scala 106:3 45:25]
    node _GEN_179 = mux(_T_6, m_9_sel, _GEN_159) @[PE_CTRL.scala 106:3 46:25]
    node _GEN_180 = mux(_T_6, value_4, _GEN_160) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_181 = mux(_T_6, m_0_sel, _GEN_161) @[PE_CTRL.scala 106:3 37:25]
    node _GEN_182 = mux(_T_6, m_1_sel, _GEN_162) @[PE_CTRL.scala 106:3 38:25]
    node _GEN_183 = mux(_T_6, m_2_sel, _GEN_163) @[PE_CTRL.scala 106:3 39:25]
    node _GEN_184 = mux(_T_6, m_3_sel, _GEN_164) @[PE_CTRL.scala 106:3 40:25]
    node _GEN_185 = mux(_T_6, value_5, _GEN_165) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_186 = mux(_T_1, UInt<4>("h1"), _GEN_166) @[PE_CTRL.scala 106:3 115:17]
    node _GEN_187 = mux(_T_1, _GEN_39, _GEN_172) @[PE_CTRL.scala 106:3]
    node _GEN_188 = mux(_T_1, _GEN_40, _GEN_173) @[PE_CTRL.scala 106:3]
    node _GEN_189 = mux(_T_1, _GEN_41, _GEN_181) @[PE_CTRL.scala 106:3]
    node _GEN_190 = mux(_T_1, _GEN_42, _GEN_182) @[PE_CTRL.scala 106:3]
    node _GEN_191 = mux(_T_1, _GEN_43, _GEN_183) @[PE_CTRL.scala 106:3]
    node _GEN_192 = mux(_T_1, _GEN_44, _GEN_184) @[PE_CTRL.scala 106:3]
    node _GEN_193 = mux(_T_1, _GEN_45, _GEN_174) @[PE_CTRL.scala 106:3]
    node _GEN_194 = mux(_T_1, _GEN_46, _GEN_175) @[PE_CTRL.scala 106:3]
    node _GEN_195 = mux(_T_1, _GEN_47, _GEN_176) @[PE_CTRL.scala 106:3]
    node _GEN_196 = mux(_T_1, _GEN_48, _GEN_177) @[PE_CTRL.scala 106:3]
    node _GEN_197 = mux(_T_1, _GEN_49, _GEN_178) @[PE_CTRL.scala 106:3]
    node _GEN_198 = mux(_T_1, _GEN_50, _GEN_179) @[PE_CTRL.scala 106:3]
    node _GEN_199 = mux(_T_1, _GEN_51, _GEN_168) @[PE_CTRL.scala 106:3]
    node _GEN_200 = mux(_T_1, value_1, _GEN_167) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_201 = mux(_T_1, value, _GEN_169) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_202 = mux(_T_1, value_2, _GEN_170) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_203 = mux(_T_1, value_3, _GEN_171) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_204 = mux(_T_1, value_4, _GEN_180) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_205 = mux(_T_1, value_5, _GEN_185) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_206 = mux(_T, UInt<4>("h9"), _GEN_186) @[PE_CTRL.scala 106:3 109:15]
    node _GEN_207 = mux(_T, UInt<4>("h1"), _GEN_199) @[PE_CTRL.scala 106:3 110:15]
    node _GEN_208 = mux(_T, addsub_0_op, _GEN_187) @[PE_CTRL.scala 106:3 51:30]
    node _GEN_209 = mux(_T, addsub_1_op, _GEN_188) @[PE_CTRL.scala 106:3 52:30]
    node _GEN_210 = mux(_T, m_0_sel, _GEN_189) @[PE_CTRL.scala 106:3 37:25]
    node _GEN_211 = mux(_T, m_1_sel, _GEN_190) @[PE_CTRL.scala 106:3 38:25]
    node _GEN_212 = mux(_T, m_2_sel, _GEN_191) @[PE_CTRL.scala 106:3 39:25]
    node _GEN_213 = mux(_T, m_3_sel, _GEN_192) @[PE_CTRL.scala 106:3 40:25]
    node _GEN_214 = mux(_T, m_4_sel, _GEN_193) @[PE_CTRL.scala 106:3 41:25]
    node _GEN_215 = mux(_T, m_5_sel, _GEN_194) @[PE_CTRL.scala 106:3 42:25]
    node _GEN_216 = mux(_T, m_6_sel, _GEN_195) @[PE_CTRL.scala 106:3 43:25]
    node _GEN_217 = mux(_T, m_7_sel, _GEN_196) @[PE_CTRL.scala 106:3 44:25]
    node _GEN_218 = mux(_T, m_8_sel, _GEN_197) @[PE_CTRL.scala 106:3 45:25]
    node _GEN_219 = mux(_T, m_9_sel, _GEN_198) @[PE_CTRL.scala 106:3 46:25]
    node _GEN_220 = mux(_T, value_1, _GEN_200) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_221 = mux(_T, value, _GEN_201) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_222 = mux(_T, value_2, _GEN_202) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_223 = mux(_T, value_3, _GEN_203) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_224 = mux(_T, value_4, _GEN_204) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    node _GEN_225 = mux(_T, value_5, _GEN_205) @[PE_CTRL.scala 106:3 Counter.scala 60:40]
    io_m_0_sel <= m_0_sel @[PE_CTRL.scala 62:14]
    io_m_1_sel <= m_1_sel @[PE_CTRL.scala 63:14]
    io_m_2_sel <= m_2_sel @[PE_CTRL.scala 64:14]
    io_m_3_sel <= m_3_sel @[PE_CTRL.scala 65:14]
    io_m_4_sel <= m_4_sel @[PE_CTRL.scala 66:14]
    io_m_5_sel <= m_5_sel @[PE_CTRL.scala 67:14]
    io_m_6_sel <= m_6_sel @[PE_CTRL.scala 68:14]
    io_m_7_sel <= m_7_sel @[PE_CTRL.scala 69:14]
    io_m_8_sel <= m_8_sel @[PE_CTRL.scala 70:14]
    io_m_9_sel <= m_9_sel @[PE_CTRL.scala 71:14]
    io_addsub_0_op <= addsub_0_op @[PE_CTRL.scala 73:18]
    io_addsub_1_op <= addsub_1_op @[PE_CTRL.scala 74:18]
    io_dbg_fsm <= dbg_fsm @[PE_CTRL.scala 76:14]
    m_0_sel <= mux(reset, UInt<2>("h0"), _GEN_210) @[PE_CTRL.scala 37:{25,25}]
    m_1_sel <= mux(reset, UInt<2>("h0"), _GEN_211) @[PE_CTRL.scala 38:{25,25}]
    m_2_sel <= mux(reset, UInt<2>("h0"), _GEN_212) @[PE_CTRL.scala 39:{25,25}]
    m_3_sel <= mux(reset, UInt<2>("h0"), _GEN_213) @[PE_CTRL.scala 40:{25,25}]
    m_4_sel <= mux(reset, UInt<2>("h0"), _GEN_214) @[PE_CTRL.scala 41:{25,25}]
    m_5_sel <= mux(reset, UInt<2>("h0"), _GEN_215) @[PE_CTRL.scala 42:{25,25}]
    m_6_sel <= mux(reset, UInt<2>("h0"), _GEN_216) @[PE_CTRL.scala 43:{25,25}]
    m_7_sel <= mux(reset, UInt<2>("h0"), _GEN_217) @[PE_CTRL.scala 44:{25,25}]
    m_8_sel <= mux(reset, UInt<2>("h0"), _GEN_218) @[PE_CTRL.scala 45:{25,25}]
    m_9_sel <= mux(reset, UInt<2>("h0"), _GEN_219) @[PE_CTRL.scala 46:{25,25}]
    op_type <= io_op_type @[PE_CTRL.scala 48:25]
    addsub_0_op <= mux(reset, UInt<2>("h3"), _GEN_208) @[PE_CTRL.scala 51:{30,30}]
    addsub_1_op <= mux(reset, UInt<2>("h3"), _GEN_209) @[PE_CTRL.scala 52:{30,30}]
    use_int <= io_use_int @[PE_CTRL.scala 55:29]
    dbg_fsm <= mux(reset, UInt<4>("h0"), _GEN_206) @[PE_CTRL.scala 60:{24,24}]
    value <= mux(reset, UInt<4>("h0"), _GEN_221) @[Counter.scala 60:{40,40}]
    value_1 <= mux(reset, UInt<4>("h0"), _GEN_220) @[Counter.scala 60:{40,40}]
    value_2 <= mux(reset, UInt<4>("h0"), _GEN_222) @[Counter.scala 60:{40,40}]
    value_3 <= mux(reset, UInt<4>("h0"), _GEN_223) @[Counter.scala 60:{40,40}]
    value_4 <= mux(reset, UInt<6>("h0"), _GEN_224) @[Counter.scala 60:{40,40}]
    value_5 <= mux(reset, UInt<2>("h0"), _GEN_225) @[Counter.scala 60:{40,40}]
    pe_step <= mux(reset, UInt<4>("h0"), _GEN_207) @[PE_CTRL.scala 103:{25,25}]

  module MuxPE :
    input clock : Clock
    input reset : UInt<1>
    input io_sel : UInt<2>
    input io_in_0 : UInt<32>
    input io_in_1 : UInt<32>
    input io_in_2 : UInt<32>
    input io_in_3 : UInt<32>
    output io_out : UInt<32>

    reg sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), sel) @[MuxPE.scala 20:21]
    reg in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), in_0) @[MuxPE.scala 21:21]
    reg in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), in_1) @[MuxPE.scala 22:21]
    reg in_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), in_2) @[MuxPE.scala 23:21]
    reg in_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), in_3) @[MuxPE.scala 24:21]
    reg out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), out) @[MuxPE.scala 25:21]
    node _T = eq(io_sel, UInt<2>("h0")) @[MuxPE.scala 27:17]
    node _T_1 = eq(io_sel, UInt<2>("h1")) @[MuxPE.scala 31:23]
    node _T_2 = eq(io_sel, UInt<2>("h2")) @[MuxPE.scala 35:23]
    node _GEN_0 = mux(_T_2, in_2, in_3) @[MuxPE.scala 36:3 37:9 41:9]
    node _GEN_1 = mux(_T_1, in_1, _GEN_0) @[MuxPE.scala 32:3 33:9]
    node _GEN_2 = mux(_T, in_0, _GEN_1) @[MuxPE.scala 28:3 29:9]
    io_out <= out @[MuxPE.scala 44:10]
    sel <= io_sel @[MuxPE.scala 20:21]
    in_0 <= io_in_0 @[MuxPE.scala 21:21]
    in_1 <= io_in_1 @[MuxPE.scala 22:21]
    in_2 <= io_in_2 @[MuxPE.scala 23:21]
    in_3 <= io_in_3 @[MuxPE.scala 24:21]
    out <= mux(reset, UInt<32>("h0"), _GEN_2) @[MuxPE.scala 25:{21,21}]

  module MulFullRawFN :
    input io_a_isNaN : UInt<1>
    input io_a_isInf : UInt<1>
    input io_a_isZero : UInt<1>
    input io_a_sign : UInt<1>
    input io_a_sExp : SInt<10>
    input io_a_sig : UInt<25>
    input io_b_isNaN : UInt<1>
    input io_b_isInf : UInt<1>
    input io_b_isZero : UInt<1>
    input io_b_sign : UInt<1>
    input io_b_sExp : SInt<10>
    input io_b_sig : UInt<25>
    output io_invalidExc : UInt<1>
    output io_rawOut_isNaN : UInt<1>
    output io_rawOut_isInf : UInt<1>
    output io_rawOut_isZero : UInt<1>
    output io_rawOut_sign : UInt<1>
    output io_rawOut_sExp : SInt<10>
    output io_rawOut_sig : UInt<48>

    node _notSigNaN_invalidExc_T = and(io_a_isInf, io_b_isZero) @[MulRecFN.scala 58:44]
    node _notSigNaN_invalidExc_T_1 = and(io_a_isZero, io_b_isInf) @[MulRecFN.scala 58:76]
    node notSigNaN_invalidExc = or(_notSigNaN_invalidExc_T, _notSigNaN_invalidExc_T_1) @[MulRecFN.scala 58:60]
    node notNaN_isInfOut = or(io_a_isInf, io_b_isInf) @[MulRecFN.scala 59:38]
    node notNaN_isZeroOut = or(io_a_isZero, io_b_isZero) @[MulRecFN.scala 60:40]
    node notNaN_signOut = xor(io_a_sign, io_b_sign) @[MulRecFN.scala 61:36]
    node _common_sExpOut_T = add(io_a_sExp, io_b_sExp) @[MulRecFN.scala 62:36]
    node _common_sExpOut_T_1 = tail(_common_sExpOut_T, 1) @[MulRecFN.scala 62:36]
    node _common_sExpOut_T_2 = asSInt(_common_sExpOut_T_1) @[MulRecFN.scala 62:36]
    node _common_sExpOut_T_3 = sub(_common_sExpOut_T_2, asSInt(UInt<10>("h100"))) @[MulRecFN.scala 62:48]
    node _common_sExpOut_T_4 = tail(_common_sExpOut_T_3, 1) @[MulRecFN.scala 62:48]
    node common_sExpOut = asSInt(_common_sExpOut_T_4) @[MulRecFN.scala 62:48]
    node _common_sigOut_T = mul(io_a_sig, io_b_sig) @[MulRecFN.scala 63:35]
    node common_sigOut = bits(_common_sigOut_T, 47, 0) @[MulRecFN.scala 63:46]
    node _io_invalidExc_T = bits(io_a_sig, 22, 22) @[common.scala 84:56]
    node _io_invalidExc_T_1 = eq(_io_invalidExc_T, UInt<1>("h0")) @[common.scala 84:49]
    node _io_invalidExc_T_2 = and(io_a_isNaN, _io_invalidExc_T_1) @[common.scala 84:46]
    node _io_invalidExc_T_3 = bits(io_b_sig, 22, 22) @[common.scala 84:56]
    node _io_invalidExc_T_4 = eq(_io_invalidExc_T_3, UInt<1>("h0")) @[common.scala 84:49]
    node _io_invalidExc_T_5 = and(io_b_isNaN, _io_invalidExc_T_4) @[common.scala 84:46]
    node _io_invalidExc_T_6 = or(_io_invalidExc_T_2, _io_invalidExc_T_5) @[MulRecFN.scala 66:45]
    node _io_invalidExc_T_7 = or(_io_invalidExc_T_6, notSigNaN_invalidExc) @[MulRecFN.scala 66:71]
    node _io_rawOut_isNaN_T = or(io_a_isNaN, io_b_isNaN) @[MulRecFN.scala 70:35]
    io_invalidExc <= _io_invalidExc_T_7 @[MulRecFN.scala 66:19]
    io_rawOut_isNaN <= _io_rawOut_isNaN_T @[MulRecFN.scala 70:21]
    io_rawOut_isInf <= notNaN_isInfOut @[MulRecFN.scala 67:21]
    io_rawOut_isZero <= notNaN_isZeroOut @[MulRecFN.scala 68:22]
    io_rawOut_sign <= notNaN_signOut @[MulRecFN.scala 71:20]
    io_rawOut_sExp <= common_sExpOut @[MulRecFN.scala 69:20]
    io_rawOut_sig <= common_sigOut @[MulRecFN.scala 72:19]

  module MulRawFN :
    input io_a_isNaN : UInt<1>
    input io_a_isInf : UInt<1>
    input io_a_isZero : UInt<1>
    input io_a_sign : UInt<1>
    input io_a_sExp : SInt<10>
    input io_a_sig : UInt<25>
    input io_b_isNaN : UInt<1>
    input io_b_isInf : UInt<1>
    input io_b_isZero : UInt<1>
    input io_b_sign : UInt<1>
    input io_b_sExp : SInt<10>
    input io_b_sig : UInt<25>
    output io_invalidExc : UInt<1>
    output io_rawOut_isNaN : UInt<1>
    output io_rawOut_isInf : UInt<1>
    output io_rawOut_isZero : UInt<1>
    output io_rawOut_sign : UInt<1>
    output io_rawOut_sExp : SInt<10>
    output io_rawOut_sig : UInt<27>

    inst mulFullRaw of MulFullRawFN @[MulRecFN.scala 84:28]
    node _io_rawOut_sig_T = shr(mulFullRaw.io_rawOut_sig, 22) @[MulRecFN.scala 93:15]
    node _io_rawOut_sig_T_1 = bits(mulFullRaw.io_rawOut_sig, 21, 0) @[MulRecFN.scala 93:37]
    node _io_rawOut_sig_T_2 = orr(_io_rawOut_sig_T_1) @[MulRecFN.scala 93:55]
    node _io_rawOut_sig_T_3 = cat(_io_rawOut_sig_T, _io_rawOut_sig_T_2) @[Cat.scala 30:58]
    io_invalidExc <= mulFullRaw.io_invalidExc @[MulRecFN.scala 89:19]
    io_rawOut_isNaN <= mulFullRaw.io_rawOut_isNaN @[MulRecFN.scala 90:15]
    io_rawOut_isInf <= mulFullRaw.io_rawOut_isInf @[MulRecFN.scala 90:15]
    io_rawOut_isZero <= mulFullRaw.io_rawOut_isZero @[MulRecFN.scala 90:15]
    io_rawOut_sign <= mulFullRaw.io_rawOut_sign @[MulRecFN.scala 90:15]
    io_rawOut_sExp <= mulFullRaw.io_rawOut_sExp @[MulRecFN.scala 90:15]
    io_rawOut_sig <= _io_rawOut_sig_T_3 @[MulRecFN.scala 91:19]
    mulFullRaw.io_a_isNaN <= io_a_isNaN @[MulRecFN.scala 86:21]
    mulFullRaw.io_a_isInf <= io_a_isInf @[MulRecFN.scala 86:21]
    mulFullRaw.io_a_isZero <= io_a_isZero @[MulRecFN.scala 86:21]
    mulFullRaw.io_a_sign <= io_a_sign @[MulRecFN.scala 86:21]
    mulFullRaw.io_a_sExp <= io_a_sExp @[MulRecFN.scala 86:21]
    mulFullRaw.io_a_sig <= io_a_sig @[MulRecFN.scala 86:21]
    mulFullRaw.io_b_isNaN <= io_b_isNaN @[MulRecFN.scala 87:21]
    mulFullRaw.io_b_isInf <= io_b_isInf @[MulRecFN.scala 87:21]
    mulFullRaw.io_b_isZero <= io_b_isZero @[MulRecFN.scala 87:21]
    mulFullRaw.io_b_sign <= io_b_sign @[MulRecFN.scala 87:21]
    mulFullRaw.io_b_sExp <= io_b_sExp @[MulRecFN.scala 87:21]
    mulFullRaw.io_b_sig <= io_b_sig @[MulRecFN.scala 87:21]

  module RoundAnyRawFNToRecFN :
    input io_invalidExc : UInt<1>
    input io_infiniteExc : UInt<1>
    input io_in_isNaN : UInt<1>
    input io_in_isInf : UInt<1>
    input io_in_isZero : UInt<1>
    input io_in_sign : UInt<1>
    input io_in_sExp : SInt<10>
    input io_in_sig : UInt<27>
    input io_roundingMode : UInt<3>
    input io_detectTininess : UInt<1>
    output io_out : UInt<33>
    output io_exceptionFlags : UInt<5>

    node roundingMode_near_even = eq(io_roundingMode, UInt<3>("h0")) @[RoundAnyRawFNToRecFN.scala 88:53]
    node roundingMode_minMag = eq(io_roundingMode, UInt<3>("h1")) @[RoundAnyRawFNToRecFN.scala 89:53]
    node roundingMode_min = eq(io_roundingMode, UInt<3>("h2")) @[RoundAnyRawFNToRecFN.scala 90:53]
    node roundingMode_max = eq(io_roundingMode, UInt<3>("h3")) @[RoundAnyRawFNToRecFN.scala 91:53]
    node roundingMode_near_maxMag = eq(io_roundingMode, UInt<3>("h4")) @[RoundAnyRawFNToRecFN.scala 92:53]
    node roundingMode_odd = eq(io_roundingMode, UInt<3>("h6")) @[RoundAnyRawFNToRecFN.scala 93:53]
    node _roundMagUp_T = and(roundingMode_min, io_in_sign) @[RoundAnyRawFNToRecFN.scala 96:27]
    node _roundMagUp_T_1 = eq(io_in_sign, UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 96:66]
    node _roundMagUp_T_2 = and(roundingMode_max, _roundMagUp_T_1) @[RoundAnyRawFNToRecFN.scala 96:63]
    node roundMagUp = or(_roundMagUp_T, _roundMagUp_T_2) @[RoundAnyRawFNToRecFN.scala 96:42]
    node adjustedSig = shl(io_in_sig, 0) @[RoundAnyRawFNToRecFN.scala 112:22]
    node doShiftSigDown1 = bits(adjustedSig, 26, 26) @[RoundAnyRawFNToRecFN.scala 118:61]
    node _roundMask_T = bits(io_in_sExp, 8, 0) @[RoundAnyRawFNToRecFN.scala 154:37]
    node _roundMask_T_1 = not(_roundMask_T) @[primitives.scala 51:21]
    node roundMask_msb = bits(_roundMask_T_1, 8, 8) @[primitives.scala 57:25]
    node roundMask_lsbs = bits(_roundMask_T_1, 7, 0) @[primitives.scala 58:26]
    node roundMask_msb_1 = bits(roundMask_lsbs, 7, 7) @[primitives.scala 57:25]
    node roundMask_lsbs_1 = bits(roundMask_lsbs, 6, 0) @[primitives.scala 58:26]
    node roundMask_msb_2 = bits(roundMask_lsbs_1, 6, 6) @[primitives.scala 57:25]
    node roundMask_lsbs_2 = bits(roundMask_lsbs_1, 5, 0) @[primitives.scala 58:26]
    node roundMask_shift = dshr(asSInt(UInt<65>("h10000000000000000")), roundMask_lsbs_2) @[primitives.scala 77:58]
    node _roundMask_T_2 = bits(roundMask_shift, 63, 42) @[primitives.scala 79:22]
    node _roundMask_T_3 = bits(_roundMask_T_2, 15, 0) @[Bitwise.scala 109:18]
    node _roundMask_T_4 = shl(UInt<8>("hff"), 8) @[Bitwise.scala 102:47]
    node _roundMask_T_5 = xor(UInt<16>("hffff"), _roundMask_T_4) @[Bitwise.scala 102:21]
    node _roundMask_T_6 = shr(_roundMask_T_3, 8) @[Bitwise.scala 103:21]
    node _roundMask_T_7 = and(_roundMask_T_6, _roundMask_T_5) @[Bitwise.scala 103:31]
    node _roundMask_T_8 = bits(_roundMask_T_3, 7, 0) @[Bitwise.scala 103:46]
    node _roundMask_T_9 = shl(_roundMask_T_8, 8) @[Bitwise.scala 103:65]
    node _roundMask_T_10 = not(_roundMask_T_5) @[Bitwise.scala 103:77]
    node _roundMask_T_11 = and(_roundMask_T_9, _roundMask_T_10) @[Bitwise.scala 103:75]
    node _roundMask_T_12 = or(_roundMask_T_7, _roundMask_T_11) @[Bitwise.scala 103:39]
    node _roundMask_T_13 = bits(_roundMask_T_5, 11, 0) @[Bitwise.scala 102:28]
    node _roundMask_T_14 = shl(_roundMask_T_13, 4) @[Bitwise.scala 102:47]
    node _roundMask_T_15 = xor(_roundMask_T_5, _roundMask_T_14) @[Bitwise.scala 102:21]
    node _roundMask_T_16 = shr(_roundMask_T_12, 4) @[Bitwise.scala 103:21]
    node _roundMask_T_17 = and(_roundMask_T_16, _roundMask_T_15) @[Bitwise.scala 103:31]
    node _roundMask_T_18 = bits(_roundMask_T_12, 11, 0) @[Bitwise.scala 103:46]
    node _roundMask_T_19 = shl(_roundMask_T_18, 4) @[Bitwise.scala 103:65]
    node _roundMask_T_20 = not(_roundMask_T_15) @[Bitwise.scala 103:77]
    node _roundMask_T_21 = and(_roundMask_T_19, _roundMask_T_20) @[Bitwise.scala 103:75]
    node _roundMask_T_22 = or(_roundMask_T_17, _roundMask_T_21) @[Bitwise.scala 103:39]
    node _roundMask_T_23 = bits(_roundMask_T_15, 13, 0) @[Bitwise.scala 102:28]
    node _roundMask_T_24 = shl(_roundMask_T_23, 2) @[Bitwise.scala 102:47]
    node _roundMask_T_25 = xor(_roundMask_T_15, _roundMask_T_24) @[Bitwise.scala 102:21]
    node _roundMask_T_26 = shr(_roundMask_T_22, 2) @[Bitwise.scala 103:21]
    node _roundMask_T_27 = and(_roundMask_T_26, _roundMask_T_25) @[Bitwise.scala 103:31]
    node _roundMask_T_28 = bits(_roundMask_T_22, 13, 0) @[Bitwise.scala 103:46]
    node _roundMask_T_29 = shl(_roundMask_T_28, 2) @[Bitwise.scala 103:65]
    node _roundMask_T_30 = not(_roundMask_T_25) @[Bitwise.scala 103:77]
    node _roundMask_T_31 = and(_roundMask_T_29, _roundMask_T_30) @[Bitwise.scala 103:75]
    node _roundMask_T_32 = or(_roundMask_T_27, _roundMask_T_31) @[Bitwise.scala 103:39]
    node _roundMask_T_33 = bits(_roundMask_T_25, 14, 0) @[Bitwise.scala 102:28]
    node _roundMask_T_34 = shl(_roundMask_T_33, 1) @[Bitwise.scala 102:47]
    node _roundMask_T_35 = xor(_roundMask_T_25, _roundMask_T_34) @[Bitwise.scala 102:21]
    node _roundMask_T_36 = shr(_roundMask_T_32, 1) @[Bitwise.scala 103:21]
    node _roundMask_T_37 = and(_roundMask_T_36, _roundMask_T_35) @[Bitwise.scala 103:31]
    node _roundMask_T_38 = bits(_roundMask_T_32, 14, 0) @[Bitwise.scala 103:46]
    node _roundMask_T_39 = shl(_roundMask_T_38, 1) @[Bitwise.scala 103:65]
    node _roundMask_T_40 = not(_roundMask_T_35) @[Bitwise.scala 103:77]
    node _roundMask_T_41 = and(_roundMask_T_39, _roundMask_T_40) @[Bitwise.scala 103:75]
    node _roundMask_T_42 = or(_roundMask_T_37, _roundMask_T_41) @[Bitwise.scala 103:39]
    node _roundMask_T_43 = bits(_roundMask_T_2, 21, 16) @[Bitwise.scala 109:44]
    node _roundMask_T_44 = bits(_roundMask_T_43, 3, 0) @[Bitwise.scala 109:18]
    node _roundMask_T_45 = bits(_roundMask_T_44, 1, 0) @[Bitwise.scala 109:18]
    node _roundMask_T_46 = bits(_roundMask_T_45, 0, 0) @[Bitwise.scala 109:18]
    node _roundMask_T_47 = bits(_roundMask_T_45, 1, 1) @[Bitwise.scala 109:44]
    node _roundMask_T_48 = cat(_roundMask_T_46, _roundMask_T_47) @[Cat.scala 30:58]
    node _roundMask_T_49 = bits(_roundMask_T_44, 3, 2) @[Bitwise.scala 109:44]
    node _roundMask_T_50 = bits(_roundMask_T_49, 0, 0) @[Bitwise.scala 109:18]
    node _roundMask_T_51 = bits(_roundMask_T_49, 1, 1) @[Bitwise.scala 109:44]
    node _roundMask_T_52 = cat(_roundMask_T_50, _roundMask_T_51) @[Cat.scala 30:58]
    node _roundMask_T_53 = cat(_roundMask_T_48, _roundMask_T_52) @[Cat.scala 30:58]
    node _roundMask_T_54 = bits(_roundMask_T_43, 5, 4) @[Bitwise.scala 109:44]
    node _roundMask_T_55 = bits(_roundMask_T_54, 0, 0) @[Bitwise.scala 109:18]
    node _roundMask_T_56 = bits(_roundMask_T_54, 1, 1) @[Bitwise.scala 109:44]
    node _roundMask_T_57 = cat(_roundMask_T_55, _roundMask_T_56) @[Cat.scala 30:58]
    node _roundMask_T_58 = cat(_roundMask_T_53, _roundMask_T_57) @[Cat.scala 30:58]
    node _roundMask_T_59 = cat(_roundMask_T_42, _roundMask_T_58) @[Cat.scala 30:58]
    node _roundMask_T_60 = not(_roundMask_T_59) @[primitives.scala 74:36]
    node _roundMask_T_61 = mux(roundMask_msb_2, UInt<1>("h0"), _roundMask_T_60) @[primitives.scala 74:21]
    node _roundMask_T_62 = not(_roundMask_T_61) @[primitives.scala 74:17]
    node _roundMask_T_63 = cat(_roundMask_T_62, UInt<3>("h7")) @[Cat.scala 30:58]
    node roundMask_msb_3 = bits(roundMask_lsbs_1, 6, 6) @[primitives.scala 57:25]
    node roundMask_lsbs_3 = bits(roundMask_lsbs_1, 5, 0) @[primitives.scala 58:26]
    node roundMask_shift_1 = dshr(asSInt(UInt<65>("h10000000000000000")), roundMask_lsbs_3) @[primitives.scala 77:58]
    node _roundMask_T_64 = bits(roundMask_shift_1, 2, 0) @[primitives.scala 79:22]
    node _roundMask_T_65 = bits(_roundMask_T_64, 1, 0) @[Bitwise.scala 109:18]
    node _roundMask_T_66 = bits(_roundMask_T_65, 0, 0) @[Bitwise.scala 109:18]
    node _roundMask_T_67 = bits(_roundMask_T_65, 1, 1) @[Bitwise.scala 109:44]
    node _roundMask_T_68 = cat(_roundMask_T_66, _roundMask_T_67) @[Cat.scala 30:58]
    node _roundMask_T_69 = bits(_roundMask_T_64, 2, 2) @[Bitwise.scala 109:44]
    node _roundMask_T_70 = cat(_roundMask_T_68, _roundMask_T_69) @[Cat.scala 30:58]
    node _roundMask_T_71 = mux(roundMask_msb_3, _roundMask_T_70, UInt<1>("h0")) @[primitives.scala 61:24]
    node _roundMask_T_72 = mux(roundMask_msb_1, _roundMask_T_63, _roundMask_T_71) @[primitives.scala 66:24]
    node _roundMask_T_73 = mux(roundMask_msb, _roundMask_T_72, UInt<1>("h0")) @[primitives.scala 61:24]
    node _roundMask_T_74 = or(_roundMask_T_73, doShiftSigDown1) @[RoundAnyRawFNToRecFN.scala 157:23]
    node roundMask = cat(_roundMask_T_74, UInt<2>("h3")) @[Cat.scala 30:58]
    node _shiftedRoundMask_T = shr(roundMask, 1) @[RoundAnyRawFNToRecFN.scala 160:57]
    node shiftedRoundMask = cat(UInt<1>("h0"), _shiftedRoundMask_T) @[Cat.scala 30:58]
    node _roundPosMask_T = not(shiftedRoundMask) @[RoundAnyRawFNToRecFN.scala 161:28]
    node roundPosMask = and(_roundPosMask_T, roundMask) @[RoundAnyRawFNToRecFN.scala 161:46]
    node _roundPosBit_T = and(adjustedSig, roundPosMask) @[RoundAnyRawFNToRecFN.scala 162:40]
    node roundPosBit = orr(_roundPosBit_T) @[RoundAnyRawFNToRecFN.scala 162:56]
    node _anyRoundExtra_T = and(adjustedSig, shiftedRoundMask) @[RoundAnyRawFNToRecFN.scala 163:42]
    node anyRoundExtra = orr(_anyRoundExtra_T) @[RoundAnyRawFNToRecFN.scala 163:62]
    node anyRound = or(roundPosBit, anyRoundExtra) @[RoundAnyRawFNToRecFN.scala 164:36]
    node _roundIncr_T = or(roundingMode_near_even, roundingMode_near_maxMag) @[RoundAnyRawFNToRecFN.scala 167:38]
    node _roundIncr_T_1 = and(_roundIncr_T, roundPosBit) @[RoundAnyRawFNToRecFN.scala 167:67]
    node _roundIncr_T_2 = and(roundMagUp, anyRound) @[RoundAnyRawFNToRecFN.scala 169:29]
    node roundIncr = or(_roundIncr_T_1, _roundIncr_T_2) @[RoundAnyRawFNToRecFN.scala 168:31]
    node _roundedSig_T = or(adjustedSig, roundMask) @[RoundAnyRawFNToRecFN.scala 172:32]
    node _roundedSig_T_1 = shr(_roundedSig_T, 2) @[RoundAnyRawFNToRecFN.scala 172:44]
    node _roundedSig_T_2 = add(_roundedSig_T_1, UInt<1>("h1")) @[RoundAnyRawFNToRecFN.scala 172:49]
    node _roundedSig_T_3 = and(roundingMode_near_even, roundPosBit) @[RoundAnyRawFNToRecFN.scala 173:49]
    node _roundedSig_T_4 = eq(anyRoundExtra, UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 174:30]
    node _roundedSig_T_5 = and(_roundedSig_T_3, _roundedSig_T_4) @[RoundAnyRawFNToRecFN.scala 173:64]
    node _roundedSig_T_6 = shr(roundMask, 1) @[RoundAnyRawFNToRecFN.scala 175:35]
    node _roundedSig_T_7 = mux(_roundedSig_T_5, _roundedSig_T_6, UInt<26>("h0")) @[RoundAnyRawFNToRecFN.scala 173:25]
    node _roundedSig_T_8 = not(_roundedSig_T_7) @[RoundAnyRawFNToRecFN.scala 173:21]
    node _roundedSig_T_9 = and(_roundedSig_T_2, _roundedSig_T_8) @[RoundAnyRawFNToRecFN.scala 172:61]
    node _roundedSig_T_10 = not(roundMask) @[RoundAnyRawFNToRecFN.scala 178:32]
    node _roundedSig_T_11 = and(adjustedSig, _roundedSig_T_10) @[RoundAnyRawFNToRecFN.scala 178:30]
    node _roundedSig_T_12 = shr(_roundedSig_T_11, 2) @[RoundAnyRawFNToRecFN.scala 178:43]
    node _roundedSig_T_13 = and(roundingMode_odd, anyRound) @[RoundAnyRawFNToRecFN.scala 179:42]
    node _roundedSig_T_14 = shr(roundPosMask, 1) @[RoundAnyRawFNToRecFN.scala 179:67]
    node _roundedSig_T_15 = mux(_roundedSig_T_13, _roundedSig_T_14, UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 179:24]
    node _roundedSig_T_16 = or(_roundedSig_T_12, _roundedSig_T_15) @[RoundAnyRawFNToRecFN.scala 178:47]
    node roundedSig = mux(roundIncr, _roundedSig_T_9, _roundedSig_T_16) @[RoundAnyRawFNToRecFN.scala 171:16]
    node _sRoundedExp_T = shr(roundedSig, 24) @[RoundAnyRawFNToRecFN.scala 183:54]
    node _sRoundedExp_T_1 = cvt(_sRoundedExp_T) @[RoundAnyRawFNToRecFN.scala 183:69]
    node sRoundedExp = add(io_in_sExp, _sRoundedExp_T_1) @[RoundAnyRawFNToRecFN.scala 183:40]
    node _common_expOut_T = bits(sRoundedExp, 8, 0) @[RoundAnyRawFNToRecFN.scala 185:37]
    node _common_fractOut_T = bits(roundedSig, 23, 1) @[RoundAnyRawFNToRecFN.scala 188:27]
    node _common_fractOut_T_1 = bits(roundedSig, 22, 0) @[RoundAnyRawFNToRecFN.scala 189:27]
    node _common_fractOut_T_2 = mux(doShiftSigDown1, _common_fractOut_T, _common_fractOut_T_1) @[RoundAnyRawFNToRecFN.scala 187:16]
    node _common_overflow_T = shr(sRoundedExp, 7) @[RoundAnyRawFNToRecFN.scala 194:30]
    node _common_overflow_T_1 = geq(_common_overflow_T, asSInt(UInt<3>("h3"))) @[RoundAnyRawFNToRecFN.scala 194:50]
    node _common_totalUnderflow_T = lt(sRoundedExp, asSInt(UInt<8>("h6b"))) @[RoundAnyRawFNToRecFN.scala 198:31]
    node _unboundedRange_roundPosBit_T = bits(adjustedSig, 2, 2) @[RoundAnyRawFNToRecFN.scala 201:45]
    node _unboundedRange_roundPosBit_T_1 = bits(adjustedSig, 1, 1) @[RoundAnyRawFNToRecFN.scala 201:61]
    node unboundedRange_roundPosBit = mux(doShiftSigDown1, _unboundedRange_roundPosBit_T, _unboundedRange_roundPosBit_T_1) @[RoundAnyRawFNToRecFN.scala 201:16]
    node _unboundedRange_anyRound_T = bits(adjustedSig, 2, 2) @[RoundAnyRawFNToRecFN.scala 203:44]
    node _unboundedRange_anyRound_T_1 = and(doShiftSigDown1, _unboundedRange_anyRound_T) @[RoundAnyRawFNToRecFN.scala 203:30]
    node _unboundedRange_anyRound_T_2 = bits(adjustedSig, 1, 0) @[RoundAnyRawFNToRecFN.scala 203:63]
    node _unboundedRange_anyRound_T_3 = orr(_unboundedRange_anyRound_T_2) @[RoundAnyRawFNToRecFN.scala 203:70]
    node unboundedRange_anyRound = or(_unboundedRange_anyRound_T_1, _unboundedRange_anyRound_T_3) @[RoundAnyRawFNToRecFN.scala 203:49]
    node _unboundedRange_roundIncr_T = or(roundingMode_near_even, roundingMode_near_maxMag) @[RoundAnyRawFNToRecFN.scala 205:38]
    node _unboundedRange_roundIncr_T_1 = and(_unboundedRange_roundIncr_T, unboundedRange_roundPosBit) @[RoundAnyRawFNToRecFN.scala 205:67]
    node _unboundedRange_roundIncr_T_2 = and(roundMagUp, unboundedRange_anyRound) @[RoundAnyRawFNToRecFN.scala 207:29]
    node unboundedRange_roundIncr = or(_unboundedRange_roundIncr_T_1, _unboundedRange_roundIncr_T_2) @[RoundAnyRawFNToRecFN.scala 206:46]
    node _roundCarry_T = bits(roundedSig, 25, 25) @[RoundAnyRawFNToRecFN.scala 210:27]
    node _roundCarry_T_1 = bits(roundedSig, 24, 24) @[RoundAnyRawFNToRecFN.scala 211:27]
    node roundCarry = mux(doShiftSigDown1, _roundCarry_T, _roundCarry_T_1) @[RoundAnyRawFNToRecFN.scala 209:16]
    node _common_underflow_T = shr(io_in_sExp, 8) @[RoundAnyRawFNToRecFN.scala 218:48]
    node _common_underflow_T_1 = leq(_common_underflow_T, asSInt(UInt<1>("h0"))) @[RoundAnyRawFNToRecFN.scala 218:62]
    node _common_underflow_T_2 = and(anyRound, _common_underflow_T_1) @[RoundAnyRawFNToRecFN.scala 218:32]
    node _common_underflow_T_3 = bits(roundMask, 3, 3) @[RoundAnyRawFNToRecFN.scala 219:57]
    node _common_underflow_T_4 = bits(roundMask, 2, 2) @[RoundAnyRawFNToRecFN.scala 219:71]
    node _common_underflow_T_5 = mux(doShiftSigDown1, _common_underflow_T_3, _common_underflow_T_4) @[RoundAnyRawFNToRecFN.scala 219:30]
    node _common_underflow_T_6 = and(_common_underflow_T_2, _common_underflow_T_5) @[RoundAnyRawFNToRecFN.scala 218:74]
    node _common_underflow_T_7 = eq(io_detectTininess, UInt<1>("h1")) @[RoundAnyRawFNToRecFN.scala 220:49]
    node _common_underflow_T_8 = bits(roundMask, 4, 4) @[RoundAnyRawFNToRecFN.scala 222:49]
    node _common_underflow_T_9 = bits(roundMask, 3, 3) @[RoundAnyRawFNToRecFN.scala 223:49]
    node _common_underflow_T_10 = mux(doShiftSigDown1, _common_underflow_T_8, _common_underflow_T_9) @[RoundAnyRawFNToRecFN.scala 221:39]
    node _common_underflow_T_11 = eq(_common_underflow_T_10, UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 221:34]
    node _common_underflow_T_12 = and(_common_underflow_T_7, _common_underflow_T_11) @[RoundAnyRawFNToRecFN.scala 220:77]
    node _common_underflow_T_13 = and(_common_underflow_T_12, roundCarry) @[RoundAnyRawFNToRecFN.scala 224:38]
    node _common_underflow_T_14 = and(_common_underflow_T_13, roundPosBit) @[RoundAnyRawFNToRecFN.scala 225:45]
    node _common_underflow_T_15 = and(_common_underflow_T_14, unboundedRange_roundIncr) @[RoundAnyRawFNToRecFN.scala 225:60]
    node _common_underflow_T_16 = eq(_common_underflow_T_15, UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 220:27]
    node _common_underflow_T_17 = and(_common_underflow_T_6, _common_underflow_T_16) @[RoundAnyRawFNToRecFN.scala 219:76]
    node common_totalUnderflow = _common_totalUnderflow_T @[RoundAnyRawFNToRecFN.scala 123:37 195:31]
    node _common_underflow_T_18 = or(common_totalUnderflow, _common_underflow_T_17) @[RoundAnyRawFNToRecFN.scala 215:40]
    node _common_inexact_T = or(common_totalUnderflow, anyRound) @[RoundAnyRawFNToRecFN.scala 228:49]
    node isNaNOut = or(io_invalidExc, io_in_isNaN) @[RoundAnyRawFNToRecFN.scala 233:34]
    node notNaN_isSpecialInfOut = or(io_infiniteExc, io_in_isInf) @[RoundAnyRawFNToRecFN.scala 234:49]
    node _commonCase_T = eq(isNaNOut, UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 235:22]
    node _commonCase_T_1 = eq(notNaN_isSpecialInfOut, UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 235:36]
    node _commonCase_T_2 = and(_commonCase_T, _commonCase_T_1) @[RoundAnyRawFNToRecFN.scala 235:33]
    node _commonCase_T_3 = eq(io_in_isZero, UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 235:64]
    node commonCase = and(_commonCase_T_2, _commonCase_T_3) @[RoundAnyRawFNToRecFN.scala 235:61]
    node common_overflow = _common_overflow_T_1 @[RoundAnyRawFNToRecFN.scala 122:37 191:25]
    node overflow = and(commonCase, common_overflow) @[RoundAnyRawFNToRecFN.scala 236:32]
    node common_underflow = _common_underflow_T_18 @[RoundAnyRawFNToRecFN.scala 124:37 213:26]
    node underflow = and(commonCase, common_underflow) @[RoundAnyRawFNToRecFN.scala 237:32]
    node common_inexact = _common_inexact_T @[RoundAnyRawFNToRecFN.scala 125:37 228:24]
    node _inexact_T = and(commonCase, common_inexact) @[RoundAnyRawFNToRecFN.scala 238:43]
    node inexact = or(overflow, _inexact_T) @[RoundAnyRawFNToRecFN.scala 238:28]
    node _overflow_roundMagUp_T = or(roundingMode_near_even, roundingMode_near_maxMag) @[RoundAnyRawFNToRecFN.scala 241:32]
    node overflow_roundMagUp = or(_overflow_roundMagUp_T, roundMagUp) @[RoundAnyRawFNToRecFN.scala 241:60]
    node _pegMinNonzeroMagOut_T = and(commonCase, common_totalUnderflow) @[RoundAnyRawFNToRecFN.scala 243:20]
    node _pegMinNonzeroMagOut_T_1 = or(roundMagUp, roundingMode_odd) @[RoundAnyRawFNToRecFN.scala 243:60]
    node pegMinNonzeroMagOut = and(_pegMinNonzeroMagOut_T, _pegMinNonzeroMagOut_T_1) @[RoundAnyRawFNToRecFN.scala 243:45]
    node _pegMaxFiniteMagOut_T = eq(overflow_roundMagUp, UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 244:42]
    node pegMaxFiniteMagOut = and(overflow, _pegMaxFiniteMagOut_T) @[RoundAnyRawFNToRecFN.scala 244:39]
    node _notNaN_isInfOut_T = and(overflow, overflow_roundMagUp) @[RoundAnyRawFNToRecFN.scala 246:45]
    node notNaN_isInfOut = or(notNaN_isSpecialInfOut, _notNaN_isInfOut_T) @[RoundAnyRawFNToRecFN.scala 246:32]
    node signOut = mux(isNaNOut, UInt<1>("h0"), io_in_sign) @[RoundAnyRawFNToRecFN.scala 248:22]
    node _expOut_T = or(io_in_isZero, common_totalUnderflow) @[RoundAnyRawFNToRecFN.scala 251:32]
    node _expOut_T_1 = mux(_expOut_T, UInt<9>("h1c0"), UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 251:18]
    node _expOut_T_2 = not(_expOut_T_1) @[RoundAnyRawFNToRecFN.scala 251:14]
    node common_expOut = _common_expOut_T @[RoundAnyRawFNToRecFN.scala 120:31 185:23]
    node _expOut_T_3 = and(common_expOut, _expOut_T_2) @[RoundAnyRawFNToRecFN.scala 250:24]
    node _expOut_T_4 = not(UInt<9>("h6b")) @[RoundAnyRawFNToRecFN.scala 256:19]
    node _expOut_T_5 = mux(pegMinNonzeroMagOut, _expOut_T_4, UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 255:18]
    node _expOut_T_6 = not(_expOut_T_5) @[RoundAnyRawFNToRecFN.scala 255:14]
    node _expOut_T_7 = and(_expOut_T_3, _expOut_T_6) @[RoundAnyRawFNToRecFN.scala 254:17]
    node _expOut_T_8 = mux(pegMaxFiniteMagOut, UInt<9>("h80"), UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 259:18]
    node _expOut_T_9 = not(_expOut_T_8) @[RoundAnyRawFNToRecFN.scala 259:14]
    node _expOut_T_10 = and(_expOut_T_7, _expOut_T_9) @[RoundAnyRawFNToRecFN.scala 258:17]
    node _expOut_T_11 = mux(notNaN_isInfOut, UInt<9>("h40"), UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 263:18]
    node _expOut_T_12 = not(_expOut_T_11) @[RoundAnyRawFNToRecFN.scala 263:14]
    node _expOut_T_13 = and(_expOut_T_10, _expOut_T_12) @[RoundAnyRawFNToRecFN.scala 262:17]
    node _expOut_T_14 = mux(pegMinNonzeroMagOut, UInt<9>("h6b"), UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 267:16]
    node _expOut_T_15 = or(_expOut_T_13, _expOut_T_14) @[RoundAnyRawFNToRecFN.scala 266:18]
    node _expOut_T_16 = mux(pegMaxFiniteMagOut, UInt<9>("h17f"), UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 271:16]
    node _expOut_T_17 = or(_expOut_T_15, _expOut_T_16) @[RoundAnyRawFNToRecFN.scala 270:15]
    node _expOut_T_18 = mux(notNaN_isInfOut, UInt<9>("h180"), UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 275:16]
    node _expOut_T_19 = or(_expOut_T_17, _expOut_T_18) @[RoundAnyRawFNToRecFN.scala 274:15]
    node _expOut_T_20 = mux(isNaNOut, UInt<9>("h1c0"), UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 276:16]
    node expOut = or(_expOut_T_19, _expOut_T_20) @[RoundAnyRawFNToRecFN.scala 275:77]
    node _fractOut_T = or(isNaNOut, io_in_isZero) @[RoundAnyRawFNToRecFN.scala 278:22]
    node _fractOut_T_1 = or(_fractOut_T, common_totalUnderflow) @[RoundAnyRawFNToRecFN.scala 278:38]
    node _fractOut_T_2 = mux(isNaNOut, UInt<23>("h400000"), UInt<1>("h0")) @[RoundAnyRawFNToRecFN.scala 279:16]
    node common_fractOut = _common_fractOut_T_2 @[RoundAnyRawFNToRecFN.scala 121:31 186:25]
    node _fractOut_T_3 = mux(_fractOut_T_1, _fractOut_T_2, common_fractOut) @[RoundAnyRawFNToRecFN.scala 278:12]
    node _fractOut_T_4 = bits(pegMaxFiniteMagOut, 0, 0) @[Bitwise.scala 72:15]
    node _fractOut_T_5 = mux(_fractOut_T_4, UInt<23>("h7fffff"), UInt<23>("h0")) @[Bitwise.scala 72:12]
    node fractOut = or(_fractOut_T_3, _fractOut_T_5) @[RoundAnyRawFNToRecFN.scala 281:11]
    node io_out_hi = cat(signOut, expOut) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, fractOut) @[Cat.scala 30:58]
    node io_exceptionFlags_lo = cat(underflow, inexact) @[Cat.scala 30:58]
    node io_exceptionFlags_hi_hi = cat(io_invalidExc, io_infiniteExc) @[Cat.scala 30:58]
    node io_exceptionFlags_hi = cat(io_exceptionFlags_hi_hi, overflow) @[Cat.scala 30:58]
    node _io_exceptionFlags_T = cat(io_exceptionFlags_hi, io_exceptionFlags_lo) @[Cat.scala 30:58]
    io_out <= _io_out_T @[RoundAnyRawFNToRecFN.scala 284:12]
    io_exceptionFlags <= _io_exceptionFlags_T @[RoundAnyRawFNToRecFN.scala 285:23]

  module RoundRawFNToRecFN :
    input io_invalidExc : UInt<1>
    input io_infiniteExc : UInt<1>
    input io_in_isNaN : UInt<1>
    input io_in_isInf : UInt<1>
    input io_in_isZero : UInt<1>
    input io_in_sign : UInt<1>
    input io_in_sExp : SInt<10>
    input io_in_sig : UInt<27>
    input io_roundingMode : UInt<3>
    input io_detectTininess : UInt<1>
    output io_out : UInt<33>
    output io_exceptionFlags : UInt<5>

    inst roundAnyRawFNToRecFN of RoundAnyRawFNToRecFN @[RoundAnyRawFNToRecFN.scala 307:15]
    io_out <= roundAnyRawFNToRecFN.io_out @[RoundAnyRawFNToRecFN.scala 315:23]
    io_exceptionFlags <= roundAnyRawFNToRecFN.io_exceptionFlags @[RoundAnyRawFNToRecFN.scala 316:23]
    roundAnyRawFNToRecFN.io_invalidExc <= io_invalidExc @[RoundAnyRawFNToRecFN.scala 310:44]
    roundAnyRawFNToRecFN.io_infiniteExc <= io_infiniteExc @[RoundAnyRawFNToRecFN.scala 311:44]
    roundAnyRawFNToRecFN.io_in_isNaN <= io_in_isNaN @[RoundAnyRawFNToRecFN.scala 312:44]
    roundAnyRawFNToRecFN.io_in_isInf <= io_in_isInf @[RoundAnyRawFNToRecFN.scala 312:44]
    roundAnyRawFNToRecFN.io_in_isZero <= io_in_isZero @[RoundAnyRawFNToRecFN.scala 312:44]
    roundAnyRawFNToRecFN.io_in_sign <= io_in_sign @[RoundAnyRawFNToRecFN.scala 312:44]
    roundAnyRawFNToRecFN.io_in_sExp <= io_in_sExp @[RoundAnyRawFNToRecFN.scala 312:44]
    roundAnyRawFNToRecFN.io_in_sig <= io_in_sig @[RoundAnyRawFNToRecFN.scala 312:44]
    roundAnyRawFNToRecFN.io_roundingMode <= io_roundingMode @[RoundAnyRawFNToRecFN.scala 313:44]
    roundAnyRawFNToRecFN.io_detectTininess <= io_detectTininess @[RoundAnyRawFNToRecFN.scala 314:44]

  module MulRecFN :
    input io_a : UInt<33>
    input io_b : UInt<33>
    input io_roundingMode : UInt<3>
    input io_detectTininess : UInt<1>
    output io_out : UInt<33>
    output io_exceptionFlags : UInt<5>

    inst mulRawFN_ of MulRawFN @[MulRecFN.scala 113:26]
    inst roundRawFNToRecFN of RoundRawFNToRecFN @[MulRecFN.scala 121:15]
    node mulRawFN_io_a_exp = bits(io_a, 31, 23) @[rawFloatFromRecFN.scala 50:21]
    node _mulRawFN_io_a_isZero_T = bits(mulRawFN_io_a_exp, 8, 6) @[rawFloatFromRecFN.scala 51:29]
    node mulRawFN_io_a_isZero = eq(_mulRawFN_io_a_isZero_T, UInt<1>("h0")) @[rawFloatFromRecFN.scala 51:54]
    node _mulRawFN_io_a_isSpecial_T = bits(mulRawFN_io_a_exp, 8, 7) @[rawFloatFromRecFN.scala 52:29]
    node mulRawFN_io_a_isSpecial = eq(_mulRawFN_io_a_isSpecial_T, UInt<2>("h3")) @[rawFloatFromRecFN.scala 52:54]
    node _mulRawFN_io_a_out_isNaN_T = bits(mulRawFN_io_a_exp, 6, 6) @[rawFloatFromRecFN.scala 55:41]
    node _mulRawFN_io_a_out_isNaN_T_1 = and(mulRawFN_io_a_isSpecial, _mulRawFN_io_a_out_isNaN_T) @[rawFloatFromRecFN.scala 55:33]
    node _mulRawFN_io_a_out_isInf_T = bits(mulRawFN_io_a_exp, 6, 6) @[rawFloatFromRecFN.scala 56:41]
    node _mulRawFN_io_a_out_isInf_T_1 = eq(_mulRawFN_io_a_out_isInf_T, UInt<1>("h0")) @[rawFloatFromRecFN.scala 56:36]
    node _mulRawFN_io_a_out_isInf_T_2 = and(mulRawFN_io_a_isSpecial, _mulRawFN_io_a_out_isInf_T_1) @[rawFloatFromRecFN.scala 56:33]
    node _mulRawFN_io_a_out_sign_T = bits(io_a, 32, 32) @[rawFloatFromRecFN.scala 58:25]
    node _mulRawFN_io_a_out_sExp_T = cvt(mulRawFN_io_a_exp) @[rawFloatFromRecFN.scala 59:27]
    node _mulRawFN_io_a_out_sig_T = eq(mulRawFN_io_a_isZero, UInt<1>("h0")) @[rawFloatFromRecFN.scala 60:39]
    node _mulRawFN_io_a_out_sig_T_1 = bits(io_a, 22, 0) @[rawFloatFromRecFN.scala 60:51]
    node mulRawFN_io_a_out_sig_hi = cat(UInt<1>("h0"), _mulRawFN_io_a_out_sig_T) @[Cat.scala 30:58]
    node _mulRawFN_io_a_out_sig_T_2 = cat(mulRawFN_io_a_out_sig_hi, _mulRawFN_io_a_out_sig_T_1) @[Cat.scala 30:58]
    node mulRawFN_io_b_exp = bits(io_b, 31, 23) @[rawFloatFromRecFN.scala 50:21]
    node _mulRawFN_io_b_isZero_T = bits(mulRawFN_io_b_exp, 8, 6) @[rawFloatFromRecFN.scala 51:29]
    node mulRawFN_io_b_isZero = eq(_mulRawFN_io_b_isZero_T, UInt<1>("h0")) @[rawFloatFromRecFN.scala 51:54]
    node _mulRawFN_io_b_isSpecial_T = bits(mulRawFN_io_b_exp, 8, 7) @[rawFloatFromRecFN.scala 52:29]
    node mulRawFN_io_b_isSpecial = eq(_mulRawFN_io_b_isSpecial_T, UInt<2>("h3")) @[rawFloatFromRecFN.scala 52:54]
    node _mulRawFN_io_b_out_isNaN_T = bits(mulRawFN_io_b_exp, 6, 6) @[rawFloatFromRecFN.scala 55:41]
    node _mulRawFN_io_b_out_isNaN_T_1 = and(mulRawFN_io_b_isSpecial, _mulRawFN_io_b_out_isNaN_T) @[rawFloatFromRecFN.scala 55:33]
    node _mulRawFN_io_b_out_isInf_T = bits(mulRawFN_io_b_exp, 6, 6) @[rawFloatFromRecFN.scala 56:41]
    node _mulRawFN_io_b_out_isInf_T_1 = eq(_mulRawFN_io_b_out_isInf_T, UInt<1>("h0")) @[rawFloatFromRecFN.scala 56:36]
    node _mulRawFN_io_b_out_isInf_T_2 = and(mulRawFN_io_b_isSpecial, _mulRawFN_io_b_out_isInf_T_1) @[rawFloatFromRecFN.scala 56:33]
    node _mulRawFN_io_b_out_sign_T = bits(io_b, 32, 32) @[rawFloatFromRecFN.scala 58:25]
    node _mulRawFN_io_b_out_sExp_T = cvt(mulRawFN_io_b_exp) @[rawFloatFromRecFN.scala 59:27]
    node _mulRawFN_io_b_out_sig_T = eq(mulRawFN_io_b_isZero, UInt<1>("h0")) @[rawFloatFromRecFN.scala 60:39]
    node _mulRawFN_io_b_out_sig_T_1 = bits(io_b, 22, 0) @[rawFloatFromRecFN.scala 60:51]
    node mulRawFN_io_b_out_sig_hi = cat(UInt<1>("h0"), _mulRawFN_io_b_out_sig_T) @[Cat.scala 30:58]
    node _mulRawFN_io_b_out_sig_T_2 = cat(mulRawFN_io_b_out_sig_hi, _mulRawFN_io_b_out_sig_T_1) @[Cat.scala 30:58]
    node mulRawFN_io_a_out_isNaN = _mulRawFN_io_a_out_isNaN_T_1 @[rawFloatFromRecFN.scala 54:23 55:20]
    node mulRawFN_io_a_out_isInf = _mulRawFN_io_a_out_isInf_T_2 @[rawFloatFromRecFN.scala 54:23 56:20]
    node mulRawFN_io_a_out_isZero = mulRawFN_io_a_isZero @[rawFloatFromRecFN.scala 54:23 57:20]
    node mulRawFN_io_a_out_sign = _mulRawFN_io_a_out_sign_T @[rawFloatFromRecFN.scala 54:23 58:20]
    node mulRawFN_io_a_out_sExp = _mulRawFN_io_a_out_sExp_T @[rawFloatFromRecFN.scala 54:23 59:20]
    node mulRawFN_io_a_out_sig = _mulRawFN_io_a_out_sig_T_2 @[rawFloatFromRecFN.scala 54:23 60:20]
    node mulRawFN_io_b_out_isNaN = _mulRawFN_io_b_out_isNaN_T_1 @[rawFloatFromRecFN.scala 54:23 55:20]
    node mulRawFN_io_b_out_isInf = _mulRawFN_io_b_out_isInf_T_2 @[rawFloatFromRecFN.scala 54:23 56:20]
    node mulRawFN_io_b_out_isZero = mulRawFN_io_b_isZero @[rawFloatFromRecFN.scala 54:23 57:20]
    node mulRawFN_io_b_out_sign = _mulRawFN_io_b_out_sign_T @[rawFloatFromRecFN.scala 54:23 58:20]
    node mulRawFN_io_b_out_sExp = _mulRawFN_io_b_out_sExp_T @[rawFloatFromRecFN.scala 54:23 59:20]
    node mulRawFN_io_b_out_sig = _mulRawFN_io_b_out_sig_T_2 @[rawFloatFromRecFN.scala 54:23 60:20]
    io_out <= roundRawFNToRecFN.io_out @[MulRecFN.scala 127:23]
    io_exceptionFlags <= roundRawFNToRecFN.io_exceptionFlags @[MulRecFN.scala 128:23]
    mulRawFN_.io_a_isNaN <= mulRawFN_io_a_out_isNaN @[MulRecFN.scala 115:19]
    mulRawFN_.io_a_isInf <= mulRawFN_io_a_out_isInf @[MulRecFN.scala 115:19]
    mulRawFN_.io_a_isZero <= mulRawFN_io_a_out_isZero @[MulRecFN.scala 115:19]
    mulRawFN_.io_a_sign <= mulRawFN_io_a_out_sign @[MulRecFN.scala 115:19]
    mulRawFN_.io_a_sExp <= mulRawFN_io_a_out_sExp @[MulRecFN.scala 115:19]
    mulRawFN_.io_a_sig <= mulRawFN_io_a_out_sig @[MulRecFN.scala 115:19]
    mulRawFN_.io_b_isNaN <= mulRawFN_io_b_out_isNaN @[MulRecFN.scala 116:19]
    mulRawFN_.io_b_isInf <= mulRawFN_io_b_out_isInf @[MulRecFN.scala 116:19]
    mulRawFN_.io_b_isZero <= mulRawFN_io_b_out_isZero @[MulRecFN.scala 116:19]
    mulRawFN_.io_b_sign <= mulRawFN_io_b_out_sign @[MulRecFN.scala 116:19]
    mulRawFN_.io_b_sExp <= mulRawFN_io_b_out_sExp @[MulRecFN.scala 116:19]
    mulRawFN_.io_b_sig <= mulRawFN_io_b_out_sig @[MulRecFN.scala 116:19]
    roundRawFNToRecFN.io_invalidExc <= mulRawFN_.io_invalidExc @[MulRecFN.scala 122:39]
    roundRawFNToRecFN.io_infiniteExc <= UInt<1>("h0") @[MulRecFN.scala 123:39]
    roundRawFNToRecFN.io_in_isNaN <= mulRawFN_.io_rawOut_isNaN @[MulRecFN.scala 124:39]
    roundRawFNToRecFN.io_in_isInf <= mulRawFN_.io_rawOut_isInf @[MulRecFN.scala 124:39]
    roundRawFNToRecFN.io_in_isZero <= mulRawFN_.io_rawOut_isZero @[MulRecFN.scala 124:39]
    roundRawFNToRecFN.io_in_sign <= mulRawFN_.io_rawOut_sign @[MulRecFN.scala 124:39]
    roundRawFNToRecFN.io_in_sExp <= mulRawFN_.io_rawOut_sExp @[MulRecFN.scala 124:39]
    roundRawFNToRecFN.io_in_sig <= mulRawFN_.io_rawOut_sig @[MulRecFN.scala 124:39]
    roundRawFNToRecFN.io_roundingMode <= io_roundingMode @[MulRecFN.scala 125:39]
    roundRawFNToRecFN.io_detectTininess <= io_detectTininess @[MulRecFN.scala 126:41]

  module MultPE :
    input clock : Clock
    input reset : UInt<1>
    input io_use_int : UInt<1>
    input io_rounding : UInt<3>
    input io_tininess : UInt<1>
    input io_in_0 : UInt<32>
    input io_in_1 : UInt<32>
    output io_out : UInt<32>

    inst mulRecFN of MulRecFN @[MultPE.scala 50:26]
    reg rounding : UInt<3>, clock with :
      reset => (UInt<1>("h0"), rounding) @[MultPE.scala 21:26]
    reg tininess : UInt<1>, clock with :
      reset => (UInt<1>("h0"), tininess) @[MultPE.scala 23:26]
    reg use_int : UInt<1>, clock with :
      reset => (UInt<1>("h0"), use_int) @[MultPE.scala 25:26]
    reg module_out : UInt<33>, clock with :
      reset => (UInt<1>("h0"), module_out) @[MultPE.scala 27:27]
    node _sign_in_0_T = asSInt(io_in_0) @[MultPE.scala 31:44]
    reg sign_in_0 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), sign_in_0) @[MultPE.scala 31:29]
    node _sign_in_1_T = asSInt(io_in_1) @[MultPE.scala 32:44]
    reg sign_in_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), sign_in_1) @[MultPE.scala 32:29]
    node _module_out_T = mul(sign_in_0, sign_in_1) @[MultPE.scala 35:30]
    node _module_out_T_1 = asUInt(_module_out_T) @[MultPE.scala 35:49]
    reg fN_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), fN_in_0) @[MultPE.scala 42:27]
    reg fN_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), fN_in_1) @[MultPE.scala 43:27]
    node recFN_from_fN_in_0_rawIn_sign = bits(fN_in_0, 31, 31) @[rawFloatFromFN.scala 46:22]
    node recFN_from_fN_in_0_rawIn_expIn = bits(fN_in_0, 30, 23) @[rawFloatFromFN.scala 47:23]
    node recFN_from_fN_in_0_rawIn_fractIn = bits(fN_in_0, 22, 0) @[rawFloatFromFN.scala 48:25]
    node recFN_from_fN_in_0_rawIn_isZeroExpIn = eq(recFN_from_fN_in_0_rawIn_expIn, UInt<1>("h0")) @[rawFloatFromFN.scala 50:34]
    node recFN_from_fN_in_0_rawIn_isZeroFractIn = eq(recFN_from_fN_in_0_rawIn_fractIn, UInt<1>("h0")) @[rawFloatFromFN.scala 51:38]
    node _recFN_from_fN_in_0_rawIn_normDist_T = bits(recFN_from_fN_in_0_rawIn_fractIn, 0, 0) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_1 = bits(recFN_from_fN_in_0_rawIn_fractIn, 1, 1) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_2 = bits(recFN_from_fN_in_0_rawIn_fractIn, 2, 2) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_3 = bits(recFN_from_fN_in_0_rawIn_fractIn, 3, 3) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_4 = bits(recFN_from_fN_in_0_rawIn_fractIn, 4, 4) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_5 = bits(recFN_from_fN_in_0_rawIn_fractIn, 5, 5) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_6 = bits(recFN_from_fN_in_0_rawIn_fractIn, 6, 6) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_7 = bits(recFN_from_fN_in_0_rawIn_fractIn, 7, 7) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_8 = bits(recFN_from_fN_in_0_rawIn_fractIn, 8, 8) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_9 = bits(recFN_from_fN_in_0_rawIn_fractIn, 9, 9) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_10 = bits(recFN_from_fN_in_0_rawIn_fractIn, 10, 10) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_11 = bits(recFN_from_fN_in_0_rawIn_fractIn, 11, 11) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_12 = bits(recFN_from_fN_in_0_rawIn_fractIn, 12, 12) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_13 = bits(recFN_from_fN_in_0_rawIn_fractIn, 13, 13) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_14 = bits(recFN_from_fN_in_0_rawIn_fractIn, 14, 14) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_15 = bits(recFN_from_fN_in_0_rawIn_fractIn, 15, 15) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_16 = bits(recFN_from_fN_in_0_rawIn_fractIn, 16, 16) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_17 = bits(recFN_from_fN_in_0_rawIn_fractIn, 17, 17) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_18 = bits(recFN_from_fN_in_0_rawIn_fractIn, 18, 18) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_19 = bits(recFN_from_fN_in_0_rawIn_fractIn, 19, 19) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_20 = bits(recFN_from_fN_in_0_rawIn_fractIn, 20, 20) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_21 = bits(recFN_from_fN_in_0_rawIn_fractIn, 21, 21) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_22 = bits(recFN_from_fN_in_0_rawIn_fractIn, 22, 22) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_23 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_1, UInt<5>("h15"), UInt<5>("h16")) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_24 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_2, UInt<5>("h14"), _recFN_from_fN_in_0_rawIn_normDist_T_23) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_25 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_3, UInt<5>("h13"), _recFN_from_fN_in_0_rawIn_normDist_T_24) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_26 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_4, UInt<5>("h12"), _recFN_from_fN_in_0_rawIn_normDist_T_25) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_27 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_5, UInt<5>("h11"), _recFN_from_fN_in_0_rawIn_normDist_T_26) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_28 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_6, UInt<5>("h10"), _recFN_from_fN_in_0_rawIn_normDist_T_27) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_29 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_7, UInt<4>("hf"), _recFN_from_fN_in_0_rawIn_normDist_T_28) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_30 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_8, UInt<4>("he"), _recFN_from_fN_in_0_rawIn_normDist_T_29) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_31 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_9, UInt<4>("hd"), _recFN_from_fN_in_0_rawIn_normDist_T_30) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_32 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_10, UInt<4>("hc"), _recFN_from_fN_in_0_rawIn_normDist_T_31) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_33 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_11, UInt<4>("hb"), _recFN_from_fN_in_0_rawIn_normDist_T_32) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_34 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_12, UInt<4>("ha"), _recFN_from_fN_in_0_rawIn_normDist_T_33) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_35 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_13, UInt<4>("h9"), _recFN_from_fN_in_0_rawIn_normDist_T_34) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_36 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_14, UInt<4>("h8"), _recFN_from_fN_in_0_rawIn_normDist_T_35) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_37 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_15, UInt<3>("h7"), _recFN_from_fN_in_0_rawIn_normDist_T_36) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_38 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_16, UInt<3>("h6"), _recFN_from_fN_in_0_rawIn_normDist_T_37) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_39 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_17, UInt<3>("h5"), _recFN_from_fN_in_0_rawIn_normDist_T_38) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_40 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_18, UInt<3>("h4"), _recFN_from_fN_in_0_rawIn_normDist_T_39) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_41 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_19, UInt<2>("h3"), _recFN_from_fN_in_0_rawIn_normDist_T_40) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_42 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_20, UInt<2>("h2"), _recFN_from_fN_in_0_rawIn_normDist_T_41) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_43 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_21, UInt<1>("h1"), _recFN_from_fN_in_0_rawIn_normDist_T_42) @[Mux.scala 47:69]
    node recFN_from_fN_in_0_rawIn_normDist = mux(_recFN_from_fN_in_0_rawIn_normDist_T_22, UInt<1>("h0"), _recFN_from_fN_in_0_rawIn_normDist_T_43) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_subnormFract_T = dshl(recFN_from_fN_in_0_rawIn_fractIn, recFN_from_fN_in_0_rawIn_normDist) @[rawFloatFromFN.scala 54:36]
    node _recFN_from_fN_in_0_rawIn_subnormFract_T_1 = bits(_recFN_from_fN_in_0_rawIn_subnormFract_T, 21, 0) @[rawFloatFromFN.scala 54:47]
    node recFN_from_fN_in_0_rawIn_subnormFract = shl(_recFN_from_fN_in_0_rawIn_subnormFract_T_1, 1) @[rawFloatFromFN.scala 54:64]
    node _recFN_from_fN_in_0_rawIn_adjustedExp_T = xor(recFN_from_fN_in_0_rawIn_normDist, UInt<9>("h1ff")) @[rawFloatFromFN.scala 57:26]
    node _recFN_from_fN_in_0_rawIn_adjustedExp_T_1 = mux(recFN_from_fN_in_0_rawIn_isZeroExpIn, _recFN_from_fN_in_0_rawIn_adjustedExp_T, recFN_from_fN_in_0_rawIn_expIn) @[rawFloatFromFN.scala 56:16]
    node _recFN_from_fN_in_0_rawIn_adjustedExp_T_2 = mux(recFN_from_fN_in_0_rawIn_isZeroExpIn, UInt<2>("h2"), UInt<1>("h1")) @[rawFloatFromFN.scala 60:27]
    node _recFN_from_fN_in_0_rawIn_adjustedExp_T_3 = or(UInt<8>("h80"), _recFN_from_fN_in_0_rawIn_adjustedExp_T_2) @[rawFloatFromFN.scala 60:22]
    node _recFN_from_fN_in_0_rawIn_adjustedExp_T_4 = add(_recFN_from_fN_in_0_rawIn_adjustedExp_T_1, _recFN_from_fN_in_0_rawIn_adjustedExp_T_3) @[rawFloatFromFN.scala 59:15]
    node recFN_from_fN_in_0_rawIn_adjustedExp = tail(_recFN_from_fN_in_0_rawIn_adjustedExp_T_4, 1) @[rawFloatFromFN.scala 59:15]
    node recFN_from_fN_in_0_rawIn_isZero = and(recFN_from_fN_in_0_rawIn_isZeroExpIn, recFN_from_fN_in_0_rawIn_isZeroFractIn) @[rawFloatFromFN.scala 62:34]
    node _recFN_from_fN_in_0_rawIn_isSpecial_T = bits(recFN_from_fN_in_0_rawIn_adjustedExp, 8, 7) @[rawFloatFromFN.scala 63:37]
    node recFN_from_fN_in_0_rawIn_isSpecial = eq(_recFN_from_fN_in_0_rawIn_isSpecial_T, UInt<2>("h3")) @[rawFloatFromFN.scala 63:62]
    node _recFN_from_fN_in_0_rawIn_out_isNaN_T = eq(recFN_from_fN_in_0_rawIn_isZeroFractIn, UInt<1>("h0")) @[rawFloatFromFN.scala 66:36]
    node _recFN_from_fN_in_0_rawIn_out_isNaN_T_1 = and(recFN_from_fN_in_0_rawIn_isSpecial, _recFN_from_fN_in_0_rawIn_out_isNaN_T) @[rawFloatFromFN.scala 66:33]
    node _recFN_from_fN_in_0_rawIn_out_isInf_T = and(recFN_from_fN_in_0_rawIn_isSpecial, recFN_from_fN_in_0_rawIn_isZeroFractIn) @[rawFloatFromFN.scala 67:33]
    node _recFN_from_fN_in_0_rawIn_out_sExp_T = bits(recFN_from_fN_in_0_rawIn_adjustedExp, 8, 0) @[rawFloatFromFN.scala 70:34]
    node _recFN_from_fN_in_0_rawIn_out_sExp_T_1 = cvt(_recFN_from_fN_in_0_rawIn_out_sExp_T) @[rawFloatFromFN.scala 70:48]
    node _recFN_from_fN_in_0_rawIn_out_sig_T = eq(recFN_from_fN_in_0_rawIn_isZero, UInt<1>("h0")) @[rawFloatFromFN.scala 72:29]
    node _recFN_from_fN_in_0_rawIn_out_sig_T_1 = mux(recFN_from_fN_in_0_rawIn_isZeroExpIn, recFN_from_fN_in_0_rawIn_subnormFract, recFN_from_fN_in_0_rawIn_fractIn) @[rawFloatFromFN.scala 72:42]
    node recFN_from_fN_in_0_rawIn_out_sig_hi = cat(UInt<1>("h0"), _recFN_from_fN_in_0_rawIn_out_sig_T) @[Cat.scala 30:58]
    node _recFN_from_fN_in_0_rawIn_out_sig_T_2 = cat(recFN_from_fN_in_0_rawIn_out_sig_hi, _recFN_from_fN_in_0_rawIn_out_sig_T_1) @[Cat.scala 30:58]
    node recFN_from_fN_in_0_rawIn__sExp = _recFN_from_fN_in_0_rawIn_out_sExp_T_1 @[rawFloatFromFN.scala 65:23 70:20]
    node _recFN_from_fN_in_0_T = bits(recFN_from_fN_in_0_rawIn__sExp, 8, 6) @[recFNFromFN.scala 48:53]
    node recFN_from_fN_in_0_rawIn__isZero = recFN_from_fN_in_0_rawIn_isZero @[rawFloatFromFN.scala 65:23 68:20]
    node _recFN_from_fN_in_0_T_1 = mux(recFN_from_fN_in_0_rawIn__isZero, UInt<3>("h0"), _recFN_from_fN_in_0_T) @[recFNFromFN.scala 48:16]
    node recFN_from_fN_in_0_rawIn__isNaN = _recFN_from_fN_in_0_rawIn_out_isNaN_T_1 @[rawFloatFromFN.scala 65:23 66:20]
    node _recFN_from_fN_in_0_T_2 = mux(recFN_from_fN_in_0_rawIn__isNaN, UInt<1>("h1"), UInt<1>("h0")) @[recFNFromFN.scala 49:20]
    node _recFN_from_fN_in_0_T_3 = or(_recFN_from_fN_in_0_T_1, _recFN_from_fN_in_0_T_2) @[recFNFromFN.scala 48:79]
    node _recFN_from_fN_in_0_T_4 = bits(recFN_from_fN_in_0_rawIn__sExp, 5, 0) @[recFNFromFN.scala 50:23]
    node recFN_from_fN_in_0_rawIn__sig = _recFN_from_fN_in_0_rawIn_out_sig_T_2 @[rawFloatFromFN.scala 65:23 71:17]
    node _recFN_from_fN_in_0_T_5 = bits(recFN_from_fN_in_0_rawIn__sig, 22, 0) @[recFNFromFN.scala 51:22]
    node recFN_from_fN_in_0_lo = cat(_recFN_from_fN_in_0_T_4, _recFN_from_fN_in_0_T_5) @[Cat.scala 30:58]
    node recFN_from_fN_in_0_rawIn__sign = recFN_from_fN_in_0_rawIn_sign @[rawFloatFromFN.scala 65:23 69:20]
    node recFN_from_fN_in_0_hi = cat(recFN_from_fN_in_0_rawIn__sign, _recFN_from_fN_in_0_T_3) @[Cat.scala 30:58]
    node _recFN_from_fN_in_0_T_6 = cat(recFN_from_fN_in_0_hi, recFN_from_fN_in_0_lo) @[Cat.scala 30:58]
    reg recFN_from_fN_in_0 : UInt<33>, clock with :
      reset => (UInt<1>("h0"), recFN_from_fN_in_0) @[MultPE.scala 46:37]
    node recFN_from_fN_in_1_rawIn_sign = bits(fN_in_1, 31, 31) @[rawFloatFromFN.scala 46:22]
    node recFN_from_fN_in_1_rawIn_expIn = bits(fN_in_1, 30, 23) @[rawFloatFromFN.scala 47:23]
    node recFN_from_fN_in_1_rawIn_fractIn = bits(fN_in_1, 22, 0) @[rawFloatFromFN.scala 48:25]
    node recFN_from_fN_in_1_rawIn_isZeroExpIn = eq(recFN_from_fN_in_1_rawIn_expIn, UInt<1>("h0")) @[rawFloatFromFN.scala 50:34]
    node recFN_from_fN_in_1_rawIn_isZeroFractIn = eq(recFN_from_fN_in_1_rawIn_fractIn, UInt<1>("h0")) @[rawFloatFromFN.scala 51:38]
    node _recFN_from_fN_in_1_rawIn_normDist_T = bits(recFN_from_fN_in_1_rawIn_fractIn, 0, 0) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_1 = bits(recFN_from_fN_in_1_rawIn_fractIn, 1, 1) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_2 = bits(recFN_from_fN_in_1_rawIn_fractIn, 2, 2) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_3 = bits(recFN_from_fN_in_1_rawIn_fractIn, 3, 3) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_4 = bits(recFN_from_fN_in_1_rawIn_fractIn, 4, 4) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_5 = bits(recFN_from_fN_in_1_rawIn_fractIn, 5, 5) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_6 = bits(recFN_from_fN_in_1_rawIn_fractIn, 6, 6) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_7 = bits(recFN_from_fN_in_1_rawIn_fractIn, 7, 7) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_8 = bits(recFN_from_fN_in_1_rawIn_fractIn, 8, 8) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_9 = bits(recFN_from_fN_in_1_rawIn_fractIn, 9, 9) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_10 = bits(recFN_from_fN_in_1_rawIn_fractIn, 10, 10) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_11 = bits(recFN_from_fN_in_1_rawIn_fractIn, 11, 11) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_12 = bits(recFN_from_fN_in_1_rawIn_fractIn, 12, 12) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_13 = bits(recFN_from_fN_in_1_rawIn_fractIn, 13, 13) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_14 = bits(recFN_from_fN_in_1_rawIn_fractIn, 14, 14) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_15 = bits(recFN_from_fN_in_1_rawIn_fractIn, 15, 15) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_16 = bits(recFN_from_fN_in_1_rawIn_fractIn, 16, 16) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_17 = bits(recFN_from_fN_in_1_rawIn_fractIn, 17, 17) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_18 = bits(recFN_from_fN_in_1_rawIn_fractIn, 18, 18) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_19 = bits(recFN_from_fN_in_1_rawIn_fractIn, 19, 19) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_20 = bits(recFN_from_fN_in_1_rawIn_fractIn, 20, 20) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_21 = bits(recFN_from_fN_in_1_rawIn_fractIn, 21, 21) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_22 = bits(recFN_from_fN_in_1_rawIn_fractIn, 22, 22) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_23 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_1, UInt<5>("h15"), UInt<5>("h16")) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_24 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_2, UInt<5>("h14"), _recFN_from_fN_in_1_rawIn_normDist_T_23) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_25 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_3, UInt<5>("h13"), _recFN_from_fN_in_1_rawIn_normDist_T_24) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_26 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_4, UInt<5>("h12"), _recFN_from_fN_in_1_rawIn_normDist_T_25) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_27 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_5, UInt<5>("h11"), _recFN_from_fN_in_1_rawIn_normDist_T_26) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_28 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_6, UInt<5>("h10"), _recFN_from_fN_in_1_rawIn_normDist_T_27) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_29 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_7, UInt<4>("hf"), _recFN_from_fN_in_1_rawIn_normDist_T_28) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_30 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_8, UInt<4>("he"), _recFN_from_fN_in_1_rawIn_normDist_T_29) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_31 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_9, UInt<4>("hd"), _recFN_from_fN_in_1_rawIn_normDist_T_30) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_32 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_10, UInt<4>("hc"), _recFN_from_fN_in_1_rawIn_normDist_T_31) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_33 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_11, UInt<4>("hb"), _recFN_from_fN_in_1_rawIn_normDist_T_32) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_34 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_12, UInt<4>("ha"), _recFN_from_fN_in_1_rawIn_normDist_T_33) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_35 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_13, UInt<4>("h9"), _recFN_from_fN_in_1_rawIn_normDist_T_34) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_36 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_14, UInt<4>("h8"), _recFN_from_fN_in_1_rawIn_normDist_T_35) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_37 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_15, UInt<3>("h7"), _recFN_from_fN_in_1_rawIn_normDist_T_36) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_38 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_16, UInt<3>("h6"), _recFN_from_fN_in_1_rawIn_normDist_T_37) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_39 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_17, UInt<3>("h5"), _recFN_from_fN_in_1_rawIn_normDist_T_38) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_40 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_18, UInt<3>("h4"), _recFN_from_fN_in_1_rawIn_normDist_T_39) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_41 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_19, UInt<2>("h3"), _recFN_from_fN_in_1_rawIn_normDist_T_40) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_42 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_20, UInt<2>("h2"), _recFN_from_fN_in_1_rawIn_normDist_T_41) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_43 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_21, UInt<1>("h1"), _recFN_from_fN_in_1_rawIn_normDist_T_42) @[Mux.scala 47:69]
    node recFN_from_fN_in_1_rawIn_normDist = mux(_recFN_from_fN_in_1_rawIn_normDist_T_22, UInt<1>("h0"), _recFN_from_fN_in_1_rawIn_normDist_T_43) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_subnormFract_T = dshl(recFN_from_fN_in_1_rawIn_fractIn, recFN_from_fN_in_1_rawIn_normDist) @[rawFloatFromFN.scala 54:36]
    node _recFN_from_fN_in_1_rawIn_subnormFract_T_1 = bits(_recFN_from_fN_in_1_rawIn_subnormFract_T, 21, 0) @[rawFloatFromFN.scala 54:47]
    node recFN_from_fN_in_1_rawIn_subnormFract = shl(_recFN_from_fN_in_1_rawIn_subnormFract_T_1, 1) @[rawFloatFromFN.scala 54:64]
    node _recFN_from_fN_in_1_rawIn_adjustedExp_T = xor(recFN_from_fN_in_1_rawIn_normDist, UInt<9>("h1ff")) @[rawFloatFromFN.scala 57:26]
    node _recFN_from_fN_in_1_rawIn_adjustedExp_T_1 = mux(recFN_from_fN_in_1_rawIn_isZeroExpIn, _recFN_from_fN_in_1_rawIn_adjustedExp_T, recFN_from_fN_in_1_rawIn_expIn) @[rawFloatFromFN.scala 56:16]
    node _recFN_from_fN_in_1_rawIn_adjustedExp_T_2 = mux(recFN_from_fN_in_1_rawIn_isZeroExpIn, UInt<2>("h2"), UInt<1>("h1")) @[rawFloatFromFN.scala 60:27]
    node _recFN_from_fN_in_1_rawIn_adjustedExp_T_3 = or(UInt<8>("h80"), _recFN_from_fN_in_1_rawIn_adjustedExp_T_2) @[rawFloatFromFN.scala 60:22]
    node _recFN_from_fN_in_1_rawIn_adjustedExp_T_4 = add(_recFN_from_fN_in_1_rawIn_adjustedExp_T_1, _recFN_from_fN_in_1_rawIn_adjustedExp_T_3) @[rawFloatFromFN.scala 59:15]
    node recFN_from_fN_in_1_rawIn_adjustedExp = tail(_recFN_from_fN_in_1_rawIn_adjustedExp_T_4, 1) @[rawFloatFromFN.scala 59:15]
    node recFN_from_fN_in_1_rawIn_isZero = and(recFN_from_fN_in_1_rawIn_isZeroExpIn, recFN_from_fN_in_1_rawIn_isZeroFractIn) @[rawFloatFromFN.scala 62:34]
    node _recFN_from_fN_in_1_rawIn_isSpecial_T = bits(recFN_from_fN_in_1_rawIn_adjustedExp, 8, 7) @[rawFloatFromFN.scala 63:37]
    node recFN_from_fN_in_1_rawIn_isSpecial = eq(_recFN_from_fN_in_1_rawIn_isSpecial_T, UInt<2>("h3")) @[rawFloatFromFN.scala 63:62]
    node _recFN_from_fN_in_1_rawIn_out_isNaN_T = eq(recFN_from_fN_in_1_rawIn_isZeroFractIn, UInt<1>("h0")) @[rawFloatFromFN.scala 66:36]
    node _recFN_from_fN_in_1_rawIn_out_isNaN_T_1 = and(recFN_from_fN_in_1_rawIn_isSpecial, _recFN_from_fN_in_1_rawIn_out_isNaN_T) @[rawFloatFromFN.scala 66:33]
    node _recFN_from_fN_in_1_rawIn_out_isInf_T = and(recFN_from_fN_in_1_rawIn_isSpecial, recFN_from_fN_in_1_rawIn_isZeroFractIn) @[rawFloatFromFN.scala 67:33]
    node _recFN_from_fN_in_1_rawIn_out_sExp_T = bits(recFN_from_fN_in_1_rawIn_adjustedExp, 8, 0) @[rawFloatFromFN.scala 70:34]
    node _recFN_from_fN_in_1_rawIn_out_sExp_T_1 = cvt(_recFN_from_fN_in_1_rawIn_out_sExp_T) @[rawFloatFromFN.scala 70:48]
    node _recFN_from_fN_in_1_rawIn_out_sig_T = eq(recFN_from_fN_in_1_rawIn_isZero, UInt<1>("h0")) @[rawFloatFromFN.scala 72:29]
    node _recFN_from_fN_in_1_rawIn_out_sig_T_1 = mux(recFN_from_fN_in_1_rawIn_isZeroExpIn, recFN_from_fN_in_1_rawIn_subnormFract, recFN_from_fN_in_1_rawIn_fractIn) @[rawFloatFromFN.scala 72:42]
    node recFN_from_fN_in_1_rawIn_out_sig_hi = cat(UInt<1>("h0"), _recFN_from_fN_in_1_rawIn_out_sig_T) @[Cat.scala 30:58]
    node _recFN_from_fN_in_1_rawIn_out_sig_T_2 = cat(recFN_from_fN_in_1_rawIn_out_sig_hi, _recFN_from_fN_in_1_rawIn_out_sig_T_1) @[Cat.scala 30:58]
    node recFN_from_fN_in_1_rawIn__sExp = _recFN_from_fN_in_1_rawIn_out_sExp_T_1 @[rawFloatFromFN.scala 65:23 70:20]
    node _recFN_from_fN_in_1_T = bits(recFN_from_fN_in_1_rawIn__sExp, 8, 6) @[recFNFromFN.scala 48:53]
    node recFN_from_fN_in_1_rawIn__isZero = recFN_from_fN_in_1_rawIn_isZero @[rawFloatFromFN.scala 65:23 68:20]
    node _recFN_from_fN_in_1_T_1 = mux(recFN_from_fN_in_1_rawIn__isZero, UInt<3>("h0"), _recFN_from_fN_in_1_T) @[recFNFromFN.scala 48:16]
    node recFN_from_fN_in_1_rawIn__isNaN = _recFN_from_fN_in_1_rawIn_out_isNaN_T_1 @[rawFloatFromFN.scala 65:23 66:20]
    node _recFN_from_fN_in_1_T_2 = mux(recFN_from_fN_in_1_rawIn__isNaN, UInt<1>("h1"), UInt<1>("h0")) @[recFNFromFN.scala 49:20]
    node _recFN_from_fN_in_1_T_3 = or(_recFN_from_fN_in_1_T_1, _recFN_from_fN_in_1_T_2) @[recFNFromFN.scala 48:79]
    node _recFN_from_fN_in_1_T_4 = bits(recFN_from_fN_in_1_rawIn__sExp, 5, 0) @[recFNFromFN.scala 50:23]
    node recFN_from_fN_in_1_rawIn__sig = _recFN_from_fN_in_1_rawIn_out_sig_T_2 @[rawFloatFromFN.scala 65:23 71:17]
    node _recFN_from_fN_in_1_T_5 = bits(recFN_from_fN_in_1_rawIn__sig, 22, 0) @[recFNFromFN.scala 51:22]
    node recFN_from_fN_in_1_lo = cat(_recFN_from_fN_in_1_T_4, _recFN_from_fN_in_1_T_5) @[Cat.scala 30:58]
    node recFN_from_fN_in_1_rawIn__sign = recFN_from_fN_in_1_rawIn_sign @[rawFloatFromFN.scala 65:23 69:20]
    node recFN_from_fN_in_1_hi = cat(recFN_from_fN_in_1_rawIn__sign, _recFN_from_fN_in_1_T_3) @[Cat.scala 30:58]
    node _recFN_from_fN_in_1_T_6 = cat(recFN_from_fN_in_1_hi, recFN_from_fN_in_1_lo) @[Cat.scala 30:58]
    reg recFN_from_fN_in_1 : UInt<33>, clock with :
      reset => (UInt<1>("h0"), recFN_from_fN_in_1) @[MultPE.scala 47:37]
    node io_out_rawIn_exp = bits(mulRecFN.io_out, 31, 23) @[rawFloatFromRecFN.scala 50:21]
    node _io_out_rawIn_isZero_T = bits(io_out_rawIn_exp, 8, 6) @[rawFloatFromRecFN.scala 51:29]
    node io_out_rawIn_isZero = eq(_io_out_rawIn_isZero_T, UInt<1>("h0")) @[rawFloatFromRecFN.scala 51:54]
    node _io_out_rawIn_isSpecial_T = bits(io_out_rawIn_exp, 8, 7) @[rawFloatFromRecFN.scala 52:29]
    node io_out_rawIn_isSpecial = eq(_io_out_rawIn_isSpecial_T, UInt<2>("h3")) @[rawFloatFromRecFN.scala 52:54]
    node _io_out_rawIn_out_isNaN_T = bits(io_out_rawIn_exp, 6, 6) @[rawFloatFromRecFN.scala 55:41]
    node _io_out_rawIn_out_isNaN_T_1 = and(io_out_rawIn_isSpecial, _io_out_rawIn_out_isNaN_T) @[rawFloatFromRecFN.scala 55:33]
    node _io_out_rawIn_out_isInf_T = bits(io_out_rawIn_exp, 6, 6) @[rawFloatFromRecFN.scala 56:41]
    node _io_out_rawIn_out_isInf_T_1 = eq(_io_out_rawIn_out_isInf_T, UInt<1>("h0")) @[rawFloatFromRecFN.scala 56:36]
    node _io_out_rawIn_out_isInf_T_2 = and(io_out_rawIn_isSpecial, _io_out_rawIn_out_isInf_T_1) @[rawFloatFromRecFN.scala 56:33]
    node _io_out_rawIn_out_sign_T = bits(mulRecFN.io_out, 32, 32) @[rawFloatFromRecFN.scala 58:25]
    node _io_out_rawIn_out_sExp_T = cvt(io_out_rawIn_exp) @[rawFloatFromRecFN.scala 59:27]
    node _io_out_rawIn_out_sig_T = eq(io_out_rawIn_isZero, UInt<1>("h0")) @[rawFloatFromRecFN.scala 60:39]
    node _io_out_rawIn_out_sig_T_1 = bits(mulRecFN.io_out, 22, 0) @[rawFloatFromRecFN.scala 60:51]
    node io_out_rawIn_out_sig_hi = cat(UInt<1>("h0"), _io_out_rawIn_out_sig_T) @[Cat.scala 30:58]
    node _io_out_rawIn_out_sig_T_2 = cat(io_out_rawIn_out_sig_hi, _io_out_rawIn_out_sig_T_1) @[Cat.scala 30:58]
    node io_out_rawIn__sExp = _io_out_rawIn_out_sExp_T @[rawFloatFromRecFN.scala 54:23 59:20]
    node io_out_isSubnormal = lt(io_out_rawIn__sExp, asSInt(UInt<9>("h82"))) @[fNFromRecFN.scala 50:39]
    node _io_out_denormShiftDist_T = bits(io_out_rawIn__sExp, 4, 0) @[fNFromRecFN.scala 51:51]
    node _io_out_denormShiftDist_T_1 = sub(UInt<1>("h1"), _io_out_denormShiftDist_T) @[fNFromRecFN.scala 51:39]
    node io_out_denormShiftDist = tail(_io_out_denormShiftDist_T_1, 1) @[fNFromRecFN.scala 51:39]
    node io_out_rawIn__sig = _io_out_rawIn_out_sig_T_2 @[rawFloatFromRecFN.scala 54:23 60:20]
    node _io_out_denormFract_T = shr(io_out_rawIn__sig, 1) @[fNFromRecFN.scala 52:38]
    node _io_out_denormFract_T_1 = dshr(_io_out_denormFract_T, io_out_denormShiftDist) @[fNFromRecFN.scala 52:42]
    node io_out_denormFract = bits(_io_out_denormFract_T_1, 22, 0) @[fNFromRecFN.scala 52:60]
    node _io_out_expOut_T = bits(io_out_rawIn__sExp, 7, 0) @[fNFromRecFN.scala 57:27]
    node _io_out_expOut_T_1 = sub(_io_out_expOut_T, UInt<8>("h81")) @[fNFromRecFN.scala 57:45]
    node _io_out_expOut_T_2 = tail(_io_out_expOut_T_1, 1) @[fNFromRecFN.scala 57:45]
    node _io_out_expOut_T_3 = mux(io_out_isSubnormal, UInt<1>("h0"), _io_out_expOut_T_2) @[fNFromRecFN.scala 55:16]
    node io_out_rawIn__isNaN = _io_out_rawIn_out_isNaN_T_1 @[rawFloatFromRecFN.scala 54:23 55:20]
    node io_out_rawIn__isInf = _io_out_rawIn_out_isInf_T_2 @[rawFloatFromRecFN.scala 54:23 56:20]
    node _io_out_expOut_T_4 = or(io_out_rawIn__isNaN, io_out_rawIn__isInf) @[fNFromRecFN.scala 59:44]
    node _io_out_expOut_T_5 = bits(_io_out_expOut_T_4, 0, 0) @[Bitwise.scala 72:15]
    node _io_out_expOut_T_6 = mux(_io_out_expOut_T_5, UInt<8>("hff"), UInt<8>("h0")) @[Bitwise.scala 72:12]
    node io_out_expOut = or(_io_out_expOut_T_3, _io_out_expOut_T_6) @[fNFromRecFN.scala 59:15]
    node _io_out_fractOut_T = bits(io_out_rawIn__sig, 22, 0) @[fNFromRecFN.scala 63:52]
    node _io_out_fractOut_T_1 = mux(io_out_rawIn__isInf, UInt<1>("h0"), _io_out_fractOut_T) @[fNFromRecFN.scala 63:20]
    node io_out_fractOut = mux(io_out_isSubnormal, io_out_denormFract, _io_out_fractOut_T_1) @[fNFromRecFN.scala 61:16]
    node io_out_rawIn__sign = _io_out_rawIn_out_sign_T @[rawFloatFromRecFN.scala 54:23 58:20]
    node io_out_hi = cat(io_out_rawIn__sign, io_out_expOut) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, io_out_fractOut) @[Cat.scala 30:58]
    node _GEN_0 = mux(use_int, _module_out_T_1, module_out) @[MultPE.scala 29:16 35:16 27:27]
    node _GEN_1 = mux(use_int, module_out, _io_out_T) @[MultPE.scala 29:16 37:12 57:12]
    node recFN_from_fN_in_0_rawIn__isInf = _recFN_from_fN_in_0_rawIn_out_isInf_T @[rawFloatFromFN.scala 65:23 67:20]
    node recFN_from_fN_in_1_rawIn__isInf = _recFN_from_fN_in_1_rawIn_out_isInf_T @[rawFloatFromFN.scala 65:23 67:20]
    node io_out_rawIn__isZero = io_out_rawIn_isZero @[rawFloatFromRecFN.scala 54:23 57:20]
    io_out <= bits(_GEN_1, 31, 0)
    rounding <= io_rounding @[MultPE.scala 21:26]
    tininess <= io_tininess @[MultPE.scala 23:26]
    use_int <= io_use_int @[MultPE.scala 25:26]
    module_out <= bits(mux(reset, UInt<33>("h0"), _GEN_0), 32, 0) @[MultPE.scala 27:{27,27}]
    sign_in_0 <= _sign_in_0_T @[MultPE.scala 31:29]
    sign_in_1 <= _sign_in_1_T @[MultPE.scala 32:29]
    fN_in_0 <= io_in_0 @[MultPE.scala 42:27]
    fN_in_1 <= io_in_1 @[MultPE.scala 43:27]
    recFN_from_fN_in_0 <= _recFN_from_fN_in_0_T_6 @[MultPE.scala 46:37]
    recFN_from_fN_in_1 <= _recFN_from_fN_in_1_T_6 @[MultPE.scala 47:37]
    mulRecFN.io_a <= recFN_from_fN_in_0 @[MultPE.scala 53:19]
    mulRecFN.io_b <= recFN_from_fN_in_1 @[MultPE.scala 54:19]
    mulRecFN.io_roundingMode <= rounding @[MultPE.scala 51:32]
    mulRecFN.io_detectTininess <= tininess @[MultPE.scala 52:32]

  module AddRawFN :
    input io_subOp : UInt<1>
    input io_a_isNaN : UInt<1>
    input io_a_isInf : UInt<1>
    input io_a_isZero : UInt<1>
    input io_a_sign : UInt<1>
    input io_a_sExp : SInt<10>
    input io_a_sig : UInt<25>
    input io_b_isNaN : UInt<1>
    input io_b_isInf : UInt<1>
    input io_b_isZero : UInt<1>
    input io_b_sign : UInt<1>
    input io_b_sExp : SInt<10>
    input io_b_sig : UInt<25>
    input io_roundingMode : UInt<3>
    output io_invalidExc : UInt<1>
    output io_rawOut_isNaN : UInt<1>
    output io_rawOut_isInf : UInt<1>
    output io_rawOut_isZero : UInt<1>
    output io_rawOut_sign : UInt<1>
    output io_rawOut_sExp : SInt<10>
    output io_rawOut_sig : UInt<27>

    node effSignB = xor(io_b_sign, io_subOp) @[AddRecFN.scala 60:30]
    node eqSigns = eq(io_a_sign, effSignB) @[AddRecFN.scala 61:29]
    node notEqSigns_signZero = eq(io_roundingMode, UInt<3>("h2")) @[AddRecFN.scala 62:47]
    node _sDiffExps_T = sub(io_a_sExp, io_b_sExp) @[AddRecFN.scala 63:31]
    node _sDiffExps_T_1 = tail(_sDiffExps_T, 1) @[AddRecFN.scala 63:31]
    node sDiffExps = asSInt(_sDiffExps_T_1) @[AddRecFN.scala 63:31]
    node _modNatAlignDist_T = lt(sDiffExps, asSInt(UInt<1>("h0"))) @[AddRecFN.scala 64:41]
    node _modNatAlignDist_T_1 = sub(io_b_sExp, io_a_sExp) @[AddRecFN.scala 64:58]
    node _modNatAlignDist_T_2 = tail(_modNatAlignDist_T_1, 1) @[AddRecFN.scala 64:58]
    node _modNatAlignDist_T_3 = asSInt(_modNatAlignDist_T_2) @[AddRecFN.scala 64:58]
    node _modNatAlignDist_T_4 = mux(_modNatAlignDist_T, _modNatAlignDist_T_3, sDiffExps) @[AddRecFN.scala 64:30]
    node modNatAlignDist = bits(_modNatAlignDist_T_4, 4, 0) @[AddRecFN.scala 64:81]
    node _isMaxAlign_T = shr(sDiffExps, 5) @[AddRecFN.scala 66:19]
    node _isMaxAlign_T_1 = neq(_isMaxAlign_T, asSInt(UInt<1>("h0"))) @[AddRecFN.scala 66:37]
    node _isMaxAlign_T_2 = shr(sDiffExps, 5) @[AddRecFN.scala 67:24]
    node _isMaxAlign_T_3 = neq(_isMaxAlign_T_2, asSInt(UInt<1>("h1"))) @[AddRecFN.scala 67:42]
    node _isMaxAlign_T_4 = bits(sDiffExps, 4, 0) @[AddRecFN.scala 67:63]
    node _isMaxAlign_T_5 = eq(_isMaxAlign_T_4, UInt<1>("h0")) @[AddRecFN.scala 67:87]
    node _isMaxAlign_T_6 = or(_isMaxAlign_T_3, _isMaxAlign_T_5) @[AddRecFN.scala 67:51]
    node isMaxAlign = and(_isMaxAlign_T_1, _isMaxAlign_T_6) @[AddRecFN.scala 66:45]
    node alignDist = mux(isMaxAlign, UInt<5>("h1f"), modNatAlignDist) @[AddRecFN.scala 68:24]
    node _closeSubMags_T = eq(eqSigns, UInt<1>("h0")) @[AddRecFN.scala 69:24]
    node _closeSubMags_T_1 = eq(isMaxAlign, UInt<1>("h0")) @[AddRecFN.scala 69:36]
    node _closeSubMags_T_2 = and(_closeSubMags_T, _closeSubMags_T_1) @[AddRecFN.scala 69:33]
    node _closeSubMags_T_3 = leq(modNatAlignDist, UInt<1>("h1")) @[AddRecFN.scala 69:68]
    node closeSubMags = and(_closeSubMags_T_2, _closeSubMags_T_3) @[AddRecFN.scala 69:48]
    node _close_alignedSigA_T = leq(asSInt(UInt<1>("h0")), sDiffExps) @[AddRecFN.scala 73:18]
    node _close_alignedSigA_T_1 = bits(sDiffExps, 0, 0) @[AddRecFN.scala 73:45]
    node _close_alignedSigA_T_2 = and(_close_alignedSigA_T, _close_alignedSigA_T_1) @[AddRecFN.scala 73:32]
    node _close_alignedSigA_T_3 = shl(io_a_sig, 2) @[AddRecFN.scala 73:58]
    node _close_alignedSigA_T_4 = mux(_close_alignedSigA_T_2, _close_alignedSigA_T_3, UInt<1>("h0")) @[AddRecFN.scala 73:12]
    node _close_alignedSigA_T_5 = leq(asSInt(UInt<1>("h0")), sDiffExps) @[AddRecFN.scala 74:18]
    node _close_alignedSigA_T_6 = bits(sDiffExps, 0, 0) @[AddRecFN.scala 74:45]
    node _close_alignedSigA_T_7 = eq(_close_alignedSigA_T_6, UInt<1>("h0")) @[AddRecFN.scala 74:35]
    node _close_alignedSigA_T_8 = and(_close_alignedSigA_T_5, _close_alignedSigA_T_7) @[AddRecFN.scala 74:32]
    node _close_alignedSigA_T_9 = shl(io_a_sig, 1) @[AddRecFN.scala 74:58]
    node _close_alignedSigA_T_10 = mux(_close_alignedSigA_T_8, _close_alignedSigA_T_9, UInt<1>("h0")) @[AddRecFN.scala 74:12]
    node _close_alignedSigA_T_11 = or(_close_alignedSigA_T_4, _close_alignedSigA_T_10) @[AddRecFN.scala 73:68]
    node _close_alignedSigA_T_12 = lt(sDiffExps, asSInt(UInt<1>("h0"))) @[AddRecFN.scala 75:24]
    node _close_alignedSigA_T_13 = mux(_close_alignedSigA_T_12, io_a_sig, UInt<1>("h0")) @[AddRecFN.scala 75:12]
    node close_alignedSigA = or(_close_alignedSigA_T_11, _close_alignedSigA_T_13) @[AddRecFN.scala 74:68]
    node _close_sSigSum_T = asSInt(close_alignedSigA) @[AddRecFN.scala 76:43]
    node _close_sSigSum_T_1 = shl(io_b_sig, 1) @[AddRecFN.scala 76:61]
    node _close_sSigSum_T_2 = asSInt(_close_sSigSum_T_1) @[AddRecFN.scala 76:66]
    node _close_sSigSum_T_3 = sub(_close_sSigSum_T, _close_sSigSum_T_2) @[AddRecFN.scala 76:50]
    node _close_sSigSum_T_4 = tail(_close_sSigSum_T_3, 1) @[AddRecFN.scala 76:50]
    node close_sSigSum = asSInt(_close_sSigSum_T_4) @[AddRecFN.scala 76:50]
    node _close_sigSum_T = lt(close_sSigSum, asSInt(UInt<1>("h0"))) @[AddRecFN.scala 77:42]
    node _close_sigSum_T_1 = sub(asSInt(UInt<1>("h0")), close_sSigSum) @[AddRecFN.scala 77:49]
    node _close_sigSum_T_2 = tail(_close_sigSum_T_1, 1) @[AddRecFN.scala 77:49]
    node _close_sigSum_T_3 = asSInt(_close_sigSum_T_2) @[AddRecFN.scala 77:49]
    node _close_sigSum_T_4 = mux(_close_sigSum_T, _close_sigSum_T_3, close_sSigSum) @[AddRecFN.scala 77:27]
    node close_sigSum = bits(_close_sigSum_T_4, 25, 0) @[AddRecFN.scala 77:79]
    node close_adjustedSigSum = shl(close_sigSum, 0) @[AddRecFN.scala 78:44]
    node _close_reduced2SigSum_reducedVec_0_T = bits(close_adjustedSigSum, 1, 0) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_0_T_1 = orr(_close_reduced2SigSum_reducedVec_0_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_1_T = bits(close_adjustedSigSum, 3, 2) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_1_T_1 = orr(_close_reduced2SigSum_reducedVec_1_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_2_T = bits(close_adjustedSigSum, 5, 4) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_2_T_1 = orr(_close_reduced2SigSum_reducedVec_2_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_3_T = bits(close_adjustedSigSum, 7, 6) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_3_T_1 = orr(_close_reduced2SigSum_reducedVec_3_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_4_T = bits(close_adjustedSigSum, 9, 8) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_4_T_1 = orr(_close_reduced2SigSum_reducedVec_4_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_5_T = bits(close_adjustedSigSum, 11, 10) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_5_T_1 = orr(_close_reduced2SigSum_reducedVec_5_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_6_T = bits(close_adjustedSigSum, 13, 12) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_6_T_1 = orr(_close_reduced2SigSum_reducedVec_6_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_7_T = bits(close_adjustedSigSum, 15, 14) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_7_T_1 = orr(_close_reduced2SigSum_reducedVec_7_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_8_T = bits(close_adjustedSigSum, 17, 16) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_8_T_1 = orr(_close_reduced2SigSum_reducedVec_8_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_9_T = bits(close_adjustedSigSum, 19, 18) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_9_T_1 = orr(_close_reduced2SigSum_reducedVec_9_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_10_T = bits(close_adjustedSigSum, 21, 20) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_10_T_1 = orr(_close_reduced2SigSum_reducedVec_10_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_11_T = bits(close_adjustedSigSum, 23, 22) @[primitives.scala 104:33]
    node _close_reduced2SigSum_reducedVec_11_T_1 = orr(_close_reduced2SigSum_reducedVec_11_T) @[primitives.scala 104:54]
    node _close_reduced2SigSum_reducedVec_12_T = bits(close_adjustedSigSum, 25, 24) @[primitives.scala 107:15]
    node _close_reduced2SigSum_reducedVec_12_T_1 = orr(_close_reduced2SigSum_reducedVec_12_T) @[primitives.scala 107:57]
    node close_reduced2SigSum_reducedVec_2 = _close_reduced2SigSum_reducedVec_2_T_1 @[primitives.scala 102:30 104:28]
    node close_reduced2SigSum_reducedVec_1 = _close_reduced2SigSum_reducedVec_1_T_1 @[primitives.scala 102:30 104:28]
    node close_reduced2SigSum_lo_lo_hi = cat(close_reduced2SigSum_reducedVec_2, close_reduced2SigSum_reducedVec_1) @[primitives.scala 108:20]
    node close_reduced2SigSum_reducedVec_0 = _close_reduced2SigSum_reducedVec_0_T_1 @[primitives.scala 102:30 104:28]
    node close_reduced2SigSum_lo_lo = cat(close_reduced2SigSum_lo_lo_hi, close_reduced2SigSum_reducedVec_0) @[primitives.scala 108:20]
    node close_reduced2SigSum_reducedVec_5 = _close_reduced2SigSum_reducedVec_5_T_1 @[primitives.scala 102:30 104:28]
    node close_reduced2SigSum_reducedVec_4 = _close_reduced2SigSum_reducedVec_4_T_1 @[primitives.scala 102:30 104:28]
    node close_reduced2SigSum_lo_hi_hi = cat(close_reduced2SigSum_reducedVec_5, close_reduced2SigSum_reducedVec_4) @[primitives.scala 108:20]
    node close_reduced2SigSum_reducedVec_3 = _close_reduced2SigSum_reducedVec_3_T_1 @[primitives.scala 102:30 104:28]
    node close_reduced2SigSum_lo_hi = cat(close_reduced2SigSum_lo_hi_hi, close_reduced2SigSum_reducedVec_3) @[primitives.scala 108:20]
    node close_reduced2SigSum_lo = cat(close_reduced2SigSum_lo_hi, close_reduced2SigSum_lo_lo) @[primitives.scala 108:20]
    node close_reduced2SigSum_reducedVec_8 = _close_reduced2SigSum_reducedVec_8_T_1 @[primitives.scala 102:30 104:28]
    node close_reduced2SigSum_reducedVec_7 = _close_reduced2SigSum_reducedVec_7_T_1 @[primitives.scala 102:30 104:28]
    node close_reduced2SigSum_hi_lo_hi = cat(close_reduced2SigSum_reducedVec_8, close_reduced2SigSum_reducedVec_7) @[primitives.scala 108:20]
    node close_reduced2SigSum_reducedVec_6 = _close_reduced2SigSum_reducedVec_6_T_1 @[primitives.scala 102:30 104:28]
    node close_reduced2SigSum_hi_lo = cat(close_reduced2SigSum_hi_lo_hi, close_reduced2SigSum_reducedVec_6) @[primitives.scala 108:20]
    node close_reduced2SigSum_reducedVec_10 = _close_reduced2SigSum_reducedVec_10_T_1 @[primitives.scala 102:30 104:28]
    node close_reduced2SigSum_reducedVec_9 = _close_reduced2SigSum_reducedVec_9_T_1 @[primitives.scala 102:30 104:28]
    node close_reduced2SigSum_hi_hi_lo = cat(close_reduced2SigSum_reducedVec_10, close_reduced2SigSum_reducedVec_9) @[primitives.scala 108:20]
    node close_reduced2SigSum_reducedVec_12 = _close_reduced2SigSum_reducedVec_12_T_1 @[primitives.scala 102:30 106:38]
    node close_reduced2SigSum_reducedVec_11 = _close_reduced2SigSum_reducedVec_11_T_1 @[primitives.scala 102:30 104:28]
    node close_reduced2SigSum_hi_hi_hi = cat(close_reduced2SigSum_reducedVec_12, close_reduced2SigSum_reducedVec_11) @[primitives.scala 108:20]
    node close_reduced2SigSum_hi_hi = cat(close_reduced2SigSum_hi_hi_hi, close_reduced2SigSum_hi_hi_lo) @[primitives.scala 108:20]
    node close_reduced2SigSum_hi = cat(close_reduced2SigSum_hi_hi, close_reduced2SigSum_hi_lo) @[primitives.scala 108:20]
    node close_reduced2SigSum = cat(close_reduced2SigSum_hi, close_reduced2SigSum_lo) @[primitives.scala 108:20]
    node _close_normDistReduced2_T = bits(close_reduced2SigSum, 0, 0) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_1 = bits(close_reduced2SigSum, 1, 1) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_2 = bits(close_reduced2SigSum, 2, 2) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_3 = bits(close_reduced2SigSum, 3, 3) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_4 = bits(close_reduced2SigSum, 4, 4) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_5 = bits(close_reduced2SigSum, 5, 5) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_6 = bits(close_reduced2SigSum, 6, 6) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_7 = bits(close_reduced2SigSum, 7, 7) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_8 = bits(close_reduced2SigSum, 8, 8) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_9 = bits(close_reduced2SigSum, 9, 9) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_10 = bits(close_reduced2SigSum, 10, 10) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_11 = bits(close_reduced2SigSum, 11, 11) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_12 = bits(close_reduced2SigSum, 12, 12) @[primitives.scala 92:52]
    node _close_normDistReduced2_T_13 = mux(_close_normDistReduced2_T_1, UInt<4>("hb"), UInt<4>("hc")) @[Mux.scala 47:69]
    node _close_normDistReduced2_T_14 = mux(_close_normDistReduced2_T_2, UInt<4>("ha"), _close_normDistReduced2_T_13) @[Mux.scala 47:69]
    node _close_normDistReduced2_T_15 = mux(_close_normDistReduced2_T_3, UInt<4>("h9"), _close_normDistReduced2_T_14) @[Mux.scala 47:69]
    node _close_normDistReduced2_T_16 = mux(_close_normDistReduced2_T_4, UInt<4>("h8"), _close_normDistReduced2_T_15) @[Mux.scala 47:69]
    node _close_normDistReduced2_T_17 = mux(_close_normDistReduced2_T_5, UInt<3>("h7"), _close_normDistReduced2_T_16) @[Mux.scala 47:69]
    node _close_normDistReduced2_T_18 = mux(_close_normDistReduced2_T_6, UInt<3>("h6"), _close_normDistReduced2_T_17) @[Mux.scala 47:69]
    node _close_normDistReduced2_T_19 = mux(_close_normDistReduced2_T_7, UInt<3>("h5"), _close_normDistReduced2_T_18) @[Mux.scala 47:69]
    node _close_normDistReduced2_T_20 = mux(_close_normDistReduced2_T_8, UInt<3>("h4"), _close_normDistReduced2_T_19) @[Mux.scala 47:69]
    node _close_normDistReduced2_T_21 = mux(_close_normDistReduced2_T_9, UInt<2>("h3"), _close_normDistReduced2_T_20) @[Mux.scala 47:69]
    node _close_normDistReduced2_T_22 = mux(_close_normDistReduced2_T_10, UInt<2>("h2"), _close_normDistReduced2_T_21) @[Mux.scala 47:69]
    node _close_normDistReduced2_T_23 = mux(_close_normDistReduced2_T_11, UInt<1>("h1"), _close_normDistReduced2_T_22) @[Mux.scala 47:69]
    node close_normDistReduced2 = mux(_close_normDistReduced2_T_12, UInt<1>("h0"), _close_normDistReduced2_T_23) @[Mux.scala 47:69]
    node _close_nearNormDist_T = shl(close_normDistReduced2, 1) @[AddRecFN.scala 81:53]
    node close_nearNormDist = bits(_close_nearNormDist_T, 4, 0) @[AddRecFN.scala 81:57]
    node _close_sigOut_T = dshl(close_sigSum, close_nearNormDist) @[AddRecFN.scala 82:38]
    node _close_sigOut_T_1 = shl(_close_sigOut_T, 1) @[AddRecFN.scala 82:59]
    node close_sigOut = bits(_close_sigOut_T_1, 26, 0) @[AddRecFN.scala 82:63]
    node _close_totalCancellation_T = bits(close_sigOut, 26, 25) @[AddRecFN.scala 83:49]
    node _close_totalCancellation_T_1 = orr(_close_totalCancellation_T) @[AddRecFN.scala 83:82]
    node close_totalCancellation = eq(_close_totalCancellation_T_1, UInt<1>("h0")) @[AddRecFN.scala 83:35]
    node _close_notTotalCancellation_signOut_T = lt(close_sSigSum, asSInt(UInt<1>("h0"))) @[AddRecFN.scala 84:73]
    node close_notTotalCancellation_signOut = xor(io_a_sign, _close_notTotalCancellation_signOut_T) @[AddRecFN.scala 84:56]
    node _far_signOut_T = lt(sDiffExps, asSInt(UInt<1>("h0"))) @[AddRecFN.scala 87:37]
    node far_signOut = mux(_far_signOut_T, effSignB, io_a_sign) @[AddRecFN.scala 87:26]
    node _far_sigLarger_T = lt(sDiffExps, asSInt(UInt<1>("h0"))) @[AddRecFN.scala 88:40]
    node _far_sigLarger_T_1 = mux(_far_sigLarger_T, io_b_sig, io_a_sig) @[AddRecFN.scala 88:29]
    node far_sigLarger = bits(_far_sigLarger_T_1, 23, 0) @[AddRecFN.scala 88:66]
    node _far_sigSmaller_T = lt(sDiffExps, asSInt(UInt<1>("h0"))) @[AddRecFN.scala 89:40]
    node _far_sigSmaller_T_1 = mux(_far_sigSmaller_T, io_a_sig, io_b_sig) @[AddRecFN.scala 89:29]
    node far_sigSmaller = bits(_far_sigSmaller_T_1, 23, 0) @[AddRecFN.scala 89:66]
    node _far_mainAlignedSigSmaller_T = shl(far_sigSmaller, 5) @[AddRecFN.scala 90:52]
    node far_mainAlignedSigSmaller = dshr(_far_mainAlignedSigSmaller_T, alignDist) @[AddRecFN.scala 90:56]
    node _far_reduced4SigSmaller_T = shl(far_sigSmaller, 2) @[AddRecFN.scala 91:60]
    node _far_reduced4SigSmaller_reducedVec_0_T = bits(_far_reduced4SigSmaller_T, 3, 0) @[primitives.scala 121:33]
    node _far_reduced4SigSmaller_reducedVec_0_T_1 = orr(_far_reduced4SigSmaller_reducedVec_0_T) @[primitives.scala 121:54]
    node _far_reduced4SigSmaller_reducedVec_1_T = bits(_far_reduced4SigSmaller_T, 7, 4) @[primitives.scala 121:33]
    node _far_reduced4SigSmaller_reducedVec_1_T_1 = orr(_far_reduced4SigSmaller_reducedVec_1_T) @[primitives.scala 121:54]
    node _far_reduced4SigSmaller_reducedVec_2_T = bits(_far_reduced4SigSmaller_T, 11, 8) @[primitives.scala 121:33]
    node _far_reduced4SigSmaller_reducedVec_2_T_1 = orr(_far_reduced4SigSmaller_reducedVec_2_T) @[primitives.scala 121:54]
    node _far_reduced4SigSmaller_reducedVec_3_T = bits(_far_reduced4SigSmaller_T, 15, 12) @[primitives.scala 121:33]
    node _far_reduced4SigSmaller_reducedVec_3_T_1 = orr(_far_reduced4SigSmaller_reducedVec_3_T) @[primitives.scala 121:54]
    node _far_reduced4SigSmaller_reducedVec_4_T = bits(_far_reduced4SigSmaller_T, 19, 16) @[primitives.scala 121:33]
    node _far_reduced4SigSmaller_reducedVec_4_T_1 = orr(_far_reduced4SigSmaller_reducedVec_4_T) @[primitives.scala 121:54]
    node _far_reduced4SigSmaller_reducedVec_5_T = bits(_far_reduced4SigSmaller_T, 23, 20) @[primitives.scala 121:33]
    node _far_reduced4SigSmaller_reducedVec_5_T_1 = orr(_far_reduced4SigSmaller_reducedVec_5_T) @[primitives.scala 121:54]
    node _far_reduced4SigSmaller_reducedVec_6_T = bits(_far_reduced4SigSmaller_T, 25, 24) @[primitives.scala 124:15]
    node _far_reduced4SigSmaller_reducedVec_6_T_1 = orr(_far_reduced4SigSmaller_reducedVec_6_T) @[primitives.scala 124:57]
    node far_reduced4SigSmaller_reducedVec_2 = _far_reduced4SigSmaller_reducedVec_2_T_1 @[primitives.scala 119:30 121:28]
    node far_reduced4SigSmaller_reducedVec_1 = _far_reduced4SigSmaller_reducedVec_1_T_1 @[primitives.scala 119:30 121:28]
    node far_reduced4SigSmaller_lo_hi = cat(far_reduced4SigSmaller_reducedVec_2, far_reduced4SigSmaller_reducedVec_1) @[primitives.scala 125:20]
    node far_reduced4SigSmaller_reducedVec_0 = _far_reduced4SigSmaller_reducedVec_0_T_1 @[primitives.scala 119:30 121:28]
    node far_reduced4SigSmaller_lo = cat(far_reduced4SigSmaller_lo_hi, far_reduced4SigSmaller_reducedVec_0) @[primitives.scala 125:20]
    node far_reduced4SigSmaller_reducedVec_4 = _far_reduced4SigSmaller_reducedVec_4_T_1 @[primitives.scala 119:30 121:28]
    node far_reduced4SigSmaller_reducedVec_3 = _far_reduced4SigSmaller_reducedVec_3_T_1 @[primitives.scala 119:30 121:28]
    node far_reduced4SigSmaller_hi_lo = cat(far_reduced4SigSmaller_reducedVec_4, far_reduced4SigSmaller_reducedVec_3) @[primitives.scala 125:20]
    node far_reduced4SigSmaller_reducedVec_6 = _far_reduced4SigSmaller_reducedVec_6_T_1 @[primitives.scala 119:30 123:38]
    node far_reduced4SigSmaller_reducedVec_5 = _far_reduced4SigSmaller_reducedVec_5_T_1 @[primitives.scala 119:30 121:28]
    node far_reduced4SigSmaller_hi_hi = cat(far_reduced4SigSmaller_reducedVec_6, far_reduced4SigSmaller_reducedVec_5) @[primitives.scala 125:20]
    node far_reduced4SigSmaller_hi = cat(far_reduced4SigSmaller_hi_hi, far_reduced4SigSmaller_hi_lo) @[primitives.scala 125:20]
    node far_reduced4SigSmaller = cat(far_reduced4SigSmaller_hi, far_reduced4SigSmaller_lo) @[primitives.scala 125:20]
    node _far_roundExtraMask_T = bits(alignDist, 4, 2) @[AddRecFN.scala 92:47]
    node far_roundExtraMask_shift = dshr(asSInt(UInt<9>("h100")), _far_roundExtraMask_T) @[primitives.scala 77:58]
    node _far_roundExtraMask_T_1 = bits(far_roundExtraMask_shift, 7, 1) @[primitives.scala 79:22]
    node _far_roundExtraMask_T_2 = bits(_far_roundExtraMask_T_1, 3, 0) @[Bitwise.scala 109:18]
    node _far_roundExtraMask_T_3 = bits(_far_roundExtraMask_T_2, 1, 0) @[Bitwise.scala 109:18]
    node _far_roundExtraMask_T_4 = bits(_far_roundExtraMask_T_3, 0, 0) @[Bitwise.scala 109:18]
    node _far_roundExtraMask_T_5 = bits(_far_roundExtraMask_T_3, 1, 1) @[Bitwise.scala 109:44]
    node _far_roundExtraMask_T_6 = cat(_far_roundExtraMask_T_4, _far_roundExtraMask_T_5) @[Cat.scala 30:58]
    node _far_roundExtraMask_T_7 = bits(_far_roundExtraMask_T_2, 3, 2) @[Bitwise.scala 109:44]
    node _far_roundExtraMask_T_8 = bits(_far_roundExtraMask_T_7, 0, 0) @[Bitwise.scala 109:18]
    node _far_roundExtraMask_T_9 = bits(_far_roundExtraMask_T_7, 1, 1) @[Bitwise.scala 109:44]
    node _far_roundExtraMask_T_10 = cat(_far_roundExtraMask_T_8, _far_roundExtraMask_T_9) @[Cat.scala 30:58]
    node _far_roundExtraMask_T_11 = cat(_far_roundExtraMask_T_6, _far_roundExtraMask_T_10) @[Cat.scala 30:58]
    node _far_roundExtraMask_T_12 = bits(_far_roundExtraMask_T_1, 6, 4) @[Bitwise.scala 109:44]
    node _far_roundExtraMask_T_13 = bits(_far_roundExtraMask_T_12, 1, 0) @[Bitwise.scala 109:18]
    node _far_roundExtraMask_T_14 = bits(_far_roundExtraMask_T_13, 0, 0) @[Bitwise.scala 109:18]
    node _far_roundExtraMask_T_15 = bits(_far_roundExtraMask_T_13, 1, 1) @[Bitwise.scala 109:44]
    node _far_roundExtraMask_T_16 = cat(_far_roundExtraMask_T_14, _far_roundExtraMask_T_15) @[Cat.scala 30:58]
    node _far_roundExtraMask_T_17 = bits(_far_roundExtraMask_T_12, 2, 2) @[Bitwise.scala 109:44]
    node _far_roundExtraMask_T_18 = cat(_far_roundExtraMask_T_16, _far_roundExtraMask_T_17) @[Cat.scala 30:58]
    node far_roundExtraMask = cat(_far_roundExtraMask_T_11, _far_roundExtraMask_T_18) @[Cat.scala 30:58]
    node _far_alignedSigSmaller_T = shr(far_mainAlignedSigSmaller, 3) @[AddRecFN.scala 94:38]
    node _far_alignedSigSmaller_T_1 = bits(far_mainAlignedSigSmaller, 2, 0) @[AddRecFN.scala 95:38]
    node _far_alignedSigSmaller_T_2 = orr(_far_alignedSigSmaller_T_1) @[AddRecFN.scala 95:45]
    node _far_alignedSigSmaller_T_3 = and(far_reduced4SigSmaller, far_roundExtraMask) @[AddRecFN.scala 95:76]
    node _far_alignedSigSmaller_T_4 = orr(_far_alignedSigSmaller_T_3) @[AddRecFN.scala 95:98]
    node _far_alignedSigSmaller_T_5 = or(_far_alignedSigSmaller_T_2, _far_alignedSigSmaller_T_4) @[AddRecFN.scala 95:49]
    node far_alignedSigSmaller = cat(_far_alignedSigSmaller_T, _far_alignedSigSmaller_T_5) @[Cat.scala 30:58]
    node far_subMags = eq(eqSigns, UInt<1>("h0")) @[AddRecFN.scala 96:23]
    node _far_negAlignedSigSmaller_T = not(far_alignedSigSmaller) @[AddRecFN.scala 97:62]
    node _far_negAlignedSigSmaller_T_1 = cat(UInt<1>("h1"), _far_negAlignedSigSmaller_T) @[Cat.scala 30:58]
    node far_negAlignedSigSmaller = mux(far_subMags, _far_negAlignedSigSmaller_T_1, far_alignedSigSmaller) @[AddRecFN.scala 97:39]
    node _far_sigSum_T = shl(far_sigLarger, 3) @[AddRecFN.scala 98:36]
    node _far_sigSum_T_1 = add(_far_sigSum_T, far_negAlignedSigSmaller) @[AddRecFN.scala 98:41]
    node _far_sigSum_T_2 = tail(_far_sigSum_T_1, 1) @[AddRecFN.scala 98:41]
    node _far_sigSum_T_3 = add(_far_sigSum_T_2, far_subMags) @[AddRecFN.scala 98:68]
    node far_sigSum = tail(_far_sigSum_T_3, 1) @[AddRecFN.scala 98:68]
    node _far_sigOut_T = shr(far_sigSum, 1) @[AddRecFN.scala 99:62]
    node _far_sigOut_T_1 = bits(far_sigSum, 0, 0) @[AddRecFN.scala 99:79]
    node _far_sigOut_T_2 = or(_far_sigOut_T, _far_sigOut_T_1) @[AddRecFN.scala 99:67]
    node _far_sigOut_T_3 = mux(far_subMags, far_sigSum, _far_sigOut_T_2) @[AddRecFN.scala 99:25]
    node far_sigOut = bits(_far_sigOut_T_3, 26, 0) @[AddRecFN.scala 99:83]
    node _notSigNaN_invalidExc_T = and(io_a_isInf, io_b_isInf) @[AddRecFN.scala 102:43]
    node _notSigNaN_invalidExc_T_1 = eq(eqSigns, UInt<1>("h0")) @[AddRecFN.scala 102:60]
    node notSigNaN_invalidExc = and(_notSigNaN_invalidExc_T, _notSigNaN_invalidExc_T_1) @[AddRecFN.scala 102:57]
    node notNaN_isInfOut = or(io_a_isInf, io_b_isInf) @[AddRecFN.scala 103:38]
    node addZeros = and(io_a_isZero, io_b_isZero) @[AddRecFN.scala 104:32]
    node notNaN_specialCase = or(notNaN_isInfOut, addZeros) @[AddRecFN.scala 105:46]
    node _notNaN_isZeroOut_T = eq(notNaN_isInfOut, UInt<1>("h0")) @[AddRecFN.scala 106:41]
    node _notNaN_isZeroOut_T_1 = and(_notNaN_isZeroOut_T, closeSubMags) @[AddRecFN.scala 106:58]
    node _notNaN_isZeroOut_T_2 = and(_notNaN_isZeroOut_T_1, close_totalCancellation) @[AddRecFN.scala 106:74]
    node notNaN_isZeroOut = or(addZeros, _notNaN_isZeroOut_T_2) @[AddRecFN.scala 106:37]
    node _notNaN_signOut_T = and(eqSigns, io_a_sign) @[AddRecFN.scala 108:39]
    node _notNaN_signOut_T_1 = and(io_a_isInf, io_a_sign) @[AddRecFN.scala 109:39]
    node _notNaN_signOut_T_2 = or(_notNaN_signOut_T, _notNaN_signOut_T_1) @[AddRecFN.scala 108:63]
    node _notNaN_signOut_T_3 = and(io_b_isInf, effSignB) @[AddRecFN.scala 110:39]
    node _notNaN_signOut_T_4 = or(_notNaN_signOut_T_2, _notNaN_signOut_T_3) @[AddRecFN.scala 109:63]
    node _notNaN_signOut_T_5 = eq(eqSigns, UInt<1>("h0")) @[AddRecFN.scala 111:30]
    node _notNaN_signOut_T_6 = and(notNaN_isZeroOut, _notNaN_signOut_T_5) @[AddRecFN.scala 111:27]
    node _notNaN_signOut_T_7 = and(_notNaN_signOut_T_6, notEqSigns_signZero) @[AddRecFN.scala 111:39]
    node _notNaN_signOut_T_8 = or(_notNaN_signOut_T_4, _notNaN_signOut_T_7) @[AddRecFN.scala 110:63]
    node _notNaN_signOut_T_9 = eq(notNaN_specialCase, UInt<1>("h0")) @[AddRecFN.scala 112:10]
    node _notNaN_signOut_T_10 = and(_notNaN_signOut_T_9, closeSubMags) @[AddRecFN.scala 112:30]
    node _notNaN_signOut_T_11 = eq(close_totalCancellation, UInt<1>("h0")) @[AddRecFN.scala 112:49]
    node _notNaN_signOut_T_12 = and(_notNaN_signOut_T_10, _notNaN_signOut_T_11) @[AddRecFN.scala 112:46]
    node _notNaN_signOut_T_13 = and(_notNaN_signOut_T_12, close_notTotalCancellation_signOut) @[AddRecFN.scala 113:38]
    node _notNaN_signOut_T_14 = or(_notNaN_signOut_T_8, _notNaN_signOut_T_13) @[AddRecFN.scala 111:63]
    node _notNaN_signOut_T_15 = eq(notNaN_specialCase, UInt<1>("h0")) @[AddRecFN.scala 114:10]
    node _notNaN_signOut_T_16 = eq(closeSubMags, UInt<1>("h0")) @[AddRecFN.scala 114:33]
    node _notNaN_signOut_T_17 = and(_notNaN_signOut_T_15, _notNaN_signOut_T_16) @[AddRecFN.scala 114:30]
    node _notNaN_signOut_T_18 = and(_notNaN_signOut_T_17, far_signOut) @[AddRecFN.scala 114:47]
    node notNaN_signOut = or(_notNaN_signOut_T_14, _notNaN_signOut_T_18) @[AddRecFN.scala 113:77]
    node _common_sExpOut_T = lt(sDiffExps, asSInt(UInt<1>("h0"))) @[AddRecFN.scala 116:41]
    node _common_sExpOut_T_1 = or(closeSubMags, _common_sExpOut_T) @[AddRecFN.scala 116:27]
    node _common_sExpOut_T_2 = mux(_common_sExpOut_T_1, io_b_sExp, io_a_sExp) @[AddRecFN.scala 116:13]
    node _common_sExpOut_T_3 = mux(closeSubMags, close_nearNormDist, far_subMags) @[AddRecFN.scala 117:18]
    node _common_sExpOut_T_4 = cvt(_common_sExpOut_T_3) @[AddRecFN.scala 117:66]
    node _common_sExpOut_T_5 = sub(_common_sExpOut_T_2, _common_sExpOut_T_4) @[AddRecFN.scala 117:13]
    node _common_sExpOut_T_6 = tail(_common_sExpOut_T_5, 1) @[AddRecFN.scala 117:13]
    node common_sExpOut = asSInt(_common_sExpOut_T_6) @[AddRecFN.scala 117:13]
    node common_sigOut = mux(closeSubMags, close_sigOut, far_sigOut) @[AddRecFN.scala 118:28]
    node _io_invalidExc_T = bits(io_a_sig, 22, 22) @[common.scala 84:56]
    node _io_invalidExc_T_1 = eq(_io_invalidExc_T, UInt<1>("h0")) @[common.scala 84:49]
    node _io_invalidExc_T_2 = and(io_a_isNaN, _io_invalidExc_T_1) @[common.scala 84:46]
    node _io_invalidExc_T_3 = bits(io_b_sig, 22, 22) @[common.scala 84:56]
    node _io_invalidExc_T_4 = eq(_io_invalidExc_T_3, UInt<1>("h0")) @[common.scala 84:49]
    node _io_invalidExc_T_5 = and(io_b_isNaN, _io_invalidExc_T_4) @[common.scala 84:46]
    node _io_invalidExc_T_6 = or(_io_invalidExc_T_2, _io_invalidExc_T_5) @[AddRecFN.scala 121:45]
    node _io_invalidExc_T_7 = or(_io_invalidExc_T_6, notSigNaN_invalidExc) @[AddRecFN.scala 121:71]
    node _io_rawOut_isNaN_T = or(io_a_isNaN, io_b_isNaN) @[AddRecFN.scala 125:35]
    io_invalidExc <= _io_invalidExc_T_7 @[AddRecFN.scala 121:19]
    io_rawOut_isNaN <= _io_rawOut_isNaN_T @[AddRecFN.scala 125:21]
    io_rawOut_isInf <= notNaN_isInfOut @[AddRecFN.scala 122:21]
    io_rawOut_isZero <= notNaN_isZeroOut @[AddRecFN.scala 123:22]
    io_rawOut_sign <= notNaN_signOut @[AddRecFN.scala 126:20]
    io_rawOut_sExp <= common_sExpOut @[AddRecFN.scala 124:20]
    io_rawOut_sig <= common_sigOut @[AddRecFN.scala 127:19]

  module AddRecFN :
    input io_subOp : UInt<1>
    input io_a : UInt<33>
    input io_b : UInt<33>
    input io_roundingMode : UInt<3>
    input io_detectTininess : UInt<1>
    output io_out : UInt<33>
    output io_exceptionFlags : UInt<5>

    inst addRawFN_ of AddRawFN @[AddRecFN.scala 147:26]
    inst roundRawFNToRecFN of RoundRawFNToRecFN @[AddRecFN.scala 157:15]
    node addRawFN_io_a_exp = bits(io_a, 31, 23) @[rawFloatFromRecFN.scala 50:21]
    node _addRawFN_io_a_isZero_T = bits(addRawFN_io_a_exp, 8, 6) @[rawFloatFromRecFN.scala 51:29]
    node addRawFN_io_a_isZero = eq(_addRawFN_io_a_isZero_T, UInt<1>("h0")) @[rawFloatFromRecFN.scala 51:54]
    node _addRawFN_io_a_isSpecial_T = bits(addRawFN_io_a_exp, 8, 7) @[rawFloatFromRecFN.scala 52:29]
    node addRawFN_io_a_isSpecial = eq(_addRawFN_io_a_isSpecial_T, UInt<2>("h3")) @[rawFloatFromRecFN.scala 52:54]
    node _addRawFN_io_a_out_isNaN_T = bits(addRawFN_io_a_exp, 6, 6) @[rawFloatFromRecFN.scala 55:41]
    node _addRawFN_io_a_out_isNaN_T_1 = and(addRawFN_io_a_isSpecial, _addRawFN_io_a_out_isNaN_T) @[rawFloatFromRecFN.scala 55:33]
    node _addRawFN_io_a_out_isInf_T = bits(addRawFN_io_a_exp, 6, 6) @[rawFloatFromRecFN.scala 56:41]
    node _addRawFN_io_a_out_isInf_T_1 = eq(_addRawFN_io_a_out_isInf_T, UInt<1>("h0")) @[rawFloatFromRecFN.scala 56:36]
    node _addRawFN_io_a_out_isInf_T_2 = and(addRawFN_io_a_isSpecial, _addRawFN_io_a_out_isInf_T_1) @[rawFloatFromRecFN.scala 56:33]
    node _addRawFN_io_a_out_sign_T = bits(io_a, 32, 32) @[rawFloatFromRecFN.scala 58:25]
    node _addRawFN_io_a_out_sExp_T = cvt(addRawFN_io_a_exp) @[rawFloatFromRecFN.scala 59:27]
    node _addRawFN_io_a_out_sig_T = eq(addRawFN_io_a_isZero, UInt<1>("h0")) @[rawFloatFromRecFN.scala 60:39]
    node _addRawFN_io_a_out_sig_T_1 = bits(io_a, 22, 0) @[rawFloatFromRecFN.scala 60:51]
    node addRawFN_io_a_out_sig_hi = cat(UInt<1>("h0"), _addRawFN_io_a_out_sig_T) @[Cat.scala 30:58]
    node _addRawFN_io_a_out_sig_T_2 = cat(addRawFN_io_a_out_sig_hi, _addRawFN_io_a_out_sig_T_1) @[Cat.scala 30:58]
    node addRawFN_io_b_exp = bits(io_b, 31, 23) @[rawFloatFromRecFN.scala 50:21]
    node _addRawFN_io_b_isZero_T = bits(addRawFN_io_b_exp, 8, 6) @[rawFloatFromRecFN.scala 51:29]
    node addRawFN_io_b_isZero = eq(_addRawFN_io_b_isZero_T, UInt<1>("h0")) @[rawFloatFromRecFN.scala 51:54]
    node _addRawFN_io_b_isSpecial_T = bits(addRawFN_io_b_exp, 8, 7) @[rawFloatFromRecFN.scala 52:29]
    node addRawFN_io_b_isSpecial = eq(_addRawFN_io_b_isSpecial_T, UInt<2>("h3")) @[rawFloatFromRecFN.scala 52:54]
    node _addRawFN_io_b_out_isNaN_T = bits(addRawFN_io_b_exp, 6, 6) @[rawFloatFromRecFN.scala 55:41]
    node _addRawFN_io_b_out_isNaN_T_1 = and(addRawFN_io_b_isSpecial, _addRawFN_io_b_out_isNaN_T) @[rawFloatFromRecFN.scala 55:33]
    node _addRawFN_io_b_out_isInf_T = bits(addRawFN_io_b_exp, 6, 6) @[rawFloatFromRecFN.scala 56:41]
    node _addRawFN_io_b_out_isInf_T_1 = eq(_addRawFN_io_b_out_isInf_T, UInt<1>("h0")) @[rawFloatFromRecFN.scala 56:36]
    node _addRawFN_io_b_out_isInf_T_2 = and(addRawFN_io_b_isSpecial, _addRawFN_io_b_out_isInf_T_1) @[rawFloatFromRecFN.scala 56:33]
    node _addRawFN_io_b_out_sign_T = bits(io_b, 32, 32) @[rawFloatFromRecFN.scala 58:25]
    node _addRawFN_io_b_out_sExp_T = cvt(addRawFN_io_b_exp) @[rawFloatFromRecFN.scala 59:27]
    node _addRawFN_io_b_out_sig_T = eq(addRawFN_io_b_isZero, UInt<1>("h0")) @[rawFloatFromRecFN.scala 60:39]
    node _addRawFN_io_b_out_sig_T_1 = bits(io_b, 22, 0) @[rawFloatFromRecFN.scala 60:51]
    node addRawFN_io_b_out_sig_hi = cat(UInt<1>("h0"), _addRawFN_io_b_out_sig_T) @[Cat.scala 30:58]
    node _addRawFN_io_b_out_sig_T_2 = cat(addRawFN_io_b_out_sig_hi, _addRawFN_io_b_out_sig_T_1) @[Cat.scala 30:58]
    node addRawFN_io_a_out_isNaN = _addRawFN_io_a_out_isNaN_T_1 @[rawFloatFromRecFN.scala 54:23 55:20]
    node addRawFN_io_a_out_isInf = _addRawFN_io_a_out_isInf_T_2 @[rawFloatFromRecFN.scala 54:23 56:20]
    node addRawFN_io_a_out_isZero = addRawFN_io_a_isZero @[rawFloatFromRecFN.scala 54:23 57:20]
    node addRawFN_io_a_out_sign = _addRawFN_io_a_out_sign_T @[rawFloatFromRecFN.scala 54:23 58:20]
    node addRawFN_io_a_out_sExp = _addRawFN_io_a_out_sExp_T @[rawFloatFromRecFN.scala 54:23 59:20]
    node addRawFN_io_a_out_sig = _addRawFN_io_a_out_sig_T_2 @[rawFloatFromRecFN.scala 54:23 60:20]
    node addRawFN_io_b_out_isNaN = _addRawFN_io_b_out_isNaN_T_1 @[rawFloatFromRecFN.scala 54:23 55:20]
    node addRawFN_io_b_out_isInf = _addRawFN_io_b_out_isInf_T_2 @[rawFloatFromRecFN.scala 54:23 56:20]
    node addRawFN_io_b_out_isZero = addRawFN_io_b_isZero @[rawFloatFromRecFN.scala 54:23 57:20]
    node addRawFN_io_b_out_sign = _addRawFN_io_b_out_sign_T @[rawFloatFromRecFN.scala 54:23 58:20]
    node addRawFN_io_b_out_sExp = _addRawFN_io_b_out_sExp_T @[rawFloatFromRecFN.scala 54:23 59:20]
    node addRawFN_io_b_out_sig = _addRawFN_io_b_out_sig_T_2 @[rawFloatFromRecFN.scala 54:23 60:20]
    io_out <= roundRawFNToRecFN.io_out @[AddRecFN.scala 163:23]
    io_exceptionFlags <= roundRawFNToRecFN.io_exceptionFlags @[AddRecFN.scala 164:23]
    addRawFN_.io_subOp <= io_subOp @[AddRecFN.scala 149:30]
    addRawFN_.io_a_isNaN <= addRawFN_io_a_out_isNaN @[AddRecFN.scala 150:30]
    addRawFN_.io_a_isInf <= addRawFN_io_a_out_isInf @[AddRecFN.scala 150:30]
    addRawFN_.io_a_isZero <= addRawFN_io_a_out_isZero @[AddRecFN.scala 150:30]
    addRawFN_.io_a_sign <= addRawFN_io_a_out_sign @[AddRecFN.scala 150:30]
    addRawFN_.io_a_sExp <= addRawFN_io_a_out_sExp @[AddRecFN.scala 150:30]
    addRawFN_.io_a_sig <= addRawFN_io_a_out_sig @[AddRecFN.scala 150:30]
    addRawFN_.io_b_isNaN <= addRawFN_io_b_out_isNaN @[AddRecFN.scala 151:30]
    addRawFN_.io_b_isInf <= addRawFN_io_b_out_isInf @[AddRecFN.scala 151:30]
    addRawFN_.io_b_isZero <= addRawFN_io_b_out_isZero @[AddRecFN.scala 151:30]
    addRawFN_.io_b_sign <= addRawFN_io_b_out_sign @[AddRecFN.scala 151:30]
    addRawFN_.io_b_sExp <= addRawFN_io_b_out_sExp @[AddRecFN.scala 151:30]
    addRawFN_.io_b_sig <= addRawFN_io_b_out_sig @[AddRecFN.scala 151:30]
    addRawFN_.io_roundingMode <= io_roundingMode @[AddRecFN.scala 152:30]
    roundRawFNToRecFN.io_invalidExc <= addRawFN_.io_invalidExc @[AddRecFN.scala 158:39]
    roundRawFNToRecFN.io_infiniteExc <= UInt<1>("h0") @[AddRecFN.scala 159:39]
    roundRawFNToRecFN.io_in_isNaN <= addRawFN_.io_rawOut_isNaN @[AddRecFN.scala 160:39]
    roundRawFNToRecFN.io_in_isInf <= addRawFN_.io_rawOut_isInf @[AddRecFN.scala 160:39]
    roundRawFNToRecFN.io_in_isZero <= addRawFN_.io_rawOut_isZero @[AddRecFN.scala 160:39]
    roundRawFNToRecFN.io_in_sign <= addRawFN_.io_rawOut_sign @[AddRecFN.scala 160:39]
    roundRawFNToRecFN.io_in_sExp <= addRawFN_.io_rawOut_sExp @[AddRecFN.scala 160:39]
    roundRawFNToRecFN.io_in_sig <= addRawFN_.io_rawOut_sig @[AddRecFN.scala 160:39]
    roundRawFNToRecFN.io_roundingMode <= io_roundingMode @[AddRecFN.scala 161:39]
    roundRawFNToRecFN.io_detectTininess <= io_detectTininess @[AddRecFN.scala 162:41]

  module AddSubPE :
    input clock : Clock
    input reset : UInt<1>
    input io_use_int : UInt<1>
    input io_op : UInt<1>
    input io_rounding : UInt<3>
    input io_tininess : UInt<1>
    input io_in_0 : UInt<32>
    input io_in_1 : UInt<32>
    output io_out : UInt<32>

    inst addRecFN of AddRecFN @[AddSubPE.scala 57:26]
    reg rounding : UInt<3>, clock with :
      reset => (UInt<1>("h0"), rounding) @[AddSubPE.scala 22:26]
    reg tininess : UInt<1>, clock with :
      reset => (UInt<1>("h0"), tininess) @[AddSubPE.scala 24:27]
    reg op : UInt<1>, clock with :
      reset => (UInt<1>("h0"), op) @[AddSubPE.scala 26:27]
    reg use_int : UInt<1>, clock with :
      reset => (UInt<1>("h0"), use_int) @[AddSubPE.scala 28:27]
    reg module_out : UInt<33>, clock with :
      reset => (UInt<1>("h0"), module_out) @[AddSubPE.scala 30:27]
    node _sign_in_0_T = asSInt(io_in_0) @[AddSubPE.scala 34:44]
    reg sign_in_0 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), sign_in_0) @[AddSubPE.scala 34:29]
    node _sign_in_1_T = asSInt(io_in_1) @[AddSubPE.scala 35:44]
    reg sign_in_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), sign_in_1) @[AddSubPE.scala 35:29]
    node _module_out_T = sub(sign_in_0, sign_in_1) @[AddSubPE.scala 39:32]
    node _module_out_T_1 = tail(_module_out_T, 1) @[AddSubPE.scala 39:32]
    node _module_out_T_2 = asSInt(_module_out_T_1) @[AddSubPE.scala 39:32]
    node _module_out_T_3 = asUInt(_module_out_T_2) @[AddSubPE.scala 39:51]
    node _module_out_T_4 = add(sign_in_0, sign_in_1) @[AddSubPE.scala 41:32]
    node _module_out_T_5 = tail(_module_out_T_4, 1) @[AddSubPE.scala 41:32]
    node _module_out_T_6 = asSInt(_module_out_T_5) @[AddSubPE.scala 41:32]
    node _module_out_T_7 = asUInt(_module_out_T_6) @[AddSubPE.scala 41:51]
    node _GEN_0 = mux(op, _module_out_T_3, _module_out_T_7) @[AddSubPE.scala 38:17 39:18 41:18]
    reg fN_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), fN_in_0) @[AddSubPE.scala 49:27]
    reg fN_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), fN_in_1) @[AddSubPE.scala 50:27]
    node recFN_from_fN_in_0_rawIn_sign = bits(fN_in_0, 31, 31) @[rawFloatFromFN.scala 46:22]
    node recFN_from_fN_in_0_rawIn_expIn = bits(fN_in_0, 30, 23) @[rawFloatFromFN.scala 47:23]
    node recFN_from_fN_in_0_rawIn_fractIn = bits(fN_in_0, 22, 0) @[rawFloatFromFN.scala 48:25]
    node recFN_from_fN_in_0_rawIn_isZeroExpIn = eq(recFN_from_fN_in_0_rawIn_expIn, UInt<1>("h0")) @[rawFloatFromFN.scala 50:34]
    node recFN_from_fN_in_0_rawIn_isZeroFractIn = eq(recFN_from_fN_in_0_rawIn_fractIn, UInt<1>("h0")) @[rawFloatFromFN.scala 51:38]
    node _recFN_from_fN_in_0_rawIn_normDist_T = bits(recFN_from_fN_in_0_rawIn_fractIn, 0, 0) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_1 = bits(recFN_from_fN_in_0_rawIn_fractIn, 1, 1) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_2 = bits(recFN_from_fN_in_0_rawIn_fractIn, 2, 2) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_3 = bits(recFN_from_fN_in_0_rawIn_fractIn, 3, 3) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_4 = bits(recFN_from_fN_in_0_rawIn_fractIn, 4, 4) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_5 = bits(recFN_from_fN_in_0_rawIn_fractIn, 5, 5) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_6 = bits(recFN_from_fN_in_0_rawIn_fractIn, 6, 6) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_7 = bits(recFN_from_fN_in_0_rawIn_fractIn, 7, 7) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_8 = bits(recFN_from_fN_in_0_rawIn_fractIn, 8, 8) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_9 = bits(recFN_from_fN_in_0_rawIn_fractIn, 9, 9) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_10 = bits(recFN_from_fN_in_0_rawIn_fractIn, 10, 10) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_11 = bits(recFN_from_fN_in_0_rawIn_fractIn, 11, 11) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_12 = bits(recFN_from_fN_in_0_rawIn_fractIn, 12, 12) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_13 = bits(recFN_from_fN_in_0_rawIn_fractIn, 13, 13) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_14 = bits(recFN_from_fN_in_0_rawIn_fractIn, 14, 14) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_15 = bits(recFN_from_fN_in_0_rawIn_fractIn, 15, 15) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_16 = bits(recFN_from_fN_in_0_rawIn_fractIn, 16, 16) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_17 = bits(recFN_from_fN_in_0_rawIn_fractIn, 17, 17) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_18 = bits(recFN_from_fN_in_0_rawIn_fractIn, 18, 18) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_19 = bits(recFN_from_fN_in_0_rawIn_fractIn, 19, 19) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_20 = bits(recFN_from_fN_in_0_rawIn_fractIn, 20, 20) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_21 = bits(recFN_from_fN_in_0_rawIn_fractIn, 21, 21) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_22 = bits(recFN_from_fN_in_0_rawIn_fractIn, 22, 22) @[primitives.scala 92:52]
    node _recFN_from_fN_in_0_rawIn_normDist_T_23 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_1, UInt<5>("h15"), UInt<5>("h16")) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_24 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_2, UInt<5>("h14"), _recFN_from_fN_in_0_rawIn_normDist_T_23) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_25 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_3, UInt<5>("h13"), _recFN_from_fN_in_0_rawIn_normDist_T_24) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_26 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_4, UInt<5>("h12"), _recFN_from_fN_in_0_rawIn_normDist_T_25) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_27 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_5, UInt<5>("h11"), _recFN_from_fN_in_0_rawIn_normDist_T_26) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_28 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_6, UInt<5>("h10"), _recFN_from_fN_in_0_rawIn_normDist_T_27) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_29 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_7, UInt<4>("hf"), _recFN_from_fN_in_0_rawIn_normDist_T_28) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_30 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_8, UInt<4>("he"), _recFN_from_fN_in_0_rawIn_normDist_T_29) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_31 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_9, UInt<4>("hd"), _recFN_from_fN_in_0_rawIn_normDist_T_30) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_32 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_10, UInt<4>("hc"), _recFN_from_fN_in_0_rawIn_normDist_T_31) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_33 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_11, UInt<4>("hb"), _recFN_from_fN_in_0_rawIn_normDist_T_32) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_34 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_12, UInt<4>("ha"), _recFN_from_fN_in_0_rawIn_normDist_T_33) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_35 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_13, UInt<4>("h9"), _recFN_from_fN_in_0_rawIn_normDist_T_34) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_36 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_14, UInt<4>("h8"), _recFN_from_fN_in_0_rawIn_normDist_T_35) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_37 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_15, UInt<3>("h7"), _recFN_from_fN_in_0_rawIn_normDist_T_36) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_38 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_16, UInt<3>("h6"), _recFN_from_fN_in_0_rawIn_normDist_T_37) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_39 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_17, UInt<3>("h5"), _recFN_from_fN_in_0_rawIn_normDist_T_38) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_40 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_18, UInt<3>("h4"), _recFN_from_fN_in_0_rawIn_normDist_T_39) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_41 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_19, UInt<2>("h3"), _recFN_from_fN_in_0_rawIn_normDist_T_40) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_42 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_20, UInt<2>("h2"), _recFN_from_fN_in_0_rawIn_normDist_T_41) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_normDist_T_43 = mux(_recFN_from_fN_in_0_rawIn_normDist_T_21, UInt<1>("h1"), _recFN_from_fN_in_0_rawIn_normDist_T_42) @[Mux.scala 47:69]
    node recFN_from_fN_in_0_rawIn_normDist = mux(_recFN_from_fN_in_0_rawIn_normDist_T_22, UInt<1>("h0"), _recFN_from_fN_in_0_rawIn_normDist_T_43) @[Mux.scala 47:69]
    node _recFN_from_fN_in_0_rawIn_subnormFract_T = dshl(recFN_from_fN_in_0_rawIn_fractIn, recFN_from_fN_in_0_rawIn_normDist) @[rawFloatFromFN.scala 54:36]
    node _recFN_from_fN_in_0_rawIn_subnormFract_T_1 = bits(_recFN_from_fN_in_0_rawIn_subnormFract_T, 21, 0) @[rawFloatFromFN.scala 54:47]
    node recFN_from_fN_in_0_rawIn_subnormFract = shl(_recFN_from_fN_in_0_rawIn_subnormFract_T_1, 1) @[rawFloatFromFN.scala 54:64]
    node _recFN_from_fN_in_0_rawIn_adjustedExp_T = xor(recFN_from_fN_in_0_rawIn_normDist, UInt<9>("h1ff")) @[rawFloatFromFN.scala 57:26]
    node _recFN_from_fN_in_0_rawIn_adjustedExp_T_1 = mux(recFN_from_fN_in_0_rawIn_isZeroExpIn, _recFN_from_fN_in_0_rawIn_adjustedExp_T, recFN_from_fN_in_0_rawIn_expIn) @[rawFloatFromFN.scala 56:16]
    node _recFN_from_fN_in_0_rawIn_adjustedExp_T_2 = mux(recFN_from_fN_in_0_rawIn_isZeroExpIn, UInt<2>("h2"), UInt<1>("h1")) @[rawFloatFromFN.scala 60:27]
    node _recFN_from_fN_in_0_rawIn_adjustedExp_T_3 = or(UInt<8>("h80"), _recFN_from_fN_in_0_rawIn_adjustedExp_T_2) @[rawFloatFromFN.scala 60:22]
    node _recFN_from_fN_in_0_rawIn_adjustedExp_T_4 = add(_recFN_from_fN_in_0_rawIn_adjustedExp_T_1, _recFN_from_fN_in_0_rawIn_adjustedExp_T_3) @[rawFloatFromFN.scala 59:15]
    node recFN_from_fN_in_0_rawIn_adjustedExp = tail(_recFN_from_fN_in_0_rawIn_adjustedExp_T_4, 1) @[rawFloatFromFN.scala 59:15]
    node recFN_from_fN_in_0_rawIn_isZero = and(recFN_from_fN_in_0_rawIn_isZeroExpIn, recFN_from_fN_in_0_rawIn_isZeroFractIn) @[rawFloatFromFN.scala 62:34]
    node _recFN_from_fN_in_0_rawIn_isSpecial_T = bits(recFN_from_fN_in_0_rawIn_adjustedExp, 8, 7) @[rawFloatFromFN.scala 63:37]
    node recFN_from_fN_in_0_rawIn_isSpecial = eq(_recFN_from_fN_in_0_rawIn_isSpecial_T, UInt<2>("h3")) @[rawFloatFromFN.scala 63:62]
    node _recFN_from_fN_in_0_rawIn_out_isNaN_T = eq(recFN_from_fN_in_0_rawIn_isZeroFractIn, UInt<1>("h0")) @[rawFloatFromFN.scala 66:36]
    node _recFN_from_fN_in_0_rawIn_out_isNaN_T_1 = and(recFN_from_fN_in_0_rawIn_isSpecial, _recFN_from_fN_in_0_rawIn_out_isNaN_T) @[rawFloatFromFN.scala 66:33]
    node _recFN_from_fN_in_0_rawIn_out_isInf_T = and(recFN_from_fN_in_0_rawIn_isSpecial, recFN_from_fN_in_0_rawIn_isZeroFractIn) @[rawFloatFromFN.scala 67:33]
    node _recFN_from_fN_in_0_rawIn_out_sExp_T = bits(recFN_from_fN_in_0_rawIn_adjustedExp, 8, 0) @[rawFloatFromFN.scala 70:34]
    node _recFN_from_fN_in_0_rawIn_out_sExp_T_1 = cvt(_recFN_from_fN_in_0_rawIn_out_sExp_T) @[rawFloatFromFN.scala 70:48]
    node _recFN_from_fN_in_0_rawIn_out_sig_T = eq(recFN_from_fN_in_0_rawIn_isZero, UInt<1>("h0")) @[rawFloatFromFN.scala 72:29]
    node _recFN_from_fN_in_0_rawIn_out_sig_T_1 = mux(recFN_from_fN_in_0_rawIn_isZeroExpIn, recFN_from_fN_in_0_rawIn_subnormFract, recFN_from_fN_in_0_rawIn_fractIn) @[rawFloatFromFN.scala 72:42]
    node recFN_from_fN_in_0_rawIn_out_sig_hi = cat(UInt<1>("h0"), _recFN_from_fN_in_0_rawIn_out_sig_T) @[Cat.scala 30:58]
    node _recFN_from_fN_in_0_rawIn_out_sig_T_2 = cat(recFN_from_fN_in_0_rawIn_out_sig_hi, _recFN_from_fN_in_0_rawIn_out_sig_T_1) @[Cat.scala 30:58]
    node recFN_from_fN_in_0_rawIn__sExp = _recFN_from_fN_in_0_rawIn_out_sExp_T_1 @[rawFloatFromFN.scala 65:23 70:20]
    node _recFN_from_fN_in_0_T = bits(recFN_from_fN_in_0_rawIn__sExp, 8, 6) @[recFNFromFN.scala 48:53]
    node recFN_from_fN_in_0_rawIn__isZero = recFN_from_fN_in_0_rawIn_isZero @[rawFloatFromFN.scala 65:23 68:20]
    node _recFN_from_fN_in_0_T_1 = mux(recFN_from_fN_in_0_rawIn__isZero, UInt<3>("h0"), _recFN_from_fN_in_0_T) @[recFNFromFN.scala 48:16]
    node recFN_from_fN_in_0_rawIn__isNaN = _recFN_from_fN_in_0_rawIn_out_isNaN_T_1 @[rawFloatFromFN.scala 65:23 66:20]
    node _recFN_from_fN_in_0_T_2 = mux(recFN_from_fN_in_0_rawIn__isNaN, UInt<1>("h1"), UInt<1>("h0")) @[recFNFromFN.scala 49:20]
    node _recFN_from_fN_in_0_T_3 = or(_recFN_from_fN_in_0_T_1, _recFN_from_fN_in_0_T_2) @[recFNFromFN.scala 48:79]
    node _recFN_from_fN_in_0_T_4 = bits(recFN_from_fN_in_0_rawIn__sExp, 5, 0) @[recFNFromFN.scala 50:23]
    node recFN_from_fN_in_0_rawIn__sig = _recFN_from_fN_in_0_rawIn_out_sig_T_2 @[rawFloatFromFN.scala 65:23 71:17]
    node _recFN_from_fN_in_0_T_5 = bits(recFN_from_fN_in_0_rawIn__sig, 22, 0) @[recFNFromFN.scala 51:22]
    node recFN_from_fN_in_0_lo = cat(_recFN_from_fN_in_0_T_4, _recFN_from_fN_in_0_T_5) @[Cat.scala 30:58]
    node recFN_from_fN_in_0_rawIn__sign = recFN_from_fN_in_0_rawIn_sign @[rawFloatFromFN.scala 65:23 69:20]
    node recFN_from_fN_in_0_hi = cat(recFN_from_fN_in_0_rawIn__sign, _recFN_from_fN_in_0_T_3) @[Cat.scala 30:58]
    node _recFN_from_fN_in_0_T_6 = cat(recFN_from_fN_in_0_hi, recFN_from_fN_in_0_lo) @[Cat.scala 30:58]
    reg recFN_from_fN_in_0 : UInt<33>, clock with :
      reset => (UInt<1>("h0"), recFN_from_fN_in_0) @[AddSubPE.scala 53:37]
    node recFN_from_fN_in_1_rawIn_sign = bits(fN_in_1, 31, 31) @[rawFloatFromFN.scala 46:22]
    node recFN_from_fN_in_1_rawIn_expIn = bits(fN_in_1, 30, 23) @[rawFloatFromFN.scala 47:23]
    node recFN_from_fN_in_1_rawIn_fractIn = bits(fN_in_1, 22, 0) @[rawFloatFromFN.scala 48:25]
    node recFN_from_fN_in_1_rawIn_isZeroExpIn = eq(recFN_from_fN_in_1_rawIn_expIn, UInt<1>("h0")) @[rawFloatFromFN.scala 50:34]
    node recFN_from_fN_in_1_rawIn_isZeroFractIn = eq(recFN_from_fN_in_1_rawIn_fractIn, UInt<1>("h0")) @[rawFloatFromFN.scala 51:38]
    node _recFN_from_fN_in_1_rawIn_normDist_T = bits(recFN_from_fN_in_1_rawIn_fractIn, 0, 0) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_1 = bits(recFN_from_fN_in_1_rawIn_fractIn, 1, 1) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_2 = bits(recFN_from_fN_in_1_rawIn_fractIn, 2, 2) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_3 = bits(recFN_from_fN_in_1_rawIn_fractIn, 3, 3) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_4 = bits(recFN_from_fN_in_1_rawIn_fractIn, 4, 4) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_5 = bits(recFN_from_fN_in_1_rawIn_fractIn, 5, 5) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_6 = bits(recFN_from_fN_in_1_rawIn_fractIn, 6, 6) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_7 = bits(recFN_from_fN_in_1_rawIn_fractIn, 7, 7) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_8 = bits(recFN_from_fN_in_1_rawIn_fractIn, 8, 8) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_9 = bits(recFN_from_fN_in_1_rawIn_fractIn, 9, 9) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_10 = bits(recFN_from_fN_in_1_rawIn_fractIn, 10, 10) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_11 = bits(recFN_from_fN_in_1_rawIn_fractIn, 11, 11) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_12 = bits(recFN_from_fN_in_1_rawIn_fractIn, 12, 12) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_13 = bits(recFN_from_fN_in_1_rawIn_fractIn, 13, 13) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_14 = bits(recFN_from_fN_in_1_rawIn_fractIn, 14, 14) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_15 = bits(recFN_from_fN_in_1_rawIn_fractIn, 15, 15) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_16 = bits(recFN_from_fN_in_1_rawIn_fractIn, 16, 16) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_17 = bits(recFN_from_fN_in_1_rawIn_fractIn, 17, 17) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_18 = bits(recFN_from_fN_in_1_rawIn_fractIn, 18, 18) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_19 = bits(recFN_from_fN_in_1_rawIn_fractIn, 19, 19) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_20 = bits(recFN_from_fN_in_1_rawIn_fractIn, 20, 20) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_21 = bits(recFN_from_fN_in_1_rawIn_fractIn, 21, 21) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_22 = bits(recFN_from_fN_in_1_rawIn_fractIn, 22, 22) @[primitives.scala 92:52]
    node _recFN_from_fN_in_1_rawIn_normDist_T_23 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_1, UInt<5>("h15"), UInt<5>("h16")) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_24 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_2, UInt<5>("h14"), _recFN_from_fN_in_1_rawIn_normDist_T_23) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_25 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_3, UInt<5>("h13"), _recFN_from_fN_in_1_rawIn_normDist_T_24) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_26 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_4, UInt<5>("h12"), _recFN_from_fN_in_1_rawIn_normDist_T_25) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_27 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_5, UInt<5>("h11"), _recFN_from_fN_in_1_rawIn_normDist_T_26) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_28 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_6, UInt<5>("h10"), _recFN_from_fN_in_1_rawIn_normDist_T_27) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_29 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_7, UInt<4>("hf"), _recFN_from_fN_in_1_rawIn_normDist_T_28) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_30 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_8, UInt<4>("he"), _recFN_from_fN_in_1_rawIn_normDist_T_29) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_31 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_9, UInt<4>("hd"), _recFN_from_fN_in_1_rawIn_normDist_T_30) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_32 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_10, UInt<4>("hc"), _recFN_from_fN_in_1_rawIn_normDist_T_31) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_33 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_11, UInt<4>("hb"), _recFN_from_fN_in_1_rawIn_normDist_T_32) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_34 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_12, UInt<4>("ha"), _recFN_from_fN_in_1_rawIn_normDist_T_33) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_35 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_13, UInt<4>("h9"), _recFN_from_fN_in_1_rawIn_normDist_T_34) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_36 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_14, UInt<4>("h8"), _recFN_from_fN_in_1_rawIn_normDist_T_35) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_37 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_15, UInt<3>("h7"), _recFN_from_fN_in_1_rawIn_normDist_T_36) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_38 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_16, UInt<3>("h6"), _recFN_from_fN_in_1_rawIn_normDist_T_37) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_39 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_17, UInt<3>("h5"), _recFN_from_fN_in_1_rawIn_normDist_T_38) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_40 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_18, UInt<3>("h4"), _recFN_from_fN_in_1_rawIn_normDist_T_39) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_41 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_19, UInt<2>("h3"), _recFN_from_fN_in_1_rawIn_normDist_T_40) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_42 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_20, UInt<2>("h2"), _recFN_from_fN_in_1_rawIn_normDist_T_41) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_normDist_T_43 = mux(_recFN_from_fN_in_1_rawIn_normDist_T_21, UInt<1>("h1"), _recFN_from_fN_in_1_rawIn_normDist_T_42) @[Mux.scala 47:69]
    node recFN_from_fN_in_1_rawIn_normDist = mux(_recFN_from_fN_in_1_rawIn_normDist_T_22, UInt<1>("h0"), _recFN_from_fN_in_1_rawIn_normDist_T_43) @[Mux.scala 47:69]
    node _recFN_from_fN_in_1_rawIn_subnormFract_T = dshl(recFN_from_fN_in_1_rawIn_fractIn, recFN_from_fN_in_1_rawIn_normDist) @[rawFloatFromFN.scala 54:36]
    node _recFN_from_fN_in_1_rawIn_subnormFract_T_1 = bits(_recFN_from_fN_in_1_rawIn_subnormFract_T, 21, 0) @[rawFloatFromFN.scala 54:47]
    node recFN_from_fN_in_1_rawIn_subnormFract = shl(_recFN_from_fN_in_1_rawIn_subnormFract_T_1, 1) @[rawFloatFromFN.scala 54:64]
    node _recFN_from_fN_in_1_rawIn_adjustedExp_T = xor(recFN_from_fN_in_1_rawIn_normDist, UInt<9>("h1ff")) @[rawFloatFromFN.scala 57:26]
    node _recFN_from_fN_in_1_rawIn_adjustedExp_T_1 = mux(recFN_from_fN_in_1_rawIn_isZeroExpIn, _recFN_from_fN_in_1_rawIn_adjustedExp_T, recFN_from_fN_in_1_rawIn_expIn) @[rawFloatFromFN.scala 56:16]
    node _recFN_from_fN_in_1_rawIn_adjustedExp_T_2 = mux(recFN_from_fN_in_1_rawIn_isZeroExpIn, UInt<2>("h2"), UInt<1>("h1")) @[rawFloatFromFN.scala 60:27]
    node _recFN_from_fN_in_1_rawIn_adjustedExp_T_3 = or(UInt<8>("h80"), _recFN_from_fN_in_1_rawIn_adjustedExp_T_2) @[rawFloatFromFN.scala 60:22]
    node _recFN_from_fN_in_1_rawIn_adjustedExp_T_4 = add(_recFN_from_fN_in_1_rawIn_adjustedExp_T_1, _recFN_from_fN_in_1_rawIn_adjustedExp_T_3) @[rawFloatFromFN.scala 59:15]
    node recFN_from_fN_in_1_rawIn_adjustedExp = tail(_recFN_from_fN_in_1_rawIn_adjustedExp_T_4, 1) @[rawFloatFromFN.scala 59:15]
    node recFN_from_fN_in_1_rawIn_isZero = and(recFN_from_fN_in_1_rawIn_isZeroExpIn, recFN_from_fN_in_1_rawIn_isZeroFractIn) @[rawFloatFromFN.scala 62:34]
    node _recFN_from_fN_in_1_rawIn_isSpecial_T = bits(recFN_from_fN_in_1_rawIn_adjustedExp, 8, 7) @[rawFloatFromFN.scala 63:37]
    node recFN_from_fN_in_1_rawIn_isSpecial = eq(_recFN_from_fN_in_1_rawIn_isSpecial_T, UInt<2>("h3")) @[rawFloatFromFN.scala 63:62]
    node _recFN_from_fN_in_1_rawIn_out_isNaN_T = eq(recFN_from_fN_in_1_rawIn_isZeroFractIn, UInt<1>("h0")) @[rawFloatFromFN.scala 66:36]
    node _recFN_from_fN_in_1_rawIn_out_isNaN_T_1 = and(recFN_from_fN_in_1_rawIn_isSpecial, _recFN_from_fN_in_1_rawIn_out_isNaN_T) @[rawFloatFromFN.scala 66:33]
    node _recFN_from_fN_in_1_rawIn_out_isInf_T = and(recFN_from_fN_in_1_rawIn_isSpecial, recFN_from_fN_in_1_rawIn_isZeroFractIn) @[rawFloatFromFN.scala 67:33]
    node _recFN_from_fN_in_1_rawIn_out_sExp_T = bits(recFN_from_fN_in_1_rawIn_adjustedExp, 8, 0) @[rawFloatFromFN.scala 70:34]
    node _recFN_from_fN_in_1_rawIn_out_sExp_T_1 = cvt(_recFN_from_fN_in_1_rawIn_out_sExp_T) @[rawFloatFromFN.scala 70:48]
    node _recFN_from_fN_in_1_rawIn_out_sig_T = eq(recFN_from_fN_in_1_rawIn_isZero, UInt<1>("h0")) @[rawFloatFromFN.scala 72:29]
    node _recFN_from_fN_in_1_rawIn_out_sig_T_1 = mux(recFN_from_fN_in_1_rawIn_isZeroExpIn, recFN_from_fN_in_1_rawIn_subnormFract, recFN_from_fN_in_1_rawIn_fractIn) @[rawFloatFromFN.scala 72:42]
    node recFN_from_fN_in_1_rawIn_out_sig_hi = cat(UInt<1>("h0"), _recFN_from_fN_in_1_rawIn_out_sig_T) @[Cat.scala 30:58]
    node _recFN_from_fN_in_1_rawIn_out_sig_T_2 = cat(recFN_from_fN_in_1_rawIn_out_sig_hi, _recFN_from_fN_in_1_rawIn_out_sig_T_1) @[Cat.scala 30:58]
    node recFN_from_fN_in_1_rawIn__sExp = _recFN_from_fN_in_1_rawIn_out_sExp_T_1 @[rawFloatFromFN.scala 65:23 70:20]
    node _recFN_from_fN_in_1_T = bits(recFN_from_fN_in_1_rawIn__sExp, 8, 6) @[recFNFromFN.scala 48:53]
    node recFN_from_fN_in_1_rawIn__isZero = recFN_from_fN_in_1_rawIn_isZero @[rawFloatFromFN.scala 65:23 68:20]
    node _recFN_from_fN_in_1_T_1 = mux(recFN_from_fN_in_1_rawIn__isZero, UInt<3>("h0"), _recFN_from_fN_in_1_T) @[recFNFromFN.scala 48:16]
    node recFN_from_fN_in_1_rawIn__isNaN = _recFN_from_fN_in_1_rawIn_out_isNaN_T_1 @[rawFloatFromFN.scala 65:23 66:20]
    node _recFN_from_fN_in_1_T_2 = mux(recFN_from_fN_in_1_rawIn__isNaN, UInt<1>("h1"), UInt<1>("h0")) @[recFNFromFN.scala 49:20]
    node _recFN_from_fN_in_1_T_3 = or(_recFN_from_fN_in_1_T_1, _recFN_from_fN_in_1_T_2) @[recFNFromFN.scala 48:79]
    node _recFN_from_fN_in_1_T_4 = bits(recFN_from_fN_in_1_rawIn__sExp, 5, 0) @[recFNFromFN.scala 50:23]
    node recFN_from_fN_in_1_rawIn__sig = _recFN_from_fN_in_1_rawIn_out_sig_T_2 @[rawFloatFromFN.scala 65:23 71:17]
    node _recFN_from_fN_in_1_T_5 = bits(recFN_from_fN_in_1_rawIn__sig, 22, 0) @[recFNFromFN.scala 51:22]
    node recFN_from_fN_in_1_lo = cat(_recFN_from_fN_in_1_T_4, _recFN_from_fN_in_1_T_5) @[Cat.scala 30:58]
    node recFN_from_fN_in_1_rawIn__sign = recFN_from_fN_in_1_rawIn_sign @[rawFloatFromFN.scala 65:23 69:20]
    node recFN_from_fN_in_1_hi = cat(recFN_from_fN_in_1_rawIn__sign, _recFN_from_fN_in_1_T_3) @[Cat.scala 30:58]
    node _recFN_from_fN_in_1_T_6 = cat(recFN_from_fN_in_1_hi, recFN_from_fN_in_1_lo) @[Cat.scala 30:58]
    reg recFN_from_fN_in_1 : UInt<33>, clock with :
      reset => (UInt<1>("h0"), recFN_from_fN_in_1) @[AddSubPE.scala 54:37]
    node io_out_rawIn_exp = bits(addRecFN.io_out, 31, 23) @[rawFloatFromRecFN.scala 50:21]
    node _io_out_rawIn_isZero_T = bits(io_out_rawIn_exp, 8, 6) @[rawFloatFromRecFN.scala 51:29]
    node io_out_rawIn_isZero = eq(_io_out_rawIn_isZero_T, UInt<1>("h0")) @[rawFloatFromRecFN.scala 51:54]
    node _io_out_rawIn_isSpecial_T = bits(io_out_rawIn_exp, 8, 7) @[rawFloatFromRecFN.scala 52:29]
    node io_out_rawIn_isSpecial = eq(_io_out_rawIn_isSpecial_T, UInt<2>("h3")) @[rawFloatFromRecFN.scala 52:54]
    node _io_out_rawIn_out_isNaN_T = bits(io_out_rawIn_exp, 6, 6) @[rawFloatFromRecFN.scala 55:41]
    node _io_out_rawIn_out_isNaN_T_1 = and(io_out_rawIn_isSpecial, _io_out_rawIn_out_isNaN_T) @[rawFloatFromRecFN.scala 55:33]
    node _io_out_rawIn_out_isInf_T = bits(io_out_rawIn_exp, 6, 6) @[rawFloatFromRecFN.scala 56:41]
    node _io_out_rawIn_out_isInf_T_1 = eq(_io_out_rawIn_out_isInf_T, UInt<1>("h0")) @[rawFloatFromRecFN.scala 56:36]
    node _io_out_rawIn_out_isInf_T_2 = and(io_out_rawIn_isSpecial, _io_out_rawIn_out_isInf_T_1) @[rawFloatFromRecFN.scala 56:33]
    node _io_out_rawIn_out_sign_T = bits(addRecFN.io_out, 32, 32) @[rawFloatFromRecFN.scala 58:25]
    node _io_out_rawIn_out_sExp_T = cvt(io_out_rawIn_exp) @[rawFloatFromRecFN.scala 59:27]
    node _io_out_rawIn_out_sig_T = eq(io_out_rawIn_isZero, UInt<1>("h0")) @[rawFloatFromRecFN.scala 60:39]
    node _io_out_rawIn_out_sig_T_1 = bits(addRecFN.io_out, 22, 0) @[rawFloatFromRecFN.scala 60:51]
    node io_out_rawIn_out_sig_hi = cat(UInt<1>("h0"), _io_out_rawIn_out_sig_T) @[Cat.scala 30:58]
    node _io_out_rawIn_out_sig_T_2 = cat(io_out_rawIn_out_sig_hi, _io_out_rawIn_out_sig_T_1) @[Cat.scala 30:58]
    node io_out_rawIn__sExp = _io_out_rawIn_out_sExp_T @[rawFloatFromRecFN.scala 54:23 59:20]
    node io_out_isSubnormal = lt(io_out_rawIn__sExp, asSInt(UInt<9>("h82"))) @[fNFromRecFN.scala 50:39]
    node _io_out_denormShiftDist_T = bits(io_out_rawIn__sExp, 4, 0) @[fNFromRecFN.scala 51:51]
    node _io_out_denormShiftDist_T_1 = sub(UInt<1>("h1"), _io_out_denormShiftDist_T) @[fNFromRecFN.scala 51:39]
    node io_out_denormShiftDist = tail(_io_out_denormShiftDist_T_1, 1) @[fNFromRecFN.scala 51:39]
    node io_out_rawIn__sig = _io_out_rawIn_out_sig_T_2 @[rawFloatFromRecFN.scala 54:23 60:20]
    node _io_out_denormFract_T = shr(io_out_rawIn__sig, 1) @[fNFromRecFN.scala 52:38]
    node _io_out_denormFract_T_1 = dshr(_io_out_denormFract_T, io_out_denormShiftDist) @[fNFromRecFN.scala 52:42]
    node io_out_denormFract = bits(_io_out_denormFract_T_1, 22, 0) @[fNFromRecFN.scala 52:60]
    node _io_out_expOut_T = bits(io_out_rawIn__sExp, 7, 0) @[fNFromRecFN.scala 57:27]
    node _io_out_expOut_T_1 = sub(_io_out_expOut_T, UInt<8>("h81")) @[fNFromRecFN.scala 57:45]
    node _io_out_expOut_T_2 = tail(_io_out_expOut_T_1, 1) @[fNFromRecFN.scala 57:45]
    node _io_out_expOut_T_3 = mux(io_out_isSubnormal, UInt<1>("h0"), _io_out_expOut_T_2) @[fNFromRecFN.scala 55:16]
    node io_out_rawIn__isNaN = _io_out_rawIn_out_isNaN_T_1 @[rawFloatFromRecFN.scala 54:23 55:20]
    node io_out_rawIn__isInf = _io_out_rawIn_out_isInf_T_2 @[rawFloatFromRecFN.scala 54:23 56:20]
    node _io_out_expOut_T_4 = or(io_out_rawIn__isNaN, io_out_rawIn__isInf) @[fNFromRecFN.scala 59:44]
    node _io_out_expOut_T_5 = bits(_io_out_expOut_T_4, 0, 0) @[Bitwise.scala 72:15]
    node _io_out_expOut_T_6 = mux(_io_out_expOut_T_5, UInt<8>("hff"), UInt<8>("h0")) @[Bitwise.scala 72:12]
    node io_out_expOut = or(_io_out_expOut_T_3, _io_out_expOut_T_6) @[fNFromRecFN.scala 59:15]
    node _io_out_fractOut_T = bits(io_out_rawIn__sig, 22, 0) @[fNFromRecFN.scala 63:52]
    node _io_out_fractOut_T_1 = mux(io_out_rawIn__isInf, UInt<1>("h0"), _io_out_fractOut_T) @[fNFromRecFN.scala 63:20]
    node io_out_fractOut = mux(io_out_isSubnormal, io_out_denormFract, _io_out_fractOut_T_1) @[fNFromRecFN.scala 61:16]
    node io_out_rawIn__sign = _io_out_rawIn_out_sign_T @[rawFloatFromRecFN.scala 54:23 58:20]
    node io_out_hi = cat(io_out_rawIn__sign, io_out_expOut) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, io_out_fractOut) @[Cat.scala 30:58]
    node _GEN_1 = mux(use_int, _GEN_0, module_out) @[AddSubPE.scala 32:16 30:27]
    node _GEN_2 = mux(use_int, module_out, _io_out_T) @[AddSubPE.scala 32:16 44:12 65:12]
    node recFN_from_fN_in_0_rawIn__isInf = _recFN_from_fN_in_0_rawIn_out_isInf_T @[rawFloatFromFN.scala 65:23 67:20]
    node recFN_from_fN_in_1_rawIn__isInf = _recFN_from_fN_in_1_rawIn_out_isInf_T @[rawFloatFromFN.scala 65:23 67:20]
    node io_out_rawIn__isZero = io_out_rawIn_isZero @[rawFloatFromRecFN.scala 54:23 57:20]
    io_out <= bits(_GEN_2, 31, 0)
    rounding <= io_rounding @[AddSubPE.scala 22:26]
    tininess <= io_tininess @[AddSubPE.scala 24:27]
    op <= io_op @[AddSubPE.scala 26:27]
    use_int <= io_use_int @[AddSubPE.scala 28:27]
    module_out <= mux(reset, UInt<33>("h0"), _GEN_1) @[AddSubPE.scala 30:{27,27}]
    sign_in_0 <= _sign_in_0_T @[AddSubPE.scala 34:29]
    sign_in_1 <= _sign_in_1_T @[AddSubPE.scala 35:29]
    fN_in_0 <= io_in_0 @[AddSubPE.scala 49:27]
    fN_in_1 <= io_in_1 @[AddSubPE.scala 50:27]
    recFN_from_fN_in_0 <= _recFN_from_fN_in_0_T_6 @[AddSubPE.scala 53:37]
    recFN_from_fN_in_1 <= _recFN_from_fN_in_1_T_6 @[AddSubPE.scala 54:37]
    addRecFN.io_subOp <= op @[AddSubPE.scala 58:23]
    addRecFN.io_a <= recFN_from_fN_in_0 @[AddSubPE.scala 61:19]
    addRecFN.io_b <= recFN_from_fN_in_1 @[AddSubPE.scala 62:19]
    addRecFN.io_roundingMode <= rounding @[AddSubPE.scala 59:32]
    addRecFN.io_detectTininess <= tininess @[AddSubPE.scala 60:32]

  module PE :
    input clock : Clock
    input reset : UInt<1>
    input io_Xi_0 : UInt<32>
    input io_Yi_0 : UInt<32>
    input io_Xi_1 : UInt<32>
    input io_Yi_1 : UInt<32>
    input io_aggr_0 : UInt<32>
    input io_aggr_1 : UInt<32>
    input io_aggr_2 : UInt<32>
    input io_aggr_3 : UInt<32>
    input io_m_0_sel : UInt<2>
    input io_m_1_sel : UInt<2>
    input io_m_2_sel : UInt<2>
    input io_m_3_sel : UInt<2>
    input io_m_4_sel : UInt<2>
    input io_m_5_sel : UInt<2>
    input io_m_6_sel : UInt<2>
    input io_m_7_sel : UInt<2>
    input io_m_8_sel : UInt<2>
    input io_m_9_sel : UInt<2>
    input io_addsub_0_op : UInt<1>
    input io_addsub_1_op : UInt<1>
    input io_rounding : UInt<3>
    input io_tininess : UInt<1>
    input io_use_int : UInt<1>
    output io_out_0 : UInt<32>
    output io_out_1 : UInt<32>

    inst m_0 of MuxPE @[PE.scala 106:19]
    inst m_1 of MuxPE @[PE.scala 107:19]
    inst m_2 of MuxPE @[PE.scala 108:19]
    inst m_3 of MuxPE @[PE.scala 109:19]
    inst m_4 of MuxPE @[PE.scala 110:19]
    inst m_5 of MuxPE @[PE.scala 111:19]
    inst m_6 of MuxPE @[PE.scala 112:19]
    inst m_7 of MuxPE @[PE.scala 113:19]
    inst m_8 of MuxPE @[PE.scala 114:19]
    inst m_9 of MuxPE @[PE.scala 115:19]
    inst multModule_0 of MultPE @[PE.scala 117:28]
    inst multModule_1 of MultPE @[PE.scala 118:28]
    inst addsubModule_0 of AddSubPE @[PE.scala 120:30]
    inst addsubModule_1 of AddSubPE @[PE.scala 121:30]
    reg Xi_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_0) @[PE.scala 47:22]
    reg Yi_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_0) @[PE.scala 48:22]
    reg Xi_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_1) @[PE.scala 49:22]
    reg Yi_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_1) @[PE.scala 50:22]
    reg aggr_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_0) @[PE.scala 55:24]
    reg aggr_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_1) @[PE.scala 56:24]
    reg aggr_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_2) @[PE.scala 57:24]
    reg aggr_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_3) @[PE.scala 58:24]
    reg m_0_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_0_sel) @[PE.scala 63:25]
    reg m_1_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_1_sel) @[PE.scala 64:25]
    reg m_2_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_2_sel) @[PE.scala 65:25]
    reg m_3_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_3_sel) @[PE.scala 66:25]
    reg m_4_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_4_sel) @[PE.scala 67:25]
    reg m_5_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_5_sel) @[PE.scala 68:25]
    reg m_6_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_6_sel) @[PE.scala 69:25]
    reg m_7_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_7_sel) @[PE.scala 70:25]
    reg m_8_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_8_sel) @[PE.scala 71:25]
    reg m_9_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_9_sel) @[PE.scala 72:25]
    reg addsub_0_op : UInt<1>, clock with :
      reset => (UInt<1>("h0"), addsub_0_op) @[PE.scala 74:29]
    reg addsub_1_op : UInt<1>, clock with :
      reset => (UInt<1>("h0"), addsub_1_op) @[PE.scala 75:29]
    reg rounding : UInt<3>, clock with :
      reset => (UInt<1>("h0"), rounding) @[PE.scala 78:29]
    reg tininess : UInt<1>, clock with :
      reset => (UInt<1>("h0"), tininess) @[PE.scala 80:29]
    reg use_int : UInt<1>, clock with :
      reset => (UInt<1>("h0"), use_int) @[PE.scala 82:29]
    reg addsubModule_0_out : UInt<33>, clock with :
      reset => (UInt<1>("h0"), addsubModule_0_out) @[PE.scala 87:36]
    reg addsubModule_1_out : UInt<33>, clock with :
      reset => (UInt<1>("h0"), addsubModule_1_out) @[PE.scala 88:36]
    reg multModule_0_out : UInt<33>, clock with :
      reset => (UInt<1>("h0"), multModule_0_out) @[PE.scala 89:36]
    reg multModule_1_out : UInt<33>, clock with :
      reset => (UInt<1>("h0"), multModule_1_out) @[PE.scala 90:36]
    reg m_0_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), m_0_out) @[PE.scala 92:24]
    reg m_1_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), m_1_out) @[PE.scala 93:24]
    reg m_2_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), m_2_out) @[PE.scala 94:24]
    reg m_3_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), m_3_out) @[PE.scala 95:24]
    reg m_4_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), m_4_out) @[PE.scala 96:24]
    reg m_5_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), m_5_out) @[PE.scala 97:24]
    reg m_6_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), m_6_out) @[PE.scala 98:24]
    reg m_7_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), m_7_out) @[PE.scala 99:24]
    reg m_8_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), m_8_out) @[PE.scala 100:24]
    reg m_9_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), m_9_out) @[PE.scala 101:24]
    io_out_0 <= m_8_out @[PE.scala 245:12]
    io_out_1 <= m_9_out @[PE.scala 246:12]
    Xi_0 <= io_Xi_0 @[PE.scala 47:22]
    Yi_0 <= io_Yi_0 @[PE.scala 48:22]
    Xi_1 <= io_Xi_1 @[PE.scala 49:22]
    Yi_1 <= io_Yi_1 @[PE.scala 50:22]
    aggr_0 <= io_aggr_0 @[PE.scala 55:24]
    aggr_1 <= io_aggr_1 @[PE.scala 56:24]
    aggr_2 <= io_aggr_2 @[PE.scala 57:24]
    aggr_3 <= io_aggr_3 @[PE.scala 58:24]
    m_0_sel <= io_m_0_sel @[PE.scala 63:25]
    m_1_sel <= io_m_1_sel @[PE.scala 64:25]
    m_2_sel <= io_m_2_sel @[PE.scala 65:25]
    m_3_sel <= io_m_3_sel @[PE.scala 66:25]
    m_4_sel <= io_m_4_sel @[PE.scala 67:25]
    m_5_sel <= io_m_5_sel @[PE.scala 68:25]
    m_6_sel <= io_m_6_sel @[PE.scala 69:25]
    m_7_sel <= io_m_7_sel @[PE.scala 70:25]
    m_8_sel <= io_m_8_sel @[PE.scala 71:25]
    m_9_sel <= io_m_9_sel @[PE.scala 72:25]
    addsub_0_op <= io_addsub_0_op @[PE.scala 74:29]
    addsub_1_op <= io_addsub_1_op @[PE.scala 75:29]
    rounding <= io_rounding @[PE.scala 78:29]
    tininess <= io_tininess @[PE.scala 80:29]
    use_int <= io_use_int @[PE.scala 82:29]
    addsubModule_0_out <= mux(reset, UInt<33>("h0"), addsubModule_0.io_out) @[PE.scala 216:23 87:{36,36}]
    addsubModule_1_out <= mux(reset, UInt<33>("h0"), addsubModule_1.io_out) @[PE.scala 225:23 88:{36,36}]
    multModule_0_out <= mux(reset, UInt<33>("h0"), multModule_0.io_out) @[PE.scala 170:21 89:{36,36}]
    multModule_1_out <= mux(reset, UInt<33>("h0"), multModule_1.io_out) @[PE.scala 178:21 90:{36,36}]
    m_0_out <= mux(reset, UInt<32>("h0"), m_0.io_out) @[PE.scala 142:11 92:{24,24}]
    m_1_out <= mux(reset, UInt<32>("h0"), m_1.io_out) @[PE.scala 148:11 93:{24,24}]
    m_2_out <= mux(reset, UInt<32>("h0"), m_2.io_out) @[PE.scala 154:11 94:{24,24}]
    m_3_out <= mux(reset, UInt<32>("h0"), m_3.io_out) @[PE.scala 160:11 95:{24,24}]
    m_4_out <= mux(reset, UInt<32>("h0"), m_4.io_out) @[PE.scala 187:15 96:{24,24}]
    m_5_out <= mux(reset, UInt<32>("h0"), m_5.io_out) @[PE.scala 193:15 97:{24,24}]
    m_6_out <= mux(reset, UInt<32>("h0"), m_6.io_out) @[PE.scala 199:15 98:{24,24}]
    m_7_out <= mux(reset, UInt<32>("h0"), m_7.io_out) @[PE.scala 205:15 99:{24,24}]
    m_8_out <= mux(reset, UInt<32>("h0"), m_8.io_out) @[PE.scala 100:{24,24} 234:15]
    m_9_out <= mux(reset, UInt<32>("h0"), m_9.io_out) @[PE.scala 101:{24,24} 240:15]
    m_0.clock <= clock
    m_0.reset <= reset
    m_0.io_sel <= m_0_sel @[PE.scala 126:14]
    m_0.io_in_0 <= Xi_0 @[PE.scala 138:15]
    m_0.io_in_1 <= bits(addsubModule_0_out, 31, 0) @[PE.scala 139:15]
    m_0.io_in_2 <= UInt<32>("h0") @[PE.scala 140:15]
    m_0.io_in_3 <= UInt<32>("h0") @[PE.scala 141:15]
    m_1.clock <= clock
    m_1.reset <= reset
    m_1.io_sel <= m_1_sel @[PE.scala 127:14]
    m_1.io_in_0 <= Yi_0 @[PE.scala 144:15]
    m_1.io_in_1 <= bits(addsubModule_0_out, 31, 0) @[PE.scala 145:15]
    m_1.io_in_2 <= UInt<32>("h0") @[PE.scala 146:15]
    m_1.io_in_3 <= UInt<32>("h0") @[PE.scala 147:15]
    m_2.clock <= clock
    m_2.reset <= reset
    m_2.io_sel <= m_2_sel @[PE.scala 128:14]
    m_2.io_in_0 <= Xi_1 @[PE.scala 150:15]
    m_2.io_in_1 <= bits(addsubModule_1_out, 31, 0) @[PE.scala 151:15]
    m_2.io_in_2 <= UInt<32>("h0") @[PE.scala 152:15]
    m_2.io_in_3 <= UInt<32>("h0") @[PE.scala 153:15]
    m_3.clock <= clock
    m_3.reset <= reset
    m_3.io_sel <= m_3_sel @[PE.scala 129:14]
    m_3.io_in_0 <= Yi_1 @[PE.scala 156:15]
    m_3.io_in_1 <= bits(addsubModule_1_out, 31, 0) @[PE.scala 157:15]
    m_3.io_in_2 <= UInt<32>("h0") @[PE.scala 158:15]
    m_3.io_in_3 <= UInt<32>("h0") @[PE.scala 159:15]
    m_4.clock <= clock
    m_4.reset <= reset
    m_4.io_sel <= m_4_sel @[PE.scala 130:14]
    m_4.io_in_0 <= Xi_0 @[PE.scala 183:15]
    m_4.io_in_1 <= bits(multModule_0_out, 31, 0) @[PE.scala 184:15]
    m_4.io_in_2 <= aggr_0 @[PE.scala 185:15]
    m_4.io_in_3 <= UInt<32>("h0") @[PE.scala 186:15]
    m_5.clock <= clock
    m_5.reset <= reset
    m_5.io_sel <= m_5_sel @[PE.scala 131:14]
    m_5.io_in_0 <= Yi_0 @[PE.scala 189:15]
    m_5.io_in_1 <= bits(multModule_1_out, 31, 0) @[PE.scala 190:15]
    m_5.io_in_2 <= aggr_1 @[PE.scala 191:15]
    m_5.io_in_3 <= UInt<32>("h0") @[PE.scala 192:15]
    m_6.clock <= clock
    m_6.reset <= reset
    m_6.io_sel <= m_6_sel @[PE.scala 132:14]
    m_6.io_in_0 <= Xi_1 @[PE.scala 195:15]
    m_6.io_in_1 <= bits(multModule_1_out, 31, 0) @[PE.scala 196:15]
    m_6.io_in_2 <= aggr_2 @[PE.scala 197:15]
    m_6.io_in_3 <= UInt<32>("h0") @[PE.scala 198:15]
    m_7.clock <= clock
    m_7.reset <= reset
    m_7.io_sel <= m_7_sel @[PE.scala 133:14]
    m_7.io_in_0 <= Yi_1 @[PE.scala 201:15]
    m_7.io_in_1 <= UInt<32>("h0") @[PE.scala 202:15]
    m_7.io_in_2 <= aggr_3 @[PE.scala 203:15]
    m_7.io_in_3 <= UInt<32>("h0") @[PE.scala 204:15]
    m_8.clock <= clock
    m_8.reset <= reset
    m_8.io_sel <= m_8_sel @[PE.scala 134:14]
    m_8.io_in_0 <= bits(addsubModule_0_out, 31, 0) @[PE.scala 230:15]
    m_8.io_in_1 <= bits(multModule_0_out, 31, 0) @[PE.scala 231:15]
    m_8.io_in_2 <= UInt<32>("h0") @[PE.scala 232:15]
    m_8.io_in_3 <= UInt<32>("h0") @[PE.scala 233:15]
    m_9.clock <= clock
    m_9.reset <= reset
    m_9.io_sel <= m_9_sel @[PE.scala 135:14]
    m_9.io_in_0 <= bits(addsubModule_1_out, 31, 0) @[PE.scala 236:15]
    m_9.io_in_1 <= bits(multModule_1_out, 31, 0) @[PE.scala 237:15]
    m_9.io_in_2 <= UInt<32>("h0") @[PE.scala 238:15]
    m_9.io_in_3 <= UInt<32>("h0") @[PE.scala 239:15]
    multModule_0.clock <= clock
    multModule_0.reset <= reset
    multModule_0.io_use_int <= use_int @[PE.scala 167:30]
    multModule_0.io_rounding <= rounding @[PE.scala 165:30]
    multModule_0.io_tininess <= tininess @[PE.scala 166:30]
    multModule_0.io_in_0 <= m_0_out @[PE.scala 168:24]
    multModule_0.io_in_1 <= m_1_out @[PE.scala 169:24]
    multModule_1.clock <= clock
    multModule_1.reset <= reset
    multModule_1.io_use_int <= use_int @[PE.scala 175:30]
    multModule_1.io_rounding <= rounding @[PE.scala 173:30]
    multModule_1.io_tininess <= tininess @[PE.scala 174:30]
    multModule_1.io_in_0 <= m_2_out @[PE.scala 176:24]
    multModule_1.io_in_1 <= m_3_out @[PE.scala 177:24]
    addsubModule_0.clock <= clock
    addsubModule_0.reset <= reset
    addsubModule_0.io_use_int <= use_int @[PE.scala 213:32]
    addsubModule_0.io_op <= addsub_0_op @[PE.scala 210:32]
    addsubModule_0.io_rounding <= rounding @[PE.scala 211:32]
    addsubModule_0.io_tininess <= tininess @[PE.scala 212:32]
    addsubModule_0.io_in_0 <= m_4_out @[PE.scala 214:32]
    addsubModule_0.io_in_1 <= m_5_out @[PE.scala 215:32]
    addsubModule_1.clock <= clock
    addsubModule_1.reset <= reset
    addsubModule_1.io_use_int <= use_int @[PE.scala 222:32]
    addsubModule_1.io_op <= addsub_1_op @[PE.scala 219:32]
    addsubModule_1.io_rounding <= rounding @[PE.scala 220:32]
    addsubModule_1.io_tininess <= tininess @[PE.scala 221:32]
    addsubModule_1.io_in_0 <= m_6_out @[PE.scala 223:32]
    addsubModule_1.io_in_1 <= m_7_out @[PE.scala 224:32]

  module PE_8IP :
    input clock : Clock
    input reset : UInt<1>
    input io_Xi_0_in_0 : UInt<32>
    input io_Yi_0_in_0 : UInt<32>
    input io_Xi_0_in_1 : UInt<32>
    input io_Yi_0_in_1 : UInt<32>
    input io_Xi_1_in_0 : UInt<32>
    input io_Yi_1_in_0 : UInt<32>
    input io_Xi_1_in_1 : UInt<32>
    input io_Yi_1_in_1 : UInt<32>
    input io_Xi_2_in_0 : UInt<32>
    input io_Yi_2_in_0 : UInt<32>
    input io_Xi_2_in_1 : UInt<32>
    input io_Yi_2_in_1 : UInt<32>
    input io_Xi_3_in_0 : UInt<32>
    input io_Yi_3_in_0 : UInt<32>
    input io_Xi_3_in_1 : UInt<32>
    input io_Yi_3_in_1 : UInt<32>
    input io_Xi_4_in_0 : UInt<32>
    input io_Yi_4_in_0 : UInt<32>
    input io_Xi_4_in_1 : UInt<32>
    input io_Yi_4_in_1 : UInt<32>
    input io_Xi_5_in_0 : UInt<32>
    input io_Yi_5_in_0 : UInt<32>
    input io_Xi_5_in_1 : UInt<32>
    input io_Yi_5_in_1 : UInt<32>
    input io_Xi_6_in_0 : UInt<32>
    input io_Yi_6_in_0 : UInt<32>
    input io_Xi_6_in_1 : UInt<32>
    input io_Yi_6_in_1 : UInt<32>
    input io_Xi_7_in_0 : UInt<32>
    input io_Yi_7_in_0 : UInt<32>
    input io_Xi_7_in_1 : UInt<32>
    input io_Yi_7_in_1 : UInt<32>
    input io_m_0_sel : UInt<2>
    input io_m_1_sel : UInt<2>
    input io_m_2_sel : UInt<2>
    input io_m_3_sel : UInt<2>
    input io_m_4_sel : UInt<2>
    input io_m_5_sel : UInt<2>
    input io_m_6_sel : UInt<2>
    input io_m_7_sel : UInt<2>
    input io_m_8_sel : UInt<2>
    input io_m_9_sel : UInt<2>
    input io_addsub_0_op : UInt<2>
    input io_addsub_1_op : UInt<2>
    input io_use_int : UInt<1>
    input io_tininess : UInt<1>
    input io_rounding : UInt<3>
    output io_dbg_aggr0 : UInt<32>
    output io_dbg_aggr1 : UInt<32>
    output io_out : UInt<32>

    inst pe_0 of PE @[PE_8IP.scala 208:20]
    inst pe_1 of PE @[PE_8IP.scala 236:20]
    inst pe_2 of PE @[PE_8IP.scala 264:20]
    inst pe_3 of PE @[PE_8IP.scala 291:20]
    inst pe_4 of PE @[PE_8IP.scala 319:20]
    inst pe_5 of PE @[PE_8IP.scala 347:20]
    inst pe_6 of PE @[PE_8IP.scala 375:20]
    inst pe_7 of PE @[PE_8IP.scala 402:20]
    inst addsubModule_0 of AddSubPE @[PE_8IP.scala 461:30]
    reg Xi_0_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_0_in_0) @[PE_8IP.scala 79:27]
    reg Yi_0_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_0_in_0) @[PE_8IP.scala 80:27]
    reg Xi_0_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_0_in_1) @[PE_8IP.scala 81:27]
    reg Yi_0_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_0_in_1) @[PE_8IP.scala 82:27]
    reg aggr_0_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_0_in_0) @[PE_8IP.scala 83:29]
    reg aggr_0_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_0_in_1) @[PE_8IP.scala 84:29]
    reg aggr_0_in_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_0_in_2) @[PE_8IP.scala 85:29]
    reg aggr_0_in_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_0_in_3) @[PE_8IP.scala 86:29]
    reg Xi_1_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_1_in_0) @[PE_8IP.scala 88:27]
    reg Yi_1_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_1_in_0) @[PE_8IP.scala 89:27]
    reg Xi_1_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_1_in_1) @[PE_8IP.scala 90:27]
    reg Yi_1_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_1_in_1) @[PE_8IP.scala 91:27]
    reg aggr_1_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_1_in_0) @[PE_8IP.scala 92:29]
    reg aggr_1_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_1_in_1) @[PE_8IP.scala 93:29]
    reg aggr_1_in_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_1_in_2) @[PE_8IP.scala 94:29]
    reg aggr_1_in_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_1_in_3) @[PE_8IP.scala 95:29]
    reg Xi_2_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_2_in_0) @[PE_8IP.scala 97:27]
    reg Yi_2_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_2_in_0) @[PE_8IP.scala 98:27]
    reg Xi_2_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_2_in_1) @[PE_8IP.scala 99:27]
    reg Yi_2_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_2_in_1) @[PE_8IP.scala 100:27]
    reg aggr_2_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_2_in_0) @[PE_8IP.scala 101:29]
    reg aggr_2_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_2_in_1) @[PE_8IP.scala 102:29]
    reg aggr_2_in_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_2_in_2) @[PE_8IP.scala 103:29]
    reg aggr_2_in_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_2_in_3) @[PE_8IP.scala 104:29]
    reg Xi_3_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_3_in_0) @[PE_8IP.scala 106:27]
    reg Yi_3_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_3_in_0) @[PE_8IP.scala 107:27]
    reg Xi_3_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_3_in_1) @[PE_8IP.scala 108:27]
    reg Yi_3_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_3_in_1) @[PE_8IP.scala 109:27]
    reg aggr_3_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_3_in_0) @[PE_8IP.scala 110:29]
    reg aggr_3_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_3_in_1) @[PE_8IP.scala 111:29]
    reg aggr_3_in_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_3_in_2) @[PE_8IP.scala 112:29]
    reg aggr_3_in_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_3_in_3) @[PE_8IP.scala 113:29]
    reg Xi_4_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_4_in_0) @[PE_8IP.scala 115:27]
    reg Yi_4_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_4_in_0) @[PE_8IP.scala 116:27]
    reg Xi_4_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_4_in_1) @[PE_8IP.scala 117:27]
    reg Yi_4_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_4_in_1) @[PE_8IP.scala 118:27]
    reg aggr_4_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_4_in_0) @[PE_8IP.scala 119:29]
    reg aggr_4_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_4_in_1) @[PE_8IP.scala 120:29]
    reg aggr_4_in_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_4_in_2) @[PE_8IP.scala 121:29]
    reg aggr_4_in_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_4_in_3) @[PE_8IP.scala 122:29]
    reg Xi_5_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_5_in_0) @[PE_8IP.scala 124:27]
    reg Yi_5_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_5_in_0) @[PE_8IP.scala 125:27]
    reg Xi_5_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_5_in_1) @[PE_8IP.scala 126:27]
    reg Yi_5_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_5_in_1) @[PE_8IP.scala 127:27]
    reg aggr_5_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_5_in_0) @[PE_8IP.scala 128:29]
    reg aggr_5_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_5_in_1) @[PE_8IP.scala 129:29]
    reg aggr_5_in_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_5_in_2) @[PE_8IP.scala 130:29]
    reg aggr_5_in_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_5_in_3) @[PE_8IP.scala 131:29]
    reg Xi_6_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_6_in_0) @[PE_8IP.scala 133:27]
    reg Yi_6_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_6_in_0) @[PE_8IP.scala 134:27]
    reg Xi_6_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_6_in_1) @[PE_8IP.scala 135:27]
    reg Yi_6_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_6_in_1) @[PE_8IP.scala 136:27]
    reg aggr_6_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_6_in_0) @[PE_8IP.scala 137:29]
    reg aggr_6_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_6_in_1) @[PE_8IP.scala 138:29]
    reg aggr_6_in_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_6_in_2) @[PE_8IP.scala 139:29]
    reg aggr_6_in_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_6_in_3) @[PE_8IP.scala 140:29]
    reg Xi_7_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_7_in_0) @[PE_8IP.scala 142:27]
    reg Yi_7_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_7_in_0) @[PE_8IP.scala 143:27]
    reg Xi_7_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_7_in_1) @[PE_8IP.scala 144:27]
    reg Yi_7_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_7_in_1) @[PE_8IP.scala 145:27]
    reg aggr_7_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_7_in_0) @[PE_8IP.scala 146:29]
    reg aggr_7_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_7_in_1) @[PE_8IP.scala 147:29]
    reg aggr_7_in_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_7_in_2) @[PE_8IP.scala 148:29]
    reg aggr_7_in_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), aggr_7_in_3) @[PE_8IP.scala 149:29]
    reg m_0_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_0_sel) @[PE_8IP.scala 154:25]
    reg m_1_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_1_sel) @[PE_8IP.scala 155:25]
    reg m_2_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_2_sel) @[PE_8IP.scala 156:25]
    reg m_3_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_3_sel) @[PE_8IP.scala 157:25]
    reg m_4_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_4_sel) @[PE_8IP.scala 158:25]
    reg m_5_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_5_sel) @[PE_8IP.scala 159:25]
    reg m_6_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_6_sel) @[PE_8IP.scala 160:25]
    reg m_7_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_7_sel) @[PE_8IP.scala 161:25]
    reg m_8_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_8_sel) @[PE_8IP.scala 162:25]
    reg m_9_sel : UInt<2>, clock with :
      reset => (UInt<1>("h0"), m_9_sel) @[PE_8IP.scala 163:25]
    reg addsub_0_op : UInt<2>, clock with :
      reset => (UInt<1>("h0"), addsub_0_op) @[PE_8IP.scala 166:30]
    reg addsub_1_op : UInt<2>, clock with :
      reset => (UInt<1>("h0"), addsub_1_op) @[PE_8IP.scala 167:30]
    reg rounding : UInt<3>, clock with :
      reset => (UInt<1>("h0"), rounding) @[PE_8IP.scala 170:29]
    reg tininess : UInt<1>, clock with :
      reset => (UInt<1>("h0"), tininess) @[PE_8IP.scala 172:29]
    reg use_int : UInt<1>, clock with :
      reset => (UInt<1>("h0"), use_int) @[PE_8IP.scala 174:29]
    reg pe_0_out_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pe_0_out_0) @[PE_8IP.scala 179:29]
    reg pe_0_out_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pe_0_out_1) @[PE_8IP.scala 180:29]
    reg pe_1_out_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pe_1_out_0) @[PE_8IP.scala 181:29]
    reg pe_1_out_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pe_1_out_1) @[PE_8IP.scala 182:29]
    reg pe_2_out_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pe_2_out_0) @[PE_8IP.scala 183:29]
    reg pe_2_out_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pe_2_out_1) @[PE_8IP.scala 184:29]
    reg pe_3_out_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pe_3_out_0) @[PE_8IP.scala 185:29]
    reg pe_3_out_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pe_3_out_1) @[PE_8IP.scala 186:29]
    reg pe_4_out_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pe_4_out_0) @[PE_8IP.scala 187:29]
    reg pe_4_out_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pe_4_out_1) @[PE_8IP.scala 188:29]
    reg pe_5_out_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pe_5_out_0) @[PE_8IP.scala 189:29]
    reg pe_5_out_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pe_5_out_1) @[PE_8IP.scala 190:29]
    reg pe_6_out_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pe_6_out_0) @[PE_8IP.scala 191:29]
    reg pe_6_out_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pe_6_out_1) @[PE_8IP.scala 192:29]
    reg pe_7_out_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pe_7_out_0) @[PE_8IP.scala 193:29]
    reg pe_7_out_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pe_7_out_1) @[PE_8IP.scala 194:29]
    reg addsum_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), addsum_in_0) @[PE_8IP.scala 202:28]
    reg addsum_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), addsum_in_1) @[PE_8IP.scala 203:28]
    io_dbg_aggr0 <= pe_0_out_0 @[PE_8IP.scala 438:16]
    io_dbg_aggr1 <= pe_0_out_1 @[PE_8IP.scala 439:16]
    io_out <= addsubModule_0.io_out @[PE_8IP.scala 472:11]
    Xi_0_in_0 <= io_Xi_0_in_0 @[PE_8IP.scala 79:27]
    Yi_0_in_0 <= io_Yi_0_in_0 @[PE_8IP.scala 80:27]
    Xi_0_in_1 <= io_Xi_0_in_1 @[PE_8IP.scala 81:27]
    Yi_0_in_1 <= io_Yi_0_in_1 @[PE_8IP.scala 82:27]
    aggr_0_in_0 <= mux(reset, UInt<32>("h0"), pe_0_out_0) @[PE_8IP.scala 433:15 83:{29,29}]
    aggr_0_in_1 <= mux(reset, UInt<32>("h0"), pe_1_out_1) @[PE_8IP.scala 434:15 84:{29,29}]
    aggr_0_in_2 <= mux(reset, UInt<32>("h0"), pe_0_out_1) @[PE_8IP.scala 435:15 85:{29,29}]
    aggr_0_in_3 <= mux(reset, UInt<32>("h0"), pe_1_out_0) @[PE_8IP.scala 436:15 86:{29,29}]
    Xi_1_in_0 <= io_Xi_1_in_0 @[PE_8IP.scala 88:27]
    Yi_1_in_0 <= io_Yi_1_in_0 @[PE_8IP.scala 89:27]
    Xi_1_in_1 <= io_Xi_1_in_1 @[PE_8IP.scala 90:27]
    Yi_1_in_1 <= io_Yi_1_in_1 @[PE_8IP.scala 91:27]
    aggr_1_in_0 <= mux(reset, UInt<32>("h0"), pe_2_out_0) @[PE_8IP.scala 442:15 92:{29,29}]
    aggr_1_in_1 <= mux(reset, UInt<32>("h0"), pe_2_out_1) @[PE_8IP.scala 443:15 93:{29,29}]
    aggr_1_in_2 <= mux(reset, UInt<32>("h0"), pe_3_out_0) @[PE_8IP.scala 444:15 94:{29,29}]
    aggr_1_in_3 <= mux(reset, UInt<32>("h0"), pe_3_out_1) @[PE_8IP.scala 445:15 95:{29,29}]
    Xi_2_in_0 <= io_Xi_2_in_0 @[PE_8IP.scala 97:27]
    Yi_2_in_0 <= io_Yi_2_in_0 @[PE_8IP.scala 98:27]
    Xi_2_in_1 <= io_Xi_2_in_1 @[PE_8IP.scala 99:27]
    Yi_2_in_1 <= io_Yi_2_in_1 @[PE_8IP.scala 100:27]
    aggr_2_in_0 <= mux(reset, UInt<32>("h0"), pe_4_out_0) @[PE_8IP.scala 101:{29,29} 447:15]
    aggr_2_in_1 <= mux(reset, UInt<32>("h0"), pe_4_out_1) @[PE_8IP.scala 102:{29,29} 448:15]
    aggr_2_in_2 <= mux(reset, UInt<32>("h0"), pe_5_out_0) @[PE_8IP.scala 103:{29,29} 449:15]
    aggr_2_in_3 <= mux(reset, UInt<32>("h0"), pe_5_out_1) @[PE_8IP.scala 104:{29,29} 450:15]
    Xi_3_in_0 <= io_Xi_3_in_0 @[PE_8IP.scala 106:27]
    Yi_3_in_0 <= io_Yi_3_in_0 @[PE_8IP.scala 107:27]
    Xi_3_in_1 <= io_Xi_3_in_1 @[PE_8IP.scala 108:27]
    Yi_3_in_1 <= io_Yi_3_in_1 @[PE_8IP.scala 109:27]
    aggr_3_in_0 <= mux(reset, UInt<32>("h0"), pe_6_out_0) @[PE_8IP.scala 110:{29,29} 452:15]
    aggr_3_in_1 <= mux(reset, UInt<32>("h0"), pe_6_out_1) @[PE_8IP.scala 111:{29,29} 453:15]
    aggr_3_in_2 <= mux(reset, UInt<32>("h0"), pe_7_out_0) @[PE_8IP.scala 112:{29,29} 454:15]
    aggr_3_in_3 <= mux(reset, UInt<32>("h0"), pe_7_out_1) @[PE_8IP.scala 113:{29,29} 455:15]
    Xi_4_in_0 <= io_Xi_4_in_0 @[PE_8IP.scala 115:27]
    Yi_4_in_0 <= io_Yi_4_in_0 @[PE_8IP.scala 116:27]
    Xi_4_in_1 <= io_Xi_4_in_1 @[PE_8IP.scala 117:27]
    Yi_4_in_1 <= io_Yi_4_in_1 @[PE_8IP.scala 118:27]
    aggr_4_in_0 <= mux(reset, UInt<32>("h0"), aggr_4_in_0) @[PE_8IP.scala 119:{29,29,29}]
    aggr_4_in_1 <= mux(reset, UInt<32>("h0"), aggr_4_in_1) @[PE_8IP.scala 120:{29,29,29}]
    aggr_4_in_2 <= mux(reset, UInt<32>("h0"), aggr_4_in_2) @[PE_8IP.scala 121:{29,29,29}]
    aggr_4_in_3 <= mux(reset, UInt<32>("h0"), aggr_4_in_3) @[PE_8IP.scala 122:{29,29,29}]
    Xi_5_in_0 <= io_Xi_5_in_0 @[PE_8IP.scala 124:27]
    Yi_5_in_0 <= io_Yi_5_in_0 @[PE_8IP.scala 125:27]
    Xi_5_in_1 <= io_Xi_5_in_1 @[PE_8IP.scala 126:27]
    Yi_5_in_1 <= io_Yi_5_in_1 @[PE_8IP.scala 127:27]
    aggr_5_in_0 <= mux(reset, UInt<32>("h0"), aggr_5_in_0) @[PE_8IP.scala 128:{29,29,29}]
    aggr_5_in_1 <= mux(reset, UInt<32>("h0"), aggr_5_in_1) @[PE_8IP.scala 129:{29,29,29}]
    aggr_5_in_2 <= mux(reset, UInt<32>("h0"), aggr_5_in_2) @[PE_8IP.scala 130:{29,29,29}]
    aggr_5_in_3 <= mux(reset, UInt<32>("h0"), aggr_5_in_3) @[PE_8IP.scala 131:{29,29,29}]
    Xi_6_in_0 <= io_Xi_6_in_0 @[PE_8IP.scala 133:27]
    Yi_6_in_0 <= io_Yi_6_in_0 @[PE_8IP.scala 134:27]
    Xi_6_in_1 <= io_Xi_6_in_1 @[PE_8IP.scala 135:27]
    Yi_6_in_1 <= io_Yi_6_in_1 @[PE_8IP.scala 136:27]
    aggr_6_in_0 <= mux(reset, UInt<32>("h0"), aggr_6_in_0) @[PE_8IP.scala 137:{29,29,29}]
    aggr_6_in_1 <= mux(reset, UInt<32>("h0"), aggr_6_in_1) @[PE_8IP.scala 138:{29,29,29}]
    aggr_6_in_2 <= mux(reset, UInt<32>("h0"), aggr_6_in_2) @[PE_8IP.scala 139:{29,29,29}]
    aggr_6_in_3 <= mux(reset, UInt<32>("h0"), aggr_6_in_3) @[PE_8IP.scala 140:{29,29,29}]
    Xi_7_in_0 <= io_Xi_7_in_0 @[PE_8IP.scala 142:27]
    Yi_7_in_0 <= io_Yi_7_in_0 @[PE_8IP.scala 143:27]
    Xi_7_in_1 <= io_Xi_7_in_1 @[PE_8IP.scala 144:27]
    Yi_7_in_1 <= io_Yi_7_in_1 @[PE_8IP.scala 145:27]
    aggr_7_in_0 <= mux(reset, UInt<32>("h0"), aggr_7_in_0) @[PE_8IP.scala 146:{29,29,29}]
    aggr_7_in_1 <= mux(reset, UInt<32>("h0"), aggr_7_in_1) @[PE_8IP.scala 147:{29,29,29}]
    aggr_7_in_2 <= mux(reset, UInt<32>("h0"), aggr_7_in_2) @[PE_8IP.scala 148:{29,29,29}]
    aggr_7_in_3 <= mux(reset, UInt<32>("h0"), aggr_7_in_3) @[PE_8IP.scala 149:{29,29,29}]
    m_0_sel <= io_m_0_sel @[PE_8IP.scala 154:25]
    m_1_sel <= io_m_1_sel @[PE_8IP.scala 155:25]
    m_2_sel <= io_m_2_sel @[PE_8IP.scala 156:25]
    m_3_sel <= io_m_3_sel @[PE_8IP.scala 157:25]
    m_4_sel <= io_m_4_sel @[PE_8IP.scala 158:25]
    m_5_sel <= io_m_5_sel @[PE_8IP.scala 159:25]
    m_6_sel <= io_m_6_sel @[PE_8IP.scala 160:25]
    m_7_sel <= io_m_7_sel @[PE_8IP.scala 161:25]
    m_8_sel <= io_m_8_sel @[PE_8IP.scala 162:25]
    m_9_sel <= io_m_9_sel @[PE_8IP.scala 163:25]
    addsub_0_op <= io_addsub_0_op @[PE_8IP.scala 166:30]
    addsub_1_op <= io_addsub_1_op @[PE_8IP.scala 167:30]
    rounding <= io_rounding @[PE_8IP.scala 170:29]
    tininess <= io_tininess @[PE_8IP.scala 172:29]
    use_int <= io_use_int @[PE_8IP.scala 174:29]
    pe_0_out_0 <= mux(reset, UInt<32>("h0"), pe_0.io_out_0) @[PE_8IP.scala 179:{29,29} 232:14]
    pe_0_out_1 <= mux(reset, UInt<32>("h0"), pe_0.io_out_1) @[PE_8IP.scala 180:{29,29} 233:14]
    pe_1_out_0 <= mux(reset, UInt<32>("h0"), pe_1.io_out_0) @[PE_8IP.scala 181:{29,29} 260:14]
    pe_1_out_1 <= mux(reset, UInt<32>("h0"), pe_1.io_out_1) @[PE_8IP.scala 182:{29,29} 261:14]
    pe_2_out_0 <= mux(reset, UInt<32>("h0"), pe_2.io_out_0) @[PE_8IP.scala 183:{29,29} 288:14]
    pe_2_out_1 <= mux(reset, UInt<32>("h0"), pe_2.io_out_1) @[PE_8IP.scala 184:{29,29} 289:14]
    pe_3_out_0 <= mux(reset, UInt<32>("h0"), pe_3.io_out_0) @[PE_8IP.scala 185:{29,29} 315:14]
    pe_3_out_1 <= mux(reset, UInt<32>("h0"), pe_3.io_out_1) @[PE_8IP.scala 186:{29,29} 316:14]
    pe_4_out_0 <= mux(reset, UInt<32>("h0"), pe_4.io_out_0) @[PE_8IP.scala 187:{29,29} 343:14]
    pe_4_out_1 <= mux(reset, UInt<32>("h0"), pe_4.io_out_1) @[PE_8IP.scala 188:{29,29} 344:14]
    pe_5_out_0 <= mux(reset, UInt<32>("h0"), pe_5.io_out_0) @[PE_8IP.scala 189:{29,29} 371:14]
    pe_5_out_1 <= mux(reset, UInt<32>("h0"), pe_5.io_out_1) @[PE_8IP.scala 190:{29,29} 372:14]
    pe_6_out_0 <= mux(reset, UInt<32>("h0"), pe_6.io_out_0) @[PE_8IP.scala 191:{29,29} 399:14]
    pe_6_out_1 <= mux(reset, UInt<32>("h0"), pe_6.io_out_1) @[PE_8IP.scala 192:{29,29} 400:14]
    pe_7_out_0 <= mux(reset, UInt<32>("h0"), pe_7.io_out_0) @[PE_8IP.scala 193:{29,29} 426:14]
    pe_7_out_1 <= mux(reset, UInt<32>("h0"), pe_7.io_out_1) @[PE_8IP.scala 194:{29,29} 427:14]
    addsum_in_0 <= mux(reset, UInt<32>("h0"), pe_0_out_0) @[PE_8IP.scala 202:{28,28} 469:15]
    addsum_in_1 <= mux(reset, UInt<32>("h0"), pe_0_out_1) @[PE_8IP.scala 203:{28,28} 470:15]
    pe_0.clock <= clock
    pe_0.reset <= reset
    pe_0.io_Xi_0 <= Xi_0_in_0 @[PE_8IP.scala 209:16]
    pe_0.io_Yi_0 <= Yi_0_in_0 @[PE_8IP.scala 210:16]
    pe_0.io_Xi_1 <= Xi_0_in_1 @[PE_8IP.scala 211:16]
    pe_0.io_Yi_1 <= Yi_0_in_1 @[PE_8IP.scala 212:16]
    pe_0.io_aggr_0 <= aggr_0_in_0 @[PE_8IP.scala 213:22]
    pe_0.io_aggr_1 <= aggr_0_in_1 @[PE_8IP.scala 214:22]
    pe_0.io_aggr_2 <= aggr_0_in_2 @[PE_8IP.scala 215:22]
    pe_0.io_aggr_3 <= aggr_0_in_3 @[PE_8IP.scala 216:22]
    pe_0.io_m_0_sel <= m_0_sel @[PE_8IP.scala 217:22]
    pe_0.io_m_1_sel <= m_1_sel @[PE_8IP.scala 218:22]
    pe_0.io_m_2_sel <= m_2_sel @[PE_8IP.scala 219:22]
    pe_0.io_m_3_sel <= m_3_sel @[PE_8IP.scala 220:22]
    pe_0.io_m_4_sel <= m_4_sel @[PE_8IP.scala 221:22]
    pe_0.io_m_5_sel <= m_5_sel @[PE_8IP.scala 222:22]
    pe_0.io_m_6_sel <= m_6_sel @[PE_8IP.scala 223:22]
    pe_0.io_m_7_sel <= m_7_sel @[PE_8IP.scala 224:22]
    pe_0.io_m_8_sel <= m_8_sel @[PE_8IP.scala 225:22]
    pe_0.io_m_9_sel <= m_9_sel @[PE_8IP.scala 226:22]
    pe_0.io_addsub_0_op <= bits(addsub_0_op, 0, 0) @[PE_8IP.scala 227:23]
    pe_0.io_addsub_1_op <= bits(addsub_1_op, 0, 0) @[PE_8IP.scala 228:23]
    pe_0.io_rounding <= rounding @[PE_8IP.scala 229:23]
    pe_0.io_tininess <= tininess @[PE_8IP.scala 230:23]
    pe_0.io_use_int <= use_int @[PE_8IP.scala 231:23]
    pe_1.clock <= clock
    pe_1.reset <= reset
    pe_1.io_Xi_0 <= Xi_1_in_0 @[PE_8IP.scala 237:16]
    pe_1.io_Yi_0 <= Yi_1_in_0 @[PE_8IP.scala 238:16]
    pe_1.io_Xi_1 <= Xi_1_in_1 @[PE_8IP.scala 239:16]
    pe_1.io_Yi_1 <= Yi_1_in_1 @[PE_8IP.scala 240:16]
    pe_1.io_aggr_0 <= aggr_1_in_0 @[PE_8IP.scala 241:22]
    pe_1.io_aggr_1 <= aggr_1_in_1 @[PE_8IP.scala 242:22]
    pe_1.io_aggr_2 <= aggr_1_in_2 @[PE_8IP.scala 243:22]
    pe_1.io_aggr_3 <= aggr_1_in_3 @[PE_8IP.scala 244:22]
    pe_1.io_m_0_sel <= m_0_sel @[PE_8IP.scala 245:23]
    pe_1.io_m_1_sel <= m_1_sel @[PE_8IP.scala 246:23]
    pe_1.io_m_2_sel <= m_2_sel @[PE_8IP.scala 247:23]
    pe_1.io_m_3_sel <= m_3_sel @[PE_8IP.scala 248:23]
    pe_1.io_m_4_sel <= m_4_sel @[PE_8IP.scala 249:23]
    pe_1.io_m_5_sel <= m_5_sel @[PE_8IP.scala 250:23]
    pe_1.io_m_6_sel <= m_6_sel @[PE_8IP.scala 251:23]
    pe_1.io_m_7_sel <= m_7_sel @[PE_8IP.scala 252:23]
    pe_1.io_m_8_sel <= m_8_sel @[PE_8IP.scala 253:23]
    pe_1.io_m_9_sel <= m_9_sel @[PE_8IP.scala 254:23]
    pe_1.io_addsub_0_op <= bits(addsub_0_op, 0, 0) @[PE_8IP.scala 255:23]
    pe_1.io_addsub_1_op <= bits(addsub_1_op, 0, 0) @[PE_8IP.scala 256:23]
    pe_1.io_rounding <= rounding @[PE_8IP.scala 257:23]
    pe_1.io_tininess <= tininess @[PE_8IP.scala 258:23]
    pe_1.io_use_int <= use_int @[PE_8IP.scala 259:23]
    pe_2.clock <= clock
    pe_2.reset <= reset
    pe_2.io_Xi_0 <= Xi_2_in_0 @[PE_8IP.scala 265:16]
    pe_2.io_Yi_0 <= Yi_2_in_0 @[PE_8IP.scala 266:16]
    pe_2.io_Xi_1 <= Xi_2_in_1 @[PE_8IP.scala 267:16]
    pe_2.io_Yi_1 <= Yi_2_in_1 @[PE_8IP.scala 268:16]
    pe_2.io_aggr_0 <= aggr_2_in_0 @[PE_8IP.scala 269:22]
    pe_2.io_aggr_1 <= aggr_2_in_1 @[PE_8IP.scala 270:22]
    pe_2.io_aggr_2 <= aggr_2_in_2 @[PE_8IP.scala 271:22]
    pe_2.io_aggr_3 <= aggr_2_in_3 @[PE_8IP.scala 272:22]
    pe_2.io_m_0_sel <= m_0_sel @[PE_8IP.scala 273:23]
    pe_2.io_m_1_sel <= m_1_sel @[PE_8IP.scala 274:23]
    pe_2.io_m_2_sel <= m_2_sel @[PE_8IP.scala 275:23]
    pe_2.io_m_3_sel <= m_3_sel @[PE_8IP.scala 276:23]
    pe_2.io_m_4_sel <= m_4_sel @[PE_8IP.scala 277:23]
    pe_2.io_m_5_sel <= m_5_sel @[PE_8IP.scala 278:23]
    pe_2.io_m_6_sel <= m_6_sel @[PE_8IP.scala 279:23]
    pe_2.io_m_7_sel <= m_7_sel @[PE_8IP.scala 280:23]
    pe_2.io_m_8_sel <= m_8_sel @[PE_8IP.scala 281:23]
    pe_2.io_m_9_sel <= m_9_sel @[PE_8IP.scala 282:23]
    pe_2.io_addsub_0_op <= bits(addsub_0_op, 0, 0) @[PE_8IP.scala 283:23]
    pe_2.io_addsub_1_op <= bits(addsub_1_op, 0, 0) @[PE_8IP.scala 284:23]
    pe_2.io_rounding <= rounding @[PE_8IP.scala 285:23]
    pe_2.io_tininess <= tininess @[PE_8IP.scala 286:23]
    pe_2.io_use_int <= use_int @[PE_8IP.scala 287:23]
    pe_3.clock <= clock
    pe_3.reset <= reset
    pe_3.io_Xi_0 <= Xi_3_in_0 @[PE_8IP.scala 292:16]
    pe_3.io_Yi_0 <= Yi_3_in_0 @[PE_8IP.scala 293:16]
    pe_3.io_Xi_1 <= Xi_3_in_1 @[PE_8IP.scala 294:16]
    pe_3.io_Yi_1 <= Yi_3_in_1 @[PE_8IP.scala 295:16]
    pe_3.io_aggr_0 <= aggr_3_in_0 @[PE_8IP.scala 296:22]
    pe_3.io_aggr_1 <= aggr_3_in_1 @[PE_8IP.scala 297:22]
    pe_3.io_aggr_2 <= aggr_3_in_2 @[PE_8IP.scala 298:22]
    pe_3.io_aggr_3 <= aggr_3_in_3 @[PE_8IP.scala 299:22]
    pe_3.io_m_0_sel <= m_0_sel @[PE_8IP.scala 300:23]
    pe_3.io_m_1_sel <= m_1_sel @[PE_8IP.scala 301:23]
    pe_3.io_m_2_sel <= m_2_sel @[PE_8IP.scala 302:23]
    pe_3.io_m_3_sel <= m_3_sel @[PE_8IP.scala 303:23]
    pe_3.io_m_4_sel <= m_4_sel @[PE_8IP.scala 304:23]
    pe_3.io_m_5_sel <= m_5_sel @[PE_8IP.scala 305:23]
    pe_3.io_m_6_sel <= m_6_sel @[PE_8IP.scala 306:23]
    pe_3.io_m_7_sel <= m_7_sel @[PE_8IP.scala 307:23]
    pe_3.io_m_8_sel <= m_8_sel @[PE_8IP.scala 308:23]
    pe_3.io_m_9_sel <= m_9_sel @[PE_8IP.scala 309:23]
    pe_3.io_addsub_0_op <= bits(addsub_0_op, 0, 0) @[PE_8IP.scala 310:23]
    pe_3.io_addsub_1_op <= bits(addsub_1_op, 0, 0) @[PE_8IP.scala 311:23]
    pe_3.io_rounding <= rounding @[PE_8IP.scala 312:23]
    pe_3.io_tininess <= tininess @[PE_8IP.scala 313:23]
    pe_3.io_use_int <= use_int @[PE_8IP.scala 314:23]
    pe_4.clock <= clock
    pe_4.reset <= reset
    pe_4.io_Xi_0 <= Xi_4_in_0 @[PE_8IP.scala 320:16]
    pe_4.io_Yi_0 <= Yi_4_in_0 @[PE_8IP.scala 321:16]
    pe_4.io_Xi_1 <= Xi_4_in_1 @[PE_8IP.scala 322:16]
    pe_4.io_Yi_1 <= Yi_4_in_1 @[PE_8IP.scala 323:16]
    pe_4.io_aggr_0 <= aggr_4_in_0 @[PE_8IP.scala 324:22]
    pe_4.io_aggr_1 <= aggr_4_in_1 @[PE_8IP.scala 325:22]
    pe_4.io_aggr_2 <= aggr_4_in_2 @[PE_8IP.scala 326:22]
    pe_4.io_aggr_3 <= aggr_4_in_3 @[PE_8IP.scala 327:22]
    pe_4.io_m_0_sel <= m_0_sel @[PE_8IP.scala 328:22]
    pe_4.io_m_1_sel <= m_1_sel @[PE_8IP.scala 329:22]
    pe_4.io_m_2_sel <= m_2_sel @[PE_8IP.scala 330:22]
    pe_4.io_m_3_sel <= m_3_sel @[PE_8IP.scala 331:22]
    pe_4.io_m_4_sel <= m_4_sel @[PE_8IP.scala 332:22]
    pe_4.io_m_5_sel <= m_5_sel @[PE_8IP.scala 333:22]
    pe_4.io_m_6_sel <= m_6_sel @[PE_8IP.scala 334:22]
    pe_4.io_m_7_sel <= m_7_sel @[PE_8IP.scala 335:22]
    pe_4.io_m_8_sel <= m_8_sel @[PE_8IP.scala 336:22]
    pe_4.io_m_9_sel <= m_9_sel @[PE_8IP.scala 337:22]
    pe_4.io_addsub_0_op <= bits(addsub_0_op, 0, 0) @[PE_8IP.scala 338:23]
    pe_4.io_addsub_1_op <= bits(addsub_1_op, 0, 0) @[PE_8IP.scala 339:23]
    pe_4.io_rounding <= rounding @[PE_8IP.scala 340:23]
    pe_4.io_tininess <= tininess @[PE_8IP.scala 341:23]
    pe_4.io_use_int <= use_int @[PE_8IP.scala 342:23]
    pe_5.clock <= clock
    pe_5.reset <= reset
    pe_5.io_Xi_0 <= Xi_5_in_0 @[PE_8IP.scala 348:16]
    pe_5.io_Yi_0 <= Yi_5_in_0 @[PE_8IP.scala 349:16]
    pe_5.io_Xi_1 <= Xi_5_in_1 @[PE_8IP.scala 350:16]
    pe_5.io_Yi_1 <= Yi_5_in_1 @[PE_8IP.scala 351:16]
    pe_5.io_aggr_0 <= aggr_5_in_0 @[PE_8IP.scala 352:22]
    pe_5.io_aggr_1 <= aggr_5_in_1 @[PE_8IP.scala 353:22]
    pe_5.io_aggr_2 <= aggr_5_in_2 @[PE_8IP.scala 354:22]
    pe_5.io_aggr_3 <= aggr_5_in_3 @[PE_8IP.scala 355:22]
    pe_5.io_m_0_sel <= m_0_sel @[PE_8IP.scala 356:23]
    pe_5.io_m_1_sel <= m_1_sel @[PE_8IP.scala 357:23]
    pe_5.io_m_2_sel <= m_2_sel @[PE_8IP.scala 358:23]
    pe_5.io_m_3_sel <= m_3_sel @[PE_8IP.scala 359:23]
    pe_5.io_m_4_sel <= m_4_sel @[PE_8IP.scala 360:23]
    pe_5.io_m_5_sel <= m_5_sel @[PE_8IP.scala 361:23]
    pe_5.io_m_6_sel <= m_6_sel @[PE_8IP.scala 362:23]
    pe_5.io_m_7_sel <= m_7_sel @[PE_8IP.scala 363:23]
    pe_5.io_m_8_sel <= m_8_sel @[PE_8IP.scala 364:23]
    pe_5.io_m_9_sel <= m_9_sel @[PE_8IP.scala 365:23]
    pe_5.io_addsub_0_op <= bits(addsub_0_op, 0, 0) @[PE_8IP.scala 366:23]
    pe_5.io_addsub_1_op <= bits(addsub_1_op, 0, 0) @[PE_8IP.scala 367:23]
    pe_5.io_rounding <= rounding @[PE_8IP.scala 368:23]
    pe_5.io_tininess <= tininess @[PE_8IP.scala 369:23]
    pe_5.io_use_int <= use_int @[PE_8IP.scala 370:23]
    pe_6.clock <= clock
    pe_6.reset <= reset
    pe_6.io_Xi_0 <= Xi_6_in_0 @[PE_8IP.scala 376:16]
    pe_6.io_Yi_0 <= Yi_6_in_0 @[PE_8IP.scala 377:16]
    pe_6.io_Xi_1 <= Xi_6_in_1 @[PE_8IP.scala 378:16]
    pe_6.io_Yi_1 <= Yi_6_in_1 @[PE_8IP.scala 379:16]
    pe_6.io_aggr_0 <= aggr_6_in_0 @[PE_8IP.scala 380:22]
    pe_6.io_aggr_1 <= aggr_6_in_1 @[PE_8IP.scala 381:22]
    pe_6.io_aggr_2 <= aggr_6_in_2 @[PE_8IP.scala 382:22]
    pe_6.io_aggr_3 <= aggr_6_in_3 @[PE_8IP.scala 383:22]
    pe_6.io_m_0_sel <= m_0_sel @[PE_8IP.scala 384:23]
    pe_6.io_m_1_sel <= m_1_sel @[PE_8IP.scala 385:23]
    pe_6.io_m_2_sel <= m_2_sel @[PE_8IP.scala 386:23]
    pe_6.io_m_3_sel <= m_3_sel @[PE_8IP.scala 387:23]
    pe_6.io_m_4_sel <= m_4_sel @[PE_8IP.scala 388:23]
    pe_6.io_m_5_sel <= m_5_sel @[PE_8IP.scala 389:23]
    pe_6.io_m_6_sel <= m_6_sel @[PE_8IP.scala 390:23]
    pe_6.io_m_7_sel <= m_7_sel @[PE_8IP.scala 391:23]
    pe_6.io_m_8_sel <= m_8_sel @[PE_8IP.scala 392:23]
    pe_6.io_m_9_sel <= m_9_sel @[PE_8IP.scala 393:23]
    pe_6.io_addsub_0_op <= bits(addsub_0_op, 0, 0) @[PE_8IP.scala 394:23]
    pe_6.io_addsub_1_op <= bits(addsub_1_op, 0, 0) @[PE_8IP.scala 395:23]
    pe_6.io_rounding <= rounding @[PE_8IP.scala 396:23]
    pe_6.io_tininess <= tininess @[PE_8IP.scala 397:23]
    pe_6.io_use_int <= use_int @[PE_8IP.scala 398:23]
    pe_7.clock <= clock
    pe_7.reset <= reset
    pe_7.io_Xi_0 <= Xi_7_in_0 @[PE_8IP.scala 403:16]
    pe_7.io_Yi_0 <= Yi_7_in_0 @[PE_8IP.scala 404:16]
    pe_7.io_Xi_1 <= Xi_7_in_1 @[PE_8IP.scala 405:16]
    pe_7.io_Yi_1 <= Yi_7_in_1 @[PE_8IP.scala 406:16]
    pe_7.io_aggr_0 <= aggr_7_in_0 @[PE_8IP.scala 407:22]
    pe_7.io_aggr_1 <= aggr_7_in_1 @[PE_8IP.scala 408:22]
    pe_7.io_aggr_2 <= aggr_7_in_2 @[PE_8IP.scala 409:22]
    pe_7.io_aggr_3 <= aggr_7_in_3 @[PE_8IP.scala 410:22]
    pe_7.io_m_0_sel <= m_0_sel @[PE_8IP.scala 411:23]
    pe_7.io_m_1_sel <= m_1_sel @[PE_8IP.scala 412:23]
    pe_7.io_m_2_sel <= m_2_sel @[PE_8IP.scala 413:23]
    pe_7.io_m_3_sel <= m_3_sel @[PE_8IP.scala 414:23]
    pe_7.io_m_4_sel <= m_4_sel @[PE_8IP.scala 415:23]
    pe_7.io_m_5_sel <= m_5_sel @[PE_8IP.scala 416:23]
    pe_7.io_m_6_sel <= m_6_sel @[PE_8IP.scala 417:23]
    pe_7.io_m_7_sel <= m_7_sel @[PE_8IP.scala 418:23]
    pe_7.io_m_8_sel <= m_8_sel @[PE_8IP.scala 419:23]
    pe_7.io_m_9_sel <= m_9_sel @[PE_8IP.scala 420:23]
    pe_7.io_addsub_0_op <= bits(addsub_0_op, 0, 0) @[PE_8IP.scala 421:23]
    pe_7.io_addsub_1_op <= bits(addsub_1_op, 0, 0) @[PE_8IP.scala 422:23]
    pe_7.io_rounding <= rounding @[PE_8IP.scala 423:23]
    pe_7.io_tininess <= tininess @[PE_8IP.scala 424:23]
    pe_7.io_use_int <= use_int @[PE_8IP.scala 425:23]
    addsubModule_0.clock <= clock
    addsubModule_0.reset <= reset
    addsubModule_0.io_use_int <= use_int @[PE_8IP.scala 465:32]
    addsubModule_0.io_op <= UInt<1>("h0") @[PE_8IP.scala 462:32]
    addsubModule_0.io_rounding <= rounding @[PE_8IP.scala 463:32]
    addsubModule_0.io_tininess <= tininess @[PE_8IP.scala 464:32]
    addsubModule_0.io_in_0 <= addsum_in_0 @[PE_8IP.scala 466:32]
    addsubModule_0.io_in_1 <= addsum_in_1 @[PE_8IP.scala 467:32]

  module PE_CTRL_8IP :
    input clock : Clock
    input reset : UInt<1>
    input io_Xi_0_in_0 : UInt<32>
    input io_Yi_0_in_0 : UInt<32>
    input io_Xi_0_in_1 : UInt<32>
    input io_Yi_0_in_1 : UInt<32>
    input io_Xi_1_in_0 : UInt<32>
    input io_Yi_1_in_0 : UInt<32>
    input io_Xi_1_in_1 : UInt<32>
    input io_Yi_1_in_1 : UInt<32>
    input io_Xi_2_in_0 : UInt<32>
    input io_Yi_2_in_0 : UInt<32>
    input io_Xi_2_in_1 : UInt<32>
    input io_Yi_2_in_1 : UInt<32>
    input io_Xi_3_in_0 : UInt<32>
    input io_Yi_3_in_0 : UInt<32>
    input io_Xi_3_in_1 : UInt<32>
    input io_Yi_3_in_1 : UInt<32>
    input io_Xi_4_in_0 : UInt<32>
    input io_Yi_4_in_0 : UInt<32>
    input io_Xi_4_in_1 : UInt<32>
    input io_Yi_4_in_1 : UInt<32>
    input io_Xi_5_in_0 : UInt<32>
    input io_Yi_5_in_0 : UInt<32>
    input io_Xi_5_in_1 : UInt<32>
    input io_Yi_5_in_1 : UInt<32>
    input io_Xi_6_in_0 : UInt<32>
    input io_Yi_6_in_0 : UInt<32>
    input io_Xi_6_in_1 : UInt<32>
    input io_Yi_6_in_1 : UInt<32>
    input io_Xi_7_in_0 : UInt<32>
    input io_Yi_7_in_0 : UInt<32>
    input io_Xi_7_in_1 : UInt<32>
    input io_Yi_7_in_1 : UInt<32>
    input io_op_type : UInt<2>
    input io_use_int : UInt<1>
    input io_tininess : UInt<1>
    input io_rounding : UInt<3>
    output io_out : UInt<32>

    inst ctrlPE of PE_CTRL @[PE_CTRL_8IP.scala 142:22]
    inst pe_8IP of PE_8IP @[PE_CTRL_8IP.scala 161:22]
    reg Xi_0_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_0_in_0) @[PE_CTRL_8IP.scala 65:27]
    reg Yi_0_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_0_in_0) @[PE_CTRL_8IP.scala 66:27]
    reg Xi_0_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_0_in_1) @[PE_CTRL_8IP.scala 67:27]
    reg Yi_0_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_0_in_1) @[PE_CTRL_8IP.scala 68:27]
    reg Xi_1_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_1_in_0) @[PE_CTRL_8IP.scala 70:27]
    reg Yi_1_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_1_in_0) @[PE_CTRL_8IP.scala 71:27]
    reg Xi_1_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_1_in_1) @[PE_CTRL_8IP.scala 72:27]
    reg Yi_1_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_1_in_1) @[PE_CTRL_8IP.scala 73:27]
    reg Xi_2_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_2_in_0) @[PE_CTRL_8IP.scala 75:27]
    reg Yi_2_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_2_in_0) @[PE_CTRL_8IP.scala 76:27]
    reg Xi_2_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_2_in_1) @[PE_CTRL_8IP.scala 77:27]
    reg Yi_2_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_2_in_1) @[PE_CTRL_8IP.scala 78:27]
    reg Xi_3_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_3_in_0) @[PE_CTRL_8IP.scala 80:27]
    reg Yi_3_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_3_in_0) @[PE_CTRL_8IP.scala 81:27]
    reg Xi_3_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_3_in_1) @[PE_CTRL_8IP.scala 82:27]
    reg Yi_3_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_3_in_1) @[PE_CTRL_8IP.scala 83:27]
    reg Xi_4_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_4_in_0) @[PE_CTRL_8IP.scala 85:27]
    reg Yi_4_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_4_in_0) @[PE_CTRL_8IP.scala 86:27]
    reg Xi_4_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_4_in_1) @[PE_CTRL_8IP.scala 87:27]
    reg Yi_4_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_4_in_1) @[PE_CTRL_8IP.scala 88:27]
    reg Xi_5_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_5_in_0) @[PE_CTRL_8IP.scala 90:27]
    reg Yi_5_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_5_in_0) @[PE_CTRL_8IP.scala 91:27]
    reg Xi_5_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_5_in_1) @[PE_CTRL_8IP.scala 92:27]
    reg Yi_5_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_5_in_1) @[PE_CTRL_8IP.scala 93:27]
    reg Xi_6_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_6_in_0) @[PE_CTRL_8IP.scala 95:27]
    reg Yi_6_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_6_in_0) @[PE_CTRL_8IP.scala 96:27]
    reg Xi_6_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_6_in_1) @[PE_CTRL_8IP.scala 97:27]
    reg Yi_6_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_6_in_1) @[PE_CTRL_8IP.scala 98:27]
    reg Xi_7_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_7_in_0) @[PE_CTRL_8IP.scala 100:27]
    reg Yi_7_in_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_7_in_0) @[PE_CTRL_8IP.scala 101:27]
    reg Xi_7_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Xi_7_in_1) @[PE_CTRL_8IP.scala 102:27]
    reg Yi_7_in_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Yi_7_in_1) @[PE_CTRL_8IP.scala 103:27]
    reg addsub_0_op : UInt<2>, clock with :
      reset => (UInt<1>("h0"), addsub_0_op) @[PE_CTRL_8IP.scala 122:30]
    reg addsub_1_op : UInt<2>, clock with :
      reset => (UInt<1>("h0"), addsub_1_op) @[PE_CTRL_8IP.scala 123:30]
    reg rounding : UInt<3>, clock with :
      reset => (UInt<1>("h0"), rounding) @[PE_CTRL_8IP.scala 126:29]
    reg tininess : UInt<1>, clock with :
      reset => (UInt<1>("h0"), tininess) @[PE_CTRL_8IP.scala 128:29]
    reg use_int : UInt<1>, clock with :
      reset => (UInt<1>("h0"), use_int) @[PE_CTRL_8IP.scala 130:29]
    reg dbg_fsm : UInt<4>, clock with :
      reset => (UInt<1>("h0"), dbg_fsm) @[PE_CTRL_8IP.scala 135:26]
    reg dbg_aggr0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), dbg_aggr0) @[PE_CTRL_8IP.scala 136:26]
    reg dbg_aggr1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), dbg_aggr1) @[PE_CTRL_8IP.scala 137:26]
    node op_type = io_op_type
    io_out <= pe_8IP.io_out @[PE_CTRL_8IP.scala 223:10]
    Xi_0_in_0 <= io_Xi_0_in_0 @[PE_CTRL_8IP.scala 65:27]
    Yi_0_in_0 <= io_Yi_0_in_0 @[PE_CTRL_8IP.scala 66:27]
    Xi_0_in_1 <= io_Xi_0_in_1 @[PE_CTRL_8IP.scala 67:27]
    Yi_0_in_1 <= io_Yi_0_in_1 @[PE_CTRL_8IP.scala 68:27]
    Xi_1_in_0 <= io_Xi_1_in_0 @[PE_CTRL_8IP.scala 70:27]
    Yi_1_in_0 <= io_Yi_1_in_0 @[PE_CTRL_8IP.scala 71:27]
    Xi_1_in_1 <= io_Xi_1_in_1 @[PE_CTRL_8IP.scala 72:27]
    Yi_1_in_1 <= io_Yi_1_in_1 @[PE_CTRL_8IP.scala 73:27]
    Xi_2_in_0 <= io_Xi_2_in_0 @[PE_CTRL_8IP.scala 75:27]
    Yi_2_in_0 <= io_Yi_2_in_0 @[PE_CTRL_8IP.scala 76:27]
    Xi_2_in_1 <= io_Xi_2_in_1 @[PE_CTRL_8IP.scala 77:27]
    Yi_2_in_1 <= io_Yi_2_in_1 @[PE_CTRL_8IP.scala 78:27]
    Xi_3_in_0 <= io_Xi_3_in_0 @[PE_CTRL_8IP.scala 80:27]
    Yi_3_in_0 <= io_Yi_3_in_0 @[PE_CTRL_8IP.scala 81:27]
    Xi_3_in_1 <= io_Xi_3_in_1 @[PE_CTRL_8IP.scala 82:27]
    Yi_3_in_1 <= io_Yi_3_in_1 @[PE_CTRL_8IP.scala 83:27]
    Xi_4_in_0 <= io_Xi_4_in_0 @[PE_CTRL_8IP.scala 85:27]
    Yi_4_in_0 <= io_Yi_4_in_0 @[PE_CTRL_8IP.scala 86:27]
    Xi_4_in_1 <= io_Xi_4_in_1 @[PE_CTRL_8IP.scala 87:27]
    Yi_4_in_1 <= io_Yi_4_in_1 @[PE_CTRL_8IP.scala 88:27]
    Xi_5_in_0 <= io_Xi_5_in_0 @[PE_CTRL_8IP.scala 90:27]
    Yi_5_in_0 <= io_Yi_5_in_0 @[PE_CTRL_8IP.scala 91:27]
    Xi_5_in_1 <= io_Xi_5_in_1 @[PE_CTRL_8IP.scala 92:27]
    Yi_5_in_1 <= io_Yi_5_in_1 @[PE_CTRL_8IP.scala 93:27]
    Xi_6_in_0 <= io_Xi_6_in_0 @[PE_CTRL_8IP.scala 95:27]
    Yi_6_in_0 <= io_Yi_6_in_0 @[PE_CTRL_8IP.scala 96:27]
    Xi_6_in_1 <= io_Xi_6_in_1 @[PE_CTRL_8IP.scala 97:27]
    Yi_6_in_1 <= io_Yi_6_in_1 @[PE_CTRL_8IP.scala 98:27]
    Xi_7_in_0 <= io_Xi_7_in_0 @[PE_CTRL_8IP.scala 100:27]
    Yi_7_in_0 <= io_Yi_7_in_0 @[PE_CTRL_8IP.scala 101:27]
    Xi_7_in_1 <= io_Xi_7_in_1 @[PE_CTRL_8IP.scala 102:27]
    Yi_7_in_1 <= io_Yi_7_in_1 @[PE_CTRL_8IP.scala 103:27]
    addsub_0_op <= mux(reset, UInt<2>("h0"), addsub_0_op) @[PE_CTRL_8IP.scala 122:{30,30,30}]
    addsub_1_op <= mux(reset, UInt<2>("h0"), addsub_1_op) @[PE_CTRL_8IP.scala 123:{30,30,30}]
    rounding <= io_rounding @[PE_CTRL_8IP.scala 126:29]
    tininess <= io_tininess @[PE_CTRL_8IP.scala 128:29]
    use_int <= io_use_int @[PE_CTRL_8IP.scala 130:29]
    dbg_fsm <= mux(reset, UInt<4>("h0"), ctrlPE.io_dbg_fsm) @[PE_CTRL_8IP.scala 135:{26,26} 156:11]
    dbg_aggr0 <= mux(reset, UInt<32>("h0"), pe_8IP.io_dbg_aggr0) @[PE_CTRL_8IP.scala 136:{26,26} 220:13]
    dbg_aggr1 <= mux(reset, UInt<32>("h0"), pe_8IP.io_dbg_aggr1) @[PE_CTRL_8IP.scala 137:{26,26} 221:13]
    ctrlPE.clock <= clock
    ctrlPE.reset <= reset
    ctrlPE.io_op_type <= op_type @[PE_CTRL_8IP.scala 143:21]
    ctrlPE.io_use_int <= use_int @[PE_CTRL_8IP.scala 144:21]
    pe_8IP.clock <= clock
    pe_8IP.reset <= reset
    pe_8IP.io_Xi_0_in_0 <= Xi_0_in_0 @[PE_CTRL_8IP.scala 166:23]
    pe_8IP.io_Yi_0_in_0 <= Yi_0_in_0 @[PE_CTRL_8IP.scala 167:23]
    pe_8IP.io_Xi_0_in_1 <= Xi_0_in_1 @[PE_CTRL_8IP.scala 168:23]
    pe_8IP.io_Yi_0_in_1 <= Yi_0_in_1 @[PE_CTRL_8IP.scala 169:23]
    pe_8IP.io_Xi_1_in_0 <= Xi_1_in_0 @[PE_CTRL_8IP.scala 171:23]
    pe_8IP.io_Yi_1_in_0 <= Yi_1_in_0 @[PE_CTRL_8IP.scala 172:23]
    pe_8IP.io_Xi_1_in_1 <= Xi_1_in_1 @[PE_CTRL_8IP.scala 173:23]
    pe_8IP.io_Yi_1_in_1 <= Yi_1_in_1 @[PE_CTRL_8IP.scala 174:23]
    pe_8IP.io_Xi_2_in_0 <= Xi_2_in_0 @[PE_CTRL_8IP.scala 176:23]
    pe_8IP.io_Yi_2_in_0 <= Yi_2_in_0 @[PE_CTRL_8IP.scala 177:23]
    pe_8IP.io_Xi_2_in_1 <= Xi_2_in_1 @[PE_CTRL_8IP.scala 178:23]
    pe_8IP.io_Yi_2_in_1 <= Yi_2_in_1 @[PE_CTRL_8IP.scala 179:23]
    pe_8IP.io_Xi_3_in_0 <= Xi_3_in_0 @[PE_CTRL_8IP.scala 181:23]
    pe_8IP.io_Yi_3_in_0 <= Yi_3_in_0 @[PE_CTRL_8IP.scala 182:23]
    pe_8IP.io_Xi_3_in_1 <= Xi_3_in_1 @[PE_CTRL_8IP.scala 183:23]
    pe_8IP.io_Yi_3_in_1 <= Yi_3_in_1 @[PE_CTRL_8IP.scala 184:23]
    pe_8IP.io_Xi_4_in_0 <= Xi_4_in_0 @[PE_CTRL_8IP.scala 186:23]
    pe_8IP.io_Yi_4_in_0 <= Yi_4_in_0 @[PE_CTRL_8IP.scala 187:23]
    pe_8IP.io_Xi_4_in_1 <= Xi_4_in_1 @[PE_CTRL_8IP.scala 188:23]
    pe_8IP.io_Yi_4_in_1 <= Yi_4_in_1 @[PE_CTRL_8IP.scala 189:23]
    pe_8IP.io_Xi_5_in_0 <= Xi_5_in_0 @[PE_CTRL_8IP.scala 191:23]
    pe_8IP.io_Yi_5_in_0 <= Yi_5_in_0 @[PE_CTRL_8IP.scala 192:23]
    pe_8IP.io_Xi_5_in_1 <= Xi_5_in_1 @[PE_CTRL_8IP.scala 193:23]
    pe_8IP.io_Yi_5_in_1 <= Yi_5_in_1 @[PE_CTRL_8IP.scala 194:23]
    pe_8IP.io_Xi_6_in_0 <= Xi_6_in_0 @[PE_CTRL_8IP.scala 196:23]
    pe_8IP.io_Yi_6_in_0 <= Yi_6_in_0 @[PE_CTRL_8IP.scala 197:23]
    pe_8IP.io_Xi_6_in_1 <= Xi_6_in_1 @[PE_CTRL_8IP.scala 198:23]
    pe_8IP.io_Yi_6_in_1 <= Yi_6_in_1 @[PE_CTRL_8IP.scala 199:23]
    pe_8IP.io_Xi_7_in_0 <= Xi_7_in_0 @[PE_CTRL_8IP.scala 201:23]
    pe_8IP.io_Yi_7_in_0 <= Yi_7_in_0 @[PE_CTRL_8IP.scala 202:23]
    pe_8IP.io_Xi_7_in_1 <= Xi_7_in_1 @[PE_CTRL_8IP.scala 203:23]
    pe_8IP.io_Yi_7_in_1 <= Yi_7_in_1 @[PE_CTRL_8IP.scala 204:23]
    pe_8IP.io_m_0_sel <= ctrlPE.io_m_0_sel @[PE_CTRL_8IP.scala 206:21]
    pe_8IP.io_m_1_sel <= ctrlPE.io_m_1_sel @[PE_CTRL_8IP.scala 207:21]
    pe_8IP.io_m_2_sel <= ctrlPE.io_m_2_sel @[PE_CTRL_8IP.scala 208:21]
    pe_8IP.io_m_3_sel <= ctrlPE.io_m_3_sel @[PE_CTRL_8IP.scala 209:21]
    pe_8IP.io_m_4_sel <= ctrlPE.io_m_4_sel @[PE_CTRL_8IP.scala 210:21]
    pe_8IP.io_m_5_sel <= ctrlPE.io_m_5_sel @[PE_CTRL_8IP.scala 211:21]
    pe_8IP.io_m_6_sel <= ctrlPE.io_m_6_sel @[PE_CTRL_8IP.scala 212:21]
    pe_8IP.io_m_7_sel <= ctrlPE.io_m_7_sel @[PE_CTRL_8IP.scala 213:21]
    pe_8IP.io_m_8_sel <= ctrlPE.io_m_8_sel @[PE_CTRL_8IP.scala 214:21]
    pe_8IP.io_m_9_sel <= ctrlPE.io_m_9_sel @[PE_CTRL_8IP.scala 215:21]
    pe_8IP.io_addsub_0_op <= ctrlPE.io_addsub_0_op @[PE_CTRL_8IP.scala 217:25]
    pe_8IP.io_addsub_1_op <= ctrlPE.io_addsub_1_op @[PE_CTRL_8IP.scala 218:25]
    pe_8IP.io_use_int <= use_int @[PE_CTRL_8IP.scala 162:22]
    pe_8IP.io_tininess <= tininess @[PE_CTRL_8IP.scala 163:22]
    pe_8IP.io_rounding <= rounding @[PE_CTRL_8IP.scala 164:22]

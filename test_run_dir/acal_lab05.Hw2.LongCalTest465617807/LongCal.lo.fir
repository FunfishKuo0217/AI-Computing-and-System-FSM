circuit LongCal :
  module LongCal :
    input clock : Clock
    input reset : UInt<1>
    input io_key_in : UInt<4>
    output io_value_valid : UInt<1>
    output io_value_bits : UInt<32>

    node _T = geq(io_key_in, UInt<4>("ha")) @[LongCal.scala 15:27]
    node _T_1 = leq(io_key_in, UInt<4>("hc")) @[LongCal.scala 15:48]
    node _T_2 = and(_T, _T_1) @[LongCal.scala 15:35]
    node _T_3 = lt(io_key_in, UInt<4>("ha")) @[LongCal.scala 18:22]
    node _T_4 = eq(io_key_in, UInt<4>("hf")) @[LongCal.scala 21:24]
    node _T_5 = eq(io_key_in, UInt<4>("hd")) @[LongCal.scala 24:27]
    node _T_6 = eq(io_key_in, UInt<4>("he")) @[LongCal.scala 27:25]
    reg in_buffer : UInt<4>, clock with :
      reset => (UInt<1>("h0"), in_buffer) @[LongCal.scala 30:28]
    reg src1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), src1) @[LongCal.scala 31:23]
    reg op : UInt<2>, clock with :
      reset => (UInt<1>("h0"), op) @[LongCal.scala 32:21]
    reg src2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), src2) @[LongCal.scala 33:23]
    reg state : UInt<3>, clock with :
      reset => (UInt<1>("h0"), state) @[LongCal.scala 39:24]
    node _T_7 = eq(UInt<3>("h0"), state) @[Conditional.scala 37:30]
    node negStart = _T_5
    node _GEN_0 = mux(negStart, UInt<3>("h5"), UInt<3>("h1")) @[LongCal.scala 44:27 LongCal.scala 44:34 LongCal.scala 45:31]
    node _T_8 = eq(UInt<3>("h1"), state) @[Conditional.scala 37:30]
    node equal = _T_4
    node _GEN_1 = mux(equal, UInt<3>("h4"), state) @[LongCal.scala 48:25 LongCal.scala 48:32 LongCal.scala 39:24]
    node operator = _T_2
    node _GEN_2 = mux(operator, UInt<3>("h2"), _GEN_1) @[LongCal.scala 49:28 LongCal.scala 49:35]
    node _T_9 = eq(UInt<3>("h5"), state) @[Conditional.scala 37:30]
    node negEnd = _T_6
    node _GEN_3 = mux(negEnd, UInt<3>("h2"), state) @[LongCal.scala 52:26 LongCal.scala 52:33 LongCal.scala 39:24]
    node _T_10 = eq(UInt<3>("h3"), state) @[Conditional.scala 37:30]
    node _GEN_4 = mux(operator, UInt<3>("h2"), state) @[LongCal.scala 55:28 LongCal.scala 55:35 LongCal.scala 39:24]
    node _GEN_5 = mux(equal, UInt<3>("h4"), _GEN_4) @[LongCal.scala 56:25 LongCal.scala 56:32]
    node _T_11 = eq(UInt<3>("h6"), state) @[Conditional.scala 37:30]
    node _T_12 = eq(UInt<3>("h2"), state) @[Conditional.scala 37:30]
    node _GEN_6 = mux(negStart, UInt<3>("h6"), UInt<3>("h3")) @[LongCal.scala 65:31 LongCal.scala 66:27 LongCal.scala 68:27]
    node _GEN_7 = mux(equal, UInt<3>("h4"), _GEN_6) @[LongCal.scala 62:24 LongCal.scala 63:23]
    node _T_13 = eq(UInt<3>("h4"), state) @[Conditional.scala 37:30]
    node _T_14 = eq(io_key_in, UInt<4>("hd")) @[LongCal.scala 73:28]
    node _GEN_8 = mux(_T_14, UInt<3>("h5"), UInt<3>("h1")) @[LongCal.scala 73:37 LongCal.scala 74:23 LongCal.scala 76:23]
    node _GEN_9 = mux(_T_13, _GEN_8, state) @[Conditional.scala 39:67 LongCal.scala 39:24]
    node _GEN_10 = mux(_T_12, _GEN_7, _GEN_9) @[Conditional.scala 39:67]
    node _GEN_11 = mux(_T_11, _GEN_3, _GEN_10) @[Conditional.scala 39:67]
    node _GEN_12 = mux(_T_10, _GEN_5, _GEN_11) @[Conditional.scala 39:67]
    node _GEN_13 = mux(_T_9, _GEN_3, _GEN_12) @[Conditional.scala 39:67]
    node _GEN_14 = mux(_T_8, _GEN_2, _GEN_13) @[Conditional.scala 39:67]
    node _GEN_15 = mux(_T_7, _GEN_0, _GEN_14) @[Conditional.scala 40:58]
    node _T_15 = eq(state, UInt<3>("h1")) @[LongCal.scala 82:16]
    node _T_16 = dshl(src1, UInt<2>("h3")) @[LongCal.scala 83:22]
    node _T_17 = dshl(src1, UInt<1>("h1")) @[LongCal.scala 83:36]
    node _T_18 = add(_T_16, _T_17) @[LongCal.scala 83:29]
    node _T_19 = tail(_T_18, 1) @[LongCal.scala 83:29]
    node _T_20 = add(_T_19, in_buffer) @[LongCal.scala 83:43]
    node _T_21 = tail(_T_20, 1) @[LongCal.scala 83:43]
    node _GEN_16 = mux(_T_15, _T_21, src1) @[LongCal.scala 82:26 LongCal.scala 83:14 LongCal.scala 31:23]
    node _T_22 = eq(state, UInt<3>("h5")) @[LongCal.scala 85:16]
    node _T_23 = neq(in_buffer, UInt<4>("hd")) @[LongCal.scala 86:25]
    node _T_24 = neq(in_buffer, UInt<4>("hb")) @[LongCal.scala 86:49]
    node _T_25 = and(_T_23, _T_24) @[LongCal.scala 86:35]
    node _T_26 = neq(in_buffer, UInt<4>("he")) @[LongCal.scala 86:73]
    node _T_27 = and(_T_25, _T_26) @[LongCal.scala 86:59]
    node _T_28 = dshl(src1, UInt<2>("h3")) @[LongCal.scala 87:26]
    node _T_29 = dshl(src1, UInt<1>("h1")) @[LongCal.scala 87:40]
    node _T_30 = add(_T_28, _T_29) @[LongCal.scala 87:33]
    node _T_31 = tail(_T_30, 1) @[LongCal.scala 87:33]
    node _T_32 = sub(_T_31, in_buffer) @[LongCal.scala 87:47]
    node _T_33 = tail(_T_32, 1) @[LongCal.scala 87:47]
    node _GEN_17 = mux(_T_27, _T_33, _GEN_16) @[LongCal.scala 86:83 LongCal.scala 87:18]
    node _GEN_18 = mux(_T_22, _GEN_17, _GEN_16) @[LongCal.scala 85:29]
    node _T_34 = eq(state, UInt<3>("h3")) @[LongCal.scala 91:16]
    node _T_35 = dshl(src2, UInt<2>("h3")) @[LongCal.scala 92:22]
    node _T_36 = dshl(src2, UInt<1>("h1")) @[LongCal.scala 92:36]
    node _T_37 = add(_T_35, _T_36) @[LongCal.scala 92:29]
    node _T_38 = tail(_T_37, 1) @[LongCal.scala 92:29]
    node _T_39 = add(_T_38, in_buffer) @[LongCal.scala 92:43]
    node _T_40 = tail(_T_39, 1) @[LongCal.scala 92:43]
    node _GEN_19 = mux(_T_34, _T_40, src2) @[LongCal.scala 91:26 LongCal.scala 92:14 LongCal.scala 33:23]
    node _T_41 = eq(state, UInt<3>("h6")) @[LongCal.scala 94:16]
    node _T_42 = neq(in_buffer, UInt<4>("hd")) @[LongCal.scala 95:25]
    node _T_43 = neq(in_buffer, UInt<4>("hb")) @[LongCal.scala 95:49]
    node _T_44 = and(_T_42, _T_43) @[LongCal.scala 95:35]
    node _T_45 = neq(in_buffer, UInt<4>("he")) @[LongCal.scala 95:73]
    node _T_46 = and(_T_44, _T_45) @[LongCal.scala 95:59]
    node _T_47 = dshl(src2, UInt<2>("h3")) @[LongCal.scala 96:26]
    node _T_48 = dshl(src2, UInt<1>("h1")) @[LongCal.scala 96:40]
    node _T_49 = add(_T_47, _T_48) @[LongCal.scala 96:33]
    node _T_50 = tail(_T_49, 1) @[LongCal.scala 96:33]
    node _T_51 = sub(_T_50, in_buffer) @[LongCal.scala 96:47]
    node _T_52 = tail(_T_51, 1) @[LongCal.scala 96:47]
    node _GEN_20 = mux(_T_46, _T_52, _GEN_19) @[LongCal.scala 95:83 LongCal.scala 96:18]
    node _GEN_21 = mux(_T_41, _GEN_20, _GEN_19) @[LongCal.scala 94:29]
    node _T_53 = eq(state, UInt<3>("h2")) @[LongCal.scala 99:16]
    node _T_54 = sub(in_buffer, UInt<4>("ha")) @[LongCal.scala 99:41]
    node _T_55 = tail(_T_54, 1) @[LongCal.scala 99:41]
    node _GEN_22 = mux(_T_53, _T_55, op) @[LongCal.scala 99:24 LongCal.scala 99:28 LongCal.scala 32:21]
    node _T_56 = eq(state, UInt<3>("h4")) @[LongCal.scala 101:16]
    node _GEN_23 = mux(_T_56, UInt<1>("h0"), _GEN_18) @[LongCal.scala 101:27 LongCal.scala 102:14]
    node _GEN_24 = mux(_T_56, UInt<1>("h0"), _GEN_21) @[LongCal.scala 101:27 LongCal.scala 103:14]
    node _GEN_25 = mux(_T_56, UInt<1>("h0"), _GEN_22) @[LongCal.scala 101:27 LongCal.scala 104:12]
    node _GEN_26 = mux(_T_56, UInt<1>("h0"), io_key_in) @[LongCal.scala 101:27 LongCal.scala 105:19 LongCal.scala 30:28]
    node _T_57 = eq(state, UInt<3>("h4")) @[LongCal.scala 108:33]
    node _T_58 = mux(_T_57, UInt<1>("h1"), UInt<1>("h0")) @[LongCal.scala 108:26]
    node _T_59 = add(src1, src2) @[LongCal.scala 109:27]
    node _T_60 = tail(_T_59, 1) @[LongCal.scala 109:27]
    node _T_61 = add(src1, src2) @[LongCal.scala 111:22]
    node _T_62 = tail(_T_61, 1) @[LongCal.scala 111:22]
    node _T_63 = sub(src1, src2) @[LongCal.scala 112:22]
    node _T_64 = tail(_T_63, 1) @[LongCal.scala 112:22]
    node _T_65 = eq(UInt<1>("h0"), op) @[Mux.scala 80:60]
    node _T_66 = mux(_T_65, _T_62, UInt<1>("h0")) @[Mux.scala 80:57]
    node _T_67 = eq(UInt<1>("h1"), op) @[Mux.scala 80:60]
    node _T_68 = mux(_T_67, _T_64, _T_66) @[Mux.scala 80:57]
    node num = _T_3
    io_value_valid <= _T_58 @[LongCal.scala 108:20]
    io_value_bits <= _T_60 @[LongCal.scala 109:19]
    in_buffer <= _GEN_26
    src1 <= mux(reset, UInt<32>("h0"), bits(_GEN_23, 31, 0)) @[LongCal.scala 31:23 LongCal.scala 31:23]
    op <= mux(reset, UInt<2>("h0"), bits(_GEN_25, 1, 0)) @[LongCal.scala 32:21 LongCal.scala 32:21]
    src2 <= mux(reset, UInt<32>("h0"), bits(_GEN_24, 31, 0)) @[LongCal.scala 33:23 LongCal.scala 33:23]
    state <= mux(reset, UInt<3>("h0"), _GEN_15) @[LongCal.scala 39:24 LongCal.scala 39:24]

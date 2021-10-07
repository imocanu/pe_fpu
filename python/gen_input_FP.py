from common import *
from bitstring import BitArray

#https://github.com/robclewley/ieee754_simulation

print("="*50)
getContextInfo()
print("="*50)


random_float_ADD_bin = []
random_float_SUB_bin = []
random_float_MUL_bin = []
random_float_in_1_bin = []
random_float_in_2_bin = []
random_float_in_3_bin = []
random_float_in_4_bin = []

result_FP_L2  = []
result_FP_L1  = []
result_FP_DOT = []
result_FP_WGT = []


random_float_in_1 = numpy.random.uniform( min_FP_range, max_FP_range, size=(1, totalNR) ).reshape(-1)
random_float_in_2 = numpy.random.uniform( min_FP_range, max_FP_range, size=(1, totalNR) ).reshape(-1)
random_float_in_3 = numpy.random.uniform( min_FP_range, max_FP_range, size=(1, totalNR) ).reshape(-1)
random_float_in_4 = numpy.random.uniform( min_FP_range, max_FP_range, size=(1, totalNR) ).reshape(-1)


for i in random_float_in_1:
    conv2bin = str(core.single(int(i)))
    conv2bin = conv2bin.replace(" ", "")
    random_float_in_1_bin.append(conv2bin)

for i in random_float_in_2:
    conv2bin = str(core.single(int(i)))
    conv2bin = conv2bin.replace(" ", "")
    random_float_in_2_bin.append(conv2bin)

for i in random_float_in_3:
    conv2bin = str(core.single(int(i)))
    conv2bin = conv2bin.replace(" ", "")
    random_float_in_3_bin.append(conv2bin)

for i in random_float_in_4:
    conv2bin = str(core.single(int(i)))
    conv2bin = conv2bin.replace(" ", "")
    random_float_in_4_bin.append(conv2bin)

#print("@", random_float_in_1)
#print("$", random_float_in_2)

for in1, in2 in zip(random_float_in_1, random_float_in_2):   
    rez32 = core.single(int(in1)) + core.single(int(in2))
    ssw = str(rez32)
    ssw = ssw.replace(" ", "")
    random_float_ADD_bin.append(ssw)
    if DEBUG :
        print(int(in1), "+", int(in2), "=", ssw)

    rez32 = core.single(int(in1)) - core.single(int(in2))
    ssw = str(rez32)
    ssw = ssw.replace(" ", "")
    random_float_SUB_bin.append(ssw)
    if DEBUG :
        print(in1, "-", in2, "=", ssw)

    rez32 = core.single(int(in1)) * core.single(int(in2))
    ssw = str(rez32)
    ssw = ssw.replace(" ", "")
    random_float_MUL_bin.append(ssw)
    if DEBUG:
        print(in1, "*", in2, "=", ssw)

# L2
for in1, in2, in3, in4 in zip(random_float_in_1, random_float_in_2, random_float_in_3, random_float_in_4):   
    # (X-Y)^2 + (X-Y)^2
    sub_0 = core.single(int(in1)) - core.single(int(in2))
    mul_0 = sub_0 * sub_0

    sub_1 = core.single(int(in3)) - core.single(int(in4))
    mul_1 = sub_1 * sub_1

    final_add = mul_0 + mul_1
    final_rez = final_add * core.single(int(8))

    ssw = str(final_rez)
    ssw = ssw.replace(" ", "")
    result_FP_L2.append(ssw)
    #print(int(in1), "|", int(in2), "|",int(in3), "|", int(in4),"=", ssw)


# L1
for in1, in2, in3, in4 in zip(random_float_in_1, random_float_in_2, random_float_in_3, random_float_in_4):   
    # (X-Y) + (X-Y)
    sub_0 = core.single(int(in1)) - core.single(int(in2))

    sub_1 = core.single(int(in3)) - core.single(int(in4))

    final_add = sub_0 + sub_1
    final_rez = final_add * core.single(int(8))

    ssw = str(final_rez)
    ssw = ssw.replace(" ", "")
    result_FP_L1.append(ssw)
    #print(int(in1), "|", int(in2), "|",int(in3), "|", int(in4),"=", ssw)


# DOT
for in1, in2, in3, in4 in zip(random_float_in_1, random_float_in_2, random_float_in_3, random_float_in_4):   
    # (X*Y) + (X*Y)
    mul_0 = core.single(int(in1)) * core.single(int(in2))

    mul_1 = core.single(int(in3)) * core.single(int(in4))

    final_add = mul_0 + mul_1
    final_rez = final_add * core.single(int(8))

    ssw = str(final_rez)
    ssw = ssw.replace(" ", "")
    result_FP_DOT.append(ssw)
    #print(int(in1), "|", int(in2), "|",int(in3), "|", int(in4),"=", ssw)


# WGT
for in1, in2, in3, in4 in zip(random_float_in_1, random_float_in_2, random_float_in_3, random_float_in_4):   
    # (X*Y) + (X*Y)
    mul_0 = core.single(int(in1)) * core.single(int(in2))

    mul_1 = core.single(int(in3)) * core.single(int(in4))

    final_add = mul_0 + mul_1
    final_rez = final_add * core.single(int(8))

    ssw = str(final_rez)
    ssw = ssw.replace(" ", "")
    result_FP_WGT.append(ssw)
    #print(int(in1), "|", int(in2), "|",int(in3), "|", int(in4),"=", ssw)


# INPUT_1
write2file(fpu32_genInput_1, random_float_in_1_bin)
# INPUT_2
write2file(fpu32_genInput_2, random_float_in_2_bin)
# INPUT_3
write2file(fpu32_genInput_3, random_float_in_3_bin)
# INPUT_4
write2file(fpu32_genInput_4, random_float_in_4_bin)
# ADD
write2file(fpu32_ADD_result, random_float_ADD_bin)
# SUB
write2file(fpu32_SUB_result, random_float_SUB_bin)
# MUL
write2file(fpu32_MUL_result, random_float_MUL_bin)

# L2
write2file(fpu32_L2_result, result_FP_L2)
# L1
write2file(fpu32_L1_result, result_FP_L1)
# DOT
write2file(fpu32_DOT_result, result_FP_DOT)
# WGT
write2file(fpu32_WGT_result, result_FP_WGT)
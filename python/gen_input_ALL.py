from common import *
from bitstring import BitArray

#https://github.com/robclewley/ieee754_simulation

print("="*50)
getContextInfo()
print("="*50)

random_float_in_1 = numpy.random.uniform(-FLOAT_range, FLOAT_range, size=(1, totalNR)).reshape(-1)
random_float_in_2 = numpy.random.uniform(-FLOAT_range, FLOAT_range, size=(1, totalNR)).reshape(-1)
random_float_in_3 = numpy.random.uniform(-FLOAT_range, FLOAT_range, size=(1, totalNR)).reshape(-1)
random_float_in_4 = numpy.random.uniform(-FLOAT_range, FLOAT_range, size=(1, totalNR)).reshape(-1)

# if DEBUG: 
#     print("gen_IN_1 :", random_float_in_1)
#     print("gen_IN_2 :", random_float_in_2)
#     print("gen_IN_3 :", random_float_in_3)
#     print("gen_IN_4 :", random_float_in_4)

random_float_ADD_bin = []
random_float_SUB_bin = []
random_float_MUL_bin = []
random_float_in_1_bin = []
random_float_in_2_bin = []
random_float_in_3_bin = []
random_float_in_4_bin = []


for i in random_float_in_1:
    conv2bin = str(core.single(i))
    conv2bin = conv2bin.replace(" ", "")
    random_float_in_1_bin.append(conv2bin)

for i in random_float_in_2:
    conv2bin = str(core.single(i))
    conv2bin = conv2bin.replace(" ", "")
    random_float_in_2_bin.append(conv2bin)

for i in random_float_in_3:
    conv2bin = str(core.single(i))
    conv2bin = conv2bin.replace(" ", "")
    random_float_in_3_bin.append(conv2bin)

for i in random_float_in_4:
    conv2bin = str(core.single(i))
    conv2bin = conv2bin.replace(" ", "")
    random_float_in_4_bin.append(conv2bin)

for in1, in2 in zip(random_float_in_1, random_float_in_2):   
    rez32 = core.single(in1) + core.single(in2)
    ssw = str(rez32)
    ssw = ssw.replace(" ", "")
    random_float_ADD_bin.append(ssw)
    if DEBUG :
        print(int(in1), "+", int(in2), "=", ssw)

    rez32 = core.single(in1) - core.single(in2)
    ssw = str(rez32)
    ssw = ssw.replace(" ", "")
    random_float_SUB_bin.append(ssw)
    if DEBUG :
        print(in1, "-", in2, "=", ssw)

    rez32 = core.single(in1) * core.single(in2)
    ssw = str(rez32)
    ssw = ssw.replace(" ", "")
    random_float_MUL_bin.append(ssw)
    if DEBUG:
        print(in1, "*", in2, "=", ssw)


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
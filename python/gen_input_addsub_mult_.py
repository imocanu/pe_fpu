from common import *

#https://github.com/robclewley/ieee754_simulation

print("="*50)
getContextInfo()
print("="*50)

random_float_in_1 = numpy.random.uniform(-FLOAT_range, FLOAT_range, size=(1, totalNR)).reshape(-1)
random_float_in_2 = numpy.random.uniform(-FLOAT_range, FLOAT_range, size=(1, totalNR)).reshape(-1)
random_float_in_3 = numpy.random.uniform(-FLOAT_range, FLOAT_range, size=(1, totalNR)).reshape(-1)
random_float_in_4 = numpy.random.uniform(-FLOAT_range, FLOAT_range, size=(1, totalNR)).reshape(-1)

if DEBUG: 
    print("gen_IN_1 :", random_float_in_1)
    print("gen_IN_2 :", random_float_in_2)
    print("gen_IN_3 :", random_float_in_3)
    print("gen_IN_4 :", random_float_in_4)

random_INT_in_1 = numpy.random.uniform(-INT_range, INT_range, size=(1, totalNR)).reshape(-1)
random_INT_in_2 = numpy.random.uniform(-INT_range, INT_range, size=(1, totalNR)).reshape(-1)


random_float_ADD_bin = []
random_float_SUB_bin = []
random_float_MUL_bin = []
random_float_in_1_bin = []
random_float_in_2_bin = []
random_float_in_3_bin = []
random_float_in_4_bin = []

random_INT_1 = []
random_INT_2 = []
random_INT_ADD = []
random_INT_SUB = []
random_INT_MUL = []


def includeConstants(inputFile, constants):
    for i in constants:
        conv2bin = str(core.single(i))
        conv2bin = conv2bin.replace(" ", "")
        inputFile.append(conv2bin)


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
        print(in1, "+", in2, "=", ssw)

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


for i in random_INT_in_1:
    random_INT_1.append(int(i)) 

for i in random_INT_in_2:
    random_INT_2.append(int(i)) 

for in1, in2 in zip(random_INT_1, random_INT_2):   
    rez32 = core.single(in1) + core.single(in2)
    ssw = str(rez32)
    ssw = ssw.replace(" ", "")
    random_INT_ADD.append(ssw)

    rez32 = core.single(in1) - core.single(in2)
    ssw = str(rez32)
    ssw = ssw.replace(" ", "")
    random_INT_SUB.append(ssw)

    rez32 = core.single(in1) * core.single(in2)
    ssw = str(rez32)
    ssw = ssw.replace(" ", "")
    random_INT_MUL.append(ssw)



fp32_constants_BIN_dummy.append(random_float_in_1_bin[0])
fp32_constants_BIN_dummy.append(random_float_in_1_bin[0])
fp32_constants_BIN_dummy.append(random_float_in_1_bin[0])
fp32_constants_BIN_dummy.append(random_float_in_1_bin[0])
fp32_constants_BIN_dummy.append(random_float_in_1_bin[0])
fp32_constants_BIN_dummy.append(random_float_in_1_bin[0])


def operationsForConstants(constants, dummy, in1, in2, add, sub, mul):
    # in1.append("@")
    # in2.append("@")
    # add.append("@")
    # sub.append("@")
    # mul.append("@")
    for i, j in zip(constants, dummy):

        in1.append(i)
        in2.append(j)

        rez32 = core.single(i) + core.single(j)
        ssw = str(rez32)
        ssw = ssw.replace(" ", "")
        add.append(ssw)

        rez32 = core.single(i) - core.single(j)
        ssw = str(rez32)
        ssw = ssw.replace(" ", "")
        sub.append(ssw)

        rez32 = core.single(i) * core.single(j)
        ssw = str(rez32)
        ssw = ssw.replace(" ", "")
        mul.append(ssw)


if addConstants:
    operationsForConstants( fp32_constants_BIN, 
                            fp32_constants_BIN_dummy, 
                            random_float_in_1_bin, 
                            random_float_in_2_bin,
                            random_float_ADD_bin,
                            random_float_SUB_bin, 
                            random_float_MUL_bin)



# INPUT_1_INT
write2file(int32_genInput_1, random_INT_1)
# INPUT_2_INT
write2file(int32_genInput_2, random_INT_2)
# ADD_INT
write2file(int32_ADD_result, random_INT_ADD)
# SUB_INT
write2file(int32_SUB_result, random_INT_SUB)
# MUL_INT
write2file(int32_MUL_result, random_INT_MUL)

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
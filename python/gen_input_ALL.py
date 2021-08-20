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

if DEBUG: 
    print("gen_IN_1 :", random_float_in_1)
    print("gen_IN_2 :", random_float_in_2)
    print("gen_IN_3 :", random_float_in_3)
    print("gen_IN_4 :", random_float_in_4)

random_INT_in_1 = numpy.random.uniform(min_INT_range, max_INT_range, size=(1, totalNR)).reshape(-1)
random_INT_in_2 = numpy.random.uniform(min_INT_range, max_INT_range, size=(1, totalNR)).reshape(-1)


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

test_INT_1 = np.random.randint(min_INT_range, max_INT_range, size=(1, totalNR), dtype=np.int16).reshape(-1)
print(test_INT_1)
test_INT_2 = np.random.randint(min_INT_range, max_INT_range, size=(1, totalNR), dtype=np.int16).reshape(-1)
print(test_INT_2)

random_INT_1_bin = []
for i in test_INT_1:
    random_INT_1_bin.append(np.binary_repr(i, width=32))
    random_INT_1.append(i) 

random_INT_2_bin = []
for i in test_INT_2:
    random_INT_2_bin.append(np.binary_repr(i, width=32))
    random_INT_2.append(i)


for in1, in2 in zip(random_INT_1, random_INT_2):
    print("SUM :", in1+in2)

def binaryToDecimal(binary):
     
    binary1 = binary
    decimal, i, n = 0, 0, 0
    while(binary != 0):
        dec = binary % 10
        decimal = decimal + dec * pow(2, i)
        binary = binary//10
        i += 1
    print(decimal) 

for in1, in2 in zip(random_INT_1_bin, random_INT_2_bin):
    pass
    # rez16 = bin(np.binary_repr(in1, width=32))
    # rez16 = str(rez16)
    # print(">>>> DEBUG_1 :", str(in1), str(in2), " = ", rez16)
    # rez16 = rez16.replace("0b", "")
    # print(">>>> DEBUG_2 :", rez16)
    # #rez16 = bin(np.binary_repr(in1, width=32) + np.binary_repr(in2, width=32))    
    # rez32 = np.sum([in1 , in2], dtype=np.int32)
    
    # testBIN = core.single(np.binary_repr(rez32, width=32))
    # print(">>>> DEBUG   :", rez16, rez32)
    # #rez16 = str(core.single(str(rez16)))
    # #rez16 = rez16.replace(" ", "") 
    # #print(">>>> DEBUG   :", rez16)
    # ssw = str(testBIN)
    # ssw = ssw.replace(" ", "") 
    # random_INT_ADD.append(ssw)



    # rez32 = np.sum([in1 , in2], dtype=np.int32)
    # testBIN = core.single(np.binary_repr(rez32, width=32))
    # ssw = str(testBIN)
    # ssw = ssw.replace(" ", "") 
    # random_INT_ADD.append(ssw)

    # rez32 = np.subtract(in1 , in2, dtype=np.int32)
    # testBIN = core.single(np.binary_repr(rez32, width=32))
    # ssw = str(testBIN)
    # ssw = ssw.replace(" ", "") 
    # random_INT_SUB.append(ssw)

    # rez32 = np.multiply(in1 , in2, dtype=np.int32)
    # testBIN = core.single(np.binary_repr(rez32, width=32))
    # ssw = str(testBIN)
    # ssw = ssw.replace(" ", "") 
    # random_INT_MUL.append(ssw)




# # INPUT_1_INT
# write2file(int32_genInput_1, random_INT_1_bin)
# # INPUT_2_INT
# write2file(int32_genInput_2, random_INT_2_bin)
# # ADD_INT
# write2file(int32_ADD_result, random_INT_ADD)
# # SUB_INT
# write2file(int32_SUB_result, random_INT_SUB)
# # MUL_INT
# write2file(int32_MUL_result, random_INT_MUL)

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
from common import *

#https://github.com/robclewley/ieee754_simulation

print("="*50)
getContextInfo()
print("="*50)

random_INT_1 = []
random_INT_2 = []
random_INT_3 = []
random_INT_4 = []
random_INT_ADD = []
random_INT_SUB = []
random_INT_MUL = []

result_INT_L2  = []
result_INT_L1  = []
result_INT_DOT = []
result_INT_WGT = []

test_INT_1 = numpy.random.uniform(min_INT_range, max_INT_range, size=(1, totalNR)).reshape(-1)
test_INT_2 = numpy.random.uniform(min_INT_range, max_INT_range, size=(1, totalNR)).reshape(-1)
test_INT_3 = numpy.random.uniform(min_INT_range, max_INT_range, size=(1, totalNR)).reshape(-1)
test_INT_4 = numpy.random.uniform(min_INT_range, max_INT_range, size=(1, totalNR)).reshape(-1)

random_INT_1_bin = []
for i in test_INT_1:
    conv2bin = str(core.single(int(i)))
    conv2bin = conv2bin.replace(" ", "")
    random_INT_1.append(int(i))
    random_INT_1_bin.append(np.binary_repr(int(i), width=32))

random_INT_2_bin = []
for i in test_INT_2:
    conv2bin = str(core.single(int(i)))
    conv2bin = conv2bin.replace(" ", "")
    random_INT_2.append(int(i))
    random_INT_2_bin.append(np.binary_repr(int(i), width=32))

random_INT_3_bin = []
for i in test_INT_3:
    conv2bin = str(core.single(int(i)))
    conv2bin = conv2bin.replace(" ", "")
    random_INT_3.append(int(i))
    random_INT_3_bin.append(np.binary_repr(int(i), width=32))

random_INT_4_bin = []
for i in test_INT_4:
    conv2bin = str(core.single(int(i)))
    conv2bin = conv2bin.replace(" ", "")
    random_INT_4.append(int(i))
    random_INT_4_bin.append(np.binary_repr(int(i), width=32)) 

# print("in_1. ", random_INT_1)
# print("in_2. ", random_INT_2)
# print("in_3. ", random_INT_3)
# print("in_4. ", random_INT_4)

# Add / Sub / Mul
for in1, in2 in zip(random_INT_1_bin, random_INT_2_bin):

    ba1 = BitArray(bin=in1).int
    ba2 = BitArray(bin=in2).int
    rez32 = np.sum([ba1 , ba2], dtype=np.int32)
    random_INT_ADD.append(np.binary_repr(rez32, width=32))

    ba1 = BitArray(bin=in1).int
    ba2 = BitArray(bin=in2).int
    rez32 = np.subtract(ba1 , ba2, dtype=np.int32)
    random_INT_SUB.append(np.binary_repr(rez32, width=32))

    ba1 = BitArray(bin=in1).int
    ba2 = BitArray(bin=in2).int
    rez32 = np.multiply(ba1 , ba2, dtype=np.int32)
    random_INT_MUL.append(np.binary_repr(rez32, width=32))

# L2
for in1, in2, in3, in4 in zip(random_INT_1_bin, random_INT_2_bin, random_INT_3_bin, random_INT_4_bin):
    # (X-Y)^2 + (X-Y)^2
    ba1 = BitArray(bin=in1).int
    ba2 = BitArray(bin=in2).int
    subOP_0  = np.subtract(ba1 , ba2, dtype=np.int32)
    multOP_0 = np.multiply(subOP_0 , subOP_0, dtype=np.int32)

    ba3 = BitArray(bin=in3).int
    ba4 = BitArray(bin=in4).int
    subOP_1  = np.subtract(ba3 , ba4, dtype=np.int32)
    multOP_1 = np.multiply(subOP_1 , subOP_1, dtype=np.int32)

    sum_pe  = np.sum([multOP_0 , multOP_1], dtype=np.int32)
    final = np.multiply(sum_pe , 8, dtype=np.int32)
    #print(final)
    result_INT_L2.append(np.binary_repr(final, width=32))


# L1
for in1, in2, in3, in4 in zip(random_INT_1_bin, random_INT_2_bin, random_INT_3_bin, random_INT_4_bin):
    # (X-Y) + (X-Y)
    ba1 = BitArray(bin=in1).int
    ba2 = BitArray(bin=in2).int
    subOP_0  = np.subtract(ba1 , ba2, dtype=np.int32)

    ba3 = BitArray(bin=in3).int
    ba4 = BitArray(bin=in4).int
    subOP_1  = np.subtract(ba3 , ba4, dtype=np.int32)

    sum_pe  = np.sum([subOP_0 , subOP_1], dtype=np.int32)
    final = np.multiply(sum_pe , 8, dtype=np.int32)
    #print(final)
    result_INT_L1.append(np.binary_repr(final, width=32))


# DOT
for in1, in2, in3, in4 in zip(random_INT_1_bin, random_INT_2_bin, random_INT_3_bin, random_INT_4_bin):
    # (X*Y) - (X*Y)
    ba1 = BitArray(bin=in1).int
    ba2 = BitArray(bin=in2).int
    multOP_0 = np.multiply(ba1 , ba2, dtype=np.int32)

    ba3 = BitArray(bin=in3).int
    ba4 = BitArray(bin=in4).int
    multOP_1 = np.multiply(ba3 , ba4, dtype=np.int32)

    sum_pe  = np.sum([multOP_0 , multOP_1], dtype=np.int32)
    final = np.multiply(sum_pe , 8, dtype=np.int32)
    result_INT_DOT.append(np.binary_repr(final, width=32))


# WGT
for in1, in2, in3, in4 in zip(random_INT_1_bin, random_INT_2_bin, random_INT_3_bin, random_INT_4_bin):
    # (X*Y) + (X*Y)
    ba1 = BitArray(bin=in1).int
    ba2 = BitArray(bin=in2).int
    multOP_0 = np.multiply(ba1 , ba2, dtype=np.int32)

    ba3 = BitArray(bin=in3).int
    ba4 = BitArray(bin=in4).int
    multOP_1 = np.multiply(ba3 , ba4, dtype=np.int32)

    sum_pe  = np.sum([multOP_0 , multOP_1], dtype=np.int32)
    final = np.multiply(sum_pe , 8, dtype=np.int32)
    #print(final)
    result_INT_WGT.append(np.binary_repr(final, width=32))


# INPUT_1_INT
write2file(int32_genInput_1, random_INT_1_bin)
# INPUT_2_INT
write2file(int32_genInput_2, random_INT_2_bin)
# INPUT_3_INT
write2file(int32_genInput_3, random_INT_3_bin)
# INPUT_4_INT
write2file(int32_genInput_4, random_INT_4_bin)

# ADD_INT
write2file(int32_ADD_result, random_INT_ADD)
# SUB_INT
write2file(int32_SUB_result, random_INT_SUB)
# MUL_INT
write2file(int32_MUL_result, random_INT_MUL)

# L2
write2file(int32_L2_result, result_INT_L2)
# L1
write2file(int32_L1_result, result_INT_L1)
# DOT
write2file(int32_DOT_result, result_INT_DOT)
# WGT
write2file(int32_WGT_result, result_INT_WGT)
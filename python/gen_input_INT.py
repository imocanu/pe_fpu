from common import *

#https://github.com/robclewley/ieee754_simulation

print("="*50)
getContextInfo()
print("="*50)

#random_INT_in_1 = numpy.random.uniform(min_INT_range, max_INT_range, size=(1, totalNR)).reshape(-1)
#random_INT_in_2 = numpy.random.uniform(min_INT_range, max_INT_range, size=(1, totalNR)).reshape(-1)

# Rounding
# up = always away from 0
ROUND_UP = 'ROUND_UP'
# down = always towards 0 (truncate)
ROUND_DOWN = 'ROUND_DOWN'
# ceiling = always towards +inf
ROUND_CEILING = 'ROUND_CEILING'
# floor = always towards -inf
ROUND_FLOOR = 'ROUND_FLOOR'
# half up = to nearest, 0.1b (0.5d) rounds away from 0 (standard and default)
ROUND_HALF_UP = 'ROUND_HALF_UP'
# half down = to nearest, 0.1 (0.5d) rounds towards 0
ROUND_HALF_DOWN = 'ROUND_HALF_DOWN'

define_context = core.context_registry()
singleA = define_context(8, 23, ROUND_HALF_UP)  # IEEE 754 32 bit float

random_INT_1 = []
random_INT_2 = []
random_INT_ADD = []
random_INT_SUB = []
random_INT_MUL = []


test_INT_1 = numpy.random.uniform(min_INT_range, max_INT_range, size=(1, totalNR)).reshape(-1)
#print(test_INT_1)
test_INT_2 = numpy.random.uniform(min_INT_range, max_INT_range, size=(1, totalNR)).reshape(-1)
#print(test_INT_2)
test_INT_3 = numpy.random.uniform(min_INT_range, max_INT_range, size=(1, totalNR)).reshape(-1)
#print(test_INT_3)
test_INT_4 = numpy.random.uniform(min_INT_range, max_INT_range, size=(1, totalNR)).reshape(-1)
#print(test_INT_4)

random_INT_1_bin = []
for i in test_INT_1:
    # random_INT_1_bin.append(np.binary_repr(i, width=32))
    conv2bin = str(core.single(int(i)))
    conv2bin = conv2bin.replace(" ", "")
    random_INT_1.append(int(i))
    random_INT_1_bin.append(np.binary_repr(int(i), width=32))

random_INT_2_bin = []
for i in test_INT_2:
    # random_INT_2_bin.append(np.binary_repr(i, width=32
    conv2bin = str(core.single(int(i)))
    conv2bin = conv2bin.replace(" ", "")
    random_INT_2.append(int(i))
    random_INT_2_bin.append(np.binary_repr(int(i), width=32)) 

print(random_INT_1_bin)
print(random_INT_2_bin)
print(random_INT_1)
print(random_INT_2)
random_TEST = []
for in1, in2 in zip(random_INT_1_bin, random_INT_2_bin):

    ba1 = BitArray(bin=in1).int
    ba2 = BitArray(bin=in2).int
    rez32 = np.sum([ba1 , ba2], dtype=np.int32)
    testBIN = singleA(np.binary_repr(rez32, width=32))
    ssw = str(testBIN)
    ssw = ssw.replace(" ", "") 
    random_INT_ADD.append(ssw)
    print(" >MUL :", ba1 + ba2)

    ba1 = BitArray(bin=in1).int
    ba2 = BitArray(bin=in2).int
    rez32 = np.subtract(ba1 , ba2, dtype=np.int32)
    testBIN = singleA(np.binary_repr(rez32, width=32))
    ssw = str(testBIN)
    ssw = ssw.replace(" ", "") 
    random_INT_SUB.append(ssw)
    print(" >SUB :", ba1 - ba2)

    # # ba1 = BitArray(bin=in1).int
    # # ba2 = BitArray(bin=in2).int
    # rez322222 = np.multiply(in1 , in2, dtype=np.int16)
    # testBIN = core.single(in1) * core.single(in2)
    # ssw = str(testBIN)
    # ssw = ssw.replace(" ", "") 
    # # testBIN2 = singleA(in2)
    # # ssw2 = str(testBIN2)
    # # ssw2 = ssw2.replace(" ", "")
    # print(BitArray(bin=ssw).int, in1 * in2, rez322222) 
    # random_INT_MUL.append(np.binary_repr(rez322222, width=16))

    # ba1 = BitArray(bin=in1).int
    # ba2 = BitArray(bin=in2).int
    
    # convBA1 = str(core.single(float(ba1)))
    # print(float(ba1))
    # convBA1 = convBA1.replace(" ", "")
    # convBA2 = str(core.single(float(ba1)))
    # convBA2 = convBA2.replace(" ", "")
    # finalREZ = core.single(convBA1) * core.single(convBA2)
    # testSSW = str(finalREZ)
    # testSSW = testSSW.replace(" ", "")

    # rez32 = np.multiply(ba1 , ba2, dtype=np.int32)
    # testBIN = singleA(np.binary_repr(rez32, width=32))
    # ssw = str(testBIN)
    # ssw = ssw.replace(" ", "") 
    # random_INT_MUL.append(ssw)
    # random_TEST.append(testSSW)

    ba1 = BitArray(bin=in1).int
    ba2 = BitArray(bin=in2).int
    rez32 = np.multiply(ba1 , ba2, dtype=np.int32)
    testBIN = singleA(np.binary_repr(rez32, width=32))
    ssw = str(testBIN)
    ssw = ssw.replace(" ", "") 
    random_INT_MUL.append(ssw)
    print(" >MUL :", ba1 * ba2)
    print(" >-----<")


print(random_INT_MUL)
print(random_TEST)
#print(str(round(random_TEST[0], 2)))

# INPUT_1_INT
write2file(int32_genInput_1, random_INT_1_bin)
# INPUT_2_INT
write2file(int32_genInput_2, random_INT_2_bin)
# INPUT_3_INT
write2file(int32_genInput_3, random_INT_1_bin)
# INPUT_4_INT
write2file(int32_genInput_4, random_INT_2_bin)
# ADD_INT
write2file(int32_ADD_result, random_INT_ADD)
# SUB_INT
write2file(int32_SUB_result, random_INT_SUB)
# MUL_INT
write2file(int32_MUL_result, random_INT_MUL)

import numpy
import numpy as np
import struct
import os
import decimal
import random
import core
import sys
from bitstring import BitArray

random.seed(123)
##### DEFAULT PARAMS ####
totalNR = 4
FLOAT_range =   10
# SCALA - INT    -2,147,483,648 to 2,147,483,647   2147483648
# SCALA - LONG   -9,223,372,036,854,775,808 to     9223372036854775807
# SCALA - FLOAT  -1.40129846432481707e-45 to 3.40282346638528860e+38
# SCALA - DOUBLE -4.94065645841246544e-324 to 1.79769313486231570e+308
max_INT16 = 32767 
min_INT16 = -32768 
max_INT32 = 2147483647
min_INT32 = -2147483648

max_INT_range =  max_INT16 / 1000
min_INT_range =  min_INT16 / 1000

DEBUG = False
addConstants = False
########################
constant_ZERO = "00000000000000000000000000000000"

rootDir = os.path.dirname(__file__)
rootDir = rootDir+"/gen/"
fpu32_genInput_1 = rootDir+"fpu32_generated_1.txt"
fpu32_genInput_2 = rootDir+"fpu32_generated_2.txt"
fpu32_genInput_3 = rootDir+"fpu32_generated_3.txt"
fpu32_genInput_4 = rootDir+"fpu32_generated_4.txt"
fpu32_ADD_result = rootDir+"fpu32_ADD_result.txt"
fpu32_SUB_result = rootDir+"fpu32_SUB_result.txt"
fpu32_MUL_result = rootDir+"fpu32_MUL_result.txt"

PE_test_1_result = rootDir+"PE_test_1_result.txt"

int32_genInput_1 = rootDir+"int32_generated_1.txt"
int32_genInput_2 = rootDir+"int32_generated_2.txt"
int32_genInput_3 = rootDir+"int32_generated_3.txt"
int32_genInput_4 = rootDir+"int32_generated_4.txt"
int32_ADD_result = rootDir+"int32_ADD_result.txt"
int32_SUB_result = rootDir+"int32_SUB_result.txt"
int32_MUL_result = rootDir+"int32_MUL_result.txt"

pe_out_test0_FP32_result = rootDir+"pe_out_test0_FP32_result.txt"
pe_out_test0_INT_result = rootDir+"pe_out_test0_INT_result.txt"

pe_out_test3_FP32_result = rootDir+"pe_out_test3_FP32_result.txt"
pe_out_test3_INT_result  = rootDir+"pe_out_test3_INT_result.txt"

pe_out_test4_FP32_result = rootDir+"pe_out_test4_FP32_result.txt"
pe_out_test4_INT_result  = rootDir+"pe_out_test4_INT_result.txt"



pe_out_L2_FP32_result = rootDir+"pe_out_L2_FP32_result.txt"
pe_out_L2_INT_result  = rootDir+"pe_out_L2_INT_result.txt"



pe_out_test5_DOT_FP32_result  = rootDir+"pe_out_test5_DOT_FP32_result.txt"
pe_out_test5_DOT_INT_result  = rootDir+"pe_out_test5_DOT_INT_result.txt"

pe_out_test6_MAN_FP32_result  = rootDir+"pe_out_test6_MAN_FP32_result.txt"
pe_out_test6_MAN_INT_result  = rootDir+"pe_out_test6_MAN_INT_result.txt"

pe_out_test7_VEC_FP32_result  = rootDir+"pe_out_test7_VEC_FP32_result.txt"
pe_out_test7_VEC_INT_result  = rootDir+"pe_out_test7_VEC_INT_result.txt"

rounding_modes = [
    'ROUND_CEILING',
    'ROUND_DOWN',
    'ROUND_FLOOR',
    'ROUND_HALF_DOWN',
    'ROUND_HALF_EVEN',
    'ROUND_HALF_UP',
    'ROUND_UP',
    'ROUND_05UP',
    ]


def getContextInfo():
    context = decimal.getcontext()
    #context.prec = 11
    context.rounding = getattr(decimal, 'ROUND_HALF_UP')
    #print("INFO-",context)
    #define_context = core.context_registry()
    #fp32context = define_context(8, 23, rounding=core.ROUND_HALF_UP)  
    print("[*]Total generated inputs : ", totalNR)
    print(" > FLOAT range : ", -FLOAT_range, "  : ", FLOAT_range)  
    print(" > INT range   : ", min_INT_range, " : ", max_INT_range)
    print("--")
    print("[*] Root Dir   : ", rootDir)
    print("--")
    print("[*] Constants  : ", addConstants)
    print("[*] Full Debug : ", DEBUG)
    #print(sys.maxsize, np.int32(INT_range), np.int32(INT_range*2))

def binary(num):
    return ''.join('{:0>8b}'.format(c) for c in struct.pack('!f', num))

def write2file(fileName, dataArray):

    if os.path.isfile(fileName):
        os.remove(fileName)

    count = 0
    f = open(fileName, "w")
    for i in dataArray:
        f.write(str(i)+"\n")
        count = count + 1
    f.close()
    #print("File ", fileName, " was created !")
    #print("  [ > ", count, " generated numbers < ]")


def readfile(fileName):
    file1 = open(fileName, 'r')
    Lines = file1.readlines()

    random_float_in_bin = []
 
    for line in Lines:
        random_float_in_bin.append(line.strip())

    floatOUT = np.asfarray(random_float_in_bin, dtype = float)

    return random_float_in_bin    
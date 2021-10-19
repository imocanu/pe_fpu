#!/bin/sh

rm -rf test_out/*.txt
ls -al test_out

echo -e "\nexport SBT_OPTS=-Xmx60G -XX:+UseG1GC \n"
export SBT_OPTS="-Xmx60G -XX:+UseG1GC"
sleep 5

make testPE_CTRL_8IP_INT_L2  |  tee test_out/out_INT_L2.txt
sleep 5
make testPE_CTRL_8IP_INT_L1  |  tee test_out/out_INT_L1.txt
sleep 5
make testPE_CTRL_8IP_INT_DOT |  tee test_out/out_INT_DOT.txt
sleep 5
make testPE_CTRL_8IP_INT_WGT |  tee test_out/out_INT_WGT.txt
sleep 5


#make testPE_CTRL_8IP_FP_L2   |  tee test_out/out_FP_L2.txt
#sleep 5
#make testPE_CTRL_8IP_FP_L1   |  tee test_out/out_FP_L1.txt
#sleep 5
#make testPE_CTRL_8IP_FP_DOT  |  tee test_out/out_FP_DOT.txt
#sleep 5
#make testPE_CTRL_8IP_FP_WGT  |  tee test_out/out_FP_WGT.txt
#sleep 5

touch test_out/done
sleep 5

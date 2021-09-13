###### WITH ADD LAYERS ############
# @ 128 PE ( 2 outputs each ) :
# -> Layer_8 : 128 Add
#     -> Layer_7 : 64 ADD
#         -> Layer_6 : 32 ADD
#             -> Layer_5 : 16 ADD
#                 -> Layer_4 : 8 ADD
#                     -> Layer_3 : 4 ADD
#                         -> Layer_2 : 2 ADD
#                             -> Layer_1 : 1 ADD 
# 
# --------------------------------------------------------------------------------------------
# 1) PE -> L2 ( 2 clocks )-> SUM ( 8 clocks ) 
# 2) PE -> L2 ( 2 clocks )  -> SUM ( 8 clocks )
# 3) PE -> L2 ( 2 clocks )      -> SUM ( 8 clocks ) 
# 4) PE -> L2 ( 2 clocks )          -> SUM ( 8 clocks ) 
# 5) PE -> L2 ( 2 clocks )              -> SUM ( 8 clocks ) 
# 6) PE -> L2 ( 2 clocks )                  -> SUM ( 8 clocks ) 
# 7) PE -> L2 ( 2 clocks )                      -> SUM ( 8 clocks ) 
# 8) PE -> L2 ( 2 clocks )                          -> SUM ( 8 clocks )
#                                        < 8 clocks >
#                         <-------------------------------------------->
# --------------------------------------------------------------------------------------------
#
# ~10 clocks / PE / L2 
# Advantage    : SIMPLE design
# Disadvantage : more clocks for more PEs -> more clocks for SUM







### WITHOUT ADD LAYERS ###
# @ 128 PE ( 2 outputs each ) :
# 6 cycles + 1 Adder OR only 6 cycles ( if PE_0 is configured to do the SUM )

# --------------------------------------------------------------------------------------------
# 1) PE -> L2 ( 2 clocks )-> SUM ( 6 clocks ) 
# 2) PE -> L2 ( 2 clocks )  -> SUM ( 6 clocks )
# 3) PE -> L2 ( 2 clocks )      -> SUM ( 6 clocks ) 
# 4) PE -> L2 ( 2 clocks )          -> SUM ( 6 clocks ) 
# 5) PE -> L2 ( 2 clocks )              -> SUM ( 6 clocks ) 
# 6) PE -> L2 ( 2 clocks )                  -> SUM ( 6 clocks ) 
# 7) PE -> L2 ( 2 clocks )                      -> SUM ( 6 clocks ) 
# 8) PE -> L2 ( 2 clocks )                          -> SUM ( 6 clocks )
#                                        < 6 clocks >
#                         <-------------------------------------------->
# --------------------------------------------------------------------------------------------

# Advantage    : Faster for a design with lot of PEs  +  Less logic blocks used for Final SUM
# Disadvantage : COMPLEX design ( Adders inside PE are blocked during SUM step )  
# PE -> L2 ( 2 clocks )-> SUM ( 6 clocks ) -> PE -> ......

# ~8 clocks / PE / L2   



# Layer 1
# <M> 0    <s> 1
# Layer 2
# <M> 1    <s> 2  <s> 3
# Layer 3
# <M> 2    <s> 4  <s> 5
# <M> 3    <s> 6  <s> 7
# Layer 4
# <M> 4    <s> 8  <s> 9
# <M> 5    <s> 10  <s> 11
# <M> 6    <s> 12  <s> 13
# <M> 7    <s> 14  <s> 15
# Layer 5
# <M> 8    <s> 16  <s> 17
# <M> 9    <s> 18  <s> 19
# <M> 10    <s> 20  <s> 21
# <M> 11    <s> 22  <s> 23
# <M> 12    <s> 24  <s> 25
# <M> 13    <s> 26  <s> 27
# <M> 14    <s> 28  <s> 29
# <M> 15    <s> 30  <s> 31
# Layer 6
# <M> 16    <s> 32  <s> 33
# <M> 17    <s> 34  <s> 35
# <M> 18    <s> 36  <s> 37
# <M> 19    <s> 38  <s> 39
# <M> 20    <s> 40  <s> 41
# <M> 21    <s> 42  <s> 43
# <M> 22    <s> 44  <s> 45
# <M> 23    <s> 46  <s> 47
# <M> 24    <s> 48  <s> 49
# <M> 25    <s> 50  <s> 51
# <M> 26    <s> 52  <s> 53
# <M> 27    <s> 54  <s> 55
# <M> 28    <s> 56  <s> 57
# <M> 29    <s> 58  <s> 59
# <M> 30    <s> 60  <s> 61
# <M> 31    <s> 62  <s> 63
# Layer 7
# <M> 32    <s> 64  <s> 65
# <M> 33    <s> 66  <s> 67
# <M> 34    <s> 68  <s> 69
# <M> 35    <s> 70  <s> 71
# <M> 36    <s> 72  <s> 73
# <M> 37    <s> 74  <s> 75
# <M> 38    <s> 76  <s> 77
# <M> 39    <s> 78  <s> 79
# <M> 40    <s> 80  <s> 81
# <M> 41    <s> 82  <s> 83
# <M> 42    <s> 84  <s> 85
# <M> 43    <s> 86  <s> 87
# <M> 44    <s> 88  <s> 89
# <M> 45    <s> 90  <s> 91
# <M> 46    <s> 92  <s> 93
# <M> 47    <s> 94  <s> 95
# <M> 48    <s> 96  <s> 97
# <M> 49    <s> 98  <s> 99
# <M> 50    <s> 100  <s> 101
# <M> 51    <s> 102  <s> 103
# <M> 52    <s> 104  <s> 105
# <M> 53    <s> 106  <s> 107
# <M> 54    <s> 108  <s> 109
# <M> 55    <s> 110  <s> 111
# <M> 56    <s> 112  <s> 113
# <M> 57    <s> 114  <s> 115
# <M> 58    <s> 116  <s> 117
# <M> 59    <s> 118  <s> 119
# <M> 60    <s> 120  <s> 121
# <M> 61    <s> 122  <s> 123
# <M> 62    <s> 124  <s> 125
# <M> 63    <s> 126  <s> 127
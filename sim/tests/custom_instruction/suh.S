#*****************************************************************************
# suh.S
#-----------------------------------------------------------------------------
#
# Test suh instruction.
#

#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN

# basic tests with no offset

  TEST_CASE(1, t6, 0x0000FFFF, \
    la t4, 0x000000aa; \
    li t5, 0xFFFF0000; \
    .word 0x01EE902B;  \
    lhu t6, 0(t4); \
  )
  	 	
  TEST_CASE(2, t6, 0x00000000, \
    la t4, 0x000000aa; \
    li t5, 0x0000FFFF; \
    .word 0x01EE902B;  \
    lhu t6, 0(t4); \
  )

  TEST_CASE(3, t6, 0x00000001, \
    la t4, 0x000000aa; \
    li t5, 0x00011000; \
    .word 0x01EE902B;  \
    lhu t6, 0(t4); \
  )

# tests with positive offset, all aligned

   TEST_CASE(4, t6, 0x0000DEAD, \
    la t4, 0x0000aa00; \
    li t5, 0xDEAD0000; \
    .word 0x01EE912B;  \
    lhu t6, 2(t4); \
  )

  TEST_CASE(5, t6, 0x0000DEAD, \
    la t4, 0x0000aa00; \
    li t5, 0xDEAD0000; \
    .word 0x01EE922B;  \
    lhu t6, 4(t4); \
  )

  TEST_CASE(6, t6, 0x0000DEAD, \
    la t4, 0x0000aa00; \
    li t5, 0xDEAD0000; \
    .word 0x01EE932B;  \
    lhu t6, 6(t4); \
  )

# tests with negative offset, all aligned

  TEST_CASE(7, t6, 0x0000DEAD, \
    la t4, 0x0000aa00; \
    li t5, 0xDEAD0000; \
    .word 0xFFEE9F2B;  \
    lhu t6, -2(t4); \
  )

  TEST_CASE(8, t6, 0x0000DEAD, \
    la t4, 0x0000aa00; \
    li t5, 0xDEAD0000; \
    .word 0xFFEE9E2B;  \
    lhu t6, -4(t4); \
  )

  TEST_CASE(9, t6, 0x0000DEAD, \
    la t4, 0x0000aa00; \
    li t5, 0xDEAD0000; \
    .word 0xFFEE9D2B;  \
    lhu t6, -6(t4); \
  )

# tests with unaligned base

  TEST_CASE(10, t6, 0x0000DEAD, \
    la t4, 0x0000aa01; \
    li t5, 0xDEAD0000; \
    .word 0x01EE91AB;  \
    lhu t6, 3(t4); \
  )
  
  TEST_CASE(11, t6, 0x0000DEAD, \
    la t4, 0x0000aa01; \
    li t5, 0xDEAD0000; \
    .word 0xFFEE9EAB;  \
    lhu t6, -3(t4); \
  )

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END


# See LICENSE for license details.

#*****************************************************************************
# suh_ma_addr.S
#-----------------------------------------------------------------------------
#
# Test misaligned suh trap.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV32M
RVTEST_CODE_BEGIN

 /* Check that a misaligned store has some effect and takes no exception,
   or takes no effect and generates an exception.  This is not very
   thorough.  */

  MISALIGNED_SUH_TEST(2, 0x0000BEEF, 0x0000902B, 0, 0)
  MISALIGNED_SUH_TEST(3, 0x00000BEE, 0x0000902B, 0, 0)
  MISALIGNED_SUH_TEST(4, 0x000000A1, 0x0000902B, 0, 0)

   
  TEST_PASSFAIL

  .global mtvec_handler

mtvec_handler:
  li s1, 6
  csrr t0, mcause
  bne t0, s1, fail
  csrw mepc, t2
  mret

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END

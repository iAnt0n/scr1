#ifndef __TEST__MACROS__H
#define __TEST__MACROS__H

#define MISALIGNED_SUH_TEST(testnum, addr, instr, offset, result) \
  li TESTNUM, testnum; \
  la t2, 1f; \
  la x1, addr; \
  li x2, result; \
  .word instr; \
  lhu x3, offset(x1); \
  bne x3, x2, fail ;\
1:  

#endif

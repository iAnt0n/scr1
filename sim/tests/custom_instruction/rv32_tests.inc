ARCH_lowercase = $(shell echo $(ARCH) | tr A-Z a-z)


rv32_isa_tests += suh.S	\
              suh_ma_addr.S


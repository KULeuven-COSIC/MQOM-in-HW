# Apply patches to AES code
patch -p1 -o rtl/common/aes_sbox.v aes/src/rtl/aes_sbox.v < rtl/common/aes_sbox.patch
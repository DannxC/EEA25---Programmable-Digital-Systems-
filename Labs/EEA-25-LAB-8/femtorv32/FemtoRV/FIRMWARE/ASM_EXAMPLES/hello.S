# Testing the serial interface. Echoes typed characters,
# and displays 4 LSBs using the LEDs.
   .include "femtorv32.inc"

# Needs both NRV_IO_UART_RX and NRV_IO_UART_TX to be
# enabled. 
#
# To access it, use:
#   miniterm.py --dtr=0 /dev/ttyUSB1 115200
#   or screen /dev/ttyUSB1 115200 (<ctrl> a \ to exit)

   .globl main
   .type  main, @function

main:
   add    sp, sp, -4
   sw     ra, 0(sp)
   call   femtosoc_tty_init      # redirect IO to configured device

   la     a0, greetings
   call   print_string
loop:
   #li     t0, 15
   #sw     t0, IO_LEDS(gp)
   #call  getchar                # wait for a char from the UART
   la     a0, loop_msg
   call   print_string
   j      loop
   li     a0, 0
   lw     ra, 0(sp)
   add    sp, sp, 4
   ret

loop_msg:
   .asciz "."

greetings:
   .asciz "**** Femto RISC-V soft core ****\n"

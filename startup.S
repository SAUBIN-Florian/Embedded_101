.syntax unified
.cpu cortex-m3
.thumb

.section .isr_vector, "a", %progbits
.global vector_table

vector_table:
    .word _estack
    .word Reset_Handler
    .word Default_Handler   /* NMI */
    .word Default_Handler   /* HardFault */
    .word Default_Handler   /* MemManage */
    .word Default_Handler   /* BusFault */
    .word Default_Handler   /* UsageFault */
    .word 0
    .word 0
    .word 0
    .word 0
    .word Default_Handler   /* SVCall */
    .word Default_Handler   /* Debug Monitor */
    .word 0
    .word Default_Handler   /* PendSV */
    .word Default_Handler   /* SysTick */

.section .text.Reset_Handler, "ax", %progbits
.global Reset_Handler
.type Reset_Handler, %function
.thumb_func

Reset_Handler:
    bl main

hang:
    b hang

.section .text.Default_Handler, "ax", %progbits
.global Default_Handler
.type Default_Handler, %function
.thumb_func

Default_Handler:
    b Default_Handler

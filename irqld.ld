ENTRY(_start)
SECTIONS
{
 . = 0x0;
 .text : {
    irq.o (.text);
    handler.o (.text);
 }
 . = . + 0x2000; /* 8kB of stack memory */
 stack_top = .;
}

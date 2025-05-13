SECTIONS {
    . = 0x10000; /* Start address */

    .text : {
        *(.text*)
    }

    .data : {
        *(.data*)
    }

    .bss : {
        *(.bss*)
    }
}

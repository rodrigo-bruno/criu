OUTPUT_ARCH(i386)
TARGET(elf32-i386)
SECTIONS
{
	.text : {
		*(.head.text)
		*(.text*)
		*(.compel.exit)
		*(.compel.init)
	}

	.data : {
		*(.data*)
		*(.bss*)
	}

	.rodata : {
		*(.rodata*)
		*(.got*)
	}

	.toc : ALIGN(8) {
		*(.toc*)
	}

	/DISCARD/ : {
		*(.debug*)
		*(.comment*)
		*(.note*)
		*(.group*)
		*(.eh_frame*)
	}

/* Parasite args should have 4 bytes align, as we have futex inside. */
. = ALIGN(4);
__export_parasite_args = .;
}

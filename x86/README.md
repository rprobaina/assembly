# x86 (i836) Assembly examples

The numbered examples are based on the book [Programming from the Ground Up](https://download-mirror.savannah.gnu.org/releases/pgubook/ProgrammingGroundUp-1-0-booksize.pdf).

## How to assemble, link and run the programs

1. Assemble
	```bash
	$ as --32 <file>.s -o <file>.o
	```

2. Link
	```bash
	$ ld -m elf_i836 -s <file>.o -o <executable>
	```

3. Run
	```bash
	$ ./<executable>
	```

4. Check the return value

	```bash
	$ echo $?
	```

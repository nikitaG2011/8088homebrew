del bios.bin
del main.bin
del reset.bin
nasm -f bin main.asm -o main.bin
nasm -f bin reset.asm -o reset.bin
cmd /c "copy /b main.bin + reset.bin bios.bin"

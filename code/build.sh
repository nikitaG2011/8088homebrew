rm bios.bn
rm main.bin
rm reset.bin
nasm -f bin main.asm -o main.bin
nasm -f bin reset.asm -o reset.bin
cmd /c "copy /b main.bin + reset.bin bios.bin"

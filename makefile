src = lab1.c
final = lab1.hex
port = ttyUSB0
out = lab1.o
bin = lab1.elf
comp1 = avr-gcc
comp2 = avrdude
flag1 = -c
flag2 = -o
flag3 = -f

program: lab1.hex
	sudo $(comp2) -c arduino -p ATMEGA328P -P /dev/$(port) -b 57600 -U flash:w:$(final)
lab1.hex: compile
	avr-objcopy -O ihex $(bin) $(final)
compile: $(out)
	$(comp1) -mmcu=atmega328p -o $(bin) $(out)
$(out) : lab1.c
	$(comp1) -mmcu=atmega328p -c $(src) -o $(out)
clean :
	rm -f $(final) $(bin) $(out)
// memory used while using avr library is 1204 Bytes
// memory(maximum) used while using arduino IDE is 30720 Bytes
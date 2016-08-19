#include<avr/io.h>
#define F_CPU 10000000UL
#include<avr/sleep.h>
int main()
{
	DDRB = 0b00100000;//digital pin 13 as output 

	while(1)
	{
		PORTB = 0b00100000;
		_delay_ms(1000);
		PORTB = 0b00000000;
		_delay_ms(1000);		
		
	}

}

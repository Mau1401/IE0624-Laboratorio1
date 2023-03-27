#include <pic14/pic12f683.h>
#include <stdint.h> 
// Se desabilita el MCLR (se pone el MCLRE en OFF) y el WDT (se pone el WDTE en OFF)
unsigned int __at 0x2007 __CONFIG = (_MCLRE_OFF&_WDTE_OFF);

// Declaracion de funciones 
void delay (unsigned int tiempo);
void displayNum (int num, int display);
uint8_t randomInRange(uint8_t min, uint8_t max);
 
void main(void)
{

	
	TRISIO = 0b00001000; //Poner todos los pines como salidas
	GPIO = 0x00; //Poner pines en bajo
 	
    unsigned int time = 100;
 	uint8_t num1, num2;
 	
    	//Loop forever
	while ( 1 )
    	{
    		
    			num1 = randomInRange(0,9);
    			num2 = randomInRange(0,9); 
			GP0 = 0x00;
			delay(time);

			GP0 = ~GP0;
			delay(time);
    	}
 
}

// Genera un número aleatorio entre min y max, ambos inclusive
uint8_t randomInRange(uint8_t min, uint8_t max) {
    static uint32_t seed = 0;
    if (seed == 0) {
        // Semilla inicial basada en la dirección del registro de estado del programa
        seed = (uint32_t) &STATUS;
    }
    // Generar un número aleatorio utilizando el algoritmo XORShift
    seed ^= (seed << 13);
    seed ^= (seed >> 17);
    seed ^= (seed << 5);
    uint8_t randomNum = (uint8_t) ((seed % (max - min + 1)) + min);
    return randomNum;
} 

void displayNum(int num, int display)
{
	if (display == 0)
	{
		if (num == 0) GPIO = 0b00000000;
		else if (num == 1)GPIO = 0b00000001;
		else if (num == 2)GPIO = 0b00000010;
		else if (num == 3)GPIO = 0b00000011;
		else if (num == 4)GPIO = 0b00000100;
		else if (num == 5)GPIO = 0b00000101;
		else if (num == 6)GPIO = 0b00000110;
		else if (num == 7)GPIO = 0b00000111;
		else if (num == 8)GPIO = 0b00010000;
		else GPIO = 0b00010001;
	}
	else 
	{
		if (num == 0) GPIO = 0b00000000;
		else if (num == 1)GPIO = 0b00000001;
		else if (num == 2)GPIO = 0b00000010;
		else if (num == 3)GPIO = 0b00000011;
		else if (num == 4)GPIO = 0b00000100;
		else if (num == 5)GPIO = 0b00000101;
		else if (num == 6)GPIO = 0b00000110;
		else if (num == 7)GPIO = 0b00000111;
		else if (num == 8)GPIO = 0b00010000;
		else GPIO = 0b00010001;
	}
}

void delay(unsigned int tiempo)
{
	unsigned int i;
	unsigned int j;

	for(i=0;i<tiempo;i++)
	  for(j=0;j<1275;j++);
}

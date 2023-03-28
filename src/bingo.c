#include <pic14/pic12f683.h>
#include <stdint.h> 
// Se desabilita el MCLR (se pone el MCLRE en OFF) y el WDT (se pone el WDTE en OFF)
unsigned int __at 0x2007 __CONFIG = (_MCLRE_OFF&_WDTE_OFF);

// Declaracion de funciones 
void delay (unsigned int tiempo);
void displayNum (uint8_t num, int display);
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

void displayNum(uint8_t num, int display)
{
  // Asignar valores a los pines de salida correspondientes
  if (display == 0) {
    switch (num) {
      case 0:
        GPIO = 0b00000001;
        break;
      case 1:
        GPIO = 0b10011111;
        break;
      case 2:
        GPIO = 0b00100100;
        break;
      case 3:
        GPIO = 0b00001100;
        break;
      case 4:
        GPIO = 0b10011001;
        break;
      case 5:
        GPIO = 0b01001000;
        break;
      case 6:
        GPIO = 0b01000000;
        break;
      case 7:
        GPIO = 0b00011111;
        break;
      case 8:
        GPIO = 0b00000000;
        break;
      case 9:
        GPIO = 0b00001000;
        break;
    }
  }
  else if (display == 1) {
    switch (num) {
      case 0:
        GPIO = 0b00000010;
        break;
      case 1:
        GPIO = 0b11101111;
        break;
      case 2:
        GPIO = 0b01100100;
        break;
      case 3:
        GPIO = 0b00110100;
        break;
      case 4:
        GPIO = 0b10011000;
        break;
      case 5:
        GPIO = 0b00110010;
        break;
      case 6:
        GPIO = 0b00010010;
        break;
      case 7:
        GPIO = 0b01101111;
        break;
      case 8:
        GPIO = 0b00000000;
        break;
      case 9:
        GPIO = 0b00010000;
        break;
    }
  }
}

void delay(unsigned int tiempo)
{
	unsigned int i;
	unsigned int j;

	for(i=0;i<tiempo;i++)
	  for(j=0;j<1275;j++);
}

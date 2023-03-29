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
 	
 	uint8_t num1, num2;
  unsigned int count = 0;
 	
  //Loop forever
	while ( 1 )
  {
    // Se generan numeros aleatorios y se muestran en el display mienttras el boton no sea presionado
    num1 = randomInRange(0,9);
    num2 = randomInRange(0,9);
    displayNum(num1,0);
    delay(5);
    displayNum(num2,1);
    delay(5);
    
    //Ahora cuando se presiona el boton se muestra el numero selecionado en el display
    if (GP3)
    { 
      count=count+1; //Se aumenta el contador
      while (GP3)
      {
        displayNum(num1,0);
        delay(5);
        displayNum(num2,1);
        delay(5);
        
      }
    }
    if (count == 16)
      {
        // Si la cuenta llega a 16 entonces se alternan con el número
				// 9 en los displays
				displayNum(9,0);
				delay(15);
				displayNum(9,1);
				delay(15);
				displayNum(9,0);
				delay(15);
				displayNum(9,1);
				delay(15);
				displayNum(9,0);
				delay(15);
				displayNum(9,1);
				delay(15);
        displayNum(9,0);
				delay(15);
				displayNum(9,1);
				delay(15);
        displayNum(9,0);
				delay(15);
				displayNum(9,1);
				delay(15);
        displayNum(9,0);
				delay(15);
				displayNum(9,1);
				delay(15);
				count = 0; // Se vuelve a poner la cuenta en 0 
			} 
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
        GPIO = 0b00000000;
        break;
      case 1:
        GPIO = 0b00000001;
        break;
      case 2:
        GPIO = 0b00000010;
        break;
      case 3:
        GPIO = 0b00000011;
        break;
      case 4:
        GPIO = 0b00000100;
        break;
      case 5:
        GPIO = 0b00000101;
        break;
      case 6:
        GPIO = 0b00000110;
        break;
      case 7:
        GPIO = 0b00000111;
        break;
      case 8:
        GPIO = 0b00010000;
        break;
      case 9:
        GPIO = 0b00010001;
        break;
    }
  }
  else if (display == 1) {
    switch (num) {
      case 0:
        GPIO = 0b00100000;
        break;
      case 1:
        GPIO = 0b00100001;
        break;
      case 2:
        GPIO = 0b00100010;
        break;
      case 3:
        GPIO = 0b00100011;
        break;
      case 4:
        GPIO = 0b00100100;
        break;
      case 5:
        GPIO = 0b00100101;
        break;
      case 6:
        GPIO = 0b00100110;
        break;
      case 7:
        GPIO = 0b00100111;
        break;
      case 8:
        GPIO = 0b00110000;
        break;
      case 9:
        GPIO = 0b00110001;
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

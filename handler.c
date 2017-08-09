
volatile unsigned int * const UART0DR = (unsigned int *) 0x101f1000;
volatile unsigned int * const TIMER0X = (unsigned int *) 0x101E200c;

void print_uart0(const char *s) {
  while(*s != '\0') {
    *UART0DR = (unsigned int)(*s);
    s++;
  }
}

void end_irq() {
  *TIMER0X = (unsigned int) 0;
}
void delay(long long int a) {
  long long int b = a;
  while(b > 0) {
    b--;
  }
}

void imp_taskB() {
  char *dois = "2";
  while(1) {
    delay(1000000/75);

    print_uart0(dois);
  }
}
void imp_taskA() {
  char *um = "1";
  while(1) {
    delay(1000000/75);

    print_uart0(um);
  }
}

void imp_taskC() {
  char *tres = "3";
  while(1) {
    delay(1000000/75);

    print_uart0(tres);
  }
}
int c_entry() {
  print_uart0("\n4\n");
  end_irq();
  return 0;
}

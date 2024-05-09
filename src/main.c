#include <util/delay.h>

extern void demo_init(void);
extern void demo_run(void);

int main(void) {    
	demo_init();	

	for (;;) {
		demo_run();

		_delay_ms(500);
	}

	return 0;
}

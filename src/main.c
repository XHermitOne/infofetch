#include <stdio.h>
//#include <sys/sysinfo.h>

#include "sys_func.h"

void main(void)
{
	char computer_name[256];
	unsigned long computername_size = 256;

	#ifdef __linux__
	printf("Linux\n");
	#else
	printf("Windows\n");
	#endif
	getComputerName(computer_name, computername_size);
	printf(computer_name);
	printf("\n");
}
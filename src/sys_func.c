#include "sys_func.h"

int getComputerName(char *buffer, unsigned long size)
{
	#ifdef __windows__
	GetComputerName(buffer, &size);
	#else
	gethostname(buffer, size);
	#endif
	return 0;
}
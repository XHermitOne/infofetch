#ifdef __windows__
#include <windows.h>
#else
#include <unistd.h>
#endif

int getComputerName(char *buffer, unsigned long size);

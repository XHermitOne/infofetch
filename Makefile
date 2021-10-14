# Makefile for infofetch project
# ВНИМАНИЕ! Для правильного исполнения Makefile необходимо пробелы заменить на табуляцию!

# Basic stuff
SHELL = /bin/sh

top_srcdir = .
srcdir = .
prefix = /usr
exec_prefix = ${prefix}
bindir = $(exec_prefix)/bin
infodir = $(prefix)/info
libdir = $(prefix)/lib
mandir = $(prefix)/man/man1
includedir = $(prefix)/include

CC = gcc
# CC = g++
DEFS = -DHAVE_CONFIG_H
#CFLAGS = -g -O2 -Wall
CFLAGS =
# Флаг -g необходим для отладки!!!
# Флаг -w отключает warning!!!
# CPPFLAGS = -g
# CPPFLAGS = -g -w -m64
# Флаг линковщика -lm подключает математические функции
# LDFLAGS = -v -lm -L/usr/lib
LDFLAGS =
LIBS = -lm
BASELIBS = -lm
# X11_INC =
# X11_LIB =
# CAIRO_LIBS = $(shell pkg-config --cflags --libs cairo)

# Directories
TOPSRCDIR = .
TOPOBJDIR = .
SRCDIR    = .
# CAIRO_INCLUDEDIR = $(includedir)/cairo

#CPPFLAGS += $(CXX_FLAGS)
# CPPFLAGS += -I$(CAIRO_INCLUDEDIR)
# LDFLAGS += $(CAIRO_LIBS)


# ВНИМАНИЕ! Сначала ставиться -o <выходной файл> затем <объектные файлы> и лишь в конце <флаги линковщика>
infofetch: main.o sys_func.o email_func.o
	$(CC) -o infofetch ./obj/main.o ./obj/sys_func.o ./obj/email_func.o $(LDFLAGS)

main.o: ./src/main.c
	$(CC) -c $(CFLAGS) ./src/main.c
	mv main.o ./obj/main.o

sys_func.o: ./src/sys_func.c
	$(CC) -c $(CFLAGS) ./src/sys_func.c
	mv sys_func.o ./obj/sys_func.o

email_func.o: ./src/email_func.c
	$(CC) -c $(CFLAGS) ./src/email_func.c
	mv email_func.o ./obj/email_func.o

clean:
	rm -f ./src/*.o ./obj/*.o ./*.o ./tst/* infofetch test


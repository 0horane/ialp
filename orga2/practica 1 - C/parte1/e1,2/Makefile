CC = gcc
CFLAGS = -Wall -Wextra -pedantic
TARGET = hola


all: $(TARGET)

hola: hola.o
		$(CC) $(CFLAGS)  $^ -o $@

hola.o: hola.c
		$(CC) $(CFLAGS) -c $< -o $@

clean: 
	rm *.o $(TARGET)

.PHONY: all clean
CC = gcc
CFLAGS = -Wall -Wextra -pedantic
TARGET = main


all: $(TARGET)

$(TARGET): $(TARGET).o
		$(CC) $(CFLAGS)  $^ -o $@

$(TARGET).o: $(TARGET).c
		$(CC) $(CFLAGS) -c $< -o $@

clean: 
	rm *.o $(TARGET)

run: all
		./main

.PHONY: all clean
CC = gcc
CFLAGS = -Wall -Wextra -pedantic
TARGET = alcohol


all: $(TARGET)

$(TARGET): $(TARGET).o
		$(CC) $(CFLAGS)  $^ -o $@

$(TARGET).o: $(TARGET).c
		$(CC) $(CFLAGS) -c $< -o $@

clean: 
	rm *.o $(TARGET)

.PHONY: all clean
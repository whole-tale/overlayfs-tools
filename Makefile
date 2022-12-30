CFLAGS = -Wall -std=c99
LIBS = -lm
CC = gcc

all: overlay

overlay: main.o logic.o sh.o
	$(CC) $(LFLAGS) main.o logic.o sh.o -o overlay $(LIBS)

main.o: main.c logic.h
	$(CC) $(CFLAGS) -c main.c

logic.o: logic.c logic.h sh.h
	$(CC) $(CFLAGS) -c logic.c

sh.o: sh.c sh.h
	$(CC) $(CFLAGS) -c sh.c

clean:
	rm -f main.o logic.o sh.o overlay

tests: overlay
	$(MAKE) -C test_cases clean
	$(MAKE) -C test_cases

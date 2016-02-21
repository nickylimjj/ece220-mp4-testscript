EXE = mp4
CC = gcc
CCFLAGS = -Wall -g #-g means default debugging info
CCLIBS = -lm

.PHONY = all
all: $(EXE)

$(EXE): $(EXE).c
	$(CC) $(CCFLAGS) -o $@ $^ $(CCLIBS)

.PHONY = test
test: $(EXE)
	./eval.sh

.PHONY = clean
clean:
	rm -rf $(EXE) $(EXE).dSYM

.PHONY = all
all: mp5 test

mp5: main.c prog5.c
	gcc -g -std=c99 -Wall -Werror main.c prog5.c -o mp5

.PHONY = test
test: prog5.c test.c 
	gcc -g -std=c99 -Wall -Werror test.c prog5.c -o test5

.PHONY = test
gdb: mp5
	gdb mp5


.PHONY = gold
gold: mp5 gold1 gold2 gold3 
	./eval.sh

gold1:
	text-examples/gold-version <text-examples/input1 1> text-examples/gold_output1
	./mp5 < ./text-examples/input1 1> my_output1
	diff my_output1 ./text-examples/gold_output1

gold2:
	text-examples/gold-version <text-examples/input2 1> text-examples/gold_output2
	./mp5 < ./text-examples/input2 1> my_output2
	diff my_output2 ./text-examples/gold_output2


gold3:
	text-examples/gold-version <text-examples/input3 1> text-examples/gold_output3
	./mp5 < ./text-examples/input3 1> my_output3
	diff my_output3 ./text-examples/gold_output3
.PHONY = clean
clean:
	rm -rf mp5 mp5.dSYM test5 test5.dSYM my_output*

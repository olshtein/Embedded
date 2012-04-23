all:
	mcc -a6 -O7 -w4 -S ex0.c -o ex0.s
	mcc -a6 -O7 -w4 -Hldopt=-m -Hldopt=-C,output=ex0.map ex0.c -o ex0.out
	mcc -a6 -w4 -S -g ex0.c -o ex0.dbg.s
	mcc -a6 -w4 -g -Hldopt=-m -Hldopt=-C,output=ex0.dbg.map ex0.c -o ex0.dbg.out
	mcc -a6 ex0_tag.s -o ex0_tag.out 

tar:
	tar cvf ex0.tar ex0.c ex0_tag.s makefile README

clean:
	rm -f ex0.s ex0.map ex0.out ex0.dbg.s ex0.dbg.map ex0.dbg.out ex0_tag.out


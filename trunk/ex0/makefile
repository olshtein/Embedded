all:
	mcc -a6 -O7 -w4 -S ex0.c -o ex0.s
	mcc -a6 -O7 -w4 -Hldopt=-m -Hldopt=-C,output=ex0.map ex0.c -o ex0.out
	mcc -a6 -O7 -w4 -S -g ex0.c -o ex0.dbg.s
	mcc -a6 -O7 -w4 -g -Hldopt=-m -Hldopt=-C,output=ex0.dbg.map ex0.c -o ex0.dbg.out

clean:
	rm -f ex0.s ex0.map ex0.out ex0.dbg.s ex0.dbg.map ex0.dbg.out


all: a.out

7segments.o: 7segments.c 7segments.h
	mcc -c -a6 -g -w3 $< -o $@
 
main.o: main.c 7segments.h
	mcc -c -a6 -g -w3 $< -o $@

a.out: main.o 7segments.o device.svr3
	mcc -a6 $+ $@ -Hldopt=-m -Hldopt-C,output=device.map

7segments_test:
	mcc -a6 -g -w3 7segments_test.c 7segments.c device.svr3 -o a.out 
tar:
	tar cvf avishl02_matanp01 ... makefile README

clean:
	rm -f a.out 7segments.o main.o devices.map 7segments_test.o

test: clean all tar
	~embsys/ARC/MetaWare/arc/bin/embsys_check_ex1.sh avishl02_matanp01


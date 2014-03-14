LEX=flex
CFLAGS=-W -Wall
CC=gcc

csv2tsv: csv2tsv.yy.c
	$(CC) $(CFLAGS) -o csv2tsv csv2tsv.yy.c


csv2tsv.yy.c: csv2tsv.l
	$(LEX) -o csv2tsv.yy.c csv2tsv.l


clean:
	rm -fv csv2tsv csv2tsv.yy.c

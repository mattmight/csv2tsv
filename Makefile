LEX=flex
CFLAGS=-W -Wall
CC=gcc


csv2tsv: csv2tsv.yy.c
	$(CC) $(CFLAGS) -o csv2tsv csv2tsv.yy.c


csv2tsv.yy.c: csv2tsv.l
	$(LEX) -o csv2tsv.yy.c csv2tsv.l


.PHONY: install
install: csv2tsv
	if [ ! -d $$HOME/bin ]; then echo 'No bin directory in ' $$HOME; exit 1; fi
	cp csv2tsv $$HOME/bin/
	

.PHONY: clean
clean:
	rm -fv csv2tsv csv2tsv.yy.c

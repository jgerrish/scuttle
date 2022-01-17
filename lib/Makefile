all: parser.mli parser.ml

clean:
	rm -f parser.mli parser.ml

parser.mli: parser.mly
	ocamlyacc -btmp_parser parser.mly
	cat ../patches/parser.mli.header tmp_parser.mli > parser.mli


parser.ml: parser.mly
	ocamlyacc -btmp_parser parser.mly
	cp tmp_parser.ml parser.ml

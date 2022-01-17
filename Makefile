all: parser.mli parser.ml

parser.mli:
	cd lib && $(MAKE) parser.mli

parser.ml:
	cd lib && $(MAKE) parser.ml

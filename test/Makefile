all: test

clean:
	rm -f *.cmi *.cmo *.cma a.out test_card test_deck test a.out

test: test.ml test_card.cma test_deck.cma ../src/card.cma ../src/deck.cma
	ocamlc -I +ounit2 -I ../src ../src/card.cma ../src/deck.cma /usr/lib64/ocaml/unix.cma /usr/lib64/ocaml/ounit2/advanced/oUnitAdvanced.cma /usr/lib64/ocaml/ounit2/oUnit.cma test_card.cma test_deck.cma test.ml -o test

test_card.cmi: test_card.mli
	ocamlc -I +ounit2 test_card.mli

test_card.cmo: test_card.ml test_card.cmi
	ocamlc -I +ounit2 -I ../src ../src/card.cma -c test_card.ml

test_card.cma: test_card.cmo
	ocamlc -a test_card.cmo -o test_card.cma

test_deck.cmi: test_deck.mli
	ocamlc -I +ounit2 -I ../src ../src/deck.cma test_deck.mli

test_deck.cmo: test_deck.ml test_deck.cmi
	ocamlc -I +ounit2 -I ../src ../src/deck.cma -c test_deck.ml

test_deck.cma: test_deck.cmo
	ocamlc -I +ounit2 -a test_deck.cmo -o test_deck.cma

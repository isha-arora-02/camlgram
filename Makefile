build:
	dune build

start:
	OCAMLRUNPARAM=b dune exec bin/main.exe

test:
	OCAMLRUNPARAM=b dune exec tests/test.exe

zip:
	rm -f MS1.zip
	zip -r MS1.zip . -x _build/\* .git/\*

clean:
	dune clean
	rm -f MS1.zip

lines:
	cloc --by-file --include-lang=OCaml .

docs : 
	dune build @doc
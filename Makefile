MAIN = main

# All TeX sources; find (unlike a shell glob) copes with empty inc/*/ dirs.
SOURCES = $(MAIN).tex $(shell find tex src inc -name '*.tex' | sort)

.PHONY: all watch clean lint fmt

all:
	latexmk -pdf $(MAIN).tex

watch:
	latexmk -pdf -pvc $(MAIN).tex

clean:
	latexmk -C
	find . -name '*.bak[0-9]*' -delete

lint:
	chktex $(SOURCES)

fmt:
	latexindent -w -s -g /dev/null -l .latexindent.yaml $(SOURCES)
	find . -name '*.bak[0-9]*' -delete

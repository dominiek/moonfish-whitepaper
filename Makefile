SHELL=/bin/bash
TEX = docker run --rm -v $$(pwd):/source damonpetta/pandocker
FLAGS = --latex-engine=xelatex -f markdown --template=include/template.tex -f markdown+pipe_tables --toc

#compile = $(sort $(wildcard *.md))
compile = $(filter-out README.md, $(wildcard *.md))
bibliography = $(wildcard *.bib)

ifneq ($(bibliography),)
FLAGS += --bibliography=$(bibliography)
endif

all:    whitepaper.pdf

whitepaper.pdf: $(compile)
	$(TEX) $(compile) -o $@ $(FLAGS)

whitepaper.tex: $(compile)
	$(TEX) $(compile) -o $@ $(FLAGS)

clean:
	rm *.pdf

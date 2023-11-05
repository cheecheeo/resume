SRC = $(wildcard *.md)

PDFS=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)
LATEX_TEMPLATE=./pandoc-templates/default.latex

all:    clean $(PDFS) $(HTML)

pdf:   clean $(PDFS)
html:  clean $(HTML)

#%.html: %.md
#	python resume.py html $(GRAVATAR_OPTION) < $< | pandoc -t html -c resume.css -o $@
#
#%.pdf:  %.md $(LATEX_TEMPLATE)
#	python resume.py tex < $< | pandoc --template=$(LATEX_TEMPLATE) -H $(basename $<)_header.tex -o $@

%.html:	%.md
	pandoc -t html -o $@ $< -c resume.css

%.pdf:	%.md
	md2pdf $< $(basename $<).pdf

ifeq ($(OS),Windows_NT)
  # on Windows
  RM = cmd //C del
else
  # on Unix
  RM = rm -f
endif

clean:
	$(RM) *.html *.pdf

$(LATEX_TEMPLATE):
	git submodule update --init

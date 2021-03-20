.PHONY: all clean

BOOKS     = class-d.tex full-book.tex full-ebook.tex invoke-often-ebook.tex invoke-often-book.tex rituals.tex
BOOKS_OUT:=$(BOOKS:.tex=.pdf)

COVERS     = cover.tex
COVERS_OUT:=$(COVERS:.tex=.pdf)

ALL_TEX    = $(BOOKS) $(COVERS)
ALL_OUT    = $(BOOKS_OUT) $(COVERS_OUT)

OUT_DIR=out

default: british-quotes full-book.pdf
complete: full-ebook.pdf
book: invoke-often-book.pdf
onscreen: invoke-often-ebook.pdf
crowley: class-d.pdf
rituals: rituals.pdf
bookfull: book cover.pdf
all: clean british-quotes default complete onscreen crowley bookfull rituals

american-quotes:
	sed -E 's/\\usepackage\[.+\]\{babel\}/\\usepackage\[american\]\{babel\}/' -i settings.tex

british-quotes:
	sed -E 's/\\usepackage\[.+\]\{babel\}/\\usepackage\[british\]\{babel\}/' -i settings.tex

%.pdf : %.tex
	@mkdir -p $(OUT_DIR)
	@echo "Compiling $@"
	@echo "Initial Compile"
	@xelatex -output-directory=out $^
	@echo "Compile 2 for TOC"
	@xelatex -output-directory=out $^

buildclean:
	rm -f *.out *.toc *.aux *.log
	rm -f out/*.out out/*.toc out/*.aux out/*.log

clean-pdfs:
	rm -f out/*.pdf

clean: buildclean clean-pdfs

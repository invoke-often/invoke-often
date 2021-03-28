.PHONY: all clean default complete book onscreen crowley rituals bookfull american-quotes british-quotes clean-pdfs buildclean

BOOKS     = class-d.tex full-book.tex full-ebook.tex invoke-often-ebook.tex invoke-often-book.tex rituals.tex
BOOKS_OUT:=$(BOOKS:.tex=.pdf)

COVERS     = cover.tex
COVERS_OUT:=$(COVERS:.tex=.pdf)

ALL_TEX    = $(BOOKS) $(COVERS)
ALL_OUT    = $(BOOKS_OUT) $(COVERS_OUT)

OUT_DIR=out

LATEX      = xelatex -interaction=batchmode -output-directory=$(OUT_DIR)

default: british-quotes full-book.pdf
complete: full-ebook.pdf
book: invoke-often-book.pdf
onscreen: invoke-often-ebook.pdf
crowley: class-d.pdf
rituals: rituals.pdf
bookfull: book cover.pdf
all: clean british-quotes default complete onscreen crowley bookfull rituals

american-quotes:
	$(info Setting American quotes style ...)
	@sed -E 's/\\usepackage\[.+\]\{babel\}/\\usepackage\[american\]\{babel\}/' -i settings.tex
	$(info Succeeded.)

british-quotes:
	$(info Setting British quotes style ...)
	@sed -E 's/\\usepackage\[.+\]\{babel\}/\\usepackage\[british\]\{babel\}/' -i settings.tex
	$(info Succeeded.)

%.pdf : %.tex
	@mkdir -p $(OUT_DIR)
	$(info Initial compile of $@)
	@$(LATEX) $^
	$(info Second compile for TOC)
	@$(LATEX) $^

buildclean:
	$(info Cleaning latex build files ...)
	@rm -f *.out *.toc *.aux *.log
	@rm -f out/*.out out/*.toc out/*.aux out/*.log

clean-pdfs:
	$(info Cleaning output pdf files ...)
	@rm -f out/*.pdf

clean: buildclean clean-pdfs

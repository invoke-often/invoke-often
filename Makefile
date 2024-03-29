BOOKS     = class-d.tex invoke-often-book.tex
BOOKS_OUT:=$(BOOKS:.tex=.pdf)

COVERS     = cover.tex
COVERS_OUT:=$(COVERS:.tex=.pdf)

ALL_TEX    = $(BOOKS) $(COVERS)
ALL_OUT    = $(BOOKS_OUT) $(COVERS_OUT)

OUT_DIR=out
LATEX      = pdflatex -interaction=batchmode -output-directory=$(OUT_DIR)

cover.pdf : cover.tex
	xelatex -interaction=batchmode -output-directory=$(OUT_DIR) cover.tex
cover: cover.pdf
book: invoke-often-book.pdf
crowley: class-d.pdf
bookfull: book cover.pdf
all: clean british-quotes default complete crowley bookfull rituals

american-quotes:
	$(info Setting American quotes style ...)
	@sed -E 's/\\usepackage\[.+\]\{babel\}/\\usepackage\[greek, american\]\{babel\}/' -i settings.tex
	$(info Succeeded.)

british-quotes:
	$(info Setting British quotes style ...)
	@sed -E 's/\\usepackage\[.+\]\{babel\}/\\usepackage\[greek, british\]\{babel\}/' -i settings.tex
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

.PHONY: all clean default book crowley american-quotes british-quotes clean-pdfs buildclean $(BOOKS)

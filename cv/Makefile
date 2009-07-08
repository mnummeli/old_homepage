all: cv

cv: cv.pdf cv.html

cv.pdf:
	pdflatex cv.tex

cv.html:
	htlatex cv.tex

.PHONY: clean
clean:
	rm -f *~ *.4ct *.4tc *.aux *.css *.dvi cv.html *.idv *.lg *.log *.pdf\
 *.tmp *.xref

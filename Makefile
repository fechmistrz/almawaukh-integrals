all: integrals.pdf

integrals.pdf: src/integrals.pdf
	rsync src/integrals.pdf integrals.pdf

src/integrals.pdf: src/*.tex src/*/*.tex
	cd src && lualatex integrals && bibtex integrals
	cd src && lualatex integrals && bibtex integrals
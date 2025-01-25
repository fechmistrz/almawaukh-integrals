define keep_solution
	mkdir -pv src/sections/makefile-solutions/
	cat src/sections/$(1)/$(2).tex | grep -E '(% SOLUTION|^$$)' | cat -s > src/sections/makefile-solutions/$(2).tex
endef

define drop_solution
	mkdir -pv src/sections/makefile-problems/
	cat src/sections/$(1)/$(2).tex | grep -v '% SOLUTION' | cat -s > src/sections/makefile-problems/$(2).tex
endef

all: integrals.pdf

integrals.pdf: src/integrals.pdf
	rsync src/integrals.pdf integrals.pdf

src/integrals.pdf: src/*.tex src/*/*.tex src/sections/makefile-solutions/hard_valean.tex src/sections/makefile-problems/hard_valean.tex
	cd src && lualatex integrals && bibtex integrals
	cd src && lualatex integrals && bibtex integrals

src/sections/makefile-solutions/hard_valean.tex: src/sections/integrals/hard_valean.tex
	$(call keep_solution,integrals,hard_valean)

src/sections/makefile-problems/hard_valean.tex: src/sections/integrals/hard_valean.tex
	$(call drop_solution,integrals,hard_valean)
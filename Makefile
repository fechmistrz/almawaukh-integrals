INTEGRALS = by_substitution by_parts bee_mit feynman_trick rational trig various theoretic \
	hard_valean hard_stackexchange hard

SOLUTIONS_INTEGRALS = $(foreach file,$(INTEGRALS),src/sections/makefile-solutions/$(file).tex)
PROBLEMS_INTEGRALS = $(foreach file,$(INTEGRALS),src/sections/makefile-problems/$(file).tex)

SOLUTION_FILES = $(SOLUTIONS_INTEGRALS)
PROBLEM_FILES = $(PROBLEMS_INTEGRALS)

ALL_DEPENDENCIES = $(SOLUTION_FILES) \
	$(PROBLEM_FILES) \
	src/*.tex \
	src/*/*.tex \
	src/sections/integrals/hard_stackexchange.tex
	
define keep_solution
	mkdir -pv src/sections/makefile-solutions/
	./tools/separate_solutions.py src/sections/$(1)/$(2).tex solutions | cat -s > src/sections/makefile-solutions/$(2).tex
endef

define drop_solution
	mkdir -pv src/sections/makefile-problems/
	./tools/separate_solutions.py src/sections/$(1)/$(2).tex | cat -s > src/sections/makefile-problems/$(2).tex
endef

define solution_and_problem_targets
src/sections/makefile-solutions/$(2).tex: src/sections/$(1)/$(2).tex
	$(call keep_solution,$(1),$(2))

src/sections/makefile-problems/$(2).tex: src/sections/$(1)/$(2).tex
	$(call drop_solution,$(1),$(2))
endef

all: integrals.pdf

integrals.pdf: src/integrals.pdf
	rsync $< $@

src/integrals.pdf: $(ALL_DEPENDENCIES)
	cd src && lualatex integrals && bibtex integrals
	cd src && lualatex integrals && bibtex integrals

src/sections/integrals/hard_stackexchange.tex: src/sections/integrals/math-stack-exchange/*.tex
	cat $$(find src/sections/integrals/math-stack-exchange/ -type f | sort -V) > src/sections/integrals/hard_stackexchange.tex

$(foreach file,$(INTEGRALS),$(eval $(call solution_and_problem_targets,integrals,$(file))))


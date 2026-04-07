LATEXMK=latexmk
MAIN=main.tex
PAPERS_DIR=papers
PAPERS_INDEX=$(PAPERS_DIR)/includes.tex

.PHONY: pdf clean includes

includes:
	@{ \
		printf "%% Auto-generated. Do not edit.\n"; \
		printf "\n%s\n" "\\chapter*{Papers}"; \
		printf "%s\n" "\\addcontentsline{toc}{chapter}{Papers}"; \
		for f in $$(ls $(PAPERS_DIR)/*.tex $(PAPERS_DIR)/*/*.tex 2>/dev/null | sort); do \
			[ "$$f" = "$(PAPERS_INDEX)" ] && continue; \
			[ -f "$$f" ] || continue; \
			base="$${f%.tex}"; \
			printf "\\input{%s}\n" "$$base"; \
		done; \
	} > "$(PAPERS_INDEX)"

pdf: includes
	$(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error $(MAIN)
	$(LATEXMK) -c $(MAIN)

clean:
	$(LATEXMK) -C

LATEXMK=latexmk
MAIN=main.tex
PAPERS_DIR=papers
PAPERS_INDEX=$(PAPERS_DIR)/includes.tex

.PHONY: pdf clean includes

includes:
	@{ \
		printf "%% Auto-generated. Do not edit.\n"; \
		found_year=0; \
		for year_dir in $$(ls -d $(PAPERS_DIR)/*/ 2>/dev/null | sort -r); do \
			[ -d "$$year_dir" ] || continue; \
			found_year=1; \
			year="$${year_dir%/}"; \
			year="$${year##*/}"; \
			printf "\n%s\n" "\\chapter*{$$year}\\newpage"; \
			printf "%s\n" "\\addcontentsline{toc}{chapter}{$$year}"; \
			for f in $$(ls "$$year_dir"*.tex 2>/dev/null | sort); do \
				[ -f "$$f" ] || continue; \
				base="$${f%.tex}"; \
				printf "\\input{%s}\n" "$$base"; \
			done; \
		done; \
		if [ "$$found_year" -eq 0 ]; then \
			printf "\n%% Add year folders under papers/, e.g. papers/2025/\n"; \
		fi; \
	} > "$(PAPERS_INDEX)"

pdf: includes
	$(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error $(MAIN)
	$(LATEXMK) -c $(MAIN)

clean:
	$(LATEXMK) -C

OUTPUT_DIRECTORY=generated

FILENAME=monografia

PDF=$(OUTPUT_DIRECTORY)/$(FILENAME).pdf
TEX=$(FILENAME).tex

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}'

.PHONY: all
all: | tex pdf ## Generate pdf and tex.
	@echo "+ $@"

.PHONY: pdf
pdf: $(PDF) ## Generate pdf.

.PHONY: clean
clean: ## Clean the output directory.
	@echo "+ $@"
	@rm -rf $(OUTPUT_DIRECTORY)

$(PDF): $(TEX) | $(OUTPUT_DIRECTORY)
	@echo "+ $@"
	@pdflatex -output-directory=$(OUTPUT_DIRECTORY) $(TEX)

# Create output directory
$(OUTPUT_DIRECTORY):
	@mkdir ./$(OUTPUT_DIRECTORY)

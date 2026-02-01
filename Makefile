AGENTS_SRC := $(PWD)/agents.xml
AGENTS_DEST := $(HOME)/.codex/AGENTS.md

.PHONY: codex-link
codex-link:
	@ln -sf "$(AGENTS_SRC)" "$(AGENTS_DEST)"
	@echo "Linked $(AGENTS_DEST) -> $(AGENTS_SRC)"

.PHONY: codex-unlink
codex-unlink:
	@if [ -L "$(AGENTS_DEST)" ]; then \
		rm -f "$(AGENTS_DEST)"; \
		echo "Removed symlink $(AGENTS_DEST)"; \
	else \
		echo "$(AGENTS_DEST) is not a symlink or does not exist."; \
	fi

AGENTS_DEST_FOR_CLAUDE := $(HOME)/.claude/CLAUDE.md

.PHONY: claude-link
claude-link:
	@ln -sf "$(AGENTS_SRC)" "$(AGENTS_DEST_FOR_CLAUDE)"
	@echo "Linked $(AGENTS_DEST_FOR_CLAUDE) -> $(AGENTS_SRC)"

.PHONY: claude-unlink
claude-unlink:
	@if [ -L "$(AGENTS_DEST_FOR_CLAUDE)" ]; then \
		rm -f "$(AGENTS_DEST_FOR_CLAUDE)"; \
		echo "Removed symlink $(AGENTS_DEST_FOR_CLAUDE)"; \
	else \
		echo "$(AGENTS_DEST_FOR_CLAUDE) is not a symlink or does not exist."; \
	fi

SKILLS_SRC := $(PWD)/.codex/skills
SKILLS_DEST := $(HOME)/.codex/skills

.PHONY: codex-skills-install
codex-skills-install:
	@set -eu; \
	if [ ! -d "$(SKILLS_SRC)" ]; then \
		echo "Source skills directory not found: $(SKILLS_SRC)"; \
		exit 1; \
	fi; \
	mkdir -p "$(SKILLS_DEST)"; \
	tmp=$$(mktemp); \
	trap 'rm -f "$$tmp"' EXIT; \
	find "$(SKILLS_SRC)" -mindepth 1 -maxdepth 1 -type d -print0 > "$$tmp"; \
	if [ ! -s "$$tmp" ]; then \
		echo "No skills found in $(SKILLS_SRC)"; \
		exit 0; \
	fi; \
	dup_found=0; \
	dup_list=""; \
	while IFS= read -r -d '' dir; do \
		base=$$(basename "$$dir"); \
		if [ -e "$(SKILLS_DEST)/$$base" ]; then \
			dup_found=1; \
			dup_list="$$dup_list$$base\n"; \
		fi; \
	done < "$$tmp"; \
	overwrite=0; \
	if [ "$$dup_found" -eq 1 ]; then \
		echo "The following skills already exist in $(SKILLS_DEST):"; \
		printf "%b" "$$dup_list"; \
		printf "Overwrite existing skills? [y/N] "; \
		read -r ans; \
		case "$$ans" in \
			y|Y) overwrite=1 ;; \
			*) overwrite=0 ;; \
		esac; \
	fi; \
	while IFS= read -r -d '' dir; do \
		base=$$(basename "$$dir"); \
		dest="$(SKILLS_DEST)/$$base"; \
		if [ -e "$$dest" ] && [ "$$overwrite" -ne 1 ]; then \
			echo "Skip $$base (already exists)"; \
			continue; \
		fi; \
		rm -rf "$$dest"; \
		cp -R "$$dir" "$$dest"; \
		echo "Installed $$base"; \
	done < "$$tmp"; \
	echo "Done."

;;; $DOOMDIR/packages.el -*- no-byte-compile: t; -*-

;;; Theme and UI Enhancements
(package! catppuccin-theme)      ; Modern, sophisticated theme
(package! company-box)           ; Better looking company popups
(package! kind-icon)             ; Adds icons to completion windows
(package! all-the-icons)         ; Icons for dired, treemacs, etc.
(package! treesit-auto)          ; Automatic tree-sitter grammar installation
(package! marginalia)            ; Rich annotations in the minibuffer

;;; Editor Enhancements
(package! evil-matchit)          ; Enhanced matching pairs navigation
(package! evil-commentary)        ; Easy code commenting (gc to comment)
(package! yasnippet-snippets)    ; Collection of useful snippets
(package! multiple-cursors)      ; Edit multiple lines at once
(package! avy)                   ; Quick navigation to visible text

;;; Development Tools
(package! lsp-ui)                ; Enhanced UI for LSP
(package! dap-mode)              ; Debug Adapter Protocol for Emacs
(package! flycheck-inline)       ; Show errors inline
(package! quickrun)              ; Run code quickly
(package! format-all)            ; Format code in any language

;;; Go Development
(package! gotest)                ; Go testing utilities
(package! go-tag)                ; Manage Go struct tags
(package! go-gen-test)           ; Generate Go test boilerplate
(package! go-impl)               ; Generate Go interface methods
(package! gorepl-mode)           ; Interactive Go REPL

;;; Git Tools
(package! git-timemachine)       ; Walk through git revisions of a file
(package! git-messenger)         ; Show commit messages
(package! magit-todos)           ; Show TODOs in magit status

;;; Project Management
(package! projectile-ripgrep)    ; Fast project search
(package! treemacs-projectile)   ; Project integration for treemacs
(package! deadgrep)              ; Fast, beautiful search UI

;;; Completion Enhancements
(package! vertico-posframe)      ; Show vertico in a posframe
(package! consult-dir)           ; Insert paths into minibuffer prompts
(package! corfu-doc)             ; Documentation popup for corfu

;;; Writing and Documentation
(package! markdown-toc)          ; Generate TOC for markdown files
(package! mixed-pitch)           ; Mix fixed and variable pitch fonts
(package! olivetti)              ; Center text for writing

;;; Terminal and Shell
(package! vterm-toggle)          ; Toggleable terminal
(package! fish-completion)       ; Fish shell completion

;;; Optional but Recommended
(package! which-key-posframe)    ; Show keybindings in a posframe
(package! rainbow-mode)          ; Colorize color names in buffers
(package! indent-guide)          ; Show indent guides
(package! origami)               ; Code folding

;;; Language Support (besides Go)
(when (modulep! :lang javascript)
  (package! typescript-mode)     ; TypeScript support
  (package! npm-mode))           ; npm integration

(when (modulep! :lang python)
  (package! python-black)        ; Python formatter
  (package! pyimport))           ; Python import management

;; Doom manages its packages through pinned commits for stability.
;; Unpinning allows you to install latest versions, but may cause instability.
;; Uncomment only if needed:
;; (unpin! go-mode lsp-mode)
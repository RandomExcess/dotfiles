;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Personal Information
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Basic UI Configuration
(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'macchiato)
(load-theme 'catppuccin t)
(setq display-line-numbers-type 'relative)
(setq org-directory "~/org/")
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(after! ispell
  (setq ispell-program-name "/opt/homebrew/bin/aspell")
  ;; Configure aspell to work better with Flyspell
  (add-to-list 'ispell-extra-args "--sug-mode=ultra"))
  
;; Font Configuration
(setq doom-font (font-spec :family "GohuFont 14 Nerd Font Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "GohuFont 14 Nerd Font Mono" :size 15))

;; System Configuration
(setq select-enable-clipboard t
      x-select-enable-clipboard-manager t)

;; Window Management
(setq evil-vsplit-window-right t
      evil-split-window-below t)

;; Auto-save and Backup Configuration
(setq auto-save-default t
      make-backup-files t
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; Performance Optimizations
(setq gc-cons-threshold 100000000
      read-process-output-max (* 1024 1024))

;; Treemacs Configuration
(after! treemacs
  (setq treemacs-width 35
        treemacs-position 'left))

;; Completion (Company) Configuration
(after! company
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1)
  (setq company-box-icons-alist 'company-box-icons-all-the-icons))

;; LSP Configuration
(after! lsp-mode
  (setq lsp-idle-delay 0.5
        lsp-log-io nil
        lsp-completion-provider :capf
        lsp-completion-show-detail t
        lsp-completion-show-kind t)
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'at-point
        lsp-ui-sideline-enable t
        lsp-ui-sideline-show-diagnostics t
        lsp-ui-sideline-show-hover t))

;; Programming Language Configurations
;; Go
(after! go-mode
  (add-hook! 'before-save-hook #'lsp-format-buffer t t)
  (add-hook! 'before-save-hook #'lsp-organize-imports t t)
  (add-hook! go-mode-hook
    (add-hook 'before-save-hook #'gofmt-before-save nil t))
  (setq gofmt-command "goimports"
        go-packages-function 'go-packages-go-list
        go-test-args "-v -race"
        gotest-verbose t))

;; Python
(after! python-mode
  (setq python-indent-offset 4))

;; JavaScript
(after! js2-mode
  (setq js2-basic-offset 2
        js-indent-level 2))

;; Key Bindings Configuration
;; Save on ESC
(add-hook 'evil-insert-state-exit-hook
          (lambda ()
            (call-interactively #'save-buffer)))

;; Leader Key Bindings
(map! :leader
      ;; Search bindings
      (:prefix "s"
       :desc "Search in buffer" "s" #'+default/search-buffer
       :desc "Search in project" "f" #'+default/search-project)
      
      ;; Code bindings
      (:prefix "c"
       :desc "Next square bracket" "," (cmd! (insert "[]") (backward-char))
       :desc "Next curly brace" "." (cmd! (insert "{}") (backward-char)))
      
      ;; Insert bindings
      (:prefix "i"
       :desc "Insert pipe" "i" (cmd! (insert "|"))
       :desc "Insert backslash" "b" (cmd! (insert "\\")))
      
      ;; Toggle bindings
      (:prefix "t"
       :desc "Toggle comment" "c" #'comment-line
       :desc "Toggle fold" "f" #'evil-toggle-fold)
      
      ;; Buffer bindings
      (:prefix "b"
       :desc "Kill buffer" "d" #'kill-current-buffer)
      
      ;; Window bindings
      (:prefix "w"
       :desc "Split window right" "v" #'evil-window-vsplit
       :desc "Split window below" "s" #'evil-window-split)
      
      ;; Terminal bindings
      :desc "Open vterm" "v" #'vterm)

;; Special character bindings
(map! :n "æ" #'evil-first-non-blank
      :n "ø" #'evil-end-of-line
      :n "å" #'evil-backward-word-begin)
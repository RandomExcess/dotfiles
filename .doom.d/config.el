;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Identity configuration for GPG, email, etc (uncomment and modify as needed)
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Font Configuration
(setq doom-font (font-spec :family "GohuFont 14 Nerd Font Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "GohuFont 14 Nerd Font Mono" :size 15))

;; Theme Configuration
(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'macchiato)
(load-theme 'catppuccin t)

;; Basic UI Configuration
(setq display-line-numbers-type t)
(setq org-directory "~/org/")

;; Clipboard Configuration
(setq select-enable-clipboard t
      x-select-enable-clipboard-manager t)

;; Window Management
(setq evil-vsplit-window-right t
      evil-split-window-below t)

;; Auto-save and backup settings
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

;; Company (Completion) Configuration
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

;; Go Mode Configuration
(after! go-mode
  ;; Format and Import Handling
  (add-hook! 'before-save-hook #'lsp-format-buffer t t)
  (add-hook! 'before-save-hook #'lsp-organize-imports t t)
  (add-hook! go-mode-hook
    (add-hook 'before-save-hook #'gofmt-before-save nil t))
  
  ;; Go Tools Configuration
  (setq gofmt-command "goimports"
        go-packages-function 'go-packages-go-list)
  
  ;; Testing Configuration
  (setq go-test-args "-v -race"
        gotest-verbose t))

;; Key Bindings (add your custom keybindings here)
(map! :leader
      (:prefix "b"
       :desc "Kill buffer" "d" #'kill-current-buffer)
      (:prefix "w"
       :desc "Split window right" "v" #'evil-window-vsplit
       :desc "Split window below" "s" #'evil-window-split))

;; Additional Language-Specific Configurations
(after! python-mode
  (setq python-indent-offset 4))

(after! js2-mode
  (setq js2-basic-offset 2
        js-indent-level 2))

;; End of config.el
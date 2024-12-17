;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Identity configuration for GPG, email, etc (uncomment and modify as needed)
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Font Configuration
;; Sets your main font to GohuFont Nerd Font at size 14
;; Uses the Catppuccin theme with macchiato flavor
(setq doom-font (font-spec :family "GohuFont 14 Nerd Font Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "GohuFont 14 Nerd Font Mono" :size 15))

;; Theme Configuration
(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'macchiato)
(load-theme 'catppuccin t)

;; Basic UI Configuration
(setq display-line-numbers-type t)              ; Shows line numbers
(setq org-directory "~/org/")                   ; Sets where org-mode files are stored

;; Clipboard Configuration
(setq select-enable-clipboard t
      x-select-enable-clipboard-manager t)

;; Window Management
(setq evil-vsplit-window-right t                ; New vertical splits go to the right
      evil-split-window-below t)                ; New horizontal splits go below

;; Auto-save and backup settings
(setq auto-save-default t                       ; Enables auto-saving
      make-backup-files t                       ; Makes backup files
      backup-by-copying t                       ; Copies files for backup instead of moving them
      delete-old-versions t
      kept-new-versions 6                       ; Keeps 6 newest versions of a file
      kept-old-versions 2
      version-control t)

;; Performance Optimizations
(setq gc-cons-threshold 100000000               ; Higher garbage collection threshold for better performance
      read-process-output-max (* 1024 1024))

;; Treemacs Configuration
(after! treemacs
  (setq treemacs-width 35                       ; Sets sidebar width to 35 characters
        treemacs-position 'left))               ; Puts it on the left side

;; Company (Completion) Configuration
(after! company
  (setq company-idle-delay 0.1                  ; Shows completions after 0.1 seconds
        company-minimum-prefix-length 1)        ; Shows completions after typing 1 character
  (setq company-box-icons-alist 'company-box-icons-all-the-icons))

;; LSP Configuration
(after! lsp-mode
  (setq lsp-idle-delay 0.5                      ; Waits 0.5 seconds before starting language server features
        lsp-log-io nil
        lsp-completion-provider :capf
        lsp-completion-show-detail t
        lsp-completion-show-kind t)

  (setq lsp-ui-doc-enable t                     ; Enables documentation popups
        lsp-ui-doc-position 'at-point           ; Shows docs at cursor position
        lsp-ui-sideline-enable t
        lsp-ui-sideline-show-diagnostics t
        lsp-ui-sideline-show-hover t))

;; Go Mode Configuration
(after! go-mode
  ;; Format and Import Handling
  ;; Automatically formats Go code on save
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
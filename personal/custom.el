(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ace-window ag anzu browse-kill-ring cider clojure-mode company
                consult crux diff-hl diminish dimmer discover-my-major
                dockerfile-mode easy-kill editorconfig elisp-slime-nav
                epl exec-path-from-shell expand-region
                flycheck flycheck-clj-kondo gist git-modes
                git-timemachine guru-mode helm hl-todo imenu-anywhere
                js2-mode json-mode lsp-mode lsp-ui magit move-text
                nlinum operate-on-number orderless projectile
                rainbow-delimiters rainbow-mode smartparens smartrep
                super-save treemacs undo-tree use-package vertico
                volatile-highlights web-mode which-key yaml-mode
                zenburn-theme zop-to-char))
 '(safe-local-variable-values '((cider-shadow-cljs-default-options . "app"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq mac-right-option-modifier nil)

(require 'flycheck-clj-kondo)

(defun my-lsp-format-before-save ()
  (lsp-format-buffer)
  ;(elixir-format)
  )

(add-hook 'before-save-hook 'my-lsp-format-before-save)

'(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; Custom smartparens stuff
(define-key smartparens-mode-map (kbd "M-(") 'sp-wrap-round)
(define-key smartparens-mode-map (kbd "M-[") 'sp-wrap-square)
(define-key smartparens-mode-map (kbd "M-{") 'sp-wrap-curly)
;; Dimmer
(require 'dimmer)
(dimmer-configure-which-key)
(dimmer-configure-helm)
(dimmer-mode t)

;; Cider
(require 'cider)
(setq cider-shadow-cljs-global-options "-A:dev")

;; Flycheck
(setq flycheck-display-errors-delay 0)

;; Undo-tree
(setq undo-tree-enable-undo-in-region t)


;; clojure-lsp!

(add-hook 'clojure-mode-hook 'lsp)
(add-hook 'clojurescript-mode-hook 'lsp)
(add-hook 'clojurec-mode-hook 'lsp)
(setq company-minimum-prefix-length 1)
(setq lsp-enable-completion-at-point t)

(define-key lsp-ui-mode-map [remap xref-find-definitions] nil)
(define-key lsp-ui-mode-map [remap xref-find-references] nil)

(setq cider-eldoc-display-for-symbol-at-point nil) ; disable cider showing eldoc during symbol at point

;; Disable overflowing lines changing colors

(setq prelude-whitespace nil)

;; Navigation
(global-set-key (kbd "M-g f") 'avy-goto-line)

(display-time-mode 1)

;; Require 'elixir-ts-mode
(require 'elixir-ts-mode)

;; Associate .ex and .exs files with elixir-ts-mode
(add-to-list 'auto-mode-alist '("\\.ex\\'" . elixir-ts-mode))
(add-to-list 'auto-mode-alist '("\\.exs\\'" . elixir-ts-mode))

(use-package lsp-mode
  :commands lsp
  :ensure t
  :diminish lsp-mode
  :hook
  (elixir-ts-mode . lsp)
  :init
  (add-to-list 'exec-path "/Users/kontijuh/Downloads/elixir-ls-v0.19.0"))

;; snippets
(yas-global-mode 1)

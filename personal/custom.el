(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dockerfile-mode treemacs dimmer flycheck-clj-kondo cider clojure-mode yaml-mode web-mode lsp-ui lsp-mode json-mode js2-mode rainbow-mode elisp-slime-nav rainbow-delimiters company consult orderless vertico exec-path-from-shell zop-to-char zenburn-theme which-key volatile-highlights undo-tree super-save smartrep smartparens operate-on-number nlinum move-text magit projectile imenu-anywhere hl-todo guru-mode git-modes git-timemachine gist flycheck expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major crux browse-kill-ring anzu ag ace-window use-package))
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
  "Format the current Clojure buffer using `lsp-format-buffer'."
  (lsp-format-buffer))

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
;_(setq cider-shadow-cljs-parameters "-A:dev watch hakuvelho-v2")
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

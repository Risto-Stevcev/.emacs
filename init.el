;;; risto.el --- Summary:
;;; Commentary:
;; This is my first Emacs file

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Code:
(package-initialize)

(require 'package)

(setq package-archives '(("elpa" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(setq backup-directory-alist
    `((".*" . ,(expand-file-name (concat user-emacs-directory "backups")))))

(setq auto-save-file-name-transforms
    `((".*" ,(expand-file-name (concat user-emacs-directory "autosaves")) t)))

(windmove-default-keybindings)

; Move windows
; can just use Shift+Arrow key
;(global-set-key (kbd "C-x C-<up>") 'windmove-up)
;(global-set-key (kbd "C-x C-<down>") 'windmove-down)
;(global-set-key (kbd "C-x C-<left>") 'windmove-left)
;(global-set-key (kbd "C-x C-<right>") 'windmove-right)

; Resize windows
(global-set-key (kbd "C-x C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-x C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-x C-<down>") 'shrink-window)
(global-set-key (kbd "C-x C-<up>") 'enlarge-window)


(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)

;; Minor modes
(evil-mode 1)

; Hide the menu bar
(menu-bar-mode 0)

; Turn off electric indent
(electric-indent-mode -1)

(flycheck-mode)
(tabbar-mode)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(show-paren-mode 1)

; Color theme
;(load-theme 'one-light t)
;(load-theme 'solarized-light t)
(load-theme 'zenburn t)

; TODO: how to set clipboard to paste from both? this doesnt fix it:
;(setq x-select-enable-primary t)
;(setq x-select-enable-clipboard t)

(defconst inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; LSP
(require 'lsp-mode)
(require 'lsp-java)
(add-hook 'tuareg-mode-hook #'lsp)
(add-hook 'js-mode-hook #'lsp)
(add-hook 'java-mode-hook #'lsp)

(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'lsp-mode-hook 'company-mode)
(add-hook 'tuareg-mode-hook 'flycheck-mode)
(add-hook 'js-mode-hook 'flycheck-mode)
(add-hook 'java-mode-hook 'flycheck-mode)

; TODO: not working
;(setq lsp-java-server-install-dir "/home/risto/eclipse.jdt.ls/server/")

(require 'yasnippet)
(yas-global-mode 1)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(add-hook 'after-init-hook #'global-flycheck-mode)

; Prefer flycheck to flymake
(setq lsp-prefer-flymake nil)
;; end LSP

;; Paredit
(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook       #'smartparens-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'smartparens-mode)
(add-hook 'lisp-mode-hook             #'smartparens-mode)
(add-hook 'lisp-interaction-mode-hook #'smartparens-mode)
(add-hook 'scheme-mode-hook           #'smartparens-mode)
(add-hook 'slime-repl-mode-hook (lambda () (smartparens-mode +1)))

(global-set-key (kbd "M-<up>") 'sp-wrap-round)
(global-set-key (kbd "M-<down>") 'sp-splice-sexp)
(global-set-key (kbd "M-<left>") 'sp-backward-slurp-sexp)
(global-set-key (kbd "M-<right>") 'sp-forward-slurp-sexp)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a71be4e5e9e418025daea651f8a1628953abb7af505da5e556e95061b6a6e389" default)))
 '(package-selected-packages
   (quote
    (solarized-theme smartparens treemacs-evil rainbow-delimiters paredit lsp-treemacs company-lsp lsp-java zenburn-theme one-themes tabbar yasnippet lsp-ui tuareg flycheck slime evil lsp-mode ivy))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here

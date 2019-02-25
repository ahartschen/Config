(package-initialize)
(eval-when-compile
  (add-to-list 'load-path "/home/austin/.emacs.d/elpa/use-package-20181119.2350")
  (require 'use-package))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number-mode nil)
 '(org-export-with-sub-superscripts (quote {}))
 '(package-selected-packages
   (quote
    (company-quickhelp fireplace nyan-mode evil-anzu anzu which-key prettier-js md4rd dashboard web-mode doom-themes use-package company helm ledger-mode org-bullets org-plus-contrib evil-collection atom-one-dark-theme))))

;; Packages                                                                                       
(use-package evil
  :ensure evil
  :init

  ;; Tells us the number of matching string
  (use-package anzu
    :ensure t
    :diminish aznu-mode
    :config
    (global-anzu-mode 1))
  (use-package evil-anzu
    :ensure t)

  :config
  (evil-mode 1))

;; Style related
(use-package doom-themes
  :ensure doom-themes
  :config (load-theme 'doom-one t))
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; turn off bell                                                                                  
(setq ring-bell-function 'ignore)

(setq org-todo-keywords 
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE" "CANCELED")))

(use-package org-bullets
  :ensure t
  :hook (org-mode . org-bullets-mode))
  
(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x b" . helm-mini))
  :config (setq helm-split-window-in-side-p t))

(use-package company
  :ensure t
  :config
  (use-package company-quickhelp
    :ensure t
    :config
    (company-quickhelp-mode))
  (global-company-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package ace-window
  :ensure t
  :bind ("M-o" . ace-window)
  :commands (ace-window)
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
	aw-background t
	aw-dispatch-always t
	aw-dispatch-alist
	'((?0 aw-delete-window " Ace - Delete Window")
	  (?m aw-swap-window " Ace - Swap Window")
	  (?n aw-flip-window " Ace - Flip Window")
	  (?2 aw-split-window-vert " Ace - Split Vertical Window")
	  (?3 aw-split-window-horz " Ace - Split Horizontal Window")
	  (?1 delete-other-windows " Ace - Delete Other Windows"))))


;; Allow you to undo/redo changes to windor configuration
(when (fboundp 'winner-mode)
  (winner-mode 1))

(use-package magit
  :ensure t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(use-package tide
  :ensure t)

(use-package ledger-mode
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package nyan-mode
  :ensure t
  :config (nyan-mode 1))

(use-package fireplace
  :ensure t)

;; These options are necessary for mysql to work on Windows
(when (eq system-type 'windows-nt)
  (setq sql-mysql-options '("-C" "-t" "-f" "-n"))
  (add-to-list 'default-frame-alist '(font . "Hack"))
  (set-face-attribute 'default nil
	              :family "Hack"))




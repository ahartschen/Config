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
    (doom-themes use-package company helm ledger-mode org-bullets org-plus-contrib evil-collection atom-one-dark-theme))))

;; Packages                                                                                       
(use-package evil
  :ensure evil
  :init
  (evil-mode 1))

;; Style related
(use-package doom-themes
  :ensure doom-themes
  :config (load-theme 'doom-one t))
(tool-bar-mode -1)

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
	 ("C-x r b" . helm-filtered-bookmarks)))

(use-package company
  :ensure t
  :config (global-company-mode t))

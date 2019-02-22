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
    (web-mode doom-themes use-package company helm ledger-mode org-bullets org-plus-contrib evil-collection atom-one-dark-theme))))

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
(menu-bar-mode -1)

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
  :config (global-company-mode t))

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


(use-package magit
  :ensure t)


  
		    

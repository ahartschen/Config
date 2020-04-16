(package-initialize)
(eval-when-compile
    (require 'use-package))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
    ;; custom-set-variables was added by Custom.
    ;; If you edit it by hand, you could mess it up, so be careful.
    ;; Your init file should contain only one such instance.
    ;; If there is more than one, they won't work right.
    '(ledger-reports
    (quote
    (("bal general " "ledger bal")
    ("bal \"401k\"" "ledger bal \"401k\"")
    ("bal general cleared" "%(binary) -f %(ledger-file) bal \"Liabilities:Credit Cards\" \"Checking\" \"Savings\" \"Money Market\" \"CD\" --empty --cleared")
    ("bal general" "%(binary) -f %(ledger-file) bal \"Liabilities:Credit Cards\" \"Checking\" \"Savings\" \"Money Market\" \"CD\" --empty")
    ("bal" "%(binary) -f %(ledger-file) bal")
    ("reg" "%(binary) -f %(ledger-file) reg")
    ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
    ("account" "%(binary) -f %(ledger-file) reg %(account)"))))
    '(package-selected-packages
    (quote
    (org-journal neotree org-alert alert company-jedi py-autopep8 elpy Company-quickhelp evil-anzu anzu which-key dashboard doom-themes use-package company helm ledger-mode org-bullets org-plus-contrib evil-collection atom-one-dark-theme)))
    '(python-shell-interpreter "python3"))

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

;; turn off bell g
(setq ring-bell-function 'ignore)

(setq org-todo-keywords 
    '((sequence "TODO" "STARTED" "DONE" "CANCELED" )))

(setq org-todo-keyword-faces
    '(("TODO" . org-warning) ("STARTED" . "yellow")
    ("CANCELED" . (:foreground "red" :weight bold))))

(use-package org-bullets
  :ensure t
  :after (org)
  :hook (org-mode . org-bullets-mode))

(add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)

(setq org-directory "~/Dropbox/org")
(setq org-default-notes-file (concat org-directory "/general.org"))

(setq org-capture-templates
      '(("t" "TODO" entry (file+headline "~/Dropbox/org/general.org" "Tasks")
	 "* TODO %?\n SCHEDULED: %U\n")
	("n" "Note" entry (file+headline "~/Dropbox/org/general.org" "Notes")
	 "* %?\n")
	("q" "Questions" entry (file+headline "~/Dropbox/org/general.org" "Questions")
	 "* %?\n")))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(use-package helm
    :ensure t
    :bind (("M-x" . helm-M-x)
    ("C-x C-f" . helm-find-files)
    ("C-x b" . helm-mini))
    :config (setq helm-split-window-in-side-p t))

(setq org-agenda-files (list "~/Dropbox/org/general.org"))

(use-package org-journal
    :ensure t
    :defer t
    :custom
    (org-journal-dir "~/Dropbox/org/journal"))

(use-package company
    :ensure t
    :config
    (use-package company-quickhelp
    :ensure t
    :config
    (company-quickhelp-mode))
    (global-company-mode t))

(use-package company-jedi
    :commands company-jedi
    :init
    (defun use-package-company-add-company-jedi ()
    (unless (member 'company-jedi company-backends)
    (add-to-list 'company-backends 'company-jedi)))
    (add-hook 'python-mode-hook #'use-package-company-add-company-jedi))

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
    :ensure t
    :defer t
    :config
    (add-hook 'ledger-mode-hook
    (lambda ()
    (setq-local tab-always-indent 'complete)
    (setq-local completion-cycle-threshold t)
    (setq-local ledger-complete-in-steps t))))

(use-package which-key
    :ensure t
    :config (which-key-mode))

(use-package rainbow-delimiters
    :ensure t
    :hook (prog-mode . rainbow-delimiters-mode))

(use-package elpy
    :ensure t
    :init
    (elpy-enable)
    :config
    (setq elpy-shell-echo-input nil))

(use-package py-autopep8
    :ensure t
    :config
    (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

(use-package flycheck
    :ensure t
    :init (global-flycheck-mode))

;; Auto closing of brackets/braces/paranthesis/quotes/etc.
(electric-pair-mode 1)

(use-package alert
    :ensure t)

(require 'notifications)

(use-package org-alert
    :ensure t
    :config
    (setq alert-default-style 'notifications))

(defun my-python-mode-hook () 
    (linum-mode 1)) 

(add-hook 'python-mode-hook 'my-python-mode-hook)

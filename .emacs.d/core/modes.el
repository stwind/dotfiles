(provide 'modes)

(defun setup-helm ()
  (use-package helm)
  (use-package helm-config)

  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))

  (global-set-key (kbd "M-x") 'helm-M-x)
  (setq helm-M-x-fuzzy-match t)

  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

  (global-set-key (kbd "M-y") 'helm-show-kill-ring)

  (global-set-key (kbd "C-x b") 'helm-mini)
  (setq helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match    t)

  (global-set-key (kbd "C-x C-f") 'helm-find-files)

  (helm-mode 1))

(install-pkg 'helm)

(install-pkg 'helm-ag)

(defun setup-helm-projectile ()
  (projectile-global-mode)
  (setq projectile-completion-system 'helm)
  (helm-projectile-on)
  (setq projectile-switch-project-action 'helm-projectile))

(install-pkg 'helm-projectile)

(defun setup-helm-swoop ()
  (use-package helm-swoop)

  (global-set-key (kbd "M-i") 'helm-swoop)
  (global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
  (global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
  (global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

  ;; When doing isearch, hand the word over to helm-swoop
  (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
  ;; From helm-swoop to helm-multi-swoop-all
  (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)

  ;; Instead of helm-multi-swoop-all, you can also use helm-multi-swoop-current-mode
  (define-key helm-swoop-map (kbd "M-m") 'helm-multi-swoop-current-mode-from-helm-swoop)

  ;; Move up and down like isearch
  (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
  (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)

  ;; Save buffer when helm-multi-swoop-edit complete
  (setq helm-multi-swoop-edit-save t)

  ;; If this value is t, split window inside the current window
  (setq helm-swoop-split-with-multiple-windows nil)

  ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
  (setq helm-swoop-split-direction 'split-window-vertically)

  ;; If nil, you can slightly boost invoke speed in exchange for text color
  (setq helm-swoop-speed-or-color nil)

  ;; Go to the opposite side of line from the end or beginning of line
  (setq helm-swoop-move-to-line-cycle t)

  ;; Optional face for line numbers
  ;; Face name is `helm-swoop-line-number-face`
  (setq helm-swoop-use-line-number-face t))

(install-pkg 'helm-swoop)

(defun setup-evil-nerd-commenter ()
  (evilnc-default-hotkeys))

                                        ;(install-pkg 'evil-nerd-commenter)

(defun setup-ace-window ()
  (setq aw-background nil)
  (global-set-key (kbd "M-[") 'ace-window)
  (ace-window-display-mode)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

(install-pkg 'ace-window)

(defun setup-git-gutter ()
  (use-package git-gutter)
  (global-git-gutter-mode t)
  ;; (global-set-key (kbd "C-x C-g") 'git-gutter:toggle)
  (global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
  ;; Jump to next/previous hunk
  (global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
  (global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

  ;; Stage current hunk
  (global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

  ;; Revert current hunk
  (global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)
  (setq git-gutter:added-sign "+")
  (setq git-gutter:deleted-sign "-")
  (setq git-gutter:modified-sign "!")
  (setq git-gutter:update-interval 2)
  (set-face-foreground 'git-gutter:modified "blue")
  (set-face-foreground 'git-gutter:added "green")
  (set-face-foreground 'git-gutter:deleted "red"))

(install-pkg 'git-gutter)

(defun setup-anzu ()
  (global-anzu-mode +1)
  (global-set-key (kbd "M-%") 'anzu-query-replace)
  (global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)
  (set-face-attribute 'anzu-mode-line nil :weight 'bold)
  (setq anzu-mode-lighter "")
  (setq anzu-deactivate-region t)
  (setq anzu-search-threshold 1000)
  (setq anzu-replace-to-string-separator " => "))

(install-pkg 'anzu)

(defun setup-indent-guide ()
  (indent-guide-global-mode)
  (set-face-foreground 'indent-guide-face "gray"))

(install-pkg 'indent-guide)

(defun setup-aggresive-indent ()
  (global-aggressive-indent-mode 1)
  (add-to-list 'aggressive-indent-excluded-modes 'html-mode))

;(install-pkg 'aggressive-indent)

(defun setup-whitespace-cleanup-mode ()
  (setq global-whitespace-cleanup-mode t))

(install-pkg 'whitespace-cleanup-mode)

(defun setup-clean-aindent-mode ()
  (electric-indent-mode -1)  ; no electric indent, auto-indent is sufficient
  (clean-aindent-mode t)
  (setq clean-aindent-is-simple-indent t)
  (define-key global-map (kbd "RET") 'newline-and-indent))

;; (install-pkg 'clean-aindent-mode)

(defun setup-highlight-symbol ()
  (highlight-symbol-nav-mode)
  (add-hook 'prog-mode-hook (lambda () (highlight-symbol-mode)))
  (add-hook 'org-mode-hook (lambda () (highlight-symbol-mode)))

  (setq highlight-symbol-idle-delay 0.2
        highlight-symbol-on-navigation-p t)

  (global-set-key (kbd "M-n") 'highlight-symbol-next)
  (global-set-key (kbd "M-p") 'highlight-symbol-prev))

(install-pkg 'highlight-symbol)

(defun setup-volatile-highlights ()
  (volatile-highlights-mode t))

(install-pkg 'volatile-highlights)

(defun setup-expand-region ()
  (global-set-key (kbd "C-=") 'er/expand-region))

(install-pkg 'expand-region)

(defun ome-rainbow-delimiters-setup ()
  (rainbow-delimiters-mode))

(install-pkg 'rainbow-delimiters)

(defun setup-magit ()
  (global-set-key (kbd "C-x g") 'magit-status))

(install-pkg 'magit)

(defun setup-avy ()
  (use-package avy)
  (global-set-key (kbd "C-;") 'avy-goto-char)
  (global-set-key (kbd "C-'") 'avy-goto-char-2)
  (global-set-key (kbd "M-g f") 'avy-goto-line)
  (global-set-key (kbd "M-g w") 'avy-goto-word-1)
  (global-set-key (kbd "M-g e") 'avy-goto-word-0)
  (avy-setup-default))

(install-pkg 'avy)

(defun setup-ace-jump-mode ()
  (autoload
    'ace-jump-mode
    "ace-jump-mode"
    "Emacs quick move minor mode"
    t)
  (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

  (autoload
    'ace-jump-mode-pop-mark
    "ace-jump-mode"
    "Ace jump back:-)"
    t)
  (eval-after-load "ace-jump-mode" '(ace-jump-mode-enable-mark-sync))
  (define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark))

(install-pkg 'ace-jump-mode)

(defun setup-ace-isearch ()
  ;(require 'ace-isearch)
  ;(use-package ace-isearch)
  ;(global-ace-isearch-mode 1)
  )

;(install-pkg 'ace-isearch)

(defun setup-web-mode ()
  (defun my-web-mode-hook ()
    (local-set-key (kbd "RET") 'newline-and-indent)
    (setq web-mode-enable-auto-pairing nil))

  (add-hook 'web-mode-hook 'my-web-mode-hook)
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(install-pkg 'web-mode)

(defun setup-company ()
  (add-hook 'after-init-hook 'global-company-mode))

(install-pkg 'company)

(defun setup-yasnippet ()
  (yas-global-mode 1))

(install-pkg 'yasnippet)

(defun setup-yasnippet-snippets ()
  (add-to-list 'yas-snippet-dirs
               (el-get-package-directory "yasnippet-snippets"))
  (yas-reload-all))

(install-pkg 'yasnippet-snippets)

(defun setup-smartparens ()
  (require 'smartparens-config)
  (setq sp-autoskip-closing-pair 'always)
  (setq sp-navigate-close-if-unbalanced t)
  (smartparens-global-mode t))

(install-pkg 'smartparens)

(install-pkg 'git-modes)

(provide 'gui)

;; show column number and line number
;; (dolist (mode '(column-number-mode line-number-mode))
;;  (when (fboundp mode) (funcall mode t)))

(line-number-mode 1)
(global-linum-mode 0)

;; make the fringe thinner (default is 8 in pixels)
(fringe-mode 4)

;; show parenthesis match
(show-paren-mode 1)
(setq show-paren-style 'expression)

;; Toggle line highlighting in all buffers
(global-hl-line-mode t)

;; http://stackoverflow.com/questions/27758800/why-does-emacs-leave-a-gap-when-trying-to-maximize-the-frame
(setq frame-resize-pixelwise t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode t)
(global-hl-line-mode t)
(show-paren-mode 1)
(set-fringe-mode '(0 . 0))
(setq show-paren-style 'mixed)
(set-face-background 'show-paren-match-face "grey")
(set-face-foreground 'show-paren-match-face "black")

(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(set-frame-parameter nil 'fullscreen 'fullboth)

(setq initial-scratch-message "")
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)

(setq visible-bell nil)

(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono for Powerline-12"))
(set-face-attribute 'default t :font "DejaVu Sans Mono for Powerline-12")

(defun setup-solarized-theme ()
  (require 'solarized-theme)
  (use-package solarized-theme
    :config
    (setq solarized-distinct-fringe-background t)
    (setq solarized-use-more-italic t)
    (load-theme 'solarized-light t)))

(install-pkg 'solarized-theme)

(defun setup-smart-mode-line ()
  (setq sml/theme 'respectful)
  (sml/setup))

(install-pkg 'smart-mode-line)

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

(when (window-system)
  (set-frame-font "Fira Code"))
(let ((alist '((33 . ".\\(?:\\(?:==\\)\\|[!=]\\)")
               (35 . ".\\(?:[(?[_{]\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*\\)\\|[*/]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|\\+\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (58 . ".\\(?:[:=]\\)")
               (59 . ".\\(?:;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:[:=?]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (123 . ".\\(?:-\\)")
               ;; (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:[=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))

(add-to-list 'default-frame-alist '(font . "Fira Code-12"))
(set-face-attribute 'default t :font "Fira Code-12")

(defun setup-solarized-theme ()
  (require 'solarized-theme)
  (use-package solarized-theme
    :config
    (setq solarized-distinct-fringe-background t)
    (setq solarized-use-more-italic t)
    (setq solarized-termcolors 256)
    (setq solarized-contrast 'high)
    (setq solarized-visibility 'high)
    (load-theme 'solarized-light t)))

;; (install-pkg 'solarized-theme)

(defun setup-monokai-theme ()
  (load-theme 'monokai t))

;; (install-pkg 'monokai-theme)

(defun setup-material-theme ()
  (add-to-list 'custom-theme-load-path
               (el-get-package-directory 'material-theme))
  (load-theme 'material t))

(install-pkg 'material-theme)

(defun setup-color-theme-almost-monokai ()
  (color-theme-almost-monokai))

;; (install-pkg 'color-theme-almost-monokai)

(defun setup-color-theme-sanityinc-tomorrow ()
  (color-theme-sanityinc-tomorrow-night))

;; (install-pkg 'color-theme-sanityinc-tomorrow)

;; (install-pkg 'cyberpunk-theme)

(defun setup-colorsarenice-theme ()
  (add-to-list 'custom-theme-load-path
               (el-get-package-directory 'colorsarenice-theme))
  (load-theme 'colorsarenice-dark t))

;; (install-pkg 'colorsarenice-theme)

(defun setup-smart-mode-line ()
  (setq sml/theme 'respectful)
  (sml/setup))

(install-pkg 'smart-mode-line)

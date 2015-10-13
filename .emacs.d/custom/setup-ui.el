(provide 'setup-ui)

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

; solarized-theme
(setq solarized-distinct-fringe-background t)

(load-theme 'solarized-light t)

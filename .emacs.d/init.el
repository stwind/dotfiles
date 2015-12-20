(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" default)))
 '(edts-inhibit-package-check t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defvar home-dir (file-name-directory (or load-file-name (buffer-file-name)))
  "home directory.")

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch
          ;; do not build recipes from emacswiki due to poor quality and
          ;; documentation
          el-get-install-skip-emacswiki-recipes)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  ;; build melpa packages for el-get
  (el-get-install 'package)
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("melpa" . "http://melpa.org/packages/")))
  (el-get-elpa-build-local-recipes))

(setq el-get-git-shallow-clone t)

(add-to-list 'el-get-recipe-path (expand-file-name "el-get-recipes"))

(setq el-get-user-package-directory "~/.emacs.d")

(defun load-module (module)
  ;; ensure el-get-sources is empty
  (setq el-get-sources nil)
  ;; enable git shallow clone to save time and bandwidth
  (setq el-get-git-shallow-clone t)
  (require module)
  (el-get 'sync (mapcar 'el-get-source-name el-get-sources)))

(defun install-pkg (el-get-package)
  (let ((package-setup-func
         (intern (concat "setup-" (el-get-as-string el-get-package)))))
    (if (fboundp package-setup-func)
        (add-to-list 'el-get-sources
                     `(:name ,el-get-package :after (progn (,package-setup-func))))
      (add-to-list 'el-get-sources
                   `(:name ,el-get-package)))))

(add-to-list 'load-path "~/.emacs.d/core/")

(load-module 'basic)
(load-module 'gui)
(load-module 'modes)
(load-module 'langs)

;; (defvar required-packages
;;   '(
;;     ;; better-defaults
;;     exec-path-from-shell
;;     smart-mode-line
;;     solarized-theme
;;     nyan-mode
;;     helm
;;     helm-ag
;;     helm-projectile
;;     helm-swoop
;;     git-gutter
;;     magit
;;     js2-mode
;;     clojure-mode
;;     clojure-mode-extra-font-locking
;;     clojure-snippets
;;     cider
;;     clj-refactor
;;     cljr-helm
;;     cljsbuild-mode
;;     align-cljlet
;;     anzu
;;     avy
;;     ace-window
;;     ace-isearch
;;     indent-guide
;;     aggressive-indent
;;     whitespace-cleanup-mode
;;     smartparens
;;     clean-aindent-mode
;;     highlight-symbol
;;     discover-my-major
;;     rainbow-mode
;;     info+
;;     help-mode+
;;     volatile-highlights
;;     expand-region
;;     evil-nerd-commenter
;;     rainbow-delimiters
;;     yasnippet
;;     company
;;     web-mode
;;     use-package
;;     yaml-mode
;;     ansible
;;     dockerfile-mode
;;     terraform-mode
;;     hcl-mode
;;     coffee-mode
;;     glsl-mode
;;     ) "a list of packages to ensure are installed at launch.")

;; (add-hook 'after-init-hook 'my-after-init-hook)
;; (defun my-after-init-hook ()
;;   (require 'edts-start))

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(ace-isearch-fallback-function (quote helm-swoop-from-isearch))
;;  '(ace-isearch-func-delay 0)
;;  '(ace-isearch-function (quote avy-goto-char))
;;  '(ace-isearch-function-from-isearch (quote helm-swoop-from-isearch))
;;  '(ace-isearch-input-length 6)
;;  '(ace-isearch-jump-delay 0.25)
;;  '(ace-isearch-use-function-from-isearch t)
;;  '(ace-isearch-use-jump (quote printing-char))
;;  '(cider-cljs-repl
;;  "(do (require 'weasel.repl.websocket) (cemerick.piggieback/cljs-repl (weasel.repl.websocket/repl-env :ip \"127.0.0.1\" :port 9001)))")
;;  '(cider-repl-use-pretty-printing t)
;;  '(cider-show-error-buffer nil)
;;  '(js2-basic-offset 2)
;;  '(js2-bounce-indent-p t)
;;  '(safe-local-variable-values (quote ((no-byte-compile t)))))



;; ; smartparens
;; (smartparens-global-mode t)
;; (require 'smartparens-config)

;; (bind-keys
;;  :map smartparens-mode-map
;;  ("C-M-a" . sp-beginning-of-sexp)
;;  ("C-M-e" . sp-end-of-sexp)

;;  ("C-<down>" . sp-down-sexp)
;;  ("C-<up>"   . sp-up-sexp)
;;  ("M-<down>" . sp-backward-down-sexp)
;;  ("M-<up>"   . sp-backward-up-sexp)

;;  ("C-M-f" . sp-forward-sexp)
;;  ("C-M-b" . sp-backward-sexp)

;;  ("C-M-n" . sp-next-sexp)
;;  ("C-M-p" . sp-previous-sexp)

;;  ("C-S-f" . sp-forward-symbol)
;;  ("C-S-b" . sp-backward-symbol)

;;  ("C-<right>" . sp-forward-slurp-sexp)
;;  ("M-<right>" . sp-forward-barf-sexp)
;;  ("C-<left>"  . sp-backward-slurp-sexp)
;;  ("M-<left>"  . sp-backward-barf-sexp)

;;  ("C-M-t" . sp-transpose-sexp)
;;  ("C-M-k" . sp-kill-sexp)
;;  ("C-k"   . sp-kill-hybrid-sexp)
;;  ("M-k"   . sp-backward-kill-sexp)
;;  ("C-M-w" . sp-copy-sexp)

;;  ("C-M-d" . delete-sexp)

;;  ("M-<backspace>" . backward-kill-word)
;;  ("C-<backspace>" . sp-backward-kill-word)
;;  ([remap sp-backward-kill-word] . backward-kill-word)

;;  ;; ("M-[" . sp-backward-unwrap-sexp)
;;  ;; ("M-]" . sp-unwrap-sexp)

;;  ("C-x C-t" . sp-transpose-hybrid-sexp)

;;  ("C-c ("  . wrap-with-parens)
;;  ("C-c ["  . wrap-with-brackets)
;;  ("C-c {"  . wrap-with-braces)
;;  ("C-c '"  . wrap-with-single-quotes)
;;  ("C-c \"" . wrap-with-double-quotes)
;;  ("C-c _"  . wrap-with-underscores)
;;  ("C-c `"  . wrap-with-back-quotes))

;; (sp-local-tag '(sgml-mode html-mode) "<" "<_>" "</_>" :transform 'sp-match-sgml-tags)

;; (defun my-web-mode-hook ()
;;   (local-set-key (kbd "RET") 'newline-and-indent)
;;   (setq web-mode-enable-auto-pairing nil))

;; (add-hook 'web-mode-hook  'my-web-mode-hook)

;; (defun sp-web-mode-is-code-context (id action context)
;;   (and (eq action 'insert)
;;        (not (or (get-text-property (point) 'part-side)
;;                 (get-text-property (point) 'block-side)))))

;; (sp-local-pair 'web-mode "<" nil :when '(sp-web-mode-is-code-context))


;; (evilnc-default-hotkeys)


;; ;; clj-refactor
;; (require 'clj-refactor)

;; (defun my-clojure-mode-hook ()
;;     (clj-refactor-mode 1)
;;     (yas-minor-mode 1) ; for adding require/use/import
;;     (cljr-add-keybindings-with-prefix "C-c C-m"))

;; (add-hook 'clojure-mode-hook #'my-clojure-mode-hook)
;; (global-set-key (kbd "C-c C-r") 'cljr-helm)

;; (require 'align-cljlet)
;; (require 'nyan-mode)

;; (define-key isearch-mode-map (kbd "C-'") 'ace-isearch-jump-during-isearch)
;; (define-key isearch-mode-map (kbd "C-;") 'helm-swoop-from-isearch)

;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; (add-hook 'yaml-mode-hook '(lambda () (ansible 1)))

;; (require 'dockerfile-mode)
;; (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))
;; (add-to-list 'interpreter-mode-alist '("node" . js2-mode))

;; (add-to-list 'auto-mode-alist '("\\.nomad\\'" . hcl-mode))

;; (defun describe-foo-at-point ()
;;   "Show the documentation of the Elisp function and variable near point.
;; 	This checks in turn:
;; 	-- for a function name where point is
;; 	-- for a variable name where point is
;; 	-- for a surrounding function call
;; 	"
;;   (interactive)
;;   (let (sym)
;;     ;; sigh, function-at-point is too clever.  we want only the first half.
;;     (cond ((setq sym (ignore-errors
;;                        (with-syntax-table emacs-lisp-mode-syntax-table
;;                          (save-excursion
;;                            (or (not (zerop (skip-syntax-backward "_w")))
;;                                (eq (char-syntax (char-after (point))) ?w)
;;                                (eq (char-syntax (char-after (point))) ?_)
;;                                (forward-sexp -1))
;;                            (skip-chars-forward "`'")
;;                            (let ((obj (read (current-buffer))))
;;                              (and (symbolp obj) (fboundp obj) obj))))))
;;            (describe-function sym))
;;           ((setq sym (variable-at-point)) (describe-variable sym))
;;           ;; now let it operate fully -- i.e. also check the
;;           ;; surrounding sexp for a function call.
;;           ((setq sym (function-at-point)) (describe-function sym)))))

;; (define-key emacs-lisp-mode-map [(f1)] 'describe-foo-at-point)
;; (define-key emacs-lisp-mode-map [(control f1)] 'describe-function)
; (define-key emacs-lisp-mode-map [(shift f1)] 'describe-variable)

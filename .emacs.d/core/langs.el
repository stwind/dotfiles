(provide 'langs)

(defun setup-clojure-mode ()
  (use-package clojure-mode)
  (add-hook 'clojure-mode-hook #'subword-mode)
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
  (define-clojure-indent
    (defroutes 'defun)
    (GET 2)
    (POST 2)
    (PUT 2)
    (DELETE 2)
    (HEAD 2)
    (ANY 2)
    (context 2)))

(install-pkg 'clojure-mode)

(defun setup-cider ()
  (setq cider-auto-select-error-buffer t)
  (setq cider-interactive-eval-result-prefix ";; => ")
  (setq cider-prefer-local-resources t)
  (setq cider-popup-stacktraces nil)
  (setq cider-repl-popup-stacktraces t)
  (setq cider-repl-display-in-current-window t)
  (setq cider-repl-result-prefix ";; => ")
  (setq cider-repl-tab-command 'indent-for-tab-command)
  (setq cider-repl-pop-to-buffer-on-connect nil)
  (setq cider-repl-use-clojure-font-lock t)
  (setq cider-repl-use-pretty-printing t)
  (setq cider-repl-wrap-history t)
  (setq cider-test-show-report-on-success t)
  (setq cider-show-error-buffer 'only-in-repl)
  (setq nrepl-hide-special-buffers t)
  (setq nrepl-buffer-name-separator "-")
  (setq nrepl-buffer-name-show-port t)

  (setq cider-pprint-fn 'puget)

  (add-hook 'cider-repl-mode-hook #'subword-mode)
  (add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'cider-turn-on-eldoc-mode)
  (add-hook 'cider-mode-hook #'company-mode))

(install-pkg 'cider)

(install-pkg 'align-cljlet)

(defun setup-ac-cider ()
  (add-hook 'cider-mode-hook 'ac-flyspell-workaround)
  (add-hook 'cider-mode-hook 'ac-cider-setup)
  (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
  (eval-after-load "auto-complete"
    '(progn
       (add-to-list 'ac-modes 'cider-mode)
       (add-to-list 'ac-modes 'cider-repl-mode))))

(install-pkg 'ac-cider)

(defun setup-flycheck-clojure ()
  (eval-after-load 'flycheck '(flycheck-clojure-setup))
  (add-hook 'after-init-hook #'global-flycheck-mode))

;; (install-pkg 'flycheck-clojure)

(install-pkg 'glsl-mode)

(install-pkg 'yaml-mode)

(defun setup-dockerfile-mode ()
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode)))

(install-pkg 'dockerfile-mode)

(install-pkg 'terraform-mode)

(defun setup-hcl-mode ()
  (add-to-list 'auto-mode-alist '("\\.nomad\\'" . hcl-mode)))

(install-pkg 'hcl-mode)

(install-pkg 'coffee-mode)

(defun setup-edts ()
  (add-hook 'after-init-hook '(lambda () (require 'edts-start))))

(install-pkg 'erlang-mode)
(install-pkg 'edts 'elpa)

(install-pkg 'json-mode)

(defun setup-js2-mode ()
  (setq js2-basic-offset 2)
  (setq js2-bounce-indent-p t)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'interpreter-mode-alist '("node" . js2-mode)))

(install-pkg 'js2-mode)

(install-pkg 'org-mode)

(defun setup-ox-reveal ()
  (require 'ox-reveal)
  (setq org-reveal-root "https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.2.0"))

(install-pkg 'ox-reveal)

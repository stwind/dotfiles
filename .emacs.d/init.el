(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" default)))
 '(edts-inhibit-package-check t)
 '(safe-local-variable-values (quote ((erlang-indent-level . 4)))))
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
  (setq el-get-sources nil)
  (setq el-get-git-shallow-clone t)
  (require module)
  (el-get 'sync (mapcar 'el-get-source-name el-get-sources)))

(defun install-pkg (pkg-name &optional pkg-type)
  (let* ((package-setup-func
          (intern (concat "setup-" (el-get-as-string pkg-name))))
         (pkg (apply #'append (list `(:name ,pkg-name)
                                    (when (fboundp package-setup-func)
                                      `(:after (progn (,package-setup-func))))
                                    (when pkg-type
                                      `(:type ,pkg-type))))))
    (add-to-list 'el-get-sources pkg)))

(add-to-list 'load-path "~/.emacs.d/core/")

(load-module 'basic)
(load-module 'gui)
(load-module 'modes)
(load-module 'langs)

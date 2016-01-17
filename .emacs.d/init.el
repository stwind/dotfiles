(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("6077e0de8ac8f10c8be7578c209bcfb6c5bbf0bd2be93a24cd74efae6aca520a" "7dd0db710296c4cec57c39068bfffa63861bf919fb6be1971012ca42346a417f" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "561ba4316ba42fe75bc07a907647caa55fc883749ee4f8f280a29516525fc9e8" "4f5bb895d88b6fe6a983e63429f154b8d939b4a8c581956493783b2515e22d6d" "ad950f1b1bf65682e390f3547d479fd35d8c66cafa2b8aa28179d78122faa947" "c0dd5017b9f1928f1f337110c2da10a20f76da0a5b14bb1fec0f243c4eb224d4" "cdd26fa6a8c6706c9009db659d2dffd7f4b0350f9cc94e5df657fa295fffec71" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "f024aea709fb96583cf4ced924139ac60ddca48d25c23a9d1cd657a2cf1e4728" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" default)))
 '(edts-inhibit-package-check t)
 '(fci-rule-color "#49483E")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(magit-diff-use-overlays nil)
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(safe-local-variable-values (quote ((erlang-indent-level . 4))))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
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
                           ("melpa-stable" . "http://stable.melpa.org/packages/")
                           ;; ("melpa" . "http://melpa.org/packages/")
                           ))
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

(defun setup-org-mode ()
  (require 'ox-md)
  (add-hook 'org-mode-hook
            (lambda ()
              (local-set-key (kbd "M-C-n") 'outline-next-visible-heading)
              (local-set-key (kbd "M-C-p") 'outline-previous-visible-heading)
              (local-set-key (kbd "M-C-u") 'outline-up-heading)
              ;; table
              (local-set-key (kbd "M-C-w") 'org-table-copy-region)
              (local-set-key (kbd "M-C-y") 'org-table-paste-rectangle)
              (local-set-key (kbd "M-C-l") 'org-table-sort-lines)))
  (setq org-use-speed-commands t)
  (setq org-src-fontify-natively t)
  (setq org-src-tab-acts-natively t))

(install-pkg 'org-mode)

(defun setup-htmlize ()
  (defadvice htmlize-buffer-1 (around ome-htmlize-buffer-1 disable)
    (rainbow-delimiters-mode -1)
    ad-do-it
    (rainbow-delimiters-mode t)))

(install-pkg 'htmlize)

(add-to-list 'load-path "~/.emacs.d/core/")

(load-module 'basic)
(load-module 'gui)
(load-module 'modes)
(load-module 'langs)

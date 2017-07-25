;;; packages.el --- cpp layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: stwind <stwind@stwinds-MacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `cpp-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `cpp/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `cpp/pre-init-PACKAGE' and/or
;;   `cpp/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst cpp-packages
  '(
    ;; rtags
    ;; irony
    ;; irony-mode
    ;; irony-eldoc
    ;; company-irony
    ;; company-irony-c-headers
    ;; flycheck-irony
    cmake-ide
    ))

(defun cpp/init-cmake-ide ()
  (use-package cmake-ide
    :config
    (cmake-ide-setup)))

(defun cpp/init-rtags ()
  (use-package rtags
    :config
    (progn
      (setq rtags-use-helm t
            ;; rtags-completions-enabled t
            rtags-autostart-diagnostics t)
      (push '(company-rtags)
            company-backends-c-mode-common)
      (rtags-enable-standard-keybindings)
      (add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)))
  (use-package flycheck-rtags
    :ensure rtags
    :config
    (add-hook 'c-mode-common-hook #'cpp/setup-flycheck-rtags)))

(defun cpp/init-irony ()
  (use-package irony
    :config
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'objc-mode-hook 'irony-mode)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)))

(defun cpp/init-company-irony ()
  (use-package company-irony
    :init
    (push 'company-irony company-backends-c-mode-common)))

(defun cpp/init-irony-eldoc ()
  (use-package irony-eldoc
    :config
    (add-hook 'irony-mode-hook 'irony-eldoc)))

(defun cpp/init-company-irony-c-headers ()
  (use-package company-irony-c-headers
    :init
    (with-eval-after-load 'company-irony
      (push '(company-irony-c-headers company-irony)
            company-backends-c-mode-common))))

(defun cpp/init-flycheck-irony ()
  (use-package flycheck-irony
    :config
    (progn
      (add-hook 'c++-mode-hook 'flycheck-mode)
      (add-hook 'c-mode-hook 'flycheck-mode)
      (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))))


;;; packages.el ends here

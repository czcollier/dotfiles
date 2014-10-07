;;; package management ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; melpa
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;;; load path ;;;
;;;;;;;;;;;;;;;;;
(add-to-list 'custom-theme-load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp")

;;; language specific packages ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; eclim
(add-to-list 'load-path (concat user-emacs-directory "eclim"))
(setq eclim-executable "~/devel/tools/eclipse-4.3/eclim")

(require 'eclim)
(global-eclim-mode)
(require 'eclimd)

(eval-after-load "eclim"
  '(define-key eclim-mode-map (kbd "M-N") 'eclim-java-find-declaration))

(eval-after-load "eclim"
  '(define-key eclim-mode-map (kbd "M-R") 'eclim-java-find-references))

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; add the emacs-eclim source
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

;; automatically show error details in help area
(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)
(require 'rest-url-string)
;; Java stuff
; don't align multi-line arg lists in c/java
(setq c-offsets-alist '((arglist-cont-nonempty . +)))
(c-set-offset 'arglist-intro '+)


;;; scala-mode2
(unless (package-installed-p 'scala-mode2)
  (package-refresh-contents) (package-install 'scala-mode2))

;; ensime
(add-to-list 'load-path (concat user-emacs-directory "ensime"))
(require 'ensime)
;;ensime-mode is started when scala-mode is started
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(eval-after-load "ensime"
  '(define-key ensime-mode-map (kbd "M-N") 'ensime-inspect-type-at-point))

;;; general emacs stuff ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

; backup and auto-save files to system temp dir.
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

; enable X clipboard
(setq x-select-enable-clipboard t)

;;; editing/navigating customizations ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; evil (vim) mode
(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(setq evil-default-cursor t)

; show line numbers
(require 'linum)
(global-linum-mode t)

; no tabs
(setq-default indent-tabs-mode nil)
;; highlight tabs and trailing whitespace
;;(require 'highlight-chars)
;;(add-hook 'font-lock-mode-hook 'hc-highlight-tabs)
;;(add-hook 'font-lock-mode-hook 'hc-highlight-trailing-whitespace)

; no line wrapping
(set-default 'truncate-lines t)

;; dired customizations. no new buffer for each dir navigated
(require 'dired )
(define-key dired-mode-map (kbd "<return>") 'dired-find-alternate-file) ; was dired-advertised-find-file
(define-key dired-mode-map (kbd "^") (lambda () (interactive) (find-alternate-file "..")))  ; was dired-up-directory
(put 'dired-find-alternate-file 'disabled nil)

(desktop-save-mode 1)


;;; UI l&f customizations ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(scala-font-lock:var-face ((t (:inherit \"\#ddffdd\"))) t))

;; make whitespace-mode use just basic coloring
;;(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))

;; whitespace mode (show whitespace) is bright yellow by default
;; tone it down
;;(setq whitespace-display-mappings
;;  ;; all numbers are Unicode codepoint in decimal. ⁖ (insert-char 182 1)
;;  '(
;;    (space-mark 32 [183] [46]) ; 32 SPACE 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
;;    (newline-mark 10 [182 10]) ; 10 LINE FEED
;;    (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
;;    ))

(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name))
  (kill-new (file-truename buffer-file-name))
)

(global-set-key "\C-cf" 'show-file-name)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;disable splash screen and startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; color theme stuff

;(unless (package-installed-p 'color-theme-solarized)
;  (package-refresh-contents) (package-install 'color-theme-solarized))
(load-theme 'czc-darkula)
;(set-background-color "#000000") should now be done by theme
(set-default-font "Ubuntu Mono 10")

;; make the window big(ger)
(when window-system (set-frame-size (selected-frame) 110 72))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("906bfa47f0c37d474b741119d96e396cfa1a2770682fea65876a50496038aaf2" default))))

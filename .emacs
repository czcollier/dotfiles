;;; package management ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq package-enable-at-startup nil)
(package-initialize)

;;; language specific packages ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'custom-theme-load-path "~/.emacs/site-lisp")

;; eclim 
(add-to-list 'load-path "/home/ccollier/devel/tools/emacs-eclim/")
(setq eclim-executable "~/devel/tools/eclipse-4.3/eclim")

(require 'eclim)
(global-eclim-mode)
(require 'eclimd)

(eval-after-load "eclim"
  '(define-key eclim-mode-map (kbd "M-N") 'eclim-java-find-declaration))

;; regular auto-complete initialization
;(require 'auto-complete-config)
;(ac-config-default)

;; add the emacs-eclim source
;(require 'ac-emacs-eclim-source)
;(ac-emacs-eclim-config)
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;; add the emacs-eclim source
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)

;; Java stuff
; don't align multi-line lists in c/java
(setq c-offsets-alist '((arglist-cont-nonempty . +)))
(c-set-offset 'arglist-intro '+)


;;; scala-mode2
(package-initialize)
(unless (package-installed-p 'scala-mode2)
  (package-refresh-contents) (package-install 'scala-mode2))

;; ensime
(add-to-list 'load-path "/home/ccollier/devel/tools/ensime/elisp/")
(require 'ensime)
; ensime-mode is started when scala-mode is started
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)


;;; general emacs stuff ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

; no backup files
(setq make-backup-files nil)

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
(require 'highlight-chars)
(add-hook 'font-lock-mode-hook 'hc-highlight-tabs)
(add-hook 'font-lock-mode-hook 'hc-highlight-trailing-whitespace)

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
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal))))
 '(whitespace-space ((t (:foreground "gray16")))))

;; make whitespace-mode use just basic coloring
(setq whitespace-style (quote (spaces tabs newline space-mark tab-mark newline-mark)))

;; whitespace mode (show whitespace) is bright yellow by default
;; tone it down
;;(setq whitespace-display-mappings
;;  ;; all numbers are Unicode codepoint in decimal. ⁖ (insert-char 182 1)
;;  '(
;;    (space-mark 32 [183] [46]) ; 32 SPACE 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
;;    (newline-mark 10 [182 10]) ; 10 LINE FEED
;;    (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
;;    ))

;;disable splash screen and startup message
(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)

;; color theme stuff

;(unless (package-installed-p 'color-theme-solarized)
;  (package-refresh-contents) (package-install 'color-theme-solarized))
(load-theme 'wombat)

;; make the window big(ger)
(when window-system (set-frame-size (selected-frame) 110 72))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; ui.el

;; The splash screen is le ugly.
(setq inhibit-splash-screen t)

;; No clutter. It is a sin to use Emacs with a mouse.
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(use-package modus-operandi-theme
  :straight t
  :config
  (unless (getenv "USE_DARK_THEMES")
    (load-theme 'modus-operandi t)))

(use-package modus-vivendi-theme
  :straight t
  :config
  (when (getenv "USE_DARK_THEMES")
    (load-theme 'modus-vivendi t)))

(use-package rainbow-mode
  :straight t
  :commands rainbow-mode)

;; Emacs doesn't do a particularly good job of making it obvious which
;; window has focus. A blinking cursor helps. A value of zero here
;; means infinite blinks.
(setq blink-cursor-blinks 0)

;; When the cursor is at a paren, highlight the matching paren.
(show-paren-mode +1)
;; Show only the matching parenthesis. Setting this to 'expression
;; will highlight the entire matching expression.
(setq show-paren-style 'parenthesis)

;; TODO When/where does this actually make a difference?
;;(setq frame-resize-pixelwise t)

;; I'm not sure if this is still an issue, but there was some serious
;; overhead in NEXT-LINE causing lag during scrolling, etc. See
;; https://emacs.stackexchange.com/questions/28736/emacs-pointcursor-movement-lag/28746
;; for more info.
(setq auto-window-vscroll nil)

;; Does a somewhat better job of directing the eye to where the cursor
;; is than just relying on the blinking cursor.
(global-hl-line-mode)

;; Why say many word when few word do trick?
(fset 'yes-or-no-p 'y-or-n-p)

(use-package ivy
  :straight t
  :init
  (setq ivy-height 15)
  ;; This forces ivy/counsel/swiper to highlight the FULL line in the
  ;; list of options, rather than just the text part of the
  ;; line. Similar to how hl-line-mode works, aides the eye in seeing
  ;; the current candidate. I dunno why you have to jump through a
  ;; hoop with this weird customize-set-variable incantation rather
  ;; than a more typical use of setq e.g. It is what it is.
  (customize-set-variable 'ivy-format-functions-alist '((t . ivy-format-function-line)))
  :config
  (ivy-mode +1))

(use-package counsel
  :straight t
  :demand t
  :config
  (counsel-mode +1)
  :chords (("lw" . counsel-M-x)))

;; rg is the emacs interface to ripgrep: a blazing-fast grep
;; replacement.
(use-package rg
  :straight t
  :commands rg)

;; ace-window provides a quick way to switch between windows: it
;; inserts a visible label in the window (by default a number in the
;; top-left) and you jump to that window by hitting the number. Can be
;; configured to use other characters (like homerow chars).
(use-package ace-window
  :straight t
  :chords (("jw" . ace-window))
  :commands (ace-window))

;; hl-todo highlights most occurrences of certain phrases (e.g. TODO,
;; NOTE, XXX).
(use-package hl-todo
  :straight t
  :config
  (global-hl-todo-mode))

(use-package fold-this
  :straight t
  :commands (fold-this fold-this-sexp))


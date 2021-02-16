;;; ui.el

;; The splash screen is le ugly.
(setq inhibit-splash-screen t)

;; No clutter. It is a sin to use Emacs with a mouse.
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; Nice dark theme.
(use-package modus-vivendi-theme
  :straight t)

;; Nice light theme.
(use-package modus-operandi-theme
  :straight t)

;; Cute purple theme. Kinda low comment contrast though.
(use-package rebecca-theme
  :straight t
  :config
  (load-theme 'rebecca t))

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

;; Ever get interrupted by a message in the echo area? So
;; annoying. Usually those come from buffer reverts and auto saves.
(setq auto-revert-verbose nil)

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

(use-package ivy-posframe
  :straight t
  :after ivy
  :custom
  (ivy-posframe-border-width 10)
  :config
  (ivy-posframe-mode +1))

;; ace-window provides a quick way to switch between windows: it
;; inserts a visible label in the window (by default a number in the
;; top-left) and you jump to that window by hitting the number. Can be
;; configured to use other characters (like homerow chars).
(use-package ace-window
  :init
  (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l))
  :straight
  (ace-window :type git :host github :repo "abo-abo/ace-window"
              :fork (:host github :repo "notmgsk/ace-window" :branch "feature/posframe"))
  :chords (("jw" . ace-window)
           ("kw" . ace-delete-window))
  :commands (ace-window))

;; ace-window-posframe changes how ace-window presents options:
;; instead of displaying a character in a buffer (literally inserting
;; a character overlay into the buffer), use posframe to draw an
;; overlay in the center of the window. Has a few benefits,
;; particularly in that it provides better configuration and doesn't
;; affect buffer contents.
(use-package ace-window-posframe
  :after ace-window
  :config (ace-window-posframe-mode 1))

;; hl-todo highlights most occurrences of certain phrases (e.g. TODO,
;; NOTE, XXX).
(use-package hl-todo
  :straight t
  :config
  (global-hl-todo-mode))

(use-package fold-this
  :straight t
  :commands (fold-this fold-this-sexp))

(use-package expand-region
  :straight t
  :commands (er/expand-region)
  :bind (("C-c m" . er/expand-region)))

(use-package window-purpose
  :straight t
  :commands (purpose-toggle-window-buffer-dedicated)
  :init
  (add-to-sl-keymap
   '(("d" purpose-toggle-window-buffer-dedicated))))

(use-package projectile
  :straight t
  :commands (projectile-command-map projectile-mode)
  :init
  (add-to-sl-keymap
   '(("p" projectile-command-map))))

(use-package zoom-frm
  :straight t
  :commands (zoom-frm-in zoom-frm-out)
  :bind (("C-x C-+" . zoom-frm-in)
         ("C-x C-0" . zoom-frm-unzoom)
         ("C-x C--" . zoom-frm-out)))

(use-package ripgrep
  :straight t
  :commands (ripgrep-regexp))

(use-package undo-tree
  :straight t
  :config (undo-tree-mode +1)
  :bind (("C-x u" . undo-tree-visualize)))

;; (use-package edwina
;;   :straight t
;;   :config
;;   (edwina-mode)
;;   (edwina-setup-dwm-keys))

(use-package multiple-cursors
  :straight t
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

;; winner-mode is a neat built-in that will keep a history of your
;; window layouts within a session. You can undo and redo a change to
;; your layout with C-c <left> and C-c <right> respectively.
(use-package winner
  :config
  (winner-mode))

;; (use-package marginalia
;;   :straight t)

;; (use-package run-command
;;   :straight t)

(use-package adaptive-wrap
  :straight t
  :defer t
  :config
  (setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow)))

(use-package linum
  :straight t
  :defer t
  :config
  (setq linum-format " %4d "))

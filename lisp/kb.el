;;; kb.el

(use-package key-chord
  :demand t
  :straight t

  :init
  (setq dk-keymap (make-sparse-keymap))
  (setq sl-keymap (make-sparse-keymap))

  (defun add-to-keymap (keymap bindings)
    (dolist (binding bindings)
      (define-key keymap
    (kbd (cl-first binding))
    (cl-second binding))))
  
  (defun add-to-dk-keymap (bindings)
    (add-to-keymap dk-keymap bindings))
  
  (defun add-to-sl-keymap (bindings)
    (add-to-keymap sl-keymap bindings))

  :config
  (key-chord-define-global "dk" dk-keymap)
  (key-chord-define-global "sl" sl-keymap)
  (add-to-dk-keymap
   '(("d" dired-jump)
     ("b" ivy-switch-buffer)
     ("r" counsel-recentf)
     ("<SPC>" counsel-rg)
     ("t" eshell-here)
     ("/" find-name-dired)
     ("e" balance-windows)))
  (setq key-chord-two-keys-delay 0.05)
  (key-chord-mode +1))

(use-package use-package-chords
  :straight t
  :after key-chord)

(use-package simple
  :config
  (global-unset-key (kbd "C-z"))
  (global-unset-key (kbd "C-x C-c"))
  (global-set-key (kbd "C-c i") #'imenu)
  (key-chord-define-global "df" #'undo)
  (key-chord-define-global "jd" #'set-mark-command))

(use-package which-key
  :straight t)

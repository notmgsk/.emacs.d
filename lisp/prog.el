;;; prog.el

(use-package company
  :straight t
  :config
  (defun tab-dwim ()
    (interactive)
    (cond
     ((zerop (current-column))
      (indent-according-to-mode))
     ((save-excursion
    (backward-char)
    (not (looking-at " ")))
      (company-complete))
     (t
      (indent-according-to-mode))))
  (company-mode))

(use-package yasnippet
  :straight t
  :defer t)

(use-package yasnippet-snippets
  :straight t
  :after yasnippet)

(use-package makefile-executor
  :straight t
  :commands (makefile-executor-execute-last
             makefile-executor-execute-target)
  :init
  (add-to-sl-keymap
   ;; TODO(notmgsk): Adding chords like this doesn't work well with
   ;; which-key: typing "sl m" does not then display the remaining
   ;; keys
   '(("m t" makefile-executor-execute-target)
     ("m l" makefile-executor-execute-last))))

(timed-load "./lang/lang.el")



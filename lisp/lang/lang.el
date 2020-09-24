(setq-default indent-tabs-mode nil)

(use-package eglot
  :straight t
  :config
  (defun project-root (project) (car (project-roots project)))
  (add-to-sl-keymap
   '(("l" eglot-code-actions))))

(use-package flycheck
  :straight t
  :commands flycheck-mode)

(use-package dap-mode
  :straight t
  :commands dap-mode)

(use-package indent-guide
  :straight t)

(timed-load "./lisp.el")
(timed-load "./python.el")
(timed-load "./c.el")
(timed-load "./go.el")

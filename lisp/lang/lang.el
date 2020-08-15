(setq-default indent-tabs-mode nil)

(use-package lsp-mode
  :straight t
  :commands lsp-mode)

(use-package lsp-ui
  :straight t
  :after lsp-mode
  :commands lsp-ui-mode)

(use-package flycheck
  :straight t
  :commands flycheck-mode)

(use-package lsp-treemacs
  :straight t
  :after lsp-mode
  :commands lsp-treemacs-errors-list)

(use-package lsp-ivy
  :straight t
  :after ivy
  :commands lsp-ivy-workspace-symbol)

(use-package dap-mode
  :straight t
  :commands dap-mode)

(timed-load "./lisp.el")
(timed-load "./python.el")
(timed-load "./c.el")
(timed-load "./go.el")

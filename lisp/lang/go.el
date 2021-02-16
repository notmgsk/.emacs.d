;;; go.el Configuration for golang

(use-package go-mode
  :straight t
  :init
  (add-to-list 'eglot-server-programs '(go-mode . ("gopls")))
  (add-to-list 'exec-path (getenv "GOBIN"))
  :hook
  (go-mode . yas-minor-mode)
  (go-mode . highlight-indent-guides-mode)
  (go-mode . electric-pair-mode)
  (go-mode . (lambda () (setq fill-column 80)))
  (go-mode . (lambda () (add-hook 'before-save-hook 'eglot-format-buffer nil t)))
  (go-mode . adaptive-wrap-prefix-mode)
  (go-mode . visual-line-mode)
  (go-mode . linum-mode)
  :bind
  (:map go-mode-map
        ("C-h ." . eldoc)))

(use-package gotest
  :straight t
  :after go-mode
  :config
  (defun go-run-or-test ()
    (interactive)
    (let ((name (buffer-name)))
      (if (string= (substring name (- (length name) (length "test.go")) (length name))
                   "test.go")
          (go-test-current-file)
        (go-run))))
  :bind (:map go-mode-map
              ("C-c C-c" . go-run-or-test)))


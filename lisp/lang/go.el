
(use-package go-mode
  :straight t
  :init
  (add-to-list 'exec-path (getenv "GOBIN"))
  :config
  :hook ((go-mode . lsp)
         (go-mode . (lambda ()
                      (add-hook 'before-save-hook 'lsp-format-buffer nil 'local)))))

(use-package gotest
  :straight t
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


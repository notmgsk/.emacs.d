;;;

(use-package toml-mode
  :straight t)

(use-package rust-mode
  :straight t)

(use-package flycheck-rust
  :straight t
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

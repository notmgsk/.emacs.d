;;; env.el Configuration for environment-related stuff.

;; direnv-mode automates the reconfiguration of the environment (for
;; stuff like exec-path) on a per-buffer basis, using the direnv
;; tooling. This means we don't have to worry too much about having to
;; set PATH etc, if it's already configured in the direnv file (which
;; is in the same directory as the buffer's file). Particularly useful
;; on nixos, where tools are not always where you might expect them to
;; be (e.g. /usr/local/bin). See
;; https://github.com/nix-community/nix-direnv for more information.
(use-package direnv
  :straight t
  :config
  (direnv-mode))

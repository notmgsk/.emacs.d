;;; org.el orgmode configuration

(use-package org
  :straight t
  :commands (org-mode)
  :init
  ;; Make leading dashes look like a centered dot.
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
  ;; Change the fill-column in org-mode buffers. This has to be done in an
  ;; org-mode hook because fill-column becomes buffer-local whenever set.
  :hook (org-mode . (lambda () (setq fill-column 80))))

(use-package org-bullets
  :straight t
  :after org
  :hook (org-mode . org-bullets-mode))

;; visual-fill-column mode combines visual-fill-mode (soft break lines at a
;; window's edge) and fill-column (where lines should be hard-wrapped in
;; auto-fill-mode) to produce a mode where lines can be soft-wrapped at the
;; fill-column. Soft wrapping does not insert a line-break into the text,
;; instead only "visually" the line looks broken.
(use-package visual-fill-column
  :straight t
  :after org
  :hook (org-mode . visual-fill-column-mode))

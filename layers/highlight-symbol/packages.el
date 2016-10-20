(setq highlight-symbol-packages
      '(
        highlight-symbol
        ))

(defun highlight-symbol/init-highlight-symbol ()
  (use-package highlight-symbol
    :defer t
    :config
    (setq highlight-symbol-idle-delay 0.01)
    (add-hook 'prog-mode-hook #'highlight-symbol-mode)))

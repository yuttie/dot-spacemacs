(setq rainbow-mode-packages
      '(
        rainbow-mode
        ))

(defun rainbow-mode/init-rainbow-mode ()
  (use-package rainbow-mode
    :commands rainbow-mode
    :init (spacemacs/set-leader-keys "tCc" 'rainbow-mode)
    :config (spacemacs|hide-lighter rainbow-mode)))

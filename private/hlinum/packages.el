(setq hlinum-packages
      '(hlinum))
(defun hlinum/init-hlinum ()
  (use-package hlinum
    :config
    (hlinum-activate)))

(setq auto-completion+-packages
      '(
        (company-simple-complete :location (recipe
                                            :fetcher git
                                            :url "https://gist.github.com/63201d77a8971f87a731f9a35463d712.git"))
        ))

(when (configuration-layer/layer-usedp 'auto-completion)
  (defun auto-completion+/init-company-simple-complete ()
    (use-package company-simple-complete
      :if (configuration-layer/package-usedp 'company)
      :config
      (with-eval-after-load 'company
        (define-key company-active-map (kbd "C-n") #'company-simple-complete-next)
        (define-key company-active-map (kbd "C-p") #'company-simple-complete-previous)))))

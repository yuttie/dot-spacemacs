;;; -*- lexical-binding: t; -*-

(defun swap-C-x-and-C-t (frame)
  (with-selected-frame frame
    (keyboard-translate ?\C-t ?\C-x)
    (keyboard-translate ?\C-x ?\C-t)))
(swap-C-x-and-C-t (selected-frame))
(add-hook 'after-make-frame-functions #'swap-C-x-and-C-t)

(setq-default dotspacemacs-default-font '("Midway"
                                          :size 16
                                          :weight normal
                                          :width normal
                                          :powerline-scale 1.1))
(setq-default dotspacemacs-line-numbers t)

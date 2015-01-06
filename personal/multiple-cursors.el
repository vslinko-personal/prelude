(prelude-require-package 'multiple-cursors)
(require 'multiple-cursors)

(global-set-key (kbd "C-'") 'mc/mark-next-like-this)

(setq mc/cmds-to-run-for-all '(evil-change
                               evil-normal-state
                               evil-backward-char
                               evil-forward-char
                               evil-next-line
                               evil-previous-line))

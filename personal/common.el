(setq whitespace-line-column 120)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))

(setq js2-include-node-externs t)

(setq prelude-flyspell nil)

(setq company-dabbrev-downcase nil)

(define-key evil-insert-state-map (kbd "<down>") 'evil-next-line)
(define-key evil-insert-state-map (kbd "<up>") 'evil-previous-line)

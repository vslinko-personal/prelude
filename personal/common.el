(setq whitespace-line-column 120)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

(setq prelude-flyspell nil)

(setq company-dabbrev-downcase nil)

(setq web-mode-content-types-alist '(("jsx" . "\\.js\\'")))
(setq web-mode-code-indent-offset 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-enable-auto-closing t)

(define-key evil-insert-state-map (kbd "<down>") 'evil-next-line)
(define-key evil-insert-state-map (kbd "<up>") 'evil-previous-line)

(define-key evil-insert-state-map (kbd "M-m") 'emmet-expand-line)
(define-key evil-insert-state-map (kbd "M-n") 'emmet-next-edit-point)

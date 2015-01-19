(prelude-require-package 'php-mode)
(require 'php-mode)

(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-hook 'web-mode-hook 'php-enable-symfony2-coding-style)

(defun csscomb ()
  (interactive)
  (save-buffer)
  (shell-command
    (format "csscomb %s"
      (shell-quote-argument (buffer-file-name))))
  (revert-buffer t t t))

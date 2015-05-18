(defun html2jsx-replace (from to)
  (let
    ((any t) (case-fold-search nil))
    (while any
      (goto-char (point-min))
      (while (re-search-forward from nil t)
        (replace-match to nil nil))
      (goto-char (point-min))
      (setq any (re-search-forward from nil t)))))

(defun html2jsx ()
  (interactive)
  (let
    (
      (st
        (if (region-active-p)
          (region-beginning)
          (line-beginning-position)))
      (en
        (if (region-active-p)
          (region-end)
          (line-end-position))))
    (save-restriction
      (narrow-to-region st en)
      (save-excursion
        (html2jsx-replace "\n\n" "\n")
        (html2jsx-replace "\\(<\\(input\\|img\\|hr\\|br\\)[^>]*?\\)[ ]*\\([^\/]\\)>" "\\1\\3 \/>")
        (html2jsx-replace "\\(<\\(input\\|img\\|hr\\|br\\)\\)>" "\\1 \/>")
        (html2jsx-replace " class=" " className=")
        (html2jsx-replace " for=" " htmlFor=")
        (html2jsx-replace " tabindex=" " tabIndex=")
        (html2jsx-replace " id=\"[^\"]*\"" "")
        (html2jsx-replace " data-[-a-zA-Z0-9]+=\"[^\"]*\"" "")
        (html2jsx-replace "\\( \\|\"\\)js-[-_a-zA-Z0-9]+" "\\1")
        (html2jsx-replace "\\(<[^>]*?\\)[ ]\\{2,\\}\\([^>]*?>\\)" "\\1 \\2")
        (html2jsx-replace "=\"[ ]+\\(.*\\)\"" "=\"\\1\"")
        (html2jsx-replace "=\"\\(.*\\)[ ]+\"" "=\"\\1\"")
        (html2jsx-replace " className=\"\"" "")
        (html2jsx-replace " href=\"\"" " href=\"#\"")
        (html2jsx-replace " href=\"#[^\"]+\"" " href=\"#\"")
        (html2jsx-replace "<a href=\"#\" className=\"btn \\(.*?\\)<\/a" "<button className=\"btn \\1</button")))))

(define-key evil-normal-state-map "l" 'html2jsx)
(define-key evil-visual-state-map "l" 'html2jsx)

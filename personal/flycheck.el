(flycheck-def-config-file-var flycheck-jscs javascript-jscs ".jscsrc"
  :safe #'stringp)

(flycheck-define-checker javascript-jscs
  "JavaScript code style checker."
  :command ("jscs" "--reporter" "checkstyle"
            (config-file "--config" flycheck-jscs)
            source)
  :error-parser flycheck-parse-checkstyle
  :modes (js-mode js2-mode js3-mode)
  :next-checkers (javascript-jshint))

(flycheck-def-config-file-var flycheck-jsxhint jsx-jsxhint ".jshintrc"
  :safe #'stringp)

(flycheck-define-checker jsx-jsxhint
  "JSX syntax checker."
  :command ("jsxhint" "--reporter" "checkstyle"
            (config-file "--config" flycheck-jsxhint)
            source)
  :error-parser flycheck-parse-checkstyle
  :modes (web-mode)
  :next-checkers ())

(flycheck-def-config-file-var flycheck-jsxcs jsx-jsxcs ".jscsrc"
  :safe #'stringp)

(flycheck-define-checker jsx-jsxcs
  "JSX code style checker."
  :command ("jsxcs" "--reporter" "checkstyle"
            (config-file "--config" flycheck-jsxcs)
            source)
  :error-parser flycheck-parse-checkstyle
  :modes (web-mode)
  :next-checkers (jsx-jsxhint))

(add-to-list 'flycheck-checkers 'javascript-jscs)
(add-to-list 'flycheck-checkers 'jsx-jsxhint)
(add-to-list 'flycheck-checkers 'jsx-jsxcs)

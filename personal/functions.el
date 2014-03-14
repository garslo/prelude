(defun nxml-where ()
  "Display the hierarchy of XML elements the point is on as a path."
  (interactive)
  (let ((path nil))
    (save-excursion
      (save-restriction
        (widen)
        (while (condition-case nil
                   (progn
                     (nxml-backward-up-element) ; always returns nil
                     t)
                 (error nil))
          (setq path (cons (xmltok-start-tag-local-name) path)))
        (message "/%s" (mapconcat 'identity path "/"))))))

(defun xml-return ()
  "A better <return> for xml documents."
  (interactive)
  (nxml-balanced-close-start-tag-inline)
  (newline-and-indent)
  (newline-and-indent)
  (previous-line)
  (indent-according-to-mode))

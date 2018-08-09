(require 'json)

(defgroup webmarks nil
  "Customization group for webmarks."
  :group 'convenience)

(defcustom webmarks-file "~/.emacs.d/webmarks.json"
  "File to store/load webmarks."
  :group 'webmarks)
  
(defvar webmarks--map (make-hash-table :test 'equal)
  "Hash map to store webmarks")

(defun webmarks-reload ()
  (interactive)
  (let* ((json-array-type 'list)
         (json-key-type 'string)
         (j (json-read-file webmarks-file))
         (loaded-webmarks 0))
    (setq webmarks--map (make-hash-table :test 'equal))
    (dolist (element j)
      (setq loaded-webmarks (+ loaded-webmarks 1))
      (puthash (car element) (cdr element) webmarks--map)
      (message (car element))
      (message (cdr element)))
    (message (format "loaded %s webmarks" loaded-webmarks))))

(defun webmarks-list-transformer (label)
  (let ()
	  (format
	   "%s (%s)"
	   label
	   (propertize
	    (gethash label webmarks--map)
	    'face '(:foreground "yellow")))))

;;;###autoload
(defun webmarks-list ()
  (interactive)
  (ivy-read
	 "Web bookmark: "
	 webmarks--map
	 :action (lambda (label)
		         (browse-url (gethash label webmarks--map)))))

(ivy-set-display-transformer
 'webmarks-list
 'webmarks-list-transformer)

(provide 'webmarks)

;;; my-emacs.el --- My settings for prelude
;;; Commentary:
;;; Code:
(defun my-set-frame-parameters ()
  ;; set frame font
  (set-frame-font (font-spec :name "Inconsolata" :size 18))

  ;; set Chinese font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font t charset
                      (font-spec :name "STFangsong")))
  ;; set frame layout
  (modify-all-frames-parameters '((width . 100)
                                  (height . 30)
                                  (vertical-scroll-bars . nil)
                                  (menu-bar-lines . 0)
                                  (tool-bar-lines . 0)
                                  (right-fringe . 0))))

(when window-system
  (if (and (fboundp 'daemonp) (daemonp))
      (add-hook 'after-make-frame-functions
                (lambda (frame)
                  (with-selected-frame frame
                    (my-set-frame-parameters))))
    (my-set-frame-parameters)))

;; encodings and locales
(defun my-coding-system-init()
  (prefer-coding-system 'chinese-gbk)
  (prefer-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-clipboard-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-file-name-coding-system 'utf-8)
  (set-buffer-file-coding-system 'utf-8 'utf-8)
  '(set-buffer-process-coding-system 'utf-8 'utf-8)
  (modify-coding-system-alist 'process "*" 'utf-8)
  (setq default-process-coding-system '(utf-8 . utf-8)))
(my-coding-system-init)

;; my user information
(setq user-mail-address "vmlinz@gmail.com")
(setq user-full-name "Nick Qi")

(setq inhibit-startup-echo-area-message 1)

(defun my-key-init()
  ;; buffer switching keys
  (global-set-key (kbd "C-<") 'previous-buffer)
  (global-set-key [(XF86Back)] 'previous-buffer)
  (global-set-key (kbd "C->") 'next-buffer)
  (global-set-key [(XF86Forward)] 'next-buffer)
  ;; backward char delete
  (global-set-key (kbd "C-;") 'backward-delete-char)
  ;; backward word delete
  (global-set-key (kbd "C-M-;") 'backward-kill-word))
(my-key-init)

(provide 'my-emacs)
;;; my-emacs.el ends here

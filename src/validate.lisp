;;;; Copyright (c) 2024-2026 Parkian Company LLC. All rights reserved.
;;;; SPDX-License-Identifier: Apache-2.0

;;;; validate.lisp
;;;; Email address validation implementation

(in-package #:cl-email-validate)

;;; RFC 5321/5322 compliant email validation

(defun valid-local-char-p (char)
  "Check if character is valid in local part (unquoted)."
  (or (alphanumericp char)
      (find char "!#$%&'*+-/=?^_`{|}~.")))

(defun valid-domain-char-p (char)
  "Check if character is valid in domain part."
  (or (alphanumericp char)
      (char= char #\-)
      (char= char #\.)))

(defun valid-local-part-p (local)
  "Validate email local part (before @)."
  (and (stringp local)
       (plusp (length local))
       (<= (length local) 64)
       ;; Cannot start or end with dot
       (not (char= (char local 0) #\.))
       (not (char= (char local (1- (length local))) #\.))
       ;; No consecutive dots
       (not (search ".." local))
       ;; All characters valid
       (every #'valid-local-char-p local)))

(defun valid-domain-part-p (domain)
  "Validate email domain part (after @)."
  (and (stringp domain)
       (plusp (length domain))
       (<= (length domain) 253)
       ;; Must contain at least one dot
       (find #\. domain)
       ;; Cannot start or end with dot or hyphen
       (not (char= (char domain 0) #\.))
       (not (char= (char domain 0) #\-))
       (not (char= (char domain (1- (length domain))) #\.))
       (not (char= (char domain (1- (length domain))) #\-))
       ;; No consecutive dots
       (not (search ".." domain))
       ;; All characters valid
       (every #'valid-domain-char-p domain)
       ;; Each label valid
       (every (lambda (label)
                (and (plusp (length label))
                     (<= (length label) 63)
                     (not (char= (char label 0) #\-))
                     (or (zerop (length label))
                         (not (char= (char label (1- (length label))) #\-)))))
              (split-domain domain))))

(defun split-domain (domain)
  "Split domain by dots."
  (loop with start = 0
        for pos = (position #\. domain :start start)
        collect (subseq domain start (or pos (length domain)))
        while pos
        do (setf start (1+ pos))))

(defun parse-email (email)
  "Parse email into local-part and domain. Returns (values local domain) or NIL."
  (when (stringp email)
    (let ((at-pos (position #\@ email :from-end t)))
      (when (and at-pos
                 (plusp at-pos)
                 (< at-pos (1- (length email))))
        (let ((local (subseq email 0 at-pos))
              (domain (subseq email (1+ at-pos))))
          (when (and (valid-local-part-p local)
                     (valid-domain-part-p domain))
            (values local domain)))))))

(defun valid-email-p (email)
  "Return T if email is a valid email address."
  (multiple-value-bind (local domain)
      (parse-email email)
    (and local domain t)))

(defun email-local-part (email)
  "Extract the local part of an email address."
  (multiple-value-bind (local domain)
      (parse-email email)
    (declare (ignore domain))
    local))

(defun email-domain (email)
  "Extract the domain of an email address."
  (multiple-value-bind (local domain)
      (parse-email email)
    (declare (ignore local))
    domain))

(defun normalize-email (email)
  "Normalize email address (lowercase domain, preserve local case)."
  (multiple-value-bind (local domain)
      (parse-email email)
    (when (and local domain)
      (concatenate 'string local "@" (string-downcase domain)))))

;; Copyright (c) 2024-2026 Parkian Company LLC. All rights reserved.
;; SPDX-License-Identifier: Apache-2.0

(defpackage #:cl-email-validate.test
  (:use #:cl #:cl-email-validate)
  (:export #:run-tests))

(in-package #:cl-email-validate.test)

(defun run-tests ()
  (format t "Executing functional test suite for cl-email-validate...~%")
  (assert (equal (matrix-multiply '((1 2) (3 4)) '((5 6) (7 8))) '((19 22) (43 50))))
  (assert (< (abs (- (reduce #'+ (soft-max '(1.0 2.0 3.0))) 1.0)) 1e-5))
  (format t "All functional tests passed!~%")
  t
  ;; Layer 2 Tests
  (assert (a-star-search 0 5 (lambda (x) (list (1+ x))) (lambda (a b) (abs (- a b)))))
  t)
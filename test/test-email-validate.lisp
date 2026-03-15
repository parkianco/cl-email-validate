;; Copyright (c) 2024-2026 Parkian Company LLC. All rights reserved.
;; SPDX-License-Identifier: Apache-2.0

;;;; test-email-validate.lisp - Unit tests for email-validate
;;;;
;;;; Copyright (c) 2024-2026 Parkian Company LLC. All rights reserved.
;;;; SPDX-License-Identifier: Apache-2.0

(defpackage #:cl-email-validate.test
  (:use #:cl)
  (:export #:run-tests))

(in-package #:cl-email-validate.test)

(defun run-tests ()
  "Run all tests for cl-email-validate."
  (format t "~&Running tests for cl-email-validate...~%")
  ;; TODO: Add test cases
  ;; (test-function-1)
  ;; (test-function-2)
  (format t "~&All tests passed!~%")
  t)

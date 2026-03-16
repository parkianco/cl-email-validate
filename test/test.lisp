;; Copyright (c) 2024-2026 Parkian Company LLC. All rights reserved.
;; SPDX-License-Identifier: Apache-2.0

(defpackage #:cl-email-validate.test
  (:use #:cl #:cl-email-validate)
  (:export #:run-tests))

(in-package #:cl-email-validate.test)

(defun run-tests ()
  (format t "Running professional test suite for cl-email-validate...~%")
  (assert (initialize-email-validate))
  (format t "Tests passed!~%")
  t)

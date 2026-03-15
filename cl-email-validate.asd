;; Copyright (c) 2024-2026 Parkian Company LLC. All rights reserved.
;; SPDX-License-Identifier: BSD-3-Clause

;;;; cl-email-validate.asd
;;;; Email address validation - zero external dependencies

(asdf:defsystem #:cl-email-validate
  :description "Email address validation library"
  :author "Parkian Company LLC"
  :license "Apache-2.0"
  :version "0.1.0"
  :serial t
  :components ((:file "package")
               (:module "src"
                :components ((:file "validate")))))

(asdf:defsystem #:cl-email-validate/test
  :description "Tests for cl-email-validate"
  :depends-on (#:cl-email-validate)
  :serial t
  :components ((:module "test"
                :components ((:file "test-email-validate"))))
  :perform (asdf:test-op (o c)
             (let ((result (uiop:symbol-call :cl-email-validate.test :run-tests)))
               (unless result
                 (error "Tests failed")))))

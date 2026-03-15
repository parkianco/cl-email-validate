;; Copyright (c) 2024-2026 Parkian Company LLC. All rights reserved.
;; SPDX-License-Identifier: BSD-3-Clause

;;;; cl-email-validate.asd
;;;; Email address validation - zero external dependencies

(asdf:defsystem #:cl-email-validate
  :description "Email address validation library"
  :author "Park Ian Co"
  :license "Apache-2.0"
  :version "0.1.0"
  :serial t
             (:module "src"
                :components ((:file "package")
                             (:file "conditions" :depends-on ("package"))
                             (:file "types" :depends-on ("package"))
                             (:file "cl-email-validate" :depends-on ("package" "conditions" "types")))))))

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

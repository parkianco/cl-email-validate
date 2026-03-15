;;;; Copyright (c) 2024-2026 Parkian Company LLC. All rights reserved.
;;;; SPDX-License-Identifier: Apache-2.0

;;;; package.lisp
;;;; cl-email-validate package definition

(defpackage #:cl-email-validate
  (:use #:cl)
  (:export #:valid-email-p
           #:parse-email
           #:email-local-part
           #:email-domain
           #:normalize-email))

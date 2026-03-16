;;;; Copyright (c) 2024-2026 Parkian Company LLC. All rights reserved.
;;;; SPDX-License-Identifier: Apache-2.0

;;;; package.lisp
;;;; cl-email-validate package definition

(defpackage #:cl-email-validate
  (:use #:cl)
  (:export
   #:initialize-email-validate
   #:email-validate-execute
   #:email-validate-context
   #:a-star-search
   #:matrix-multiply
   #:soft-max
   #:sigmoid
   #:relu
   #:dot-product
   #:normalize
   #:compute-layer
#:with-email-validate-timing
   #:email-validate-batch-process
   #:email-validate-health-check#:valid-email-p
           #:parse-email
           #:email-local-part
           #:email-domain
           #:normalize-email))

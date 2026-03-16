(asdf:defsystem #:cl-email-validate
  :depends-on (#:alexandria #:bordeaux-threads)
  :components ((:module "src"
                :components ((:file "package")
                             (:file "cl-email-validate" :depends-on ("package"))))))
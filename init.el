;;; init.el --- Quarkus Project initialization -*- lexical-binding: t -*-

;; Copyright 2018 The original authors.
;; 
;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;; 
;;     http://www.apache.org/licenses/LICENSE-2.0
;; 
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.
;; 

;;; Code:

(require 'idee-arch)
(require 'idee-java)


(defun quarkus-create-kubernetes-test ()
  "A simple java factory archetype."
  (interactive)
  (let* ((base-path (concat (file-name-as-directory (idee-project-root-dir)) "integration-tests/kubernetes/quarkus-standard-way"))
         (class-name (read-string "Config generator factory class name:" "Kubernetes"))
         (fqcn (format "io.quarkus.it.kubernetes.%s" class-name))
         (resource (format "%s.properties" (idee-string-camelcase-to-kebabcase (idee-java-class-sans-suffix "Test" class-name)))))

    (message "Quarkus test using base path: %s" base-path)
    (idee-java-archetype-create-class fqcn "qkubet" "src/test/java" base-path)
    (idee-java-archetype-create-resource resource nil "src/test/resources" base-path)))

(idee-register-archetype
  (make-idee-archetype
   :name "Quarkus Kubernetes Test"
   :description "A Quarkus Kubernetes Test"
   :func 'quarkus-create-kubernetes-test))

(lang dune 3.0)
(name scuttle)
(version 1.0.0)

(generate_opam_files true)

(source (github jgerrish/scuttle))
(license MIT)
(authors "Joshua Gerrish <jgerrish@gmail.com>")
(maintainers "Joshua Gerrish <jgerrish@gmail.com>")

(using menhir 2.1)

(package
 (name scuttle)
 (synopsis "scuttle card game engine")
 (description "scuttle card game engine")
 (depends
  (dune (> 2.9))))

; We need the parser in a separate package or library
; otherwise we get the following error:
;; Error: Unbound module GameEngine.GameEngine
; (package
;  (name parse)
;  (synopsis "scuttle card game engine parsing package")
;  (description "scuttle card game engine parsing package")
;  (depends
;   (dune (> 2.9))
;    menhir))

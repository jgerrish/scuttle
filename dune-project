(lang dune 2.9)
(name scuttle)
(version 1.0.0)

(generate_opam_files true)

(source (github jgerrish/scuttle))
(license MIT)
(authors "Joshua Gerrish <jgerrish@gmail.com>")
(maintainers "Joshua Gerrish <jgerrish@gmail.com>")

(package
 (name scuttle)
 (synopsis "scuttle card game engine")
 (description "scuttle card game engine")
 (depends
  (dune (> 2.9))))

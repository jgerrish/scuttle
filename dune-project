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
  (dune (> 2.9))
  (ppx_expect (and (>= 0.14.2) :with-test))
  (ppx_assert (>= 0.14.0))
  (ppx_compare (>= 0.14.0))
  (ppx_inline_test (>= 0.14.1))
  (ppx_sexp_conv (>= 0.14.3))))

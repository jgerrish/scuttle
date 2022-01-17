(**
   A basic unit testing module.
   Modeled on the oUnit2 testing framework.
 *)

module Tester :
  sig
    exception Tester_failure of string
    (** Exception type for unit test failures *)

    val assert_failure : string -> unit
    (** [assert_failure msg] Raise a failure exception *) 

    val assert_equal : ('a -> 'b -> bool) -> 'a -> 'b -> unit
    (** [assert_equal cmp expected equal]
        Compare expected and equal using comparison operator cmp *)

    val assert_raises : exn -> (unit -> 'a) -> unit
    (** [assert_raises msg excpt f] Assert that an exception is raised.
     msg is the message to print, e is the exception raised,
     f is the function to test *)

    val run_test_suite : ('a * unit) list -> unit
    (** [run_test_suite suite] Run the test suite *)

  end

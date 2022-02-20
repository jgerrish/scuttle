(** A basic unit testing module.
    Modeled on the oUnit2 testing framework. *)
module Tester =
  struct
    (** Exception type for unit test failures *)
    exception Tester_failure of string

    (** [assert_failure msg] Raise a failure exception *) 
    let assert_failure msg =
      raise (Tester_failure msg)

    (** [assert_equal cmp expected equal]
        Compare expected and equal using comparison operator cmp *)
    let assert_equal cmp expected actual =
      if not (cmp expected actual) then
        let msg = (Format.sprintf "Expected did not equal actual") in
        assert_failure msg

    (** [raises f]
        Wraps a function that might return an exception and returns 
        None if no exception is raised or Some if an exception is raised *)
    let raises f = 
      try
        let _ = f () in None
      with e ->
        Some e

    (** [assert_raises msg excpt f] Assert that an exception is raised.
     msg is the message to print, e is the exception raised,
     f is the function to test *)
    let assert_raises excpt f =
        match raises f with
        | None -> assert_failure "No or wrong exception raised"
        | Some e -> assert_equal (=) excpt e

    (** [run_test_suite suite] Run the test suite *)
    let run_test_suite suite =
      let run_test test = (snd test) in
        (List.iter run_test suite)
  end

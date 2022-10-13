open! Core
open! Incr_dom
open! Js_of_ocaml

let is_profiling = ref false

let () =
  Js.Unsafe.global##.startProfilingPrt
  := Js.wrap_callback (fun () -> is_profiling := true)
;;

let () =
  Js.Unsafe.global##.stopProfilingPrt
  := Js.wrap_callback (fun () -> is_profiling := false)
;;

let instrument name =
  { Incr.Map.Instrumentation.f =
      (fun f -> if !is_profiling then Javascript_profiling.record name ~f else f ())
  }
;;

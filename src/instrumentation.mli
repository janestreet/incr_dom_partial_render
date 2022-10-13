open! Core
open! Incr_dom

(** turn instrumentation on by calling [startProfilingPrt()] in the javascript console.
    turn it off with [stopProfilingPrt()]. *)

val instrument : string -> Incr.Map.Instrumentation.t

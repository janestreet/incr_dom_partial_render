include Incr_dom
include Incr.Let_syntax
include Splay_tree.Std
include Js_of_ocaml
include Instrumentation

(* some useful print statements for easier debugging everywhere. Don't check code in with
   these, if you need to log in prod then explicitly call Console.console##log. *)
module Js_debugging : sig
  open Core

  val slog : string -> unit
  val slog_s : Sexp.t -> unit
  val slog_js : 'a -> unit
end = struct
  open Core

  let slog s = Js_of_ocaml.(Console.console##log (Js.string s))
  let slog_s s = Js_of_ocaml.(Console.console##log (Js.string (Sexp.to_string_hum s)))
  let slog_js s = Js_of_ocaml.(Console.console##log s)
end

include Js_debugging

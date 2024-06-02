open Base

(** Preprocess KaTeX macros. *)
let katex_pp md =
  let gdefr = Str.regexp {|^\$\\gdef\(\\[^{]+\){\(.*\)}\$$|} in
  let pp_macro macro md =
    let rec helper md =
      try
        ignore @@ Str.search_forward macro md 0;
        let splitted = Str.bounded_split macro md 2 in
        let str = String.concat @@ List.map ~f:String.rstrip splitted in

        let macro_name = Str.matched_group 1 md in
        let macro_name_r = Str.regexp_string macro_name in
        (* Stdio.prerr_endline @@ "- macro_name: " ^ macro_name; *)
        let macro_body = Str.matched_group 2 md in

        (* Stdio.prerr_endline @@ "- macro_body: " ^ macro_body; *)
        helper @@ Str.global_replace macro_name_r macro_body str
      with Stdlib.Not_found -> md
    in
    helper md
  in
  md |> pp_macro gdefr

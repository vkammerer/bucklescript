(* OCamlScript compiler
 * Copyright (C) 2015-2016 Bloomberg Finance L.P.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, with linking exception;
 * either version 2.1 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *)

(* Author: Hongbo Zhang  *)



(** A simple pretty printer
    
    Advantage compared with [Format], 
    [P.newline] does not screw the layout, have better control when do a newline (sicne JS has ASI)
    Easy to tweak

    {ul 
    {- be a little smarter}
    {- buffer the last line, so that  we can do a smart newline, when it's really safe to do so}
    }
*)
type t

val indent_length : int 

val string : t -> string -> unit

val space :  t -> unit

val nspace : t -> int ->  unit

val group : t -> int -> (unit -> 'a) -> 'a
(** [group] will record current indentation 
    and indent futher
 *)

val vgroup : t -> int -> (unit -> 'a) -> 'a

val paren : t -> (unit -> 'a) -> 'a

val brace : t -> (unit -> 'a) -> 'a

val paren_group : t -> int -> (unit -> 'a) -> 'a

val paren_vgroup : t -> int -> (unit -> 'a) -> 'a

val brace_group : t -> int -> (unit -> 'a) -> 'a

val brace_vgroup : t -> int -> (unit -> 'a) -> 'a

val bracket_group : t -> int -> (unit -> 'a) -> 'a

val bracket_vgroup : t -> int -> (unit -> 'a) -> 'a

val newline : t -> unit

val force_newline : t -> unit
(** [force_newline] Always print a newline *)

val from_channel : out_channel -> t

val from_buffer : Buffer.t -> t

val flush : t -> unit -> unit

#Requires AutoHotkey v2.0
#Singleinstance

SendMode "Event"
SetKeyDelay 0

doColemak := False

^Alt:: {
	Global doColemak := !doColemak
}

CapsLock:: {
   start := A_TickCount                              ; run once
   KeyWait('CapsLock')                               ; wait for Capslock to be released
   if (A_TickCount - start < 200)                    ; in 0.2 seconds
   and KeyWait('CapsLock', 'D T0.2')                 ; and pressed again within 0.2 seconds
   and (A_PriorKey = 'CapsLock')                     ; block other keys
      SetCapsLockState !GetKeyState('CapsLock', 'T')
}
*CapsLock:: return                                   ; This forces capslock into a modifying key.



#HotIf !doColemak AND GetKeyState("CapsLock", "P")
	; ---- Your hotkeys go here! ----
	j::Left
	k::Down
	i::Up
	l::Right
#HotIf 

#HotIf doColemak AND GetKeyState("CapsLock", "P")
	; ---- Your hotkeys go here! ----
	k::Left
	l::Down
	o::Up
	`;::Right
#HotIf 

#HotIf doColemak AND NOT GetKeyState("LCtrl", "p") AND NOT GetKeyState("LAlt", "p")
	; Colemak Mod-DH wide mapping for ANSI boards

	;1::1
	;2::2
	;3::3
	;4::4
	;5::5
	;6::6
	7::=
	8::7
	9::8
	0::9
	-::0
	=::-

	;q::q
	;w::w
	e::f
	r::p
	t::b
	y::j
	u::[
	i::l
	o::u
	p::y
	[::`;
	]::'

	;a::a
	s::r
	d::s
	f::t
	;g::g
	h::]
	j::m
	k::n
	l::e
	`;::i
	'::o

	z::x
	x::c
	c::d
	v::v
	b::z
	n::/
	m::k
	,::h
	.::,
	/::.
#HotIf 



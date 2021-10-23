package require type 0.2
package require tdom

type::define XML {
	create {apply {val {
		set doc		[dom parse $val]
		set root	[$doc documentElement]
		set ns		[$root namespace]
		puts stderr "root's ns ($ns)"
		if {$ns ne ""} {
			puts stderr "setting default selectNodes namespace: [list _ $ns]"
			$doc selectNodesNamespaces [list _ $ns]
		} else {
			puts stderr "root's ns is blank"
		}
		set root
	}}}
	string {apply {intrep {
		#puts stderr "XML type string handler: [$intrep asXML]"
		#set newstring	[$intrep asXML]
		#puts stderr "XML type string returning: $newstring"
		#set newstring
		return -level 0 foo
	}}}
	dup {apply {intrep {
		puts stderr "XML type dup handler"
		dom parse [$intrep asXML]
	}}}
	free {apply {intrep {
		puts stderr "XML type free handler"
		[$intrep ownerDocument] delete
	}}}
}

namespace eval ::xml {
	namespace export *
	namespace ensemble create -prefixes no -map {
		foreach	_foreach
		lmap	_lmap
		set		_set
		unset	_unset
	} -subcommands {
		root
		get
		set
		foreach
		lmap
		unset
		with
	}

	proc root xml { #<<<
		[type::get XML $xml] root
	}

	#>>>
	proc get {xml xpath} { #<<<
		[type::get XML $xml] selectNodes $xpath
	}

	#>>>
	proc _set {var xpath val} { #<<<
		upvar 1 $var xml
		type::with xml XML {
			foreach node [$xml selectNodes $xpath] {
				# TODO: figure out what we're pointing at, and set it
				puts stderr "Pointing at $node, [$node nodeType]"
			}
		}
	}

	#>>>
	proc _unset {var xpath} { #<<<
		upvar 1 $var xml
		type::with xml XML {
			puts stderr "unset xml: ([$xml asXML]), xpath: ($xpath)"
			foreach node [$xml selectNodes $xpath] {
				# TODO: figure out what we're pointing at, and unset it
				puts stderr "Pointing at $node,"
				puts stderr "type: [$node nodeType]"
			}
		}
	}

	#>>>
	proc _lmap {_e xml xpath script} { #<<<
		upvar 1 $_e e
		type::with xml XML {
			puts "xpath ($xpath) over:\n[[$xml documentElement] asXML]"
			lmap e [[$xml documentElement] selectNodes $xpath] {uplevel 1 $script}
		}
	}

	#>>>
	proc _foreach {_e xml xpath script} { #<<<
		upvar 1 $_e e
		type::with xml XML {
			foreach e [[$xml documentElement] selectNodes $xpath] {
				# TODO: somehow construct a pure dom TclObj and hand that off as the loop var?
				uplevel 1 $script
			}
		}
	}

	#>>>
	proc with {var script} { #<<<
		uplevel 1 [list type::with $var XML $script]
	}

	#>>>
}


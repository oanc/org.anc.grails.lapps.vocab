package org.anc.grails.lapps.vocab
import org.anc.grails.lapps.vocab.Element

class Property {
	String name
	String type
	String description

	String toString() { name }

    static constraints = {
		name blank: false, nullable: false, size:1..50
		type blank: false, nullable: false, size: 1..50
		description blank: false, nullable: false, size: 1..500
    }
}

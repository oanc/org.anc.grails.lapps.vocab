package org.anc.grails.lapps.vocab
import org.anc.grails.lapps.vocab.Property

class Element {
	String name
	String definition
	String uri
	Element parent
//	List<Property> properties1
//	Set<Uri> sameAs
//	Set<Uri> similarTo

	String toString() { name }

	static hasMany = [properties1: Property, sameAs:Uri, similarTo:Uri]
	static constraints = {
		name blank: false, nullable: false, size:1..64
		definition blank: false, nullable: false, size:0..500
		uri blank: false, nullable: false
		parent nullable: true
	}
	static mapping = {
		properties1 cascade: 'all-delete-orphan'
		sameAs cascade: 'all-delete-orphan'
		similarTo cascade: 'all-delete-orphan'
	}
}

 






























































































































































































































































































































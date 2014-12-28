package org.anc.grails.lapps.vocab
import org.anc.grails.lapps.vocab.Element

class Property {
	String name
	String type
	String description
	static hasMany = [elements:Element]
	static belongsTo = [Element]

	String toString() { name }

    static constraints = {
    }
}

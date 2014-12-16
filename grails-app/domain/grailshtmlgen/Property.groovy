package grailshtmlgen
import grailshtmlgen.Element

class Property {
	String name
	String type
	String description
	static hasMany = [elements:Element]
	static belongsTo = [Element]
	
    static constraints = {
    }
}

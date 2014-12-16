import grailshtmlgen.Element
import grailshtmlgen.Property

class BootStrap {

    def init = { servletContext ->
		new Element(properties1: new Property(name: "sample", description:"sample", type: "sample"), name:"Thing", definition:"The most generic specification",parent: null, uri: "http//vocab.lappsgrid.org/Thing", sameAs: " 	http//vocab.lappsgrid.org/Thing", similarTo: "none").save(failOnError: true) 
    }
    def destroy = {
    }
} 

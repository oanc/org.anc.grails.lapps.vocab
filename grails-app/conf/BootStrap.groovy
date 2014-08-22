import grailshtmlgen.Element

class BootStrap {

    def init = { servletContext ->
		new Element(name:"Thing", definition:"The most generic specification",parent: null, uri: "http//vocab.lappsgrid.org/Thing", sameAs: " 	http//vocab.lappsgrid.org/Thing", similarTo: "none").save(failOnError: true) 
    }
    def destroy = {
    }
} 

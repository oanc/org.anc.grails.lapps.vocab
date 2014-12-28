import grailshtmlgen.Element
import grailshtmlgen.Property

class BootStrap {

    def init = { servletContext ->
        Property start = property('start', 'Integer', 'Start offset of the annotation.')
        Property end = property('end', 'Integer', 'End offset of the annotation')
        Property pos = property('pos', 'String', 'Part of speech')
        Property string = property('string', 'String', 'Surface string in convered by the annotation.')
//
//		//new Element(properties1: new Property(name: "sample", description:"sample", type: "sample"), name:"Thing", definition:"The most generic specification",parent: null, uri: "http//vocab.lappsgrid.org/Thing", sameAs: " 	http//vocab.lappsgrid.org/Thing", similarTo: "none").save(failOnError: true)
        Element thing = element('Thing', 'The most generic specification.')
        Element chunk = element('Chunk', 'Any annotation that divides the text into contiguous segments.', [string, start, end], thing)
        Element token = element('Token', 'An indivisible unit in the text.', [pos], chunk)
    }

    def destroy = {
    }

    Property property(String name, String type, String description) {
        println "Creating property ${name}"
        return new Property(name:name, type: type, description:description).save(failOnError: true)
    }

    Element element(String name, String definition, List<Property> props = [], Element parent=null) {
        println "Creating element ${name}"
        Element e = new Element(name: name, definition: definition, parent:parent, properties1: props, sameAs:'none', similarTo:'none', uri:"http://vocab.lappsgrid.org/${name}")
//        if (e.props == null) {
//            println "Creating props set"
//            e.props = new HashSet<Property>()
//        }
//        props.each { prop ->
//            println "Adding property ${prop.name}"
//            e.properties1.add(prop)
//        }
        e.save(failOnError: true)
        return e
    }
} 

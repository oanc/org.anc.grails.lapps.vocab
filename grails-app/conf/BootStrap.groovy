import org.anc.grails.lapps.vocab.Element
import org.anc.grails.lapps.vocab.Property
import org.anc.grails.lapps.vocab.Uri

class BootStrap {
    Uri none = new Uri(uri:'none').save(failOnError: true)

    def init = { servletContext ->
//        setup()
    }

    void setup() {
        Uri isocatThing = new Uri(uri:"http://isocat.org/Thing").save(failOnError: true)
        Uri isocatToken = new Uri(uri:"http://isocat.org/Token").save(failOnError: true)
        Uri schemaThing = new Uri(uri:"http://schema.org/Thing").save(failOnError: true)
        Uri schemaPerson = new Uri(uri:"http://schema.org/Person").save(failOnError: true)

        Property id = property('id', 'String', 'A unique identifier for this element.')
        Property start = property('start', 'Integer', 'Start offset of the annotation.')
        Property end = property('end', 'Integer', 'End offset of the annotation')
        Property pos = property('pos', 'String', 'Part of speech')
        Property string = property('string', 'String', 'Surface string in convered by the annotation.')

//        Element thing = element('Thing', 'The most generic specification.', [id])
        Element thing = new Element(name:'Thing', definition: 'A thingamabob.', properties1: [id], uri:'http://vocab.lappsgrid.org/Thing', sameAs:[isocatThing, schemaThing]).save(failOnError: true)
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
        Element e = new Element(name: name, definition: definition, parent:parent, properties1: props, sameAs:[], similarTo:[], uri:"http://vocab.lappsgrid.org/${name}")
        e.addToSameAs(none)
        e.addToSimilarTo(none)
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

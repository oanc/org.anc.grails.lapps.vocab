package org.anc.grails.lapps.vocab

class Uri {
    String uri

    String toString() { uri }
    static belongsTo = [ Element ]
    static constraints = {
        uri nullable: false, blank: false
    }
}

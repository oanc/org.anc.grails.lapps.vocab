package grailshtmlgen

class Uri {
    String uri

    String toString() { uri }
    static constraints = {
        uri nullable: false, blank: false
    }
}

package org.anc.grails.lapps.vocab

class VocabController {
    VocabService vocabService

    def index() {

    }

    def parse() {
        vocabService.parse()
        flash.message = 'Vocabulary DSL parsed.'
    }

    def write() {
        String dsl = vocabService.generate()
//        vocabService.write(new OutputStreamWriter(System.out))
        flash.message = 'Generated the vocabulary DSL.'
        [text:dsl]
    }

}

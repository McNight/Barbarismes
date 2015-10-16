import Foundation

// Phrases (le premier groupe avec contexte, le second sans) :

// "Je suis abassie par votre moiguasse et je ne tafflerai jamais vos imnorgues."
// "Ce cacus abules est véritablement sylecouris."
//
// "emboulise gableutes nierant schisse clont"
// "soclatique mandasions masaticant mornacs"

let phrase = "soclatique mandasions masaticant mornacs"
let options: NSLinguisticTaggerOptions = [.OmitWhitespace, .OmitPunctuation, .JoinNames]

let range = Range<String.Index>(start: phrase.startIndex, end: phrase.endIndex)
let languageMap = [ "Latn" : [ "fr" ] ]
let orthography = NSOrthography(dominantScript: "Latn", languageMap: languageMap)

phrase.enumerateLinguisticTagsInRange(range, scheme: NSLinguisticTagSchemeNameTypeOrLexicalClass, options: options, orthography: orthography) { tag, tokenRange, _, _ in
	let token = phrase.substringWithRange(tokenRange)
	print("\(token) : \(tag)")
}

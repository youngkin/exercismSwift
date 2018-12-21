import Foundation

class WordCount {
    var wordOccurences = [String: Int]()
    
    init(words: String) {
        words.alphaNumWords.forEach { word in
            wordOccurences[String(word.lowercased())] =
                (wordOccurences[String(word.lowercased())] ?? 0) + 1
        }
        
    }
    
    func count() -> [String: Int]{
        return wordOccurences
    }
}

extension String {
    var alphaNumWords: [String] {
        return components(separatedBy: CharacterSet.symbols.union(.punctuationCharacters))
            .joined()
            .components(separatedBy: .whitespaces)
            .filter{!$0.isEmpty}
    }
}

import Foundation

class BeerSong {
    
    var numStartingBeerBottles: Int
    let lastVerse = "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall."
    let oneBeerVerse = "1 bottle of beer on the wall, 1 bottle of beer.\nTake one down and pass it around, no more bottles of beer on the wall.\n\n"

    init(numberOfBeerBottles: Int) {
        numStartingBeerBottles = numberOfBeerBottles
    }
    
    func generateVersesOfBeerSong() -> String {
        var bottlesOrBottle = "bottles"
        var verses = ""
        var numCurrentBeerBottles = numStartingBeerBottles

        
        for i in (0...numCurrentBeerBottles).reversed() {
            switch i {
            case 0:
                verses = verses + lastVerse
            case 1:
                verses = verses + oneBeerVerse
            default:
                if i == 2 { bottlesOrBottle = "bottle" }
                verses = verses + "\(numCurrentBeerBottles) bottles of beer on the wall, \(numCurrentBeerBottles) bottles of beer.\n"
                verses = verses + "Take one down and pass it around, \(numCurrentBeerBottles - 1) \(bottlesOrBottle) of beer on the wall.\n\n"
            }
            numCurrentBeerBottles -= 1
        }
        return verses
    }
}

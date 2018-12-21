import Foundation

struct NumberSeries2 {
    
    enum NumberSeriesError2: Error {
        case spanLongerThanStringLength
        case invalidCharacter
        case negativeSpan
    }
    
    let intSeries: [Int64]
    
    init(_ series: String) throws {
        intSeries = try series.compactMap {
            if let element = Int64(String($0)) {
                return element
            }
            throw NumberSeriesError2.invalidCharacter
        }
    }
    
    func largestProduct(_ spanLength: Int) throws -> Int64 {
        guard spanLength <= intSeries.count else {
            throw NumberSeriesError2.spanLongerThanStringLength
        }
        guard spanLength >= 0 else {
            throw NumberSeriesError2.negativeSpan
        }
        if spanLength == 0 {
            return 1
        }
        
        var largestProduct: Int64 = 0
        for (i, _) in intSeries.enumerated() {
            if i + spanLength > intSeries.count{
                return largestProduct
            }
            let intermediateResult = intSeries[i..<i+spanLength].reduce(1, *)
            largestProduct = largestProduct > intermediateResult ? largestProduct : intermediateResult
        }
        return largestProduct
    }
}

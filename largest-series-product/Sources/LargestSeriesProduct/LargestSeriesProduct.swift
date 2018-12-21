import Foundation

struct NumberSeries1 {
    let series: String
    
    enum NumberSeriesError1: Error {
        case spanLongerThanStringLength
        case invalidCharacter
        case negativeSpan
    }
    
    init(_ series: String) {
        self.series = series
    }
    
    func largestProduct1(_ seriesLength: Int) throws -> Int64 {
        guard seriesLength <= series.count else {
            throw NumberSeriesError1.spanLongerThanStringLength
        }
        guard seriesLength >= 0 else {
            throw NumberSeriesError1.negativeSpan
        }
        
        if seriesLength == 0 {
            return 1
        }
        
        var largestProduct: Int64 = 0

        for (i, element) in series.enumerated() {
            var intermediateResult: Int64 = 1
            
            print("Current character: \(element)")
            
            if i + seriesLength > series.count {
                return largestProduct
            }
            
            for j in i...(i + (seriesLength-1)) {
                let charIndex = series.index(series.startIndex, offsetBy: j)
                guard let charAsInt = Int.init(String(series[charIndex])) else {
                    throw NumberSeriesError1.invalidCharacter
                }
                intermediateResult = intermediateResult * Int64(charAsInt)
            }
            
            largestProduct = intermediateResult > largestProduct ? intermediateResult : largestProduct
        }
        
        return largestProduct
    }
}

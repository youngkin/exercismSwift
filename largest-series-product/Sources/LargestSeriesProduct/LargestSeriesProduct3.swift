import Foundation

struct NumberSeries {
    
    enum NumberSeriesError: Error {
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
            throw NumberSeriesError.invalidCharacter
        }
    }
    
    func largestProduct(_ spanLength: Int) throws -> Int64 {
        guard spanLength <= intSeries.count else {
            throw NumberSeriesError.spanLongerThanStringLength
        }
        guard spanLength >= 0 else {
            throw NumberSeriesError.negativeSpan
        }
        if spanLength == 0 {
            return 1
        }
        
        return intSeries.enumerated().map {$0.offset..<$0.offset + spanLength} // set of Ranges spanning intSeries
            .filter { $0.upperBound <= intSeries.count} // set of Ranges except any Ranges beyond intSeries.count
            .map {intSeries[$0].reduce(1) {$0 * $1}} // set of products of a given intSeries[Range]
            .reduce(0) {$0 > $1 ? $0 : $1} // The final result, the largest product
    }
}

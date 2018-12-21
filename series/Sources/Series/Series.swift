struct Series {
    let series: [Int]
    
    init(_ series: String) {
        self.series = series.compactMap { Int(String($0)) }
    }
    
    func slices(_ len: Int) -> [[Int]] {
        return series.enumerated().map { $0.offset..<$0.offset + len }
            .filter { $0.upperBound <= series.count }
            .map { Array(series[$0]) }
    }
}

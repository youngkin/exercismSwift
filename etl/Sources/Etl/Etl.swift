import Foundation

struct ETL {
    static func transform(_ input: [Int:[String]]) -> [String:Int] {
        // intermediateResult is a [[String:Int]]
        let intermediateResult = input.compactMap { (key, values) -> [String:Int] in
            var results:[String:Int] = [:]
            for value in values {
                results[value.lowercased()] = key
            }
            return results
        }
        
        // Need to flatten [[String:Int]] into a [String:Int]
        var finalResult:[String:Int] = [:]
        for kv in intermediateResult {
            finalResult = finalResult.merging(kv) { (current, _) in current }
        }
        return finalResult
    }
    
    static func transform2( _ old: [ Int: [ String ] ] ) -> [ String: Int ] {
        return Dictionary( uniqueKeysWithValues:
            old.map{ ps, ls in ls.map{ l in ( l.lowercased(), ps ) } }.flatMap{ $0 } )
    }

}

struct Dominoes {

    let chained: Bool
    
      init(_ dominoesIn: [(left: Int, right: Int)]) {
        guard dominoesIn.count > 0 else {
            chained = false
            return
        }
        
        // `accumulator` is a tuple to capture the results of the attempted domino chaining operation.
        //
        // The first element of the tuple is used to track the left hand side value of the
        // FIRST domino, and the value of the right hand side of the CURRENT domino. The
        // left hand side value of the first domino will be maintained in this first element
        // while iterating over all remaining dominoes.
        //
        // The second element of the single tuple is an array of the remaining dominoes to
        // be chained to the current (implied) set of chained dominoes. Once this array is
        // empty, then we've reached the end of the search for a chain of dominoes.
        //
        // Once the original set of dominoes has been fully traversed (i.e., the second element
        // of the tuple is empty) the first element of the tuple will contain the value of the
        // left hand side of the first domino in the set and the right hand side of the last domino
        // in the set. If these 2 are equal then the final requirement for chaining, namely that
        // these values match, is met.
        var accumulator: ((Int, Int), [(Int, Int)])? = ((dominoesIn[0].left, dominoesIn[0].right), Array(dominoesIn[1...]))

        while let ((startingLeftValue, endingRightValue), remainingDominoes) = accumulator {
            // This creates the alternative "halting" condition for the case where the
            // end of remainingDominoes is reached without finding any dominoes to chain (in
            // the for-loop below).
            accumulator = nil
            
            guard remainingDominoes.count > 0 else {
                chained = startingLeftValue == endingRightValue
                return
            }

            for (i, domino) in remainingDominoes.enumerated() {
                let nextRightValue: Int

                // Match current tile with right side of previous domino tile. If
                // either of the LHS or RHS match, then the 2 dominoes can be chained.
                if domino.0 == endingRightValue {
                    nextRightValue = domino.1
                }
                else if domino.1 == endingRightValue { 
                    nextRightValue = domino.0
                }
                else {
                    // No match so keep iterating through the array looking for a domino
                    // that can be chained with the previous domino. Note, if this condition
                    // is hit for all "remainingDominoes" then "accumulator" will remain nil.
                    continue
                }

                var tmpDominoes = remainingDominoes
                // Remove matching domino from the set of remaining dominoes left to match.
                tmpDominoes.remove(at: i)
                // leftValue is the left hand side of the previous/first domino. newRightValue
                // is the right hand side of the current domino.
                accumulator = ((startingLeftValue, nextRightValue), tmpDominoes)
            }
        }

        chained = false
    }

}

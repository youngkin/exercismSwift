import Foundation

struct PalindromeProducts {
    
    let largest: PalindromeProduct
    let smallest: PalindromeProduct
    
    init(maxFactor: Int64, minFactor: Int64 = 1) {
        let palidromeProducts = generatePalidromeProducts(minFactor:minFactor, maxFactor:maxFactor)
        
        largest = palidromeProducts.reduce(PalindromeProduct(0, factor: [1, 1])) { (currentValue, nextValue) -> PalindromeProduct in
            return currentValue.value > nextValue.value ? currentValue : nextValue
        }
        smallest = palidromeProducts.reduce(PalindromeProduct(maxFactor*maxFactor, factor: [maxFactor, maxFactor])) { (currentValue, nextValue) -> PalindromeProduct in
            return currentValue.value < nextValue.value ? currentValue : nextValue
        }
    }
}
    
struct PalindromeProduct {
    let value: Int64
    let factor: [Int64]
    
    init(_ value: Int64, factor: [Int64]) {
        self.value = value
        self.factor = factor
    }
}

private func generatePalidromeProducts(minFactor: Int64, maxFactor: Int64) -> [PalindromeProduct] {
    var products: [PalindromeProduct] = []
    for i in minFactor...maxFactor {
        for j in (i)...maxFactor {
            let product = PalindromeProduct(i*j,factor:[i,j])
            if isPalindrome(product) {
                products.append(product)
            }
        }
    }
    return products
}

private func isPalindrome(_ candidate: PalindromeProduct) -> Bool {
    let val = String(candidate.value)
    let reversed = String(val.reversed())
    if val == reversed {
        return true
    }
    return false
}


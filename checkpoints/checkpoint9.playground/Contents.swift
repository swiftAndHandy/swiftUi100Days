import Cocoa

func randomInt(_ intArray: [Int]?) -> Int {
     return intArray?.randomElement() ?? Int.random(in: 1...100)
}

randomInt([1, 3, 4])
randomInt(nil as [Int]?)

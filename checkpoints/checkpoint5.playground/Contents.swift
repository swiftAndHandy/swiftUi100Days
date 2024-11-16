import Cocoa

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49].filter {$0 % 2 != 0}
print(luckyNumbers)

let sortedLuckyNumbers = luckyNumbers.sorted {$0 < $1}
print(sortedLuckyNumbers)

let mappedLuckyNumbers = sortedLuckyNumbers.map {"\($0) is a lucky number"}

for number in mappedLuckyNumbers {
    print(number)
}

func bla(obstsorte: String) {
    print("\(obstsorte)")
}


var blub = { (obstsorte: String ) in
        print("\(obstsorte)")
}

blub("Kiwi")

bla(obstsorte: "Kirsche")

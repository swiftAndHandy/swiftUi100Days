import Cocoa

func hasSameLetters(a: String, b: String) -> Bool {
    a.sorted() == b.sorted()
}

print(hasSameLetters(a: "acdb", b: "bac"))

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

print(pythagoras(a: 3, b: 4))


enum PasswordError: Error {
    case short, obvious
}


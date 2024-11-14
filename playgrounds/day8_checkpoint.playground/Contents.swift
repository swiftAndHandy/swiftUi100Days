import Cocoa

enum sqrtErrors: Error {
    case outOfBounds, noIntegerRoot
}

func sqrtOf(_ number: Int) throws -> Int {
    if number < 0 || number > 10_000 {
        throw sqrtErrors.outOfBounds
    }
    
    for i in 1...number {
        if i * i == number {
            return i
        }
    }
    
    throw sqrtErrors.noIntegerRoot
}

do {
    let value = try sqrtOf(1)
    print(value)
} catch sqrtErrors.outOfBounds {
    print("Please enter a number between 0 and 10_000")
} catch sqrtErrors.noIntegerRoot {
    print("Please use a whole number")
} catch {
    print("Something went wrong")
}

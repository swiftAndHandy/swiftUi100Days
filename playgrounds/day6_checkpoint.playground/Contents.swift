import Cocoa

for value in 1...100 {
    if value.isMultiple(of: 3) && value.isMultiple(of: 5) {
        print("FizzBuzz")
    } else if value.isMultiple(of: 3) {
        print("Fizz")
    } else if value.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(value)
    }
}

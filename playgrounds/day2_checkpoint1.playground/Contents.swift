import Cocoa

func convertCelsiusToFahrenheit(_ celsiusDeg: Double) -> Double {
    return celsiusDeg * 9/5 + 32
}

let celsiusDeg = 10.0
let result = convertCelsiusToFahrenheit(celsiusDeg)

print("\(celsiusDeg)° C equals \(result)° Fahrenheit.")

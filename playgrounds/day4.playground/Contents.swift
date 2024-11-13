import Cocoa

let fruits = ["Kiwi", "Kirschen", "Banane", "Orange", "Apfel", "Melone", "Apfel", "Mango", "Pflaume", "Kiwi", "Zitrone"]
let uniqueFruits = Set(fruits)


print(fruits.count)
print(fruits.count - uniqueFruits.count)

print(fruits)
print(uniqueFruits)



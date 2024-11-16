import Cocoa

struct Car {
    let model: String
    let seats: Int
    private var currentGear: Int {
        willSet {
            if newValue <= -1 {
                print("You are now in reverse gear.")
            } else if newValue == 6 {
                print("You are now in the highest gear.")
            } else {
                print("Changed to gear \(newValue)")
            }
        }
    }
    
    init(model: String, seats: Int, currentGear: Int = 1) {
        self.model = model
        self.seats = seats
        if currentGear < -1 {
            self.currentGear = -1
        } else if currentGear == 0 {
            self.currentGear = 1
        } else if currentGear > 6 {
            self.currentGear = 6
        } else {
            self.currentGear = currentGear
        }
    }
    
    mutating func shiftUpGear() {
        if currentGear < 6 && currentGear > 0 {
            currentGear += 1
        } else if currentGear == -1 {
            currentGear = 1
        } else if currentGear == 6 {
            print("You are already in the highest gear.")
        }
    }
    
    mutating func shiftDownGear() {
        if currentGear > 1 {
            currentGear -= 1
        } else if currentGear == 1 {
            currentGear = -1
        } else if (currentGear == -1) {
            print("You are already in reverse gear.")
        }
    }
    
    func getCurrentGear() -> Int {
        return currentGear
    }
}

var car = Car(model: "Ford", seats: 4, currentGear: 3)
print(car)

car.shiftUpGear()
car.shiftUpGear()
car.shiftUpGear()
car.shiftUpGear()
car.shiftDownGear()
car.shiftDownGear()
car.shiftDownGear()
car.shiftDownGear()
car.shiftDownGear()
car.shiftDownGear()
car.shiftDownGear()

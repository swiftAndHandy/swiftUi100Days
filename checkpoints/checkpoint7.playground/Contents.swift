import Cocoa

class Animal {
    private var legs: Int {
        didSet {
            if oldValue != legs {
                print("\(self) has now \(legs) legs instead of \(oldValue).")
            } else {
                print("There was no need to change the amount of legs. \(self) still have \(legs) legs.")
            }
            
        }
    }
    
    init(legs: Int = 4) {
        self.legs = legs
    }
    
    func setLegs (to legs: Int) {
        self.legs = legs > 0 && legs <= 8 ? legs : 4
    }
    
    func getLegs() -> Int {
        legs
    }
}

class Dog: Animal {
    func speak() {
        print("Bark! I'm a dog.")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Woof! I'm a Corgi.")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Wuff! I'm a Poodle.")
    }
}

class Cat: Animal {
    let isTame: Bool
    init(isTame: Bool = false) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    func speak() {
        print("Meow! I'm a cat.")
    }
}

class Persian: Cat {
    override init(isTame: Bool = true) {
        super.init(isTame: isTame)
    }
    
    override func speak() {
        print("Miau! I'm a Persian.")
    }
}

class Lion: Cat {
    override init(isTame: Bool = false) {
        super.init(isTame: isTame)
    }
    
    override func speak() {
        print("Roooaaar! I'm a furry chocolate bar with \(self.getLegs()) legs.")
    }
}

let dog = Dog()
dog.speak()

let corgi = Corgi()
corgi.speak()

let poodle = Poodle()
poodle.speak()

let cat = Cat()
cat.speak()

let persian = Persian()
persian.speak()

let lion = Lion()
lion.speak()

lion.setLegs(to: 5)
lion.setLegs(to: 5)
corgi.getLegs()
corgi.setLegs(to: 3)
lion.setLegs(to: 4)
corgi.getLegs()

import Cocoa

protocol Building {
    var rooms: Int { get }
    var costs: Int { get }
    var realEstateAgent: String { get }
    
    func salesSummary()
}

extension Building {
    func salesSummary() {
        print("\(realEstateAgent) is selling a building with \(rooms) rooms for \(costs)$. This equals \(costs / rooms)$/room.")
    }
}

struct House: Building {
    var rooms: Int = 3
    var costs: Int = 400000
    var realEstateAgent: String = "Eric Mayson"
}

struct Office: Building {
    var rooms: Int = 6
    var costs: Int = 600000
    var realEstateAgent: String = "Kevin Miller"
}

var house = House(rooms: 4, realEstateAgent: "Tobias Franklin")
house.salesSummary()
var office = Office(realEstateAgent: "Michael Brown")
office.salesSummary()

//
//  main.swift
//  HotelOccupancy
//
//  Created by June Lara on 10/21/20.
//

import Foundation

struct Floor {
    let rooms: Int
    let occupied: Int
}

func getNumFloors() -> Int {
    print("How many floors does the hotel have? ")
    if let floors = (Int)(readLine()!), floors > 0 {
        return floors
    } else {
        return getNumFloors()
    }
}

func getNumRooms(floor: Int) -> Int {
    print("How many rooms are on floor \(floor)?")
    if let rooms = (Int)(readLine()!), rooms > 9 {
        return rooms
    } else {
        print("Floors must have at least 10 rooms")
        return getNumRooms(floor: floor)
    }
}

func getNumOfOccupiedRooms(numRooms: Int) -> Int {
    print("How many of them are occupied?")
    if let occupied = (Int)(readLine()!), occupied <= numRooms {
        return occupied
    } else {
        print("Looks like you are over booked please investigate and try again")
        return getNumOfOccupiedRooms(numRooms: numRooms)
    }
}

func getNumRoomsAndOccupancy (floors: Int) -> [Floor] {
    var floorsArray = [Floor]()
        for floor in 1...floors {
            if(floor == 13) {
                continue
            }
            let numberOfRooms = getNumRooms(floor: floor)
            let occupiedRooms = getNumOfOccupiedRooms(numRooms: numberOfRooms)
            floorsArray.append(Floor(rooms: numberOfRooms, occupied: occupiedRooms))
        }
    return floorsArray
}

struct Stats {
    var totalOccupied: Int
    var totalUnoccupied: Int
    func getTotalRooms() -> Int {
        let totalRooms = totalOccupied + totalUnoccupied
        return totalRooms
    }

}

func main() {
    let numberOfFloors = getNumFloors()
    let arrayOfFloors = getNumRoomsAndOccupancy(floors: numberOfFloors);
    print("The Hotel")
    print("------------")
    print("Floors: \(numberOfFloors)")
    var hotelStats = Stats(totalOccupied: 0, totalUnoccupied: 0)
    for floor in arrayOfFloors {
        hotelStats.totalOccupied += floor.occupied
        hotelStats.totalUnoccupied += floor.rooms - floor.occupied
    }
    print("Occupied: \(hotelStats.totalOccupied)")
    print("Unoccupied: \(hotelStats.totalUnoccupied)")
    let percentage = (Double(hotelStats.totalOccupied) / Double(hotelStats.getTotalRooms())) * 100
    print("Percentage Occupied: \(Int(percentage))%")
}

main()


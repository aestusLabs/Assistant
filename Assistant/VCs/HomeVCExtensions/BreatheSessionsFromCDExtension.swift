//
//  BreatheSessionsFromCDExtension.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-13.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
import CoreData

extension ChildHomeViewController {
    func fetchAllSessionsFromCD() {
        let fetch: NSFetchRequest<Session> = Session.fetchRequest()
        
        do {
            let results = try managedContext.fetch(fetch)
            for result in results {
                print(" ")
                //                print(result)
                print(result.sessionType)
                print(" ")
            }
        } catch let error as NSError {
            print("Error fetching results")
        }
    }
    
    func getLast3ItemsFromCD() {
        var uniqueSessions: [Session] = []
        let fetchRequest: NSFetchRequest<Session> = Session.fetchRequest()
        
        let sort = NSSortDescriptor(key: #keyPath(Session.date),
                                    ascending: false)
        fetchRequest.sortDescriptors = [sort]
        fetchRequest.fetchLimit = 10
        do {
            let results = try managedContext.fetch(fetchRequest)
            for result in results {
                print(result.sessionType)
                //                if uniqueSessions.contains(result) == false {
                //                    uniqueSessions.append(result)
                //                }
                var addBool = true
                var arrayOfSameCounts: [Int] = []
                for session in uniqueSessions {
                    var sameCount = 0
                    if session.sessionType! == result.sessionType {
                        sameCount += 1
                    }
                    if session.durationInS == result.durationInS {
                        sameCount += 1
                    }
                    if session.inhaleLength == result.inhaleLength {
                        sameCount += 1
                    }
                    if session.exhaleLength == result.exhaleLength {
                        sameCount += 1
                    }
                    if session.fullSustainLength == result.fullSustainLength {
                        sameCount += 1
                    }
                    if session.emptySustainLength == result.emptySustainLength {
                        sameCount += 1
                    }
                    if session.cycleBreakLength == result.cycleBreakLength {
                        sameCount += 1
                    }
                    if session.numberOfBreathsPerCycle == result.numberOfBreathsPerCycle {
                        sameCount += 1
                    }
                    if session.numberOfCycles == result.numberOfCycles {
                        sameCount += 1
                    }
                    arrayOfSameCounts.append(sameCount)
                }
                if arrayOfSameCounts.contains(9) == false{
                    uniqueSessions.append(result)
                }
            }
        } catch let error as NSError {
            print("Error fetching")
        }
        //        print(uniqueSessions)
        
        var threeRecomendations: [Session] = []
        var max = 2
        if uniqueSessions.count < 3 {
            max = uniqueSessions.count - 1
        }
        if max != -1 {
            for x in 0...max {
                threeRecomendations.append(uniqueSessions[x])
            }
        }
        var itemCount = 0
        var tempArray: [Item] = []
        for item in itemsShown {
            if item.type != .passableSession {
                tempArray.append(item)
            } else {
                if threeRecomendations.isEmpty == false {
                    
                    tempArray.append(createPassableSession(sessionType: myConvert.sessionTypeFrom(string: threeRecomendations[0].sessionType!), inhale: Int(threeRecomendations[0].inhaleLength), exhale: Int(threeRecomendations[0].exhaleLength), fullSustain: Int(threeRecomendations[0].fullSustainLength), emptySustain: Int(threeRecomendations[itemCount].emptySustainLength), totalLengthInSeconds: Int(threeRecomendations[0].durationInS), numberOfBreathsPerCycle: Int(threeRecomendations[0].numberOfBreathsPerCycle), breakLengthForCycle: Int(threeRecomendations[0].cycleBreakLength), totalCycles: Int(threeRecomendations[0].numberOfCycles), secondsElapsed: 0, startOfLastBreath: 0))
                    threeRecomendations.removeFirst()
                } else {
                    tempArray.append(item)
                }
                
            }
        }
        print(tempArray)
        
        itemsShown = tempArray
        
        tableView.reloadData()
        
    }
}

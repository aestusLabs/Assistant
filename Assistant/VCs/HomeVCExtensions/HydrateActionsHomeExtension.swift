//
//  HydrateActionsHomeExtension.swift
//  Assistant
//
//  Created by Ian Kohlert on 2018-04-13.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
import CoreData
extension ChildHomeViewController {
    
 
    
    
    func actOnHydration(action: ButtonAction, userInput: String) -> Bool {
        if action == .addWater {
            return true
        }
        return false
    }
    
    func updateHydrateCD() {
        let currentDay = hydrateManager.lastDayStarted as NSDate
        print(currentDay)
        
        let date = Date() as NSDate
        let dayFetch: NSFetchRequest<HydrateDay> = HydrateDay.fetchRequest()
        dayFetch.predicate = NSPredicate(format: "date == %@", currentDay as NSDate)
        
        do {
            let results = try hydrateManagedContext.fetch(dayFetch)
            if results.count > 0 {

                
                if let result = results.first {
                    print(result.intervalOneTotal)

                   result.intervalOneTotal = Int16(hydrateManager.interval1Total)
                    result.dayGoal = Int16(hydrateManager.dailyGoal)
                    result.dayTotal = Int16(hydrateManager.getDaysTotal())
                    result.intervalOneGoal = Int16(hydrateManager.interval1Goal)
                    result.intervalOneTotal = Int16(hydrateManager.interval1Total)
                    result.intervalTwoGoal = Int16(hydrateManager.interval2Goal)
                    result.intervalTwoTotal = Int16(hydrateManager.interval2Total)
                    result.intervalThreeGoal = Int16(hydrateManager.interval3Goal)
                    result.intervalThreeTotal = Int16(hydrateManager.interval3Total)
                    result.intervalFourGoal = Int16(hydrateManager.interval4Goal)
                    result.intervalFourTotal = Int16(hydrateManager.interval4Total)
                    print(result.intervalOneTotal)
                    
                }
                
                try hydrateManagedContext.save()
            } else {
                var hydrateDay = HydrateDay(context: hydrateManagedContext)

                hydrateDay.date = currentDay
                hydrateDay.dayGoal = Int16(hydrateManager.dailyGoal)
                hydrateDay.dayTotal = Int16(hydrateManager.getDaysTotal())
                hydrateDay.intervalOneGoal = Int16(hydrateManager.interval1Goal)
                hydrateDay.intervalOneTotal = Int16(hydrateManager.interval1Total)
                hydrateDay.intervalTwoGoal = Int16(hydrateManager.interval2Goal)
                hydrateDay.intervalTwoTotal = Int16(hydrateManager.interval2Total)
                hydrateDay.intervalThreeGoal = Int16(hydrateManager.interval3Goal)
                hydrateDay.intervalThreeTotal = Int16(hydrateManager.interval3Total)
                hydrateDay.intervalFourGoal = Int16(hydrateManager.interval4Goal)
                hydrateDay.intervalFourTotal = Int16(hydrateManager.interval4Total)
                try hydrateManagedContext.save()
            }
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }
        printAllHydrateCDObjects()
        //        hydrateDay.date
    }
    
    func printAllHydrateCDObjects() {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "HydrateDay")
        
        do  {
            let results = try hydrateManagedContext.fetch(fetchRequest)
            print(results.count)
            
            // TESTING
            for result in results {
                let resultToPront = result as! HydrateDay

                print(resultToPront.date)
                print(resultToPront.intervalOneTotal)


            }
            
        } catch let error as NSError {
            print("Could not fetch. /(error), \(error.userInfo)")
        }
    }
    
    func updateHydrateDefaultValues() {
        let defaults = UserDefaults.standard
        
        if let dailyGoal = defaults.object(forKey: "hydrateDailyGoal") as? Int{
            hydrateManager.dailyGoal = dailyGoal
            hydrateManager.interval1Goal = hydrateManager.getCurrentIntervalsGoal()
            hydrateManager.interval2Goal = hydrateManager.getCurrentIntervalsGoal()
            hydrateManager.interval3Goal = hydrateManager.getCurrentIntervalsGoal()
            hydrateManager.interval4Goal = hydrateManager.getCurrentIntervalsGoal()
            
        }
        
        if let lastDayStarted = defaults.object(forKey: "lastDayStarted") as? Date {
            hydrateManager.lastDayStarted = lastDayStarted
        }
        if let metric = defaults.object(forKey: "metricBool") as? Bool {
            hydrateManager.metric = metric
        }
    }
    
    func updateHydrateManagerFromCDValues() {
        let currentDay = hydrateManager.lastDayStarted as NSDate
        print(currentDay)
        
        let date = Date() as NSDate
        let dayFetch: NSFetchRequest<HydrateDay> = HydrateDay.fetchRequest()
        dayFetch.predicate = NSPredicate(format: "date == %@", currentDay as NSDate) //NSPredicate(format: "%K == %Q", #keyPath(HydrateDay.date), currentDay)
        
        do {
            let results = try hydrateManagedContext.fetch(dayFetch)
            if results.count > 0 {
                
                
                if let result = results.first {
                    hydrateManager.dailyGoal = Int(result.dayGoal)
                    hydrateManager.interval1Goal = Int(result.intervalOneGoal)
                    hydrateManager.interval1Total = Int(result.intervalOneTotal)
                    hydrateManager.interval2Total = Int(result.intervalTwoTotal)
                    hydrateManager.interval2Goal = Int(result.intervalTwoGoal)
                    hydrateManager.interval3Goal = Int(result.intervalThreeGoal)
                    hydrateManager.interval3Total = Int(result.intervalThreeTotal)
                    hydrateManager.interval4Goal = Int(result.intervalFourGoal)
                    hydrateManager.interval4Total = Int(result.intervalFourTotal)
                    hydrateManager.extraIntervalTotal = Int(result.dayTotal) - Int(result.intervalOneTotal) - Int(result.intervalTwoTotal) - Int(result.intervalThreeTotal) - Int(result.intervalFourTotal)
                    
                    
                    
                }
            } else {
              
            }
        } catch let error as NSError {
            print("Fetch error: \(error) description: \(error.userInfo)")
        }
    }
    
    func hydrateActionsSeeIfNeedToUpdateVC(action: ButtonAction) -> Bool{
        switch action {
        case .addWater:
            updateVCForAddWater()
            return true
        case .setHydrateStartTime:
            updateVCForSetHyrdateStartTime()
            return true

        default:
            return false
        }
    }
   
        func updateVCForAddWater() {
            var row = 0
            var count = 0
            for item in itemsShown {
                if item.type == .hydrateTotalsWidget {
                    row = count
                    let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0))
                    let totalsWidget = cell as! HydrateShowTotalsWidgetTableViewCell
                    totalsWidget.updateProgressBars()
                    totalsWidget.updateLabels()
                } else if item.type == .hydrateIntervalsAtGlanceWidget {
                    row = count
                    let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0))
                    if let intervalsWidget = cell as? HydrateDayAtGlanceTableViewCell {
                            intervalsWidget.colourCircles()
                    }
                    
                }
                count += 1
            }
            
            updateHydrateCD()
        }
    
    private func updateVCForSetHyrdateStartTime() {
        hydrateManager.zeroOutHydrationManager()
        
        itemsShown = []
    
        prompt = getPromptForApp()
    
        addHomePromptToTableView(segments: prompt.itemSegments )
    
    }
    
}

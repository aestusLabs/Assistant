//
//  GetCellForItemType.swift
//  Breathe
//
//  Created by Ian Kohlert on 2018-02-26.
//  Copyright © 2018 aestusLabs. All rights reserved.
//

import Foundation
import UIKit
struct GetCellForItemType {
    
    func getCellFor(item: Item) -> UITableViewCell? {
        print(item.type)
        
        if item.type == .assistantMessage {
           return assistantMessage(currentItem: item)
        } else if item.type == .titleDivider {
            return titleDivider(currentItem: item)
        } else if item.type == .userMessage {
            return userMessage(currentItem: item)
        } else if item.type == .buttonCloud {
            return buttonCloud(currentItem: item)
        } else if item.type == .passableSession {
            return passableSession(currentItem: item)
        } else if item.type == .calendarMonth {
            return monthWidget()
        } else if item.type == .dayOfWeekSelection {
            return selectDayOfWeekWidget()
        } else if item.type == .toggleWidget {
            return toggleWidget(currentItem: item)
        } else if item.type == .launchKeyboard {
            return showKeyboardCell()
        } else if item.type == .playableSession {
            return playableSessionWidget(currentItem: item)
        } else if item.type == .settingsButton {
            return settingsButton(currentItem: item)
        } else if item.type == .commandWidget {
            return commandWidget(currentItem: item)
        } else if item.type == .hydrateTotalsWidget {
            return hydrateTotalsWidget()
        } else if item.type == .hydrateIntervalsAtGlanceWidget {
            return hydrateIntervalsAtGlanceWidget()
        }
        
        
        if item.type == .pointsWidget {
            return pointsWidget()
        }
        
        if item.type == .integrationWidget {
           return integrationWidget(currentItem: item)
        }
        
        if item.type == .pending {
            return pendingCell()
        }
        return nil
    }
    func assistantMessage(currentItem: Item) -> AssistantMessageTableViewCell {
        let cell = Bundle.main.loadNibNamed("AssistantMessageTableViewCell", owner: self, options: nil)?.first as! AssistantMessageTableViewCell
        let item = currentItem as! AssistantMessage
        cell.label.text = item.text
        return cell
    }
    
    func titleDivider(currentItem: Item) -> TitleDividerTableViewCell{
        let cell = Bundle.main.loadNibNamed("TitleDividerTableViewCell", owner: self, options: nil)?.first as! TitleDividerTableViewCell
        let item = currentItem as! TitleDivider
        cell.setTitleText(title: item.text)
        return cell
    }
    
    func userMessage(currentItem: Item) -> UserMessageTableViewCell{
        let cell = Bundle.main.loadNibNamed("UserMessageTableViewCell", owner: self, options: nil)?.first as! UserMessageTableViewCell
        let item = currentItem as! UserMessage
        cell.label.text = item.text
        return cell
    }
    


    func buttonCloud(currentItem: Item) -> ButtonCloudTableViewCell {
        
        let cell = Bundle.main.loadNibNamed("ButtonCloudTableViewCell", owner: self, options: nil)?.first as! ButtonCloudTableViewCell
        let item = currentItem as! ButtonCloudData
        cell.buttons = item.buttons
        
        if item.userInputButtonSuggestions.isEmpty == false {
            cell.buttons.append(contentsOf:  item.userInputButtonSuggestions)
        }
        if item.collapsed {
            cell.messageText = item.inputText
            cell.displayUserMessage()
            
        }  else {
            cell.setUpAndAddButtons()
        }
        return cell
    }
    func passableSession(currentItem: Item) -> BreatheSessionTableViewCell{
        let cell = Bundle.main.loadNibNamed("BreatheSessionTableViewCell", owner: self, options: nil)?.first as! BreatheSessionTableViewCell
 
        
        let item = currentItem as! PassableSession
        cell.typeLabel.text = myConvert.displaySessionTypeToUser(sessionType: item.sessionType)
        cell.timeLabel.text = myConvert.displayTimeFrom(seconds: item.totalLengthInSeconds)
        
      
        //            cell.tag =
        cell.sessionType = item.sessionType
        cell.inhale = item.inhale
        cell.exhale = item.exhale
        cell.fullSustain = item.fullSustain
        cell.emptySustain = item.emptySustain
        
        cell.totalLengthInSeconds = item.totalLengthInSeconds
        cell.totalCycles = item.totalCycles
        cell.numberOfBreathsPerCycle = item.numberOfBreathsPerCycle
        cell.cycleBreakLengthInS = item.breakLengthForCycle
        cell.startOfLastBreath = item.startOfLastBreath
        cell.secondsElapsed = item.secondsElapsed
        cell.colourDots()
        cell.typeImage.image = myConvert.getImageForBreathe(sessionType: item.sessionType)
        cell.dateLabel.text = ""
        cell.dateLabelHeight.constant = 0
        cell.cellHeight.constant = 80
//        cell.roundCorners()
//        cell.layoutSubviews()
        return cell
    }
    
   
    
    func playableSessionWidget(currentItem: Item) -> PlayableSessionTableViewCell {
        let cell = Bundle.main.loadNibNamed("PlayableSessionTableViewCell", owner: self, options: nil)?.first as! PlayableSessionTableViewCell
        let widget = currentItem as! PlayableSessionData

        cell.timeLabel.text = myConvert.displayTimeFrom(seconds: widget.session.totalLengthInSeconds - widget.session.secondsElapsed  )
        cell.instructionLabel.text = "Tap to Start"
  
        cell.enlargeLungs(time: 0.25)
        
        cell.sessionType = widget.session.sessionType
        cell.inhale = widget.session.inhale
        cell.exhale = widget.session.exhale
        cell.fullSustain = widget.session.fullSustain
        cell.emptySustain = widget.session.emptySustain
        cell.totalLengthInSeconds = widget.session.totalLengthInSeconds
        cell.totalCycles = widget.session.totalCycles
        cell.startOfLastBreath = widget.session.startOfLastBreath
        cell.secondsElapsed = widget.session.secondsElapsed
        cell.numberOfBreathsPerCycle = widget.session.numberOfBreathsPerCycle
        cell.cycleBreakLengthInS = widget.session.breakLengthForCycle
        

        
      
        
        return cell
    }
    

    func integrationWidget(currentItem: Item) -> IntegrationToggleWidgetTableViewCell {
        let cell = Bundle.main.loadNibNamed("IntegrationToggleWidgetTableViewCell", owner: self, options: nil)?.first as! IntegrationToggleWidgetTableViewCell
        
        let item = currentItem as! IntegrationWidget
        cell.widgetImage.image = item.image
        cell.widgetLabel.text = item.labelText
        cell.widgetSwitch.setOn(item.isToggled, animated: false)
        
        return cell
    }
    
    func showKeyboardCell() -> ShowKeyboardTableViewCell {
        let cell = Bundle.main.loadNibNamed("ShowKeyboardTableViewCell", owner: self, options: nil)?.first as! ShowKeyboardTableViewCell
        return cell
    }
    
    func pendingCell() -> PendingItemCell {
        let cell = Bundle.main.loadNibNamed("PendingItemCell", owner: self, options: nil)?.first as! PendingItemCell
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.animate()
        return cell
    }
    
    func pointsWidget() -> PointsTableViewCell {
        let cell = Bundle.main.loadNibNamed("PointsTableViewCell", owner: self, options: nil)?.first as! PointsTableViewCell
        return cell
    }
    
    func monthWidget() -> CalendarMonthTableViewCell {
        let cell = Bundle.main.loadNibNamed("CalendarMonthTableViewCell", owner: self, options: nil)?.first as! CalendarMonthTableViewCell
        return cell
    }
    func selectDayOfWeekWidget() -> WeekSelectionTableViewCell {
        let cell = Bundle.main.loadNibNamed("WeekSelectionTableViewCell", owner: self, options: nil)?.first as! WeekSelectionTableViewCell
        return cell
    }
    
    func toggleWidget(currentItem: Item) -> ToggleTableViewCell {
        let cell = Bundle.main.loadNibNamed("ToggleTableViewCell", owner: self, options: nil)?.first as! ToggleTableViewCell
        
        return cell
    }
    
    func settingsButton(currentItem: Item) -> SettingsButtonTableViewCell {
        let cell = Bundle.main.loadNibNamed("SettingsButtonTableViewCell", owner: self, options: nil)?.first as! SettingsButtonTableViewCell
        let item = currentItem as! SettingsButton
        cell.buttonImage.image = item.image
        cell.buttonLabel.text = item.text
        
        return cell
    }
  
    func commandWidget(currentItem: Item) -> ShowCommandsTableViewCell {
        let cell = Bundle.main.loadNibNamed("ShowCommandsTableViewCell", owner: self, options: nil)?.first as! ShowCommandsTableViewCell
        let item = currentItem as! CommandWidget
        cell.titleLabel.text = item.title
        cell.bodyLabel.text = item.bodyItems.first!
        cell.bodyItems = item.bodyItems
//        cell.isExpanded = item.isExpanded
        if item.isExpanded  {
            cell.bodyLabel.text = cell.convertBodyItemsToString()
            
        }
        return cell
        
    }
    
    func hydrateTotalsWidget() -> HydrateShowTotalsWidgetTableViewCell {
        let cell = Bundle.main.loadNibNamed("HydrateShowTotalsWidgetTableViewCell", owner: self, options: nil)?.first as! HydrateShowTotalsWidgetTableViewCell
        // TODO: Take data from hydratemanager
        return cell
    }
    
    func hydrateIntervalsAtGlanceWidget() -> HydrateDayAtGlanceTableViewCell {
        let cell = Bundle.main.loadNibNamed("HydrateDayAtGlanceTableViewCell", owner: self, options: nil)?.first as! HydrateDayAtGlanceTableViewCell
        return cell
    }
}
let getCellForItemType = GetCellForItemType()

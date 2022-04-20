//
//  ViewController.swift
//  AssignmentStudentLogin
//
//  Created by SAISURAJ on 4/19/22.
//  Copyright © 2022 SAISURAJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var classTF: UITextField!
    
    @IBOutlet weak var clockTimer: UILabel!
    
    var timer:Timer?
    var totalSecond = Int()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
            // Do any additional setup after loading the view.
    }

    func addAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    @IBAction func loginAction(_ sender: UIButton) {
        let checkLoginTime = CheckTimeInterval()
        if nameTF.text != "" && classTF.text != "" {
          if checkLoginTime == true{
            addAlert(title: "Login Response", message: "You have Successfully Loggedin ")
            print(checkLoginTime,"BoolValue")
          }
          else{
            addAlert(title: "Login Response", message: "Oops!! You're Late")
            print(checkLoginTime,"BoolValue")
            }
        }
        else{
          addAlert(title: "Login Response", message: "Please Enter All the fields")
        }
    }
     func startTimer(){
     timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
     }

     @objc func countDown() {
         let date = NSDate()
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "hh:mm:ss a"
         let dateString = dateFormatter.string(from: date as Date)
        clockTimer.text = dateString
         print( dateString)
     }
     func CheckTimeInterval()->Bool{
        var timeIntervalVerified:Bool
        let calendar = Calendar.current
        let startTimeComponent = DateComponents(calendar: calendar, hour:14,minute: 00,second: 00)
        print(startTimeComponent,"startTimeComponent")
        let endTimeComponent   = DateComponents(calendar: calendar, hour: 14, minute: 14,second: 00)
    print(endTimeComponent.hour,endTimeComponent.minute,endTimeComponent.second,"endTimeComponent")
       
        let componets = Calendar.current.dateComponents([.hour, .minute, .second], from: Date())
        let currentHour = componets.hour
        let currentMinute = componets.minute
        let currentSecond = componets.second
        
        print(currentHour,"hr",currentMinute,"min",currentSecond)
        if startTimeComponent.hour! <= currentHour! && startTimeComponent.minute! <= currentMinute! && currentHour! <= endTimeComponent.hour! && currentMinute! <= endTimeComponent.minute!{
            timeIntervalVerified = true
        }
        else{
            timeIntervalVerified = false
        }
        return timeIntervalVerified
    }

}













//
//        let currentTime = Date()
//        print(currentTime,"currentTime")
//        let startOfToday = calendar.startOfDay(for: currentTime)
//        print(startOfToday,"startOfToday")
//        let startTime    = calendar.date(byAdding: startTimeComponent, to: startOfToday)!
//        print(startTime,"startTime")
//        let endTime      = calendar.date(byAdding: endTimeComponent, to: startOfToday)!
//        print(endTime,"endTime")
//
//        if startTime <= currentTime && currentTime <= endTime {
//            print("between 8 AM and 10:00 AM")
//            timeIntervalVerified = true
//        } else {
//            print("not between 08:00 AM and 10:00 AM")
//            timeIntervalVerified = false
//        }

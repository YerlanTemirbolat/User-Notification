//
//  ContentView.swift
//  User Notifications
//
//  Created by Admin on 7/30/20.
//  Copyright © 2020 Yerlan. All rights reserved.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    @State var alert = false
    
    var body: some View {
        Button(action: {
            UNUserNotificationCenter
            .current()
                .requestAuthorization(options: [.alert, .sound, .badge]) { (status, _) in
                    if status {
                        let content = UNMutableNotificationContent()
                        content.title = "Notification"
                        content.body = "Hello from Cinnamon"
                        
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                        let request = UNNotificationRequest(identifier: "Notification", content: content, trigger: trigger)
                        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                        return
                    }
                    self.alert.toggle()
            }
        }) {
            Text("Send Notification")
        }.alert(isPresented: $alert) {
            return Alert(title: Text("Please Enable Notification Access In Settings Pannel!!!"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

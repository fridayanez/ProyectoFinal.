//
//  InicioViewController.swift
//  WabiSabi
//
//  Created by Macbook on 6/6/19.
//  Copyright © 2019 Eduardo Luna. All rights reserved.
//

import UIKit
import UserNotifications

class InicioViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    var timeToRemember: Double = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UNUserNotificationCenter.current().delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.actionIdentifier == "rememberAction" {
            timeToRemember = 5
            send10SecsNotification()
        }else if response.actionIdentifier == "deleteAction" {
            UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: ["ZeldaNotification"])
        }
}


    @IBAction func send10SecsNotification(){
    

    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeToRemember, repeats: false)
    
    // 2. Creamos el contenido de la Notificación
    let content = UNMutableNotificationContent()
    content.title = "¡Pásate a Wabi Sabi!"
    content.subtitle = "Es  momento de descansar 😉"
    content.body = "Una nueva frase está disponible 😏"
    // content.sound = UNNotificationSound.default()
    
    // Añadimos las acciones y la categoría
    let rememberAction = UNNotificationAction(identifier: "rememberAction", title: "Recordar más tarde", options: [])
    let deleteAction = UNNotificationAction(identifier: "deleteAction", title: "Eliminar Notificación", options: [])
    let category = UNNotificationCategory(identifier: "zeldaCategory", actions: [rememberAction, deleteAction], intentIdentifiers: [], options: [])
    UNUserNotificationCenter.current().setNotificationCategories([category])
    
    content.categoryIdentifier = "zeldaCategory"
    
    // Añadimos la imagen al contenido de la notificación
    if let path = Bundle.main.path(forResource: "pluma", ofType: "jpeg") {
        let url = URL(fileURLWithPath: path)
        
        do {
            let attachment = try UNNotificationAttachment(identifier: "zelda", url: url, options: nil)
            content.attachments = [attachment]
        } catch {
            print("La imagen no se ha cargado")
        }
    }
    
    // 3. Creamos la Request
    let request = UNNotificationRequest(identifier: "ZeldaNotification", content: content, trigger: trigger)
    
    // 4. Añadimos la Request al Centro de Notificaciones
    UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    UNUserNotificationCenter.current().add(request) {(error) in
    if let error = error {
    print("Se ha producido un error: \(error)")
    }
    }
    
}

}




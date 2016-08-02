//
//  SocketManager.swift
//  elkhorn
//
//  Created by Tomi Lahtinen on 02/08/16.
//  Copyright © 2016 Tomi Lahtinen. All rights reserved.
//

import Foundation
import Starscream
import CoreLocation
import Gloss

class SocketManager: WebSocketDelegate {
    
    static var sharedInstance = SocketManager()
    
    let socket = WebSocket(url: NSURL(string: "ws://elkhorn.herokuapp.com/alert")!)
    
    init(){
        debugPrint("init socket manager")
        socket.delegate = self
        socket.connect()
    }
    
    func sendWarningMessage(location: CLLocation){
        if socket.isConnected {
            let w = Warning(location: location)
            socket.writeString(w.toJSON()!.description)
        }
        else {
            debugPrint("Connection to socket lost")
        }
    }
    
    // MARK: -- WebSocketDelegate
    
    func websocketDidConnect(socket: WebSocket) {
        debugPrint("Connection established")
    }
    
    func websocketDidDisconnect(socket: WebSocket, error: NSError?) {
        debugPrint("Connection established")
    }
    
    func websocketDidReceiveData(socket: WebSocket, data: NSData) {
        debugPrint("Data received")
    }
    
    func websocketDidReceiveMessage(socket: WebSocket, text: String) {
        debugPrint("Message received \(text)")
    }
}

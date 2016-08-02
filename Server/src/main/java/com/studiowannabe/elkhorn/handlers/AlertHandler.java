package com.studiowannabe.elkhorn.handlers;

import com.studiowannabe.elkhorn.Application;
import org.eclipse.jetty.websocket.api.Session;
import org.eclipse.jetty.websocket.api.annotations.OnWebSocketClose;
import org.eclipse.jetty.websocket.api.annotations.OnWebSocketConnect;
import org.eclipse.jetty.websocket.api.annotations.OnWebSocketMessage;
import org.eclipse.jetty.websocket.api.annotations.WebSocket;

import static com.studiowannabe.elkhorn.Application.broadcastMessage;
import static com.studiowannabe.elkhorn.Application.nextUserNumber;
import static com.studiowannabe.elkhorn.Application.userUsernameMap;

/**
 * Created by tomila on 02/08/16.
 */

@WebSocket
public class AlertHandler {

    @OnWebSocketConnect
    public void onConnect(final Session user) throws Exception {
        String username = "User" + nextUserNumber++;
        userUsernameMap.put(user, username);
        broadcastMessage("elkhorn", (username + " joined the chat"));
        System.out.println("Connection started");
    }


    @OnWebSocketClose
    public void onClose(final Session user, final int statusCode, final String reason) {
        String username = userUsernameMap.get(user);
        userUsernameMap.remove(user);
        broadcastMessage("Server", (username + " left the chat"));
        System.out.println("Connection closed");
    }

    @OnWebSocketMessage
    public void onMessage(final Session user, final String message) {
        broadcastMessage(userUsernameMap.get(user), message);
        System.out.println("Message received " + message);
    }

}

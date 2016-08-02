package com.studiowannabe.elkhorn;

import com.studiowannabe.elkhorn.handlers.AlertHandler;
import org.eclipse.jetty.websocket.api.Session;
import org.json.JSONObject;
import spark.Spark;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by tomila on 02/08/16.
 */
public class Application {

    public static int nextUserNumber = 1;
    public static final Map<Session, String> userUsernameMap = new HashMap<>();

    public static void main(final String[] args){
        Spark.webSocket("/alert", AlertHandler.class);
        Spark.init();
    }

    public static void broadcastMessage(final String sender, final String message) {
        userUsernameMap.keySet().stream().filter(Session::isOpen).forEach(session -> {
            try {
                session.getRemote().sendString(String.valueOf(new JSONObject()
                        .put("sender", sender)
                        .put("message", message)
                        .put("user_list", userUsernameMap.values())
                ));
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }

}

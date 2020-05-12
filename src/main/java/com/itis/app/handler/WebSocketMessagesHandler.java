package com.itis.app.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itis.app.dto.Message;
import com.itis.app.model.Role;
import com.itis.app.model.User;
import com.itis.app.repository.UserRepository;
import com.itis.app.security.details.UserDetailsImpl;
import com.itis.app.security.details.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
//import org.springframework.web.socket.WebSocketMessage;
//import org.springframework.web.socket.WebSocketSession;
//import org.springframework.web.socket.config.annotation.EnableWebSocket;
//import org.springframework.web.socket.handler.TextWebSocketHandler;
//
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.Map;
//import java.util.Optional;
//
//@Component
//@EnableWebSocket
//public class WebSocketMessagesHandler extends TextWebSocketHandler {
//    private static final Map<String, WebSocketSession> sessions = new HashMap<>();
//
//    @Autowired
//    private ObjectMapper objectMapper;
//
//    @Autowired
//    UserDetailsServiceImpl userDetails;
//
//    @Autowired
//    UserRepository userRepository;
//
//    @Override
//    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
//
//        private static final Map<String, WebSocketSession> sessions = new HashMap<>();
//
//        @Autowired
//        private ObjectMapper objectMapper;
//
//        @Override
//        public void handleMessage (WebSocketSession session, WebSocketMessage < ?>message) throws Exception {
//            String messageText = (String) message.getPayload();
//            Message messageFromJson = objectMapper.readValue(messageText, Message.class);
//
//            if (!sessions.containsKey(messageFromJson.getFrom())) {
//                sessions.put(messageFromJson.getFrom(), session);
//            }
//
//            for (WebSocketSession currentSession : sessions.values()) {
//                currentSession.sendMessage(message);
//            }
//        }
//    }
//
//}

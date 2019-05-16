package org.kh.billy.message.controller;

import java.security.Principal;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class CommonController {
	@MessageMapping("/echo")

	@SendTo("/message/socket")

	        public String sendEcho(String message, Principal principal) throws Exception {

	            return message;

	        } 
	
}

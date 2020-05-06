package com.itis.app.aspects;

import com.itis.app.dto.SignUpDto;
import com.itis.app.model.MailMessage;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class Logging {

    @Before(value= "execution(* com.itis.app.service.SignUpServiceImpl.signUp(..))")
    public void logSignUp(JoinPoint jp){
        SignUpDto user = (SignUpDto) jp.getArgs()[0];
        System.out.println("User " + user.getUsername() + " signed up");
    }

    @After(value= "execution(* com.itis.app.service.ConfirmServiceImpl.activateUser(..))")
    public void logConfirm(JoinPoint jp){
        System.out.println("User  confirmed his/her status with code " + jp.getArgs()[0]);
    }

    @After(value= "execution(* com.itis.app.service.EmailService.sendMail(..))")
    public void logSendMail(JoinPoint jp){
        MailMessage message = (MailMessage) jp.getArgs()[0];
        System.out.println("Letter with text : \"" + message.getText() + "\" is sent to user");
    }
}

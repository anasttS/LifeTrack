package com.itis.app.aspects;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class Logging {

    @Before(value= "execution(* com.itis.app.service.SignUpServiceImpl.signUp(..))")
    public void logSignUp(JoinPoint jp){
        System.out.println("User signed up");
    }

    @After(value= "execution(* com.itis.app.service.ConfirmServiceImpl.activateUser(..))")
    public void logConfirm(JoinPoint jp){
        System.out.println("User confirmed his/her status");
    }

    @After(value= "execution(* com.itis.app.service.EmailService.sendMail(..))")
    public void logSendMail(JoinPoint jp){
        System.out.println("Letter is sent to user");
    }
}

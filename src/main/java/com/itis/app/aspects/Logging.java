package com.itis.app.aspects;

import com.itis.app.dto.SignUpDto;
import com.itis.app.model.MailMessage;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import net.bytebuddy.implementation.bytecode.member.MethodInvocation;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.logging.Logger;

@Component
@Aspect
public class Logging {

    @Before(value= "execution(* com.itis.app.service.SignUpServiceImpl.signUp(..))")
    public void logSignUp(JoinPoint jp){
        SignUpDto user = (SignUpDto) jp.getArgs()[0];
        System.out.println("User " + user.getUsername() + " try to sign up");
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

    @Around("@annotation(LogExecutionTime)")
    public Object logExecutionTime(ProceedingJoinPoint joinPoint) throws Throwable {
        long start = System.currentTimeMillis();
        Object proceed = joinPoint.proceed();
        long executionTime = System.currentTimeMillis() - start;
        System.out.println(joinPoint.getSignature() + " executed in " + executionTime + "ms");
        return proceed;
    }
}

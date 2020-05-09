package com.itis.app.scope;

import com.itis.app.scope.customScope.CustomScope;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.ObjectFactory;

public class CustomBean {

    private CustomScope customScope = new CustomScope();

    public void activate(String code){
        customScope.get(code, factory);
        System.out.println("User is activated");
    }

    public void deactivate(String code){
        customScope.remove(code);
        System.out.println("User is deleted");
    }

    public void countOfUsers(){
        customScope.count();
    }



    private ObjectFactory factory = new ObjectFactory() {
        @Override
        public Object getObject() throws BeansException {
            return null;
        }
    };
}

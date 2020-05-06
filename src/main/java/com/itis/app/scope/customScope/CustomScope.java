package com.itis.app.scope.customScope;

import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.config.Scope;

import java.util.ArrayList;


public class CustomScope implements Scope {

    private ArrayList<String> scopedObjects = new ArrayList<>();

    @Override
    public Object get(String name, ObjectFactory<?> objectFactory) {
//        if (!scopedObjects.containsKey(name)) {
//            scopedObjects.put(name, getClass());
//        }
//        System.out.println(name);
//        return scopedObjects.get(name);
        //Object o = objectFactory.getObject();
        //System.out.println("Created object: " + o.toString());
        System.out.println("Code: " + name);
        scopedObjects.add(name);
        return String.class;
    }

    @Override
    public Object remove(String name) {
        System.out.println("User with code " + name + "is deleted");
        scopedObjects.remove(name);
        return null;
    }

    @Override
    public void registerDestructionCallback(String name, Runnable callback) {

    }

    @Override
    public Object resolveContextualObject(String key) {
        return null;
    }

    @Override
    public String getConversationId() {
        return "custom";
    }
}
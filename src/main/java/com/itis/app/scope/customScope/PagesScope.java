package com.itis.app.scope.customScope;

import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.config.Scope;

import java.util.HashMap;
import java.util.Map;


public class PagesScope implements Scope {
    private Map<String, Integer> redirectCounter = new HashMap<>();
    private Map<String, Object> beans = new HashMap<>();

    @Override
    public Object get(String name, ObjectFactory<?> objectFactory) {
        if (beans.size() != 0) {
            if (name.toLowerCase().contains("controller")) {
                if (beans.containsKey(name)) {
                    Object bean = beans.get(name);
                    redirectCounter.replace(name, redirectCounter.get(name) + 1);
                    System.out.println("Count of redirecting to " + name + " = " + redirectCounter.get(name));
                    return bean;
                } else {
                    Object o = objectFactory.getObject();
                    beans.put(name, o);
                    redirectCounter.put(name, 1);
                    System.out.println("Count of redirecting to " + name + " = " + redirectCounter.get(name));
                    return o;
                }
            }
        } else {
            Object o = objectFactory.getObject();
            beans.put(name, o);
            return o;
        }

        return null;
    }

    @Override
    public Object remove(String s) {
        if (redirectCounter.containsKey(s)) {
            redirectCounter.remove(s);
        }
        return beans.remove(s);
    }

    @Override
    public void registerDestructionCallback(String s, Runnable runnable) {

    }

    @Override
    public Object resolveContextualObject(String s) {
        return null;
    }

    @Override
    public String getConversationId() {
        return "pages";
    }
}
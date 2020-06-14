package com.itis.app.scope.customScope;

import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.config.Scope;

import java.util.HashMap;
import java.util.Map;


public class PagesScope implements Scope {
    private Map<String, Integer> redirectCounter = new HashMap<>();
    private Map<String, Object> pages = new HashMap<>();

    @Override
    public Object get(String name, ObjectFactory<?> objectFactory) {
        if (pages.containsKey(name)) {
            if (name.toLowerCase().contains("controller")) {
                Object bean = pages.get(name);
                redirectCounter.replace(name, redirectCounter.get(name) + 1);
                System.out.println("Count of redirecting to " + name + " = " + redirectCounter.get(name));
                return bean;
            }
        } else {
            if (name.toLowerCase().contains("controller")) {
                Object o = objectFactory.getObject();
                pages.put(name, o);
                redirectCounter.put(name, 1);
                System.out.println("Counter of interactions with " + name + " = " + redirectCounter.get(name));
                return o;
            }
        }
        return null;
    }

    @Override
    public Object remove(String s) {
        if (redirectCounter.containsKey(s)) {
            redirectCounter.remove(s);
        }
        return pages.remove(s);
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
package com.bogdan.cs230project.config;

import java.io.IOException;
import java.util.Properties;

public class Config {

    private static final String propertiesPath = "config.properties";
    private static Properties properties = null;

    public static Properties getProperties() {
        if (properties == null) {
            try {
                ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
                properties = new Properties();
                properties.load(classLoader.getResourceAsStream(propertiesPath));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return properties;
    }
}


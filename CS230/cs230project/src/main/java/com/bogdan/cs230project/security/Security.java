package com.bogdan.cs230project.security;

import java.nio.charset.StandardCharsets;
import com.google.common.hash.Hashing;

public class Security {

    public static String hash(final String originalString) {
        return Hashing.sha256().hashString(originalString, StandardCharsets.UTF_8).toString();
    }
}

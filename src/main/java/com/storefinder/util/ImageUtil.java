package com.storefinder.util;


import org.springframework.security.crypto.codec.Base64;

import java.io.UnsupportedEncodingException;

public class ImageUtil {

    public static String getImageAsString(byte[] content) {

        try {
            byte[] encodeBase64 = Base64.encode(content);
            return new String(encodeBase64, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return null;
    }
}

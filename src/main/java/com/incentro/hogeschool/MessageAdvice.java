package com.incentro.hogeschool;

import com.sun.tracing.dtrace.ModuleAttributes;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class MessageAdvice {

    @ModelAttribute("message")
    public String message(@Value("${application.message:Hello World}") String message) {
        return message;
    }

}

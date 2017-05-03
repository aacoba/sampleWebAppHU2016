package com.incentro.hogeschool;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Calendar;

@Controller
public class WeekendController {

    @RequestMapping("/weekend")
    public String weekend() {
        return "weekend";
    }
}

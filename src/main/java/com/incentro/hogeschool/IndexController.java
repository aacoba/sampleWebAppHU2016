package com.incentro.hogeschool;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/dankestmemes")
    public String dankestmemes() {
        return "dank-af";
    }
  
    @RequestMapping("/hello")
    public String sayHello(){
        return "hello";
    }
}

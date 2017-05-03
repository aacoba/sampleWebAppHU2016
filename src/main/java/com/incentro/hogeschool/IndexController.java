package com.incentro.hogeschool;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/snake")
    public String snake() {
        return "snake";
    }
    
    @RequestMapping("/Hangman")
    public String Hangman(){
    	return "Hangman";
    }

    @RequestMapping("/calculator")
    public String myContribution() { return "<h1>Calculator</h1>"; }

    @RequestMapping("/incentro")
    public String incentro() {return "incentro"; }

    @RequestMapping("/dankestmemes")
    public String dankestmemes() {
        return "dank-af";
    }
  
    @RequestMapping("/hello")
    public String sayHello(){
        return "hello";
    }
}

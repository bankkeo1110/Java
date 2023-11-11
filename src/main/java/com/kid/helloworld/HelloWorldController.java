package com.kid.helloworld;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HelloWorldController {
     @GetMapping("/")
    public String showHomePage() {
        return "index"; // This will look for /WEB-INF/views/index.jsp
    }

    @RequestMapping(value = "/hello", method = RequestMethod.POST)
    public String helloWorld(@RequestParam(name = "name", defaultValue = "World") String name, Model model) {
        model.addAttribute("message", "Hello " + name);
        return "index";
    }
}

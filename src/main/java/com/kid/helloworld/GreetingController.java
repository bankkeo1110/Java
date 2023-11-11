
package com.kid.helloworld;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GreetingController {

     @GetMapping("/cc")
    public String showHomePage() {
        return "cc"; // This will look for /WEB-INF/views/index.jsp
    }

    @RequestMapping(value= "/greet" , method = RequestMethod.POST)
    public String greet(@RequestParam String name, Model model) {
        model.addAttribute("name", name);
        return "cc"; 
    }
}

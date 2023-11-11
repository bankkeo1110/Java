package com.kid.helloworld;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CarController {

    @Autowired
    private CarService carService;

    @GetMapping("/cars")
    public String listCars(Model model) {
        model.addAttribute("cars", carService.findAllCars());
        return "car"; // This should be the name of your JSP file
    }
}

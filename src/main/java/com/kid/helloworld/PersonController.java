package com.kid.helloworld;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/persons")
public class PersonController {

    @Autowired
    private PersonService personService;

    @GetMapping
    public String listPersons(Model model) {
        model.addAttribute("persons", personService.findAllPersons());
        return "persons"; // Name of the JSP file
    }

    @GetMapping("/{id}")
    public String getPerson(@PathVariable Integer id, Model model) {
        Person person = personService.findPersonById(id);
        model.addAttribute("person", person);
        return "person-detail"; // Name of the JSP file for displaying a single person
    }

    // Add methods to handle creating, updating and deleting persons
}
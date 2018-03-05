package com.example.PersonCar.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by anyderre on 04/03/18.
 */
@Controller
public class IndexController {
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String paginaPrincipal() {
        return "index";
    }
    @RequestMapping(value = "/person", method = RequestMethod.GET)
    public String person() {
        return "person";
    }
    @RequestMapping(value = "/car", method = RequestMethod.GET)
    public String car() {
        return "car";
    }

}

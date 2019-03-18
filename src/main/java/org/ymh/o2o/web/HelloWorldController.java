package org.ymh.o2o.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/",method = RequestMethod.GET)
public class HelloWorldController {

    @RequestMapping("/hello")
    @ResponseBody
    public String sayHello(){
        return "helloWorld";
    }
}

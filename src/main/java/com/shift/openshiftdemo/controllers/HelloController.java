package com.shift.openshiftdemo.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping(path = "/")
    public String helloWorld(){
        return "Hello Openshift";
    }
}

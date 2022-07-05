package com.MvcPractise.controller;

import com.MvcPractise.entity.Address;
import com.MvcPractise.entity.Employee;
import com.MvcPractise.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AppController {


    @Autowired
    private EmpService Empservice;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showHome(){
        return "index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String showForm(Model model){

        Employee employee = new Employee();
        Address currentAddress = new Address();
        Address permanentAddress = new Address();
        employee.setCurrentAdd(currentAddress);
        employee.setPermanentAdd(permanentAddress);

        model.addAttribute("employee", employee);

        return "form";

    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String saveEmployee(Model model, @ModelAttribute("employee") Employee employee){

        System.out.println(employee.getFirstName());
        System.out.println(employee.getLastName());
        System.out.println(employee.getSex());
        System.out.println(employee.getDob());
        System.out.println(employee.getEmail());
        System.out.println(employee.getMobileNo());
        System.out.println(employee.getCurrentAdd().getCity());
        System.out.println(employee.getReligion());
        System.out.println(employee.getPermanentAdd().getCity());
        return "index";
    }


}


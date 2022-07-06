package com.MvcPractise.controller;

import com.MvcPractise.entity.Address;
import com.MvcPractise.entity.Employee;
import com.MvcPractise.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AppController {


    @Autowired
    private EmpService empService;


    @RequestMapping(value = "/", method = RequestMethod.GET)
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

        empService.createEmployeeRecord(employee);

        return "form";
    }

    @RequestMapping(value="/get", method = RequestMethod.GET)
    public String showSearch(){

        return "search";
    }

    @RequestMapping(value="/get", method = RequestMethod.POST)
    public String getEmployeeByMail(Model model, @RequestAttribute("searchEmail") String email){
        Employee employee = empService.getEmployeeRecordUsingMail(email);
        model.addAttribute("employee", employee);
        return "search";
    }




}


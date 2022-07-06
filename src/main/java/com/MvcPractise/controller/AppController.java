package com.MvcPractise.controller;

import com.MvcPractise.entity.Address;
import com.MvcPractise.entity.Employee;
import com.MvcPractise.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


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
    public String saveEmployee(Model model, @ModelAttribute("employee") Employee employee,
                               final RedirectAttributes redirectAttributes){


        empService.createEmployeeRecord(employee);
        redirectAttributes.addFlashAttribute("css", "success");
        redirectAttributes.addFlashAttribute("msg", "Record Added Successfully!");
        return "redirect:/get";
    }

    @RequestMapping(value="/get", method = RequestMethod.GET)
    public String showSearch(){

        return "search";
    }

    @RequestMapping(value="/get", method = RequestMethod.POST)
    public String getEmployeeByMail(Model model, @RequestParam("searchEmail") String email,
                                    final RedirectAttributes redirectAttributes){
        Employee employee = empService.getEmployeeRecordUsingMail(email);
        if(employee!=null) {
            model.addAttribute("found","true");
            model.addAttribute("employee", employee);
        }
        else{
            model.addAttribute("found","false");
            model.addAttribute("css", "warning");
            model.addAttribute("msg", "No Such Records!");
        }
        return "search";
    }




}


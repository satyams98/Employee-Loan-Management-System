package com.MvcPractise.controller;

import com.MvcPractise.entity.Address;
import com.MvcPractise.entity.Employee;
import com.MvcPractise.entity.Family;
import com.MvcPractise.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;


@Controller
public class AppController {


    @Autowired
    private EmpService empService;

    @RequestMapping(value="/", method = RequestMethod.GET)
    public String showHome(Model model){
        return "index";
    }


    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String showForm(Model model){

        Employee employee = new Employee();
        Address currentAddress = new Address();
        Address permanentAddress = new Address();
        employee.setCurrentAdd(currentAddress);
        employee.setPermanentAdd(permanentAddress);
        List<Family>families = new ArrayList<>();
        families.add(new Family());
        families.add(new Family());
        families.add(new Family());
        families.add(new Family());
        employee.setFamilyList(families);

        model.addAttribute("employee", employee);

        return "form";

    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String saveEmployee(Model model, @ModelAttribute("employee") Employee employee,
                               final RedirectAttributes redirectAttributes){

        if (empService.isProofIdExists(employee.getProofId())){
            redirectAttributes.addFlashAttribute("css", "danger");
            redirectAttributes.addFlashAttribute("msg", "Record with given Proof Id Already Exists!");
            return "redirect:/add";
        }
        else if (empService.isMailExists(employee.getEmail())) {

            redirectAttributes.addFlashAttribute("css", "danger");
            redirectAttributes.addFlashAttribute("msg", "Record with given Email Already Exists!");
            return "redirect:/add";
        }
        else if(empService.isContactNoExists(employee.getMobileNo())){
            redirectAttributes.addFlashAttribute("css", "danger");
            redirectAttributes.addFlashAttribute("msg", "Record with given Mobile No. Already Exists!");
            return "redirect:/add";

        }
        else {
            empService.createEmployeeRecord(employee);
            redirectAttributes.addFlashAttribute("css", "success");
            redirectAttributes.addFlashAttribute("msg", "Registered Successfully!");
            Family f1 = employee.getFamilyList().get(0);
            System.out.println(f1.getName()+f1.getAdhaarNo()+f1.getContactNo()+f1.getRelation());
            System.out.println(employee.getDob());
            return "redirect:/";
        }

    }

    @RequestMapping(value="/search", method = RequestMethod.GET)
    public String showSearch(){

        return "search";
    }

    @RequestMapping(value="/search", method = RequestMethod.POST)
    public String getEmployeeByMail(Model model, @RequestParam("searchEmail") String email,
                                    final RedirectAttributes redirectAttributes){
        Employee employee = empService.getEmployeeRecordUsingMail(email);
        if(employee!=null) {
            model.addAttribute("found","true");
            model.addAttribute("employee", employee);
            System.out.println("here in search:");
            System.out.println(employee.getFamilyList().get(0).getName());
            System.out.println(employee.getDob());
        }
        else{
            model.addAttribute("found","false");
            model.addAttribute("css", "warning");
            model.addAttribute("msg", "No Such Records!");
        }
        return "search";
    }




}


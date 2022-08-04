package com.MvcPractise.controller;

import com.MvcPractise.dao.DAO;
import com.MvcPractise.dao.DAOImplementation;
import com.MvcPractise.entity.*;
import com.MvcPractise.service.EmpService;
import com.MvcPractise.service.LoanCalculations;
import com.MvcPractise.service.LoanService;
import com.fasterxml.jackson.annotation.JsonView;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.util.Date;



@Controller
public class AppController {


    @Autowired
    private EmpService empService;

    @Autowired
    private LoanService loanService;

    @Autowired
    private DAO dao;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    @RequestMapping(value="/", method = RequestMethod.GET)
    public String showHome(Model model){
        return "index";
    }


    @RequestMapping(value="/logout", method=RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/";
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
    public String saveEmployee(Model model, @ModelAttribute("employee") Employee employee,
                               final RedirectAttributes redirectAttributes){

        if (empService.isProofIdExists(employee.getProofId())){
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Record with given Proof Id Already Exists!");
            model.addAttribute("head", "Alert!");

            model.addAttribute("employee", employee);
            return "form";
        }
        else if (empService.isMailExists(employee.getEmail())) {

            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Record with given Email Already Exists!");
            model.addAttribute("head", "Alert!");
            model.addAttribute("employee", employee);
            return "form";
        }
        else if(empService.isContactNoExists(employee.getMobileNo())){
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Record with given Mobile No. Already Exists!");
            model.addAttribute("head", "Alert!");
            model.addAttribute("employee", employee);
            return "form";

        }
        else {
            empService.createEmployeeRecord(employee);
            redirectAttributes.addFlashAttribute("css", "success");
            redirectAttributes.addFlashAttribute("msg", "Registered Successfully!");
            redirectAttributes.addFlashAttribute("head", "Success!");

            return "redirect:/";
        }

    }

    @RequestMapping(value="/search", method = RequestMethod.GET)
    public String showSearch(Model model, @RequestParam("action")String action){

        model.addAttribute("action", action);

        return "searchRecord";
    }

    @RequestMapping(value="/search", method = RequestMethod.POST)
    public String getEmployeeByMail(Model model, @RequestParam("email") String email,
                                    @RequestParam("proofType") String proofType,
                                    @RequestParam("proofId")String proofId,
                                    @RequestParam("action") String action,
                                    final RedirectAttributes redirectAttributes){
        Employee employee;

        if(!email.isEmpty()){
            employee = empService.getEmployeeRecordUsingMail(email);
        }
        else{
            employee = empService.getEmployeeById(proofType, proofId);
        }
        if(employee==null){
            model.addAttribute("css", "warning");
            model.addAttribute("msg", "No Such Record found!");
            model.addAttribute("head", "Alert!");
            return "searchRecord";
        }
        model.addAttribute("employee", employee);
        model.addAttribute("css", "success");
        model.addAttribute("msg", "Record found!");
        model.addAttribute("head", "Success!");

        if(action.equals("detail")){

            return "detail";

        }
        else if(action.equals("update")){

            return "update";
        }

        return "delete";
    }



    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateEmployee(Model model, @ModelAttribute("employee") Employee employee,
                                 final RedirectAttributes redirectAttributes ){


            empService.updateEmployeeRecord(employee);
            redirectAttributes.addFlashAttribute("css", "success");
            redirectAttributes.addFlashAttribute("msg", "Employee Updated Successfully!");
            redirectAttributes.addFlashAttribute("head", "Success!");

            return "redirect:/";



    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String showDelete(Model model){
        return "delete";
    }


    @RequestMapping(value="/delete", method = RequestMethod.POST)
    public String deleteEmployee(Model model, @ModelAttribute("employee") Employee employee,
                                 @RequestParam("email") String email,
                                 final RedirectAttributes redirectAttributes){
        System.out.println(employee==null);
        empService.deleteEmployee(email);
        redirectAttributes.addFlashAttribute("css", "success");
        redirectAttributes.addFlashAttribute("msg", "Employee Deleted Successfully!");
        redirectAttributes.addFlashAttribute("head", "Success!");

        return "redirect:/";

    }

    @RequestMapping(value = "/loanReq", method = RequestMethod.GET)
    public String showLoanRequest(Model model){
        return "LoanReq";
    }


    @JsonView(Views.Public.class)
    @ResponseBody
    @RequestMapping(value = "/calculateEligibleAmount", method = RequestMethod.POST, consumes= MediaType.APPLICATION_JSON_VALUE)
    public AjaxResponseBody calculateEligibleAmount(@RequestBody LoanReqData loanReqData ){
        AjaxResponseBody result = new AjaxResponseBody();
        LoanCalculations loanCalculations = new LoanCalculations();
        double eligibleEMI = loanCalculations.calculateMaxEligibleEMI(loanReqData.getMonthlyIncome(), loanReqData.getMonthlyExpense());
        double maxEligibleLoanAmount=loanCalculations.calculateMaxEligibleLoanAmount(eligibleEMI, loanReqData.getRoi(), loanReqData.getTenure(), loanReqData.getRepayFrequency());
        maxEligibleLoanAmount = Math.round(maxEligibleLoanAmount*100)/100;
        result.setEligibleLoanAmount(maxEligibleLoanAmount);
        return result;


    }

    @JsonView(Views.Public.class)
    @ResponseBody
    @RequestMapping(value = "/ajaxSearch", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
    public AjaxEmployeeSearchResponseBody ajaxEmployeeSearch(@RequestBody AjaxEmployeeSearch ajaxEmployeeSearch, Model model){
        AjaxEmployeeSearchResponseBody result = new AjaxEmployeeSearchResponseBody();
        boolean isExists  = empService.isProofIdExists(ajaxEmployeeSearch.getProofId());
        result.setExists(isExists);
        return result;

    }

    @RequestMapping(value = "/loanReqApproval", method = RequestMethod.POST)
    public String proceedLoan(Model model, @RequestParam("proofType")String proofType,
                              @RequestParam("proofId")String proofId

                              ){


        Employee employee = empService.getEmployeeById(proofType, proofId);
        int index = employee.getLoanAgreements().size()-1;
        LoanAgreement loanAgreement = employee.getLoanAgreements().get(index);
        LoanProduct loanProduct = loanAgreement.getLoanProduct();
        loanProduct.setStatus("Approved");
        loanAgreement.setLoanStatus("Approved");
        loanAgreement.setLoanDisbursalDate(new Date());

        empService.mergeEmployeeRecord(employee);

        model.addAttribute("css", "success");
        model.addAttribute("head", "Success! ");
        model.addAttribute("msg", "Loan Approved!");
        return "index";


    }

    @RequestMapping(value="/loanReq", method=RequestMethod.POST)
    public String loanApproval(Model model, @RequestParam("proofId")String proofId,
                               @RequestParam("proofType") String proofType,
                               @RequestParam("loanProduct")String loanProduct,
                               @RequestParam("roi")double rate,
                               @RequestParam("tenure")double tenure,
                               @RequestParam("repayFrequency") double repayFrequency,
                               @RequestParam("income") double income,
                               @RequestParam("expense") double expense,
                               @RequestParam("loanAmount")double loanAmount){

        Employee employee = empService.getEmployeeById(proofType, proofId);
        employee.setMonthlyIncome(income);
        employee.setTotalMonthlyExpenses(expense);
        double dbr= (expense/income)*100;
        employee.setDbr(dbr);



        LoanProduct loanProduct1 = new LoanProduct();
        loanProduct1.setTenure(tenure);
        loanProduct1.setRoi(rate);
        if(loanProduct.equals("H")){
            loanProduct1.setLoanProductCode("HL001");
            loanProduct1.setLoanProductName("Home Loan");
            model.addAttribute("loanProduct", "Home Loan");


        }
        else if(loanProduct.equals("E")){
            loanProduct1.setLoanProductCode("EDL001");
            loanProduct1.setLoanProductName("Education Loan");
            model.addAttribute("loanProduct", "Education Loan");

        }else{
            loanProduct1.setLoanProductCode("CVL001");
            loanProduct1.setLoanProductCode("Consumer Vehicle Loan");
            model.addAttribute("loanProduct", "Consumer Vehicle Loan");
        }

        loanProduct1.setStatus("Pending");

        LoanAgreement loanAgreement = new LoanAgreement();


        loanAgreement.setLoanProduct(loanProduct1);
        loanAgreement.setLoanAmount(loanAmount);
        loanAgreement.setRepaymentFrequency(repayFrequency);
        loanAgreement.setTenure(tenure);
        loanAgreement.setRate(rate);
        loanAgreement.setLoanStatus("Pending");
        loanAgreement.setEmployee(employee);

        loanAgreement.calculateEMI();
        loanAgreement.generateRS();

        employee.getLoanAgreements().add(loanAgreement);
        empService.mergeEmployeeRecord(employee);
        int index = empService.getEmployeeById(proofType, proofId).getLoanAgreements().size()-1;
        LoanAgreement loanAgreement1 = employee.getLoanAgreements().get(index);

        System.out.println(loanAgreement1.getLoanAgreementId());
        model.addAttribute("employee", employee);
        model.addAttribute("loanAgreement",loanAgreement1 );
        model.addAttribute("repaySchedule", loanAgreement.getRepaymentSchedule());
        model.addAttribute("dbr", dbr);

        return "loanApproval";

    }

    @RequestMapping(value = "/searchLoan", method = RequestMethod.GET)
    public String searchLoan(Model model){
        return "searchLoan";
    }

    @RequestMapping(value = "/searchLoan", method = RequestMethod.POST)
    public String SearchLoanRes(Model model, @RequestParam("proofType")String proofType,
                                @RequestParam("proofId") String proofId,
                                @RequestParam("loanAgreementId")long loanAgreementId){

        Employee employee = empService.getEmployeeById(proofType, proofId);
        if(employee==null){
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Employee not found!");
            model.addAttribute("head", "Alert!");
            return "searchLoan";
        }
        LoanAgreement loanAgreement = loanService.getLoanAgreement(loanAgreementId);
        if(loanAgreement==null){
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "Loan Record against given loan record not found!");
            model.addAttribute("head", "Alert!");
            return "searchLoan";
        }
        System.out.println(loanAgreement.getRepaymentSchedule().get(0));
        model.addAttribute("employee", employee);
        model.addAttribute("loanAgreement",loanAgreement );
        model.addAttribute("repaySchedule", loanAgreement.getRepaymentSchedule());
        model.addAttribute("dbr", employee.getDbr());



        return "searchLoanRes";
    }



}


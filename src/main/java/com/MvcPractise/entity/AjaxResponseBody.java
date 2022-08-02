package com.MvcPractise.entity;

import com.fasterxml.jackson.annotation.JsonView;

public class AjaxResponseBody {
    @JsonView(Views.Public.class)
    double eligibleLoanAmount;

    public double getEligibleLoanAmount() {
        return eligibleLoanAmount;
    }

    public void setEligibleLoanAmount(double eligibleLoanAmount) {
        this.eligibleLoanAmount = eligibleLoanAmount;
    }
}

package com.MvcPractise.entity;

import com.fasterxml.jackson.annotation.JsonView;

public class AjaxEmployeeSearchResponseBody {
    @JsonView(Views.Public.class)
    boolean isExists;

    public boolean isExists() {
        return isExists;
    }

    public void setExists(boolean exists) {
        isExists = exists;
    }
}

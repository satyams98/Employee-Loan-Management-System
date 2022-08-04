<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Register</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
        <link rel="stylesheet" href="../../resources/form.css">

        <style>


           
            .middle {
                margin: 2% 15% 5%;
                padding: 0;

            }
            .logo {
                margin: 10% 20% 20% 150%;
            }
            .form {
                margin: 4% -6% 1% 12%;
            }
            .heading {
                margin: 0 0 5% 42%;
                color:#535bac;
            }
            .logo{

                margin: 0 0 0 20%;
            }
            .logo-text{
                color:#535bac;
                margin:0 0 0 5%;
            }
           
              .submit{
                    background-color:#444B8D;
              }
              .submit:hover{
                      background-color:   #313667;
              }
              .reset{
                background-color:#736E38;
              }
              .reset:hover{
              background-color:#676231;
              }
              .cancel{
                    background-color:#73375A;
             }
             .cancel:hover{
                     background-color:#522841;
             }
             .invalid-feedback{
                    position:absolute;
                   margin: 10% 0 -7% 0;
             }
             .valid-feedback{
              position:absolute;
               margin: 10% 0 -7% 0;
             }
        </style>
    </head>
    <body>
<nav class="navbar navbar-dark bg-transparent ">

    <a href="/" class="navbar-brand text-dark mx-2 order-1  ">
        <img src="../../resources/R.jpg" alt="" width="45" height="45" class="d-inline-block align-top logo">
        <h2 class="d-inline align-middle logo-text "><strong>NSEL Employee Interface</strong></h2>
    </a>

</nav>
        <c:if test="${not empty msg}">
            <div class="toast align-items-center text-white bg-${css} border-0 " role="alert" aria-live="assertive" aria-atomic="true" style="position:absolute; z-index:9; margin:-1% 0 0 75%">
                <div class="d-flex">
                    <div class="toast-body">
                        <b>
                            ${head}</b>
                        ${msg}
                    </div>
                    <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
            </div>
        </c:if>

 
            <h2 class="heading">Loan Details</h2>

<div class="container">
    <br>
        <ul class="nav nav-tabs">
            <li class="nav-item">
                 <a href="#home" class="nav-link active" data-bs-toggle="tab">Employee Details</a>
            </li>
            <li class="nav-item">
               <a href="#profile" class="nav-link" data-bs-toggle="tab">Loan Details</a>
            </li>
            <li class="nav-item">
             <a href="#messages" class="nav-link" data-bs-toggle="tab">Repayment Schedule</a>
            </li>
        </ul>
<div class="tab-content">
    <div class="tab-pane fade show active" id="home">
        <br>
                <div class="row">
                    <div class="col-md-3">
                    <label for="firstName" class="form-label">First name</label>
                        <input type="text" class="form-control" id="firstName" name="firstName" value="${employee.firstName}" readonly/>
                            
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                            <div class="invalid-feedback">
                                Please enter valid First name.
                            </div>
                    </div>
                    <div class="col-md-3">
                         <label for="lastName" class="form-label">Last name</label>
                         <input type="text" class="form-control" id="lastName" name="lastName" value="${employee.lastName}" readonly/>
                            
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                            <div class="invalid-feedback">
                                Please enter valid Last name.
                            </div>
                    </div>

                </div>
                <br>
           
              
                <div class="row">
                    <div class="col-md-3">
                        <label for="dob" class="form-label">Date of Birth</label>
                        <input type="text" class="form-control" id="dob" name="dob" value="<fmt:formatDate type = 'date' value = '${employee.dob}'/>" readonly/>
                        
                    </div>
                    <div class="col-md-3">
                     <label for="sex" class="form-label">Sex</label>
                        <input type="text" class="form-control" id="sex" name="sex" value="${employee.sex}" readonly/>
                        
                    </div>

                </div>
                <br>
                <div class="row">
                    <div class="col-md-3">
                        <label for="religion" class="form-label">Religion</label>
                        <input type="text" class="form-control" id="religion" name="religion" value=" ${employee.religion}" readonly/>
                        
                    </div>
                    <div class="col-md-3">
                    <label for="mobileNo" class="form-label">Contact No.</label>
                    <input type="text" class="form-control" id="mobileNo" name="mobileNo" value="${employee.mobileNo}"   readonly />
                       
                    </div>

                </div>
                <br>
                <div class="row">
                    <div class="col-md-3">
                        <label for="proofType" class="form-label">Proof Type</label>
                        <input type="text" class="form-control" id="proofType" name="proofType" value="${employee.proofType}" readonly/>
                        
                    </div>
                    <div class="col-md-3">
                    <label for="proofId" class="form-label">Proof Id</label>
                    <input type="text" class="form-control" id="proofId" name="proofId" value="${employee.proofId}"   readonly />
                       
                    </div>

                </div>
    </div>
    <div class="tab-pane fade" id="profile">
         <br>
                  <div class="row">
                    <div class="col-md-3">
                        <label for="loanAgreementId" class="form-label">Loan Agreement Id</label>
                        <input type="text" class="form-control" id="loanAgreementId" name="loanAgreementId" value='<fmt:formatNumber value="${loanAgreement.loanAgreementId}" pattern="#.00"/>'   readonly/>
                        
                    </div>
                    <div class="col-md-3">
                    <label for="repayFrequency" class="form-label">Status</label>
                    <input type="text" class="form-control" id="repayFrequency" name="repayFrequency" value="${loanAgreement.loanStatus}"   readonly />
                       
                    </div>

                </div>
                 <br>
                <div class="row">
                    <div class="col-md-3">
                        <label for="dbr" class="form-label">DBR</label>
                        <input type="number" class="form-control" id="dbr" name="dbr" value='<fmt:formatNumber value="${dbr}" pattern="#.00"/>'   readonly/>
                        
                    </div>
                    <div class="col-md-3">
                    <label for="repayFrequency" class="form-label">Repayment Frequency</label>
                    <input type="text" class="form-control" id="repayFrequency" name="repayFrequency" value="${loanAgreement.repaymentFrequency}"   readonly />
                       
                    </div>

                </div>
                 <br>
                <div class="row">
                    <div class="col-md-3">
                        <label for="loanProduct" class="form-label">Loan Product</label>
                        <input type="text" class="form-control" id="loanProduct" name="loanProduct" value="${loanProduct}" readonly/>
                        
                    </div>
                    <div class="col-md-3">
                    <label for="roi" class="form-label">ROI(p.a)</label>
                    <input type="text" class="form-control" id="roi" name="roi" value="${loanAgreement.rate}"   readonly />
                       
                    </div>

                </div>
                 <br>
                <div class="row">
                    <div class="col-md-3">
                        <label for="tenure" class="form-label">Tenure</label>
                        <input type="text" class="form-control" id="tenure" name="tenure" value="${loanAgreement.tenure}" readonly/>
                        
                    </div>
                    <div class="col-md-3">
                    <label for="loanAmount" class="form-label">Loan Amount</label>
                    <input class="form-control" id="loanAmount" name="loanAmount" value='<fmt:formatNumber value="${loanAgreement.loanAmount}" pattern="#.00"/>' readonly />
                       
                    </div>

                </div>
    </div>
    <div class="tab-pane fade" id="messages">
<div class="container">
    <table id="Record" class="table table-striped table-bordered" style="width: auto;">
         <thead>
        <tr>
            <th>Month</th>
            <th>EMI</th>
            <th>Principal Paid</th>
            <th>Interest Paid</th>
            <th>Outstandign Principal </th>
               
        </tr>
    </thead>
    <tbody>
        <c:forEach items ="${repaySchedule}" var="emi">
            <tr>
                <td>${emi.month}</td>
                <td><fmt:formatNumber value="${emi.installment}" pattern="#.00"/></td>
                <td><fmt:formatNumber value="${emi.principalPaid}" pattern="#.00"/></td>
                <td><fmt:formatNumber value="${emi.interestPaid}" pattern="#.00"/></td>
                <td><fmt:formatNumber value="${emi.endingAmount}" pattern="#.00"/></td>
                
            </tr>
          
        </c:forEach>
    </tbody>
    </table>
    </div>
</div>

</div>

<div style="margin: 5% 0 6% 45%">
    <div class="row">
        <%-- <div class="col-md-3">
        <form action="/loanReqApproval" method="POST" >
            <button class="btn btn-primary submit" type="submit">Approve Loan</button>
            <input type="hidden" name="proofId" id="proofId" value="${employee.proofId}" />
             <input type="hidden" name="proofType" id="proofType" value="${employee.proofType}" />
             <input type="hidden" name="employee" id="employee" value="${employee}" />
              <input type="hidden" name="loanAgreementId" id="loanAgreementId" value="${loanAgreement.loanAgreementId}" />
        </form>
        </div> --%>
        <div class="col-md-3">
       
            <a href="/" class="btn btn-primary cancel" type="button">Cancel</a>
        
        </div>
    </div>
    <br>
    
</div>

</body>
<script>
        $(document).ready( function () {
        $('#Record').DataTable();
    } );



    </script>


</html>
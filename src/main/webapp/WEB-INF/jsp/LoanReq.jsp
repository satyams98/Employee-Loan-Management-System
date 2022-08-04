<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Loan Request</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
        
         <link rel="stylesheet" href="../../resources/form.css">
    </head>
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
                margin: 0 0 10% 42%;
                color:#535bac;
            }
            .logo{

                margin: 0 0 0 20%;
            }
            .logo-text{
                color:#535bac;
                margin:0 0 0 5%;
            }
            body{
            background-image:  url("../resources/formBack.png");
            background-repeat: no-repeat;
              background-size : cover;
              height: 1320;
              width: 720;
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
             

  input:read-only + .input-label, .input-field:valid + .input-label {
 	outline: 0;

 	border-bottom-color: #6658d3;
 	color: #6658d3;
 	transform: translateY(-1.5rem);


   }

   input[readonly] {
     background-color: #f0f0fc;
   }
  }


        </style>

<body>
<nav class="navbar navbar-dark bg-transparent ">

    <a href="/" class="navbar-brand text-dark mx-2 order-1  ">
        <img src="../../resources/R.jpg" alt="" width="45" height="45" class="d-inline-block align-top logo">
        <h2 class="d-inline align-middle logo-text "><strong>NSEL Employee Interface</strong></h2>
    </a>

</nav>
    <div id="toastBody">
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
        </div>

         <div class="middle">
            <div class="container mt-3 shadow-lg p-3 mb-5 bg-white rounded ">
                <h2 class="d-inline align-middle heading">
                    <strong>Loan Request</strong>
                </h2>

                <br>

                <form action="/loanReq" method="POST" class="form row g-3 needs-validation card-form"  id="form" >
                    
                    <div class="row">
                        <div class="col-md-5 ">
                        <div class="input">
                            <input type="text" class="input-field" id="firstName" name="firstName" value="${employee.firstName}" required/>
                            <label for="firstName" class=" input-label">First name</label>
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                            <div class="invalid-feedback">
                                Please enter valid First name.
                            </div>
                            </div>
                        </div>
                        <div class="col-md-5 input">

                            <input type="text" class=" input-field" id="lastName" name="lastName" value="${employee.lastName}" required/>
                            <label for="lastName" class=" input-label">Last name</label>
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                            <div class="invalid-feedback">
                                Please enter valid Last name.
                            </div>
                        </div>
                    </div>
                    <div>
                    <br>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                        <div class="input">

                            <input type="date" class="input-field" id="dob" name="dob" value="<fmt:formatDate pattern = 'yyyy-MM-dd'  value = '${employee.dob}'/>" required/>
                            <label for="dob" class="input-label">Date of Birth</label>
                            <div class="valid-feedback">
                                Looks good!
                            </div>
                            <div class="invalid-feedback">
                                Please enter valid Date of birth.
                            </div>
                            </div>
                        </div>
                        <div class="col-md-5 input">

                          
                            <select class="input-field " aria-label="Default select example" id="sex" name="sex" value="${employee.sex}" />
                            <option value="" selected>Select..</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Not Specific">Other</option>
                        </select>

                        <label for="sex" class="input-label">Sex</label>
                        <div class="invalid-feedback" >
                           Please select a valid Sex.
                      </div>

                    </div>
                   
                </div>
                <div>
                 <br>
              
                  </div>
                 <div class="row">
                    <div class="col-md-5 input">

                        <select class="input-field" aria-label="Default select example" id="proofType" name="proofType" value="${employee.proofType}" />
                        <option value="0" selected>Select..</option>
                        <option value="Pan Card">Pan Card</option>
                        <option value="Adhaar Card">Adhaar Card</option>
                        <option value="Passport">Passport</option>
                    </select>
                    <label for="proofType" class="input-label">Id Proof</label>
                </div>
                <div class="col-md-5 " id="renderProof" ></div>
            </div>
            <div><br/></div>
            <div class="row">
                <div class="col-md-5">
                    <button type="button" class="btn btn-primary" id="checkEmployee" >Check Employee Record</button>
                </div>
            </div>
              <div><br/></div>
            <div class="row">
                <div class="col-md-5 ">
                <div class="input">
                    <input type = "text" class="input-field" id = "income" name="income" required />
                    <label for="income" class="input-label">Monthly Income</label>
                    <div class="invalid-feedback" >
                           Please Enter a valid income.
                    </div>
                      </div>
                </div>
                <div class="col-md-5 input">
                    <input type = "text" class="input-field" id = "expense" name="expense" required />
                    <label for="expense" class="input-label">Monthly Expense</label>
                    <div class="invalid-feedback" >
                           Please Enter a valid expense.
                      </div>
                </div>

            </div>
            <div>
            <br>
            </div>
            <div class="row">
                <div class="col-md-5 input">
                      <select class="input-field" aria-label="Default select example" id="loanProduct" name="loanProduct" onchange="changeROI()"  />
                        <option value="0" selected>Select..</option>
                        <option value="H">Home Loan</option>
                        <option value="E">Education Loan</option>
                        <option value="C">Consumer Vehicle Loan</option>
                      
                    </select>
                        <label for="loanProduct" class="input-label">Loan Product</label>
                        <div class="invalid-feedback" >
                            Please Enter a valid Repayment Frequency.
                        </div>
                </div>
                <div class="col-md-5 input">
                <input type = "text" class="input-field" id = "roi" name="roi" readonly />
                <label for="roi" class="input-label">ROI(p.a)</label>
                </div>
            </div>
              <div>
            <br>
            </div>
            <div class="row">
                <div class="col-md-5">
                    <div class="input">
                        <input type = "text" class="input-field" id = "tenure" name="tenure" required />
                        <label for="tenure" class="input-label">Tenure</label>
                        <div class="invalid-feedback" >
                            Please Enter a valid tenure.
                        </div>
                    </div>
                </div>
                <div class="col-md-5 input">
                       <select class="input-field" aria-label="Default select example" id="repayFrequency" name="repayFrequency" value="${employee.proofType}" />
                        <option value="" selected>Select..</option>
                        <option value="12">Monthly</option>
                        <option value="4">Quartely</option>
                        <option value="1">Anually</option>
                         <option value="6">Half-Yearly</option>
                    </select>
                        <label for="repayFrequency" class="input-label">Repayment Frequency</label>
                        <div class="invalid-feedback" >
                            Please Enter a valid Repayment Frequency.
                        </div>
                </div>

            </div>
            <div><br></div>
            <div class="row">
                <div class="col-md-5">
                    <button type="button" class="btn btn-primary" id="calculate">Check</button>
                </div>
            </div>
             <div><br></div>
            <div class="row">
                <div class="col-md-3">
                Your Eligible Loan Amount=
                </div>
                <div class="col-md-4 input" style="margin:-3% 0 0 0">
                <span class="currency-code"><i class="fa-solid fa-indian-rupee-sign"></i></span>
                <input type="text" class="input-field" id="eligibleAmount" name="eligibleAmount" readonly />
                </div>
            </div>
             <div><br></div>
            <div class="row">
                <div class="col-md-3">
                Your DBR=
                </div>
                <div class="col-md-4 input" style="margin:-3% 0 0 0">
                <span class="currency-code"><i class="fa-solid fa-indian-rupee-sign"></i></span>
                <input type="text" class="input-field" id="dbr" name="dbr" readonly />
                </div>
            </div>
            <div><br></div>
            <div class="row">
                <div class="col-md-5 input">
                     <input type = "text" class="input-field" id = "loanAmount" name="loanAmount" required />
                        <label for="loanAmount" class="input-label">Loan Amount</label>
                        <div class="invalid-feedback" >
                            Please Enter a valid Loan Amount.
                        </div>
                </div>
                
            </div>

          
             <div class="col-12">
                    <div class="form-check">
                        <br>
                        <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                        <label class="form-check-label" for="invalidCheck">
                            Agree to terms and conditions
                        </label>
                        <div class="invalid-feedback" style="margin:0.8% 0 0 0">
                            You must agree before submitting.
                        </div>
                    </div>
                </div>
                 <div><br></div>
            <div class="row">
                <div class="col-md-5">
                    <button type="submit" class="btn btn-primary">Proceed</button>
                </div>
            </div>
               <div><br></div>
                </form>
                </div>
                </div>

<!-- Button trigger modal -->
<div style="visibility:hidden">
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" id="empNotFound">
  Launch
</button>
</div>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Alert!</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Employee Not Found! Please Register First!
      </div>
      <div class="modal-footer">
       
        <a type="button" href="/add" class="btn btn-primary">Register</a>
      </div>
    </div>
  </div>
</div>
           
</body>
<script>

$("#proofType").click(function () {


    var e = $(this).val();

    if (e == "Pan Card") {
        newRowAdd = ' <div class="col input" id ="rendered">' + ' <input type="text" class="input-field" id="proofId" name="proofId" value="${employee.proofId}"  required />' + ' <label for="proofId" class="input-label">Pan Card No. </label>' + ' <div class="invalid-feedback">' + ' Please provide a valid Id.' + ' </div>' + ' </div>' + '<div></div>';

        $("#renderProof").empty();
       
        $("#renderProof").append(newRowAdd);
    }
    if (e == "Adhaar Card") {
        newRowAdd = ' <div class="col input" id ="rendered">' + ' <input type="text" class="input-field" id="proofId" name="proofId" value="${employee.proofId}"   required />' + ' <label for="proofId" class="input-label"> Adhaar Card No.</label>' + ' <div class="invalid-feedback">' + ' Please provide a valid Id.' + ' </div>' + ' </div>' + '<div></div>';
        $("#renderProof").empty();
       
        $("#renderProof").append(newRowAdd);
         
    }

    if (e == "Passport") {
        newRowAdd = ' <div class="col input" id ="rendered">' + ' <input type="text" class="input-field" id="proofId" name="proofId" value="${employee.proofId}"   required />' + ' <label for="proofId" class="input-label">Passport No. </label>' + ' <div class="invalid-feedback">' + ' Please provide a valid Id.' + ' </div>' + ' </div>' + '<div></div>';
        $("#renderProof").empty();
       
        $("#renderProof").append(newRowAdd);
    }


    if (e == "0") {
        $("#renderProof").empty();
    }

});

var form = document.getElementById("form")
form.noValidate = true;
form.addEventListener('submit', validateForm)
field = Array.from(form.elements);
field.forEach(f =>{
    f.addEventListener('blur', (e)=>{
        if (!f.checkValidity()) {

        // field is invalid - add class
       
        f.classList.add('is-invalid');
        

      }else{
        f.classList.remove('is-invalid');
        
      }
      
    })
   
});

function validateForm(e) {
    const
    form = e.target,
    field = Array.from(form.elements);
  
 
  field.forEach(i => {
    i.setCustomValidity('');
    i.classList.remove('is-invalid');
   
  });

  var proofId = document.getElementById("proofId")
  var loanAmount = document.getElementById("loanAmount")
  var eligibleAmount = document.getElementById("eligibleAmount")
  var expense = document.getElementById("expense");


  if($('#proofId').length && proofId.value.length<10){
    proofId.setCustomValidity("Id length can not be less than 10!")
    var  data = {}
    data['css'] = 'danger'
    data['head'] = 'Alert!'
    data['msg'] = 'Proof Id length is less than 10!'
    element = proofId
    formToast(data, element);
  }

if($("#dbr").val()>40){
    expense.setCustomValidity("dbr cant be greater than 40!")
    var  data = {}
    data['css'] = 'danger'
    data['head'] = 'Alert!'
    data['msg'] = 'DBR can not be greater than 40!'
    element = document.getElementById("dbr");
    formToast(data, element);
}
var empExist = onProofIdChange;
if(!empExist){
     proofId.setCustomValidity("Id length can not be less than 10!");
}


  if (!form.checkValidity()) {

    // form is invalid - cancel submit
    e.preventDefault();
    e.stopImmediatePropagation();

    // apply invalid class
    field.forEach(i => {

      if (!i.checkValidity()) {

        // field is invalid - add class
        i.classList.add('is-invalid');

      }
      else{
        i.classList.add('is-valid');
      }

    });
    document.querySelectorAll( ":invalid" )[1].focus();
   
    
}
}

var calculate = document.getElementById("calculate");

calculate.addEventListener('click', (e)=>{

    var form = document.getElementById("form")
form.noValidate = true;
field = Array.from(form.elements);
field.forEach(f =>{

    if(f.id!="repayFrequency" && f.id!="loanAmount"){
    
        if (!f.checkValidity()) {

        // field is invalid - add class
       
        f.classList.add('is-invalid');
        

      }else{
        f.classList.remove('is-invalid');
        
      }
    }
    
});

var monthlyIncome = $("#income").val();
var monthlyExpense = $("#expense").val();
var tenure = $("#tenure").val();
var repayFrequency = $("#repayFrequency").val();
var roi = $("#roi").val();



if(monthlyIncome.length>1 && monthlyExpense.length>1 && tenure!=""){

   

    var req={}
    req["monthlyIncome"] = monthlyIncome;
    req["monthlyExpense"] = monthlyExpense;
    req["tenure"] = tenure;
    req["repayFrequency"] = repayFrequency;
    req["roi"] =roi;
    displayDBR(req)
    $.ajax({
            type : "POST",
			contentType : "application/json",
			url : "/calculateEligibleAmount",
			data : JSON.stringify(req),
            dataType : 'json',
			timeout : 100000,
			success : function(data) {
				console.log("SUCCESS: ", data);
				display(data);
			},
			error : function(e) {
				console.log("ERROR: ", e);
				display(e);
			},
			done : function(e) {
				console.log("DONE");
				enableSearchButton(true);
			}
		});
}

});

function display(data){
    $("#eligibleAmount").val(data["eligibleLoanAmount"]);

  

}

function displayDBR(data){
    var dbr =  (data["monthlyExpense"]/data["monthlyIncome"])*100;
   $("#dbr").val(dbr);
}

function changeROI(){
    var loanProduct = document.getElementById("loanProduct");
    if(loanProduct.value!=""){
       
        if(loanProduct.value=="H"){
            $("#roi").val(8);
        }else if(loanProduct.value=="E"){
             $("#roi").val(9);
        }
        else{
            $("#roi").val(10);
        }
    }
}




var checkEmployee = document.getElementById("checkEmployee");
checkEmployee.addEventListener('click', onProofIdChange);
  

function onProofIdChange(){
    

    var proofId = document.getElementById("proofId");
    var proofType = document.getElementById("proofType");
    var empExist= false;

if(proofId){

    if( proofId.value.length<10){
         proofId.classList.add('is-invalid');

    }
    else{
    proofId.classList.remove('is-invalid');
   
    var req={}
    req["proofType"]=proofType.value;
    req["proofId"] = proofId.value;
    
    $.ajax({
            type : "POST",
			contentType : "application/json",
			url : "/ajaxSearch",
			data : JSON.stringify(req),
            dataType : 'json',
			timeout : 100000,
			success : function(data) {
				console.log("SUCCESS: ", data);
				displayToast(data);
                empExist=data["isExists"]
                
			},
			error : function(e) {
				console.log("ERROR: ", e);
				display(e);

			},
			done : function(e) {
				console.log("DONE");
				enableSearchButton(true);
			}
            

		});
    }
}
return empExist;
}
function showToast(data){
    var css=data["css"]
    var head=data["head"]

    var msg = data["msg"]
 var toast =   '<div class="toast align-items-center text-white bg-'+css+' border-0 " role="alert" aria-live="assertive" aria-atomic="true" style="position:fixed; z-index:9; margin:-1% 0 0 75%">'+
                '<div class="d-flex">'+
                   ' <div class="toast-body">'+
                       ' <b>'+head+'</b>'+    
                   ' '+msg+
                    '</div>'+
                   ' <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>'+
                '</div>'+
            '</div>';
  
   var toastBody = document.getElementById("toastBody")
   $("#toastBody").empty();
   $("#toastBody").append(toast);
    $('.toast').toast('show');

            return toast;
}
function displayToast(data){
    if(data["isExists"]==true){
        data["css"]="success"
        data["head"] = "Success!"
        data["msg"]="Employee Record Found"
       
        proofId = document.getElementById("proofId")
        proofId.classList.remove('is-invalid')

    }
    else{
        data["css"]="danger"
        data["head" ]= "Alert!"
       data[ "msg"]="Employee Record Not found"      
        proofId = document.getElementById("proofId")
        proofId.classList.add('is-invalid')
        proofId.focus();
        $("#empNotFound").click();
    }
  
    showToast(data)
    return data["isExists"]==true?true:false;
}

function formToast(data, element){
   
    element.classList.add('is-invalid')
    element.focus()
    showToast(data)

}


</script>

</html>
          
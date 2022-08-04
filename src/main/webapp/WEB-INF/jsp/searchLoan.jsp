<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Search</title>
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
            background-image:  url("../resources/search.jpg");
            background-repeat: no-repeat;
            background-size : cover;
            height:720px;
            width:1280px;

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
       <div class="middle container mt-3 shadow-lg p-3 mb-5 bg-white rounded " style="width:1000px">
                  <h2 class="d-inline align-middle heading">
                    <strong>Search Loan Record</strong>
                </h2>

                 <form action="/searchLoan" method="POST" id="form">
                 <br>
                 <br>
                 <br>


              <div class="row" style="margin:3% 0 0 9.5%">
                    <div class="col-md-5 input" >

                        <select class="input-field" aria-label="Default select example" id="proofType" name="proofType" required />
                        <option value="" disabled>Select..</option>
                        <option value="Pan Card">Pan Card</option>
                        <option value="Adhaar Card">Adhaar Card</option>
                        <option value="Passport">Passport</option>
                    </select>
                    <label for="proofType" class="input-label">Id Proof</label>
                     <div class="invalid-feedback" style="margin: 0 0 -10% 0" >
                           Please Select a valid ProofId Type.
                      </div>
                </div>
                 <div class="col-md-3">
                         <div class="input">
                             <input type="text" id="proofId" name="proofId" class="input-field" >
                            <label for="proofId" class="input-label" >ProoofId</label>
                             <div class="invalid-feedback" style="margin: 0 0 -10% 0" >
                           Please Enter a valid ProofId.
                      </div>
                        </div>
                    </div>

                </div>
                   
                   
                <input type="hidden" name="action" value="${action}">

        <div class="row">
                
            <div class="col-md-3 " style="margin: 5% 0 0 10%">
                 <div class="input">
                    <input type="text" id="loanAgreementId" name="loanAgreementId" class="input-field" >
                    <label for="loanAgreementId" class="input-label" >Loan Agreement Id</label>
                      <div class="invalid-feedback" style="margin: 0% 0 -10% 0" >
                           Please Enter a valid Agree Id.
                      </div>
                </div>
            </div>
         </div>

                  <div class="row">
                <div class="col-md-3" style="margin: 5% 0 0 9.8%">
                    <button type="submit" class="btn btn-primary submit">Search</button>
                </div>
                
               <br><br><br><br>
             </div>
             
               </form>
               <div  style="margin: -4.8% 0 0 21%">
                <form action="/" method="GET">
                <button type="submit" class="btn btn-danger cancel">Cancel</button>
                </form>
               </div>
               
       <br>
       <br>
       
       </div>
       </body>
       <script>

       $(document).ready(function () {
            $('.toast').toast('show');
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
       </script>
       </html>
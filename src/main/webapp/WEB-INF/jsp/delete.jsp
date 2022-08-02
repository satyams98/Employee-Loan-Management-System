<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Details</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">


        <link rel="stylesheet" href="../../resources/form.css">
    </head>
     <style>


            .autocomplete-items {

                border: 1px solid #d4d4d4;
                border-bottom: none;
                border-top: none;
                z-index: 99;
                /*position the autocomplete items to be the same width as the container:*/
                top: 100%;
                left: 0;
                right: 0;
            }

            .autocomplete-items div {
                padding: 10px;
                cursor: pointer;
                background-color: #fff;
                border-bottom: 1px solid #d4d4d4;
            }

            /*when hovering an item:*/
            .autocomplete-items div:hover {
                background-color: #e9e9e9;
            }

            /*when navigating through the items using the arrow keys:*/
            .autocomplete-active {
                background-color: DodgerBlue !important;
                color: #ffffff;
            }
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

  input:readonly + .input-field:valid{
    background-color: grey;
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

        <c:if test="${not empty employee}">

         <div class="middle">
            <div class="container mt-3 shadow-lg p-3 mb-5 bg-white rounded ">
                <h2 class="d-inline align-middle heading">
                    <strong>Details</strong>
                </h2>

                <br>

                <form action="/update" method="POST" class="form row g-3 needs-validation card-form" novalidate modelAttribute="employee" autocomplete="off" id="form" >
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <div class="row">
                        <div class="col-md-5 ">
                        <div class="input">
                            <input type="text" class="input-field" id="firstName" name="firstName" value="${employee.firstName}" readonly/>
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

                            <input type="text" class=" input-field" id="lastName" name="lastName" value="${employee.lastName}" readonly/>
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

                            <input type="text" class="input-field" id="dob" name="dob" value="<fmt:formatDate pattern = 'yyyy-MM-dd'  value = '${employee.dob}'/>" readonly/>
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

                            <input type="text" class="input-field" id="sex" name="sex" value="${employee.sex}" readonly/>

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
                    <div class="col-md-5 ">
                            <div class="input">
                        <input type="text" class="input-field" id="religion" name="religion" value="${employee.religion}" readonly/>
                        <label for="religion" class="input-label">Religion</label>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                        <div class="invalid-feedback">
                            Please enter valid Religion.
                        </div>
                        </div>
                    </div>
                    <div class="col-md-5 input">

                        <input type="email" class="input-field" id="email" name="email" value="${employee.email}" readonly/>
                        <label for="email" class="input-label">Email
                        </label>
                         <div class="valid-feedback">
                             Looks good!
                         </div>
                        <div class="invalid-feedback">
                            Please enter a valid email address.
                        </div>
                    </div>

                </div>
                <div>
                <br>
                </div>
                <div class="row">
                    <div class="col-md-5 input">

                        <input type="text" class="input-field" id="proofType" name="proofType" value="${employee.proofType}" readonly/>
                    <label for="proofType" class="input-label">Id Proof</label>
                </div>
                <div class="col-md-5 " id="renderProof">
                 <div class="col input" id ="rendered">
		                <input type="text" class="input-field" id="proofId" name="proofId" value="${employee.proofId}" readonly />
		                <label for="proofId" class="input-label">${employee.proofType} No. </label>

                </div>
                </div>
            </div>
            <div><br/></div>

            <div class="row">
                <div class="col-md-10" id="current">
                    <label for="current" class="form-label">Address</label>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                            <button class="accordion-button collapsed" id ="addAcc2" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
                                Current Address
                            </button>
                        </h2>
                        <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
                            <div class="accordion-body">

                                <div class="row">
                                    <div class="col-md-7 ">
                                    <div class="input">

                                        <input type="text" class="input-field" id="currentAdd.street" name="currentAdd.street" value="${employee.currentAdd.street}" readonly/>
                                        <label for="currentAdd.street" class="input-label">Street</label>
                                        <div class="invalid-feedback">
                                            Please provide a valid Street.
                                        </div>
                                        </div>

                                    </div>
                                    <div class="col-md-4 input">

                                        <input type="text" class="input-field" id="currentAdd.zip" name="currentAdd.zip" value="${employee.currentAdd.zip}" readonly/>
                                        <label for="currentAdd.zip" class="input-label">Zip</label>
                                        <div class="invalid-feedback"  style="margin:0 0 -10% 0">
                                            Please provide a valid zip.
                                        </div>
                                    </div>
                                </div>

                                <br>

                                <div class="row">
                                    <div class="col-md-3 input">


                                        <input type="text" class="input-field" id="currentAdd.city" name="currentAdd.city" value="${employee.currentAdd.city}" readonly/>
                                        <label for="currentAdd.city" class="input-label">City</label>
                                        <div class="invalid-feedback" style="margin:0 0 -14% 0">
                                            Please provide a valid City.
                                        </div>


                                    </div>


                                    <div class="col-md-4 input">

                                        <input type="text" class="input-field" id="currentAdd.state" name="currentAdd.state" value="${employee.currentAdd.state}" onchange=auto readonly/>
                                        <label for="currentAdd.state" class="input-label">State</label>
                                        <div class="invalid-feedback" style="margin:0 0 -10% 0">
                                            Please select a valid State.
                                        </div>
                                    </div>
                                    <div class="col-md-4 input">


                                        <input type="text" class="input-field" id="currentAdd.country" name="currentAdd.country" value="${employee.currentAdd.country}" readonly/>
                                        <label for="currentAdd.country" class="input-label">Country</label>

                                        <div class="invalid-feedback" style="margin:0 0 -10% 0">
                                            Please provide a valid Country.
                                        </div>
                                    </div>

                                </div>

                                <br>
                                <br>

                            </div>
                        </div>
                    </div>


                </div>
            </div>

            <div class="row">
                <div class="col-md-10" id="permanent">

                    <div class="accordion-item">
                        <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                            <button class="accordion-button collapsed" id="addAcc2" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                                Permanent Address
                            </button>
                        </h2>
                        <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                            <div class="accordion-body">
                                

                                <div class="row">
                                    <div class="col-md-7 input">

                                            <input type="text" class="input-field" id="permanentAdd.street" name="permanentAdd.street" value="${employee.permanentAdd.street}" readonly />
                                             <label for="permanentAdd.street" class="input-label">Street</label>
                                            <div class="invalid-feedback">
                                                Please provide a valid Street.
                                            </div>


                                    </div>
                                    <div class="col-md-4 input">


                                            <input type="text" class="input-field" id="permanentAdd.zip" name="permanentAdd.zip" value="${employee.permanentAdd.zip}"  readonly />
                                             <label for="permanentAdd.zip" class="input-label">Zip</label>
                                            <div class="invalid-feedback" style="margin:0 0 -10% 0">
                                                Please provide a valid Zip.
                                            </div>

                                    </div>
                                    <div> <br></div>




                                    <div class="row">
                                        <div class="col-md-3 input">

                                                <input type="text" class="input-field" id="permanentAdd.city" name="permanentAdd.city" value="${employee.currentAdd.city}" readonly />
                                                <label for="permanentAdd.city" class="input-label">City</label>
                                                <div class="invalid-feedback" style="margin:0 0 -15% 0">
                                                    Please provide a valid City.
                                                </div>

                                        </div>
                                        <div class="col-md-5 input">

                                            <input type="text" class="input-field" id="permanentAdd.state" name="permanentAdd.state" value="${employee.permanentAdd.state}" readonly />
                                            <label for="permanentAdd.state" class="input-label">State</label>
                                            <div class="invalid-feedback" style="margin:0 -2% -9% 2%">
                                                Please provide a valid State.
                                            </div>
                                        </div>
                                        <div class="col-md-4 input">
                                            <input type="text" class="input-field" id="permanentAdd.country" name="permanentAdd.country" value="${employee.permanentAdd.country}" readonly />
                                            <label for="permanentAdd.country" class="input-label">Country</label>
                                            <div class="invalid-feedback" style="margin:0 0 -10% 0">
                                                Please provide a valid Country.
                                            </div>
                                        </div>

                                    </div>

                                </div>
                                <br>
                                <br>
                            </div>
                        </div>


                    </div>
                </div>
                <div>

                </div>
                <br>
                <div class="row">
                    <div class="col-md-5 input">

                        <input type="text" class="input-field" id="mobileNo" name="mobileNo" value="${employee.mobileNo}"   readonly />
                         <label for="mobileNo" class="input-label">Contact No.</label>
                        <div class="invalid-feedback">
                            Please provide a valid Contact No..
                        </div>
                    </div>

                </div>
                <div>
                    <br>
                    <br>
                </div>
                <div class="row">

                    <div class="col-md-10">
                    <div class="accordion-item">
    <h2 class="accordion-header" id="panelsStayOpen-headingFamily">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFamily" aria-expanded="true" aria-controls="panelsStayOpen-collapseFamily">
       Family Details
      </button>
    </h2>
    <div id="panelsStayOpen-collapseFamily" class="accordion-collapse collapse " aria-labelledby="panelsStayOpen-headingFamily">
      <div class="accordion-body">
      <br>
       <div id="comBtn" style="visibility:hidden;position:absolute;">

          <button type="button" id="plus" class="btn btn-light" >
              <i class="bi bi-plus-circle-fill fa-lg" style="font-size:24px;background-color: transparent; color: #387350;"></i>
          </button>


          <button type="button" id="minus" class="btn btn-light">
              <i class="bi bi-dash-circle-fill" style="font-size:24px;background-color: transparent; color: #73385B; "></i>
          </button>
          </div>
          <div id="hidden" style="position:absolute;">
      <c:forEach var="family" items="${employee.familyList}" >
          <div style="visibility:hidden">
            <input type='text' id = 'familyName' value="${family.name}" readonly />
            <input type='text' id = "familyRelation" value="${family.relation}" readonly />
            <input type="text" id = "familyContact" value="${family.contactNo}" readonly />
            <input type="text" id="familyAdhaar" value = "${family.adhaarNo}" readonly />
          </div>

      	</c:forEach>
      </div>

    <div class="row"  id = "familyContainer" >


      </div>
     
  </div>
   
      </div>
    
    </div>
      <br><br><br>
    </div>




           
               
                    <br>
                      <br>
                        <br>
                </div>
                </div>
            </form>
           </div>
            <!-- Button trigger modal -->
            <div class="col-md-3" style="margin: -10% 0 0 16%">
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Delete Record
</button>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><strong>Alert!</strong></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Are you sure you want to delete this record?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <form action="/delete" method="post">
        <button type="submit" class="btn btn-danger" >Delete</button>
        <input type="hidden" name="email" value="${employee.email}">
        </form>
      </div>
    </div>
  </div>
</div>
           
            <form action="/search" method='get'>
                <div class="col-md-3" style="margin:-3.5% 0 0 38%;">
                    <button type="submit" class="btn btn-danger cancel">Cancel</button>
                    <input type="hidden" name="action" value="detail">
                </div>
            </form>
            <br>
           
        </div>
</c:if>

</body>


<script>
var familyMembers = document.getElementById("hidden");

var plusClicks = -1;


$(document).ready(function () {


    $('.accordion-button').click();
    for(var i=0;i<familyMembers.childElementCount;i++){
    $("#plus").click();

}

});










$("#plus").click(() => {


        plusClicks++;
        name = "familyList[" + plusClicks + "].name";
        relation = "familyList[" + plusClicks + "].relation";
        mobile = "familyList[" + plusClicks + "].contactNo";
        adhaar = "familyList[" + plusClicks + "].adhaarNo";
        newFamily = '<div class="row"  id = family' + plusClicks + '>' + '     <div class="row">' +
                                                                                                                             ' <div class="col-md-3 input">' +
                                                                                                                             ' <input type="text" class="input-field" id=' + '"' + name + '"' + ' name=' + '"' + name + '"' + '  readonly />' +
                                                                                                                              '<label for=' + '"' + name + '"' + ' class="input-label">Name</label>' +
                                                                                                                              '<div class="valid-feedback" style="margin: 10% -2% -18% 0">' + ' Looks good!' +
                                                                                                                              '</div>' +
                                                                                                                              '<div class="invalid-feedback" style="margin: 10% -2% -18% 0">' +
                                                                                                                              'Please provide valid name' +
                                                                                                                              '</div>' +
                                                                                                                              '</div>' +
                                                                                                                              '<div class="col-md-3 input">' +
                                                                                                                              
                                                                                                                             '<input type="text" class="input-field" id =' + '"' + relation + '"' + ' name=' + '"' + relation + '"' + 'readonly />' +
                                                                                                                             '<label for=' + '"' + relation + '"' + ' class="input-label">Relation</label>' +
                                                                                                                             
                                                                                                                              '</div>' +
                                                                                                                              '<div class="col-md-3 input">' +
                                                                                                                              '<input type="text" class="input-field" id=' + '"' + mobile + '"' + ' name=' + '"' + mobile + '"' + ' readonly>' +
                                                                                                                              '<label for=' + '"' + mobile + '"' + ' class="input-label">Contact No.</label>' +
                                                                                                                              '<div class="invalid-feedback" style="margin: 10% 0 -25% 0">' +
                                                                                                                              'Please provide a valid Contact No..' +
                                                                                                                              '</div>' +
                                                                                                                              '</div>' +
                                                                                                                              '<div class="col-md-3 input">' +
                                                                                                                              '<input type="text" class="input-field" id=' + '"' + adhaar + '"' + ' name=' + '"' + adhaar + '"' + '  readonly>' +
                                                                                                                              '<label for=' + '"' + adhaar + '"' + ' class="input-label">Adhaar No.</label>' +
                                                                                                                              '<div class="invalid-feedback" style="margin: 10% 0 -25% 0">' +
                                                                                                                              'Please provide a valid Adhaar No..' +
                                                                                                                              '</div>' +
                                                                                                                              '</div>' +
                                                                                                                              '</div>' +
                                                                                                                              '<div><br><br></div>'

        $('#familyContainer').append(newFamily);

});

$(document).ready(()=>{
    for(var i = 0;i<=plusClicks;i++){
        var family = document.getElementById("family"+i).childNodes[1].getElementsByClassName("input-field")
        var hiddenNames = document.querySelectorAll("#familyName")
        var hiddenRelation = document.querySelectorAll("#familyRelation")
        var hiddenContactNo = document.querySelectorAll("#familyContact")
        var hiddenAdhaar = document.querySelectorAll("#familyAdhaar")
        family[0].value=hiddenNames[i].value
        family[1].value=hiddenRelation[i].value
        family[2].value = hiddenContactNo[i].value
        family[3].value = hiddenAdhaar[i].value

    }
});

$("#minus").click(() => {

    if ($('#familyContainer >div').length > 0) {

        $("#family" + plusClicks).remove();

        plusClicks--;
    }

});

$('#comBtn').click(() => {
    if (plusClicks < 0) {
        $('#minus').hide();
    } else {
        $('#minus').show();
    }

});

$(document).ready(function () {
    $('.toast').toast('show');



});
</script>

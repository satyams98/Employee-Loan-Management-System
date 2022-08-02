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
    <style>

        .logo{
            margin:10% 20% 20% 150%;
        }
         .form{
    margin: 4% -2% 1% 15%;
    }
    .heading{
    margin:5% 0 10% 42%;
    }
    </style>
</head>
<body>
<nav class="navbar navbar-dark bg-dark ">

    <a href="" class="navbar-brand text-white mx-2 order-1 ">
        <h2 class="d-inline align-middle logo"><strong>NSEL Employee Interface</strong></h2>
    </a>

</nav>

<c:if test="${not empty msg}">
    <div class="toast align-items-center text-white bg-${css} border-0 " role="alert" aria-live="assertive" aria-atomic="true" style="position:absolute; z-index:9; margin:-1% 0 0 75%">
    <div class="d-flex">
      <div class="toast-body">
     <b> ${head}</b> ${msg}
     </div>
      <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
  </div>
</c:if>

<div class="container mt-3" >
    <h3>Employee Search</h3>
    <br>
    <br>

    <form action="/search" method="POST">
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required >
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label for="searchEmail">Email</label>
                    <input type="text" class="form-control" id="searchEmail" name="searchEmail" required >
                </div>
            </div>

            <div class="col-md-3" style="margin:1.7% 0 0 0;">
                <button type="submit" class="btn btn-primary">Search</button>
            </div>

        </div>
    </form>
    <form action="/" method='get'>
        <div class="col-md-3" style="margin:-3% 0 5% 78%;">
            <button type="submit" class="btn btn-secondary">Cancel</button>
        </div>
    </form>

</div>
<c:if test="${!empty employee}">


    <div class="middle">
        <div class="container mt-3 shadow-lg p-3 mb-5 bg-white rounded "  >
            <h2 class="d-inline align-middle heading"><strong>Employee Detail</strong></h2>

            <br>

            <form action="/add" method="POST" class="form row g-3 needs-validation" novalidate modelAttribute="employee" autocomplete="off">
                <div class="row">
                    <div class="col-md-5">
                        <label for="firstName" class="form-label">First name</label>
                        <input type="text" class="form-control" id="firstName" name="firstName" value="${employee.firstName}" readonly>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                        <div class="invalid-feedback">
                            Please enter valid First name.
                        </div>
                    </div>
                    <div class="col-md-5">
                        <label for="lastName" class="form-label">Last name</label>
                        <input type="text" class="form-control" id="lastName" name="lastName" value="${employee.lastName}" readonly>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                        <div class="invalid-feedback">
                            Please enter valid Last name.
                        </div>
                    </div>
                </div>
                <div></div>
                <div class="row">
                    <div class="col-md-5">
                        <label for="dob" class="form-label">Date of Birth</label>
                        <input type="text" class="form-control" id="dob" name="dob" value="<fmt:formatDate type = 'date' value = '${employee.dob}'/>"  readonly>

                    </div>
                    <div class="col-md-5">

                        <label for="sex" class="form-label">Sex</label>
                        <input type="text" class="form-control" id="sex" name="sex" value="${employee.sex}" readonly>
                    </div>
                </div>
                <div></div>
                <div class ="row">
                    <div class="col-md-5">
                        <label for="religion" class="form-label">Religion</label>
                        <input type="text" class="form-control" id="religion" name="religion" value="${employee.religion}" readonly>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                        <div class="invalid-feedback">
                            Please enter valid Religion.
                        </div>
                    </div>
                    <div class="col-md-5">
                        <label for="email" class="form-label">Email </label>
                        <input type="email" class="form-control" id="email" name="email" value="${employee.email}" readonly>
                        <div class="invalid-feedback">
                            Please enter a valid email address.
                        </div>
                    </div>

                </div>
                <div></div>
                <div class="row">
                    <div class="col-md-5">
                        <label for="proofType" class="form-label">Id Proof</label>
                        <input type="text" class="form-control" id="proofType" name="proofType" value="${employee.proofType}" readonly>
                    </div>
                    <div class="col-md-5" id ="renderProof">
                        <label for="proofId" class="form-label">Id Proof No.</label>
                        <input type="text" class="form-control" id="proofId" value="${employee.proofId}" readonly>
                    </div>
                </div>
                <div></div>

                <div class = "row">
                    <div class="col-md-10" id="current">
                        <label for="current" class="form-label">Address</label>
                        <div></div>
                            <label for="current" class="form-label">Current Address</label>

                                    <div class="row">
                                        <div class="col-md-7">
                                            <label for="currentAdd.street" class="form-label">Street</label>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text" id="basic-addon1"><i class="bi bi-geo-fill"></i></span>
                                                <input type="text" class="form-control" id="currentAdd.street" name="currentAdd.street" value="${employee.currentAdd.street}" readonly>
                                                <div class="invalid-feedback">
                                                    Please provide a valid Street.
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-md-4">
                                            <label for="currentAdd.zip" class="form-label">Zip</label>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text" id="basic-addon1"><i class="bi bi-file-earmark-zip-fill"></i></span>
                                                <input type="text" class="form-control" id="currentAdd.zip" name="currentAdd.zip" value="${employee.currentAdd.zip}" readonly>
                                                <div class="invalid-feedback">
                                                    Please provide a valid zip.
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <br>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label for="currentAdd.city" class="form-label">City</label>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text" id="basic-addon1"><i class="bi bi-geo-alt-fill"></i></span>
                                                <input type="text" class="form-control" id="currentAdd.city" name="currentAdd.city" value="${employee.currentAdd.city}" readonly>
                                                <div class="invalid-feedback">
                                                    Please provide a valid City.
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-md-4">
                                            <label for="currentAdd.state" class="form-label">State</label>

                                            <input type="text" class="form-control" id="currentAdd.state" name="currentAdd.state" value="${employee.currentAdd.state}" readonly>

                                            <div class="invalid-feedback">
                                                Please select a valid State.
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <label for="currentAdd.country" class="form-label">Country</label>

                                            <input type="text" class="form-control" id="currentAdd.country" name="currentAdd.country" value="${employee.currentAdd.country}" readonly>

                                            <div class="invalid-feedback">
                                                Please provide a valid Country.
                                            </div>
                                        </div>

                                    </div>

                                    <br>

                                </div>
                            </div>


                <div class = "row">
                    <div class="col-md-10" id="permanent">

                        <label for="current" class="form-label">Permanent Address</label>

                                    <br>
                                    <div class="row">
                                        <div class="col-md-7">
                                            <label for="permanentAdd.street" class="form-label">Street</label>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text" id="basic-addon1"><i class="bi bi-geo-fill"></i></span>
                                                <input type="text" class="form-control" id="permanentAdd.street" name="permanentAdd.street" value="${employee.permanentAdd.street}" readonly>
                                                <div class="invalid-feedback">
                                                    Please provide a valid Street.
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-md-4">
                                            <label for="permanentAdd.zip" class="form-label">Zip</label>
                                            <div class="input-group mb-3">
                                                <span class="input-group-text" id="basic-addon1"><i class="bi bi-file-earmark-zip-fill"></i></span>
                                                <input type="text" class="form-control" id="permanentAdd.zip" name="permanentAdd.zip" value="${employee.permanentAdd.zip}"  readonly>
                                                <div class="invalid-feedback">
                                                    Please provide a valid Zip.
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                        <div class="row">
                                            <div class="col-md-3">
                                                <label for="permanentAdd.city" class="form-label">City</label>
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text" id="basic-addon1"><i class="bi bi-geo-alt-fill"></i></span>
                                                    <input type="text" class="form-control" id="permanentAdd.city" name="permanentAdd.city" value="${employee.currentAdd.city}" readonly>
                                                    <div class="invalid-feedback">
                                                        Please provide a valid City.
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <label for="permanentAdd.state" class="form-label">State</label>
                                                <input type="text" class="form-control" id="permanentAdd.state" name="permanentAdd.state" value="${employee.permanentAdd.state}" readonly>
                                                <div class="invalid-feedback">
                                                    Please provide a valid State.
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <label for="permanentAdd.country" class="form-label">Country</label>
                                                <input type="text" class="form-control" id="permanentAdd.country" name="permanentAdd.country" value="${employee.permanentAdd.country}" readonly>
                                                <div class="invalid-feedback">
                                                    Please provide a valid Country.
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </div>


                    <div></div>
                    <br>
                    <div class="row">
                        <div class="col-md-5">
                            <label for="mobileNo" class="form-label">Contact No.</label>
                            <input type="text" class="form-control" id="mobileNo" name="mobileNo" value="${employee.mobileNo}" readonly>
                            <div class="invalid-feedback">
                                Please provide a valid Contact No..
                            </div>
                        </div>

                    </div>

                    <div>
                        <br>
                    </div>

            <div class="row">
                <div class="com-md-4">
                    <label for="communication" class="form-label">Communication</label>
                    <hr style="margin: -2% 25% 0 15%; padding: 0 0 0 10%;">
                </div>
                <div class="col-md-2"></div>

                <br>
                <div id="familyContainer" style=" margin:1% 40% 0 1.5%; padding-right: 5%; width: 750px;">
                <c:forEach var="family" items="${employee.familyList}" >
                <div class="row" style=" border:thin solid #d9d5d4; padding:2% ">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <label for="firstName" class="form-label">Name</label>
                                            <input type="text" class="form-control" id="family" name="family" value="${family.name}" readonly>

                                        </div>
                                        <div class="col-md-5">
                                            <label for="relation1" class="form-label">Relation</label>
                                             <input type="text" class="form-control" id="family" name="family" value="${family.relation}" readonly>

                                        </div>
                                    </div>
                                    <div><br></div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <label for="mobileNo1" class="form-label">Contact No.</label>
                                            <input type="text" class="form-control" id="mobileNo1" name="mobileNo1" value="${family.contactNo}" readonly>

                                        </div>
                                        <div class="col-md-5">
                                            <label for="adhaar1" class="form-label">Adhaar No.</label>
                                            <input type="text" class="form-control" id="adhaar1" name="adhaar1" value="${family.adhaarNo}" readonly>

                                        </div>
                                    </div>
                                    <div><br></div>
                                </div>

                </div>
                </c:forEach>
            </div>
            </form>

        </div>
    </div>
    </div>


</c:if>

<c:if test="${found == 'false'}">
    <div class="container mt-3">
        <h3>No records!</h3>
    </div>
</c:if>
<script>
$(document).ready(function(){
  $('.toast').toast('show');
});
</script>

</body>
</html>
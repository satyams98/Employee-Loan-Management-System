<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>

<div class="container mt-3" >
    <h3>Employee Search</h3>
    <br>
    <br>
    <form action="/get" method="POST">
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
            <input type="text" class="form-control" id="searchEmail" name ="searchEmail" required >
        </div>
        </div>

            <div class="col-md-3" style="margin:1.7% 0 0 0;">
            <button type="submit" class="btn btn-primary">Search</button>
            </div>
        </div>
    </form>
</div>
<c:if test="${!empty employee}">


<div class="container mt-3" id ="empDetails">
    <h3>Employee Details</h3>
    <br>
    <form action="/add" method="POST" class=" row g-3 needs-validation"  modelAttribute="employee">
        <div class="row">
            <div class="col-md-4">
                <label for="firstName" class="form-label">First name</label>
                <input type="text" class="form-control" id="firstName" name="firstName" value="" readonly>

            </div>
            <div class="col-md-4">
                <label for="lastName" class="form-label">Last name</label>
                <input type="text" class="form-control" id="lastName" name="lastName" value="" readonly>

            </div>
        </div>
        <div></div>
        <div class="row">
            <div class="col-md-4">
                <label for="dob" class="form-label">Date of Birth</label>
                <input type="text" class="form-control" id="dob" name="dob"  readonly>

            </div>
            <div class="col-md-4">
                <label for="sex" class="form-label">Sex</label>
                <input type="text" class="form-control" id="sex" name="sex"  readonly>
            </div>
        </div>
        <div></div>
        <div class ="row">
            <div class="col-md-4">
                <label for="religion" class="form-label">Religion</label>
                <input type="text" class="form-control" id="religion" name="religion" readonly>

            </div>
            <div class="col-md-4">
                <label for="proofType" class="form-label">Id Proof</label>
                <input type="text" class="form-control" id="proofType" name="proofType"  readonly>
            </div>
        </div>
        <div></div>
        <div class="row" id ="renderProof">
             <div class="col-md-3" id ="rendered">
             <label for="proofText" class="form-label">Id Proof No.</label>
             <input type="text" class="form-control" id="proofText" readonly>

             </div>
            <div class="col-4">
                <label for="email" class="form-label">Email </label>
                <input type="email" class="form-control" id="email" name="email" readonly>
                <div class="invalid-feedback">
                    Please enter a valid email address.
                </div>
            </div>

        </div>

        <div></div>

        <div class = "row">
            <div class="col-md-8" id="current">
                <label for="current" class="form-label">Address</label>
                <div><div>
                <label for="current" class="form-label">Current Address</label>
                <div class="row">
                    <div class="col-md-7">
                        <label for="currentAdd.street" class="form-label">Street</label>
                        <input type="text" class="form-control" id="currentAdd.street" name="currentAdd.street" readonly>

                    </div>
                </div>


                <div class="row">
                    <div class="col-md-4">
                        <label for="currentAdd.country" class="form-label">Country</label>
                        <input type="text" class="form-control" id="currentAdd.country" name="currentAdd.country" readonly>

                    </div>
                    <div class="col-md-3">
                        <label for="currentAdd.zip" class="form-label">Zip</label>
                        <input type="text" class="form-control" id="currentAdd.zip" name="currentAdd.zip" readonly>

                    </div>

                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label for="currentAdd.state" class="form-label">State</label>
                        <input type="text" class="form-control" id="currentAdd.state" name="currentAdd.state" readonly>

                    </div>
                    <div class="col-md-4">
                        <label for="currentAdd.city" class="form-label">City</label>
                        <input type="text" class="form-control" id="currentAdd.city" name="currentAdd.city" readonly>
                    </div>
                </div>

            </div>
        </div>
                <div></div>
                <br>
        <div class = "row">
            <div class="col-md-8" id="permanent">
                <label for="current" class="form-label">Permanent Address</label>
                <div class="row">
                    <div class="col-md-10">
                        <label for="permanentAdd.street" class="form-label">Street</label>
                        <input type="text" class="form-control" id="permanentAdd.street" name="permanentAdd.street" readonly>
                        <div class="invalid-feedback">
                            Please provide a valid Street.
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label for="permanentAdd.country" class="form-label">Country</label>
                        <input type="text" class="form-control" id="permanentAdd.country" readonly>
                        <div class="invalid-feedback">
                            Please provide a valid city.
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label for="permanentAdd.zip" class="form-label">Zip</label>
                        <input type="text" class="form-control" id="permanentAdd.zip" name="permanentAdd.zip" readonly>
                        <div class="invalid-feedback">
                            Please provide a valid zip.
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-4">
                        <label for="permanentAdd.state" class="form-label">State</label>
                        <input type="text" class="form-control" id="permanentAdd.state" name="permanentAdd.state" readonly>
                        <div class="invalid-feedback">
                            Please provide a valid State.
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label for="permanentAdd.city" class="form-label">City</label>
                        <input type="text" class="form-control" id="permanentAdd.city" name="permanentAdd.city" readonly>
                        <div class="invalid-feedback">
                            Please provide a valid City.
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div></div>
                <br>
        <div class="row">
            <div class="col-md-4">
                <label for="mobileNo" class="form-label">Contact No.</label>
                <input type="text" class="form-control" id="mobileNo" name="mobileNo" readonly>
                <div class="invalid-feedback">
                    Please provide a valid Contact No..
                </div>
            </div>

        </div>
        <br>

    </form>
</div>
</c:if>
</body>
</html>
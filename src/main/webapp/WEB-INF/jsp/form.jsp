<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
        <link rel="stylesheet" href="../../resources/form.css">

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
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark ">

            <a href="" class="navbar-brand text-white mx-2 order-1 ">
                <h2 class="d-inline align-middle logo">
                    <strong>NSEL Employee Interface</strong>
                </h2>
            </a>

        </nav>
        <c:if test="${not empty msg}">
            <div class="toast align-items-center text-white bg-${css} border-0 " role="alert" aria-live="assertive" aria-atomic="true" style="position:absolute; z-index:9; margin:-1% 0 0 75%">
                <div class="d-flex">
                    <div class="toast-body">
                        <b>
                            ${css}</b>
                        ${msg}
                    </div>
                    <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
            </div>
        </c:if>
        <div class="middle">
            <div class="container mt-3 shadow-lg p-3 mb-5 bg-white rounded ">
                <h2 class="d-inline align-middle heading">
                    <strong>Register</strong>
                </h2>

                <br>

                <form action="/add" method="POST" class="form row g-3 needs-validation card-form" novalidate modelattribute="employee" autocomplete="off">
                    <div class="row">
                        <div class="col-md-5 ">
                        <div class="input">
                            <input type="text" class="input-field" id="firstName" name="firstName" required/>
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

                            <input type="text" class=" input-field" id="lastName" name="lastName" value="" required/>
                            <label for="lastName" class=" input-label">Last name</label>
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
                        <div class="input">

                            <input type="date" class="input-field" id="dob" name="dob" required/>
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

                            <select class="input-field" aria-label="Default select example" id="sex" name="sex"/>
                            <option value="0">Select..</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Not Specific">Other</option>
                        </select>
                        <label for="sex" class="input-label">Sex</label>
                    </div>
                </div>
                <div></div>
                <div class="row">
                    <div class="col-md-5 ">
                            <div class="input">
                        <input type="text" class="input-field" id="religion" name="religion" required/>
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

                        <input type="email" class="input-field" id="email" name="email" required/>
                        <label for="email" class="input-label">Email
                        </label>
                        <div class="invalid-feedback">
                            Please enter a valid email address.
                        </div>
                    </div>

                </div>
                <div></div>
                <div class="row">
                    <div class="col-md-5 input">

                        <select class="input-field" aria-label="Default select example" id="proofType" name="proofType"/>
                        <option value="0" selected>Select..</option>
                        <option value="Pan Card">Pan Card</option>
                        <option value="Adhaar Card">Adhaar Card</option>
                        <option value="Passport">Passport</option>
                    </select>
                    <label for="proofType" class="input-label">Id Proof</label>
                </div>
                <div class="col-md-5 " id="renderProof"></div>
            </div>
            <div><br/></div>

            <div class="row">
                <div class="col-md-10" id="current">
                    <label for="current" class="form-label">Address</label>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
                                Current Address
                            </button>
                        </h2>
                        <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
                            <div class="accordion-body">

                                <div class="row">
                                    <div class="col-md-7 ">
                                    <div class="input">

                                        <input type="text" class="input-field" id="currentAdd.street" name="currentAdd.street" required/>
                                        <label for="currentAdd.street" class="input-label">Street</label>
                                        <div class="invalid-feedback">
                                            Please provide a valid Street.
                                        </div>
                                        </div>

                                    </div>
                                    <div class="col-md-4 input">

                                        <input type="text" class="input-field" id="currentAdd.zip" name="currentAdd.zip" required/>
                                        <label for="currentAdd.zip" class="input-label">Zip</label>
                                        <div class="invalid-feedback">
                                            Please provide a valid zip.
                                        </div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-3 input">


                                        <input type="text" class="input-field" id="currentAdd.city" name="currentAdd.city" required/>
                                        <label for="currentAdd.city" class="input-label">City</label>
                                        <div class="invalid-feedback">
                                            Please provide a valid City.
                                        </div>


                                    </div>


                                    <div class="col-md-4 input">

                                        <input type="text" class="input-field" id="currentAdd.state" name="currentAdd.state" onchange=auto required/>
                                        <label for="currentAdd.state" class="input-label">State</label>
                                        <div class="invalid-feedback">
                                            Please select a valid State.
                                        </div>
                                    </div>
                                    <div class="col-md-4 input">


                                        <input type="text" class="input-field" id="currentAdd.country" name="currentAdd.country" required/>
                                        <label for="currentAdd.country" class="input-label">Country</label>

                                        <div class="invalid-feedback">
                                            Please provide a valid Country.
                                        </div>
                                    </div>

                                </div>

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
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                                Permanent Address
                            </button>
                        </h2>
                        <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                            <div class="accordion-body">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="same" onchange="addressFunction()">
                                    <label class="form-check-label" for="same">
                                        Same as Current
                                    </label>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-7 input">

                                            <input type="text" class="input-field" id="permanentAdd.street" name="permanentAdd.street" required />
                                             <label for="permanentAdd.street" class="input-label">Street</label>
                                            <div class="invalid-feedback">
                                                Please provide a valid Street.
                                            </div>


                                    </div>
                                    <div class="col-md-4 input">


                                            <input type="text" class="input-field" id="permanentAdd.zip" name="permanentAdd.zip" required />
                                             <label for="permanentAdd.zip" class="input-label">Zip</label>
                                            <div class="invalid-feedback">
                                                Please provide a valid Zip.
                                            </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-md-3 input">

                                                <input type="text" class="input-field" id="permanentAdd.city" name="permanentAdd.city" required />
                                                <label for="permanentAdd.city" class="input-label">City</label>
                                                <div class="invalid-feedback">
                                                    Please provide a valid City.
                                                </div>

                                        </div>
                                        <div class="col-md-5 input">

                                            <input type="text" class="input-field" id="permanentAdd.state" name="permanentAdd.state" required />
                                            <label for="permanentAdd.state" class="input-label">State</label>
                                            <div class="invalid-feedback">
                                                Please provide a valid State.
                                            </div>
                                        </div>
                                        <div class="col-md-4 input">
                                            <input type="text" class="input-field" id="permanentAdd.country" name="permanentAdd.country" required />
                                            <label for="permanentAdd.country" class="input-label">Country</label>
                                            <div class="invalid-feedback">
                                                Please provide a valid Country.
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>


                    </div>
                </div>
                <div></div>
                <br>
                <div class="row">
                    <div class="col-md-5 input">

                        <input type="text" class="input-field" id="mobileNo" name="mobileNo"  required />
                         <label for="mobileNo" class="input-label">Contact No.</label>
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
                    <div id="comBtn">
                        <div style="margin:-3% 0 0 70%">
                            <button type="button" id="plus" class="btn btn-light">
                                <i class="bi bi-plus-circle-fill fa-lg" style="font-size:24px;background-color: transparent; color: blue;"></i>
                            </button>
                        </div>
                        <div style="margin:-6% 0 0 78%">
                            <button type="button" id="minus" class="btn btn-light">
                                <i class="bi bi-dash-circle-fill" style="font-size:24px;background-color: transparent; color: blue; "></i>
                            </button>
                        </div>
                    </div>
                    <br>
                    <div id="familyContainer" style=" position: block; margin:1% 40% 0 1.5%; padding-right: 5%; width: 750px;"></div>
                </div>

                <div class="col-12">
                    <div class="form-check">
                        <br>
                        <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                        <label class="form-check-label" for="invalidCheck">
                            Agree to terms and conditions
                        </label>
                        <div class="invalid-feedback">
                            You must agree before submitting.
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-9">
                        <br><br>
                        <button class="btn btn-primary" type="submit">Submit form</button>
                    </div>
                    <div class="col-md-1">
                        <br><br>
                        <button class="btn btn-secondary" type="reset">Reset</button>
                    </div>


                </div>
                <div>
                    <br>
                </div>
            </form>
            <form action="/" method='get'>
                <div class="col-md-3" style="margin:-7% 0 0 85%;">
                    <button type="submit" class="btn btn-danger">Cancel</button>
                </div>
            </form>
        </div>
    </body>
</html></div><script>

(function () {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms).forEach(function (form) {
        form.addEventListener('submit', function (event) {
            if (! form.checkValidity()) {
                event.preventDefault()
                event.stopPropagation()
            }

            form.classList.add('was-validated')
        }, false)
    })
})()
var plusClicks = -1;

$("#plus").click(() => {

    if ($("#familyContainer > div").length < 4) {
        plusClicks++;
        name = "familyList[" + plusClicks + "].name";
        relation = "familyList[" + plusClicks + "].relation";
        mobile = "familyList[" + plusClicks + "].contactNo";
        adhaar = "familyList[" + plusClicks + "].adhaarNo";
        newFamily = '<div class="row" style=" border:thin solid #d9d5d4; padding:2% " id = family' + plusClicks + '>' + '                    <div class="row">' + '                        <div class="col-md-5 input">' + '       <input type="text" class="input-field" id=' + '"' + name + '"' + ' name=' + '"' + name + '"' + ' value="" required />' + '                     <label for=' + '"' + name + '"' + ' class="input-label">Name</label>' + '                         <div class="valid-feedback">' + '                                Looks good!' + '                            </div>' + '                        </div>' + '                        <div class="col-md-5 input">' + '                             <select class="input-field" aria-label="Default select example" id =' + '"' + relation + '"' + ' name=' + '"' + relation + '"' + '/>' + '                                <option selected disabled value="0">Select..</option>' + '                                <option value="father">Father</option>' + '                                <option value="mother">Mother</option>' + '                                <option value="sister">Sister</option>' + '                                <option value="brother">Brother</option>' + '                                <option value="son">Son</option>' + '                                <option value="daughter">Daughter</option>' + '                                <option value="spouse">Spouse</option>' + '                            </select>' + '   <label for=' + '"' + relation + '"' + ' class="input-label">Relation</label>' + '                     </div>' + '                    </div>' + '                    <div><br></div>' + '                    <div class="row">' + '                        <div class="col-md-5 input">' + '                                                        <input type="text" class="input-field" id=' + '"' + mobile + '"' + ' name=' + '"' + mobile + '"' + ' required>' + '  <label for=' + '"' + mobile + '"' + ' class="input-label">Contact No.</label>' + '                          <div class="invalid-feedback">' + '                                Please provide a valid Contact No..' + '                            </div>' + '                        </div>' + '                        <div class="col-md-5 input">' + '                           <input type="text" class="input-field" id=' + '"' + adhaar + '"' + ' name=' + '"' + adhaar + '"' + '  required>' + '   <label for=' + '"' + adhaar + '"' + ' class="input-label">Adhaar No.</label>' + '                            <div class="invalid-feedback">' + '                                Please provide a valid Adhaar No..' + '                            </div>' + '                        </div>' + '                    </div>' + '                    <div><br></div>' + '                </div>';
        $('#familyContainer').append(newFamily);
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
    if (plusClicks >= 3) {
        $('#plus').hide();
    } else {
        $('#plus').show();
    }
});

$(document).ready(function () {
    $('.toast').toast('show');
    $('#minus').hide();

});

$("#proofType").click(function () {


    var e = $(this).val();

    if (e == "Pan Card") {
        newRowAdd = ' <div class="col input" id ="rendered">' + ' <input type="text" class="input-field" id="proofId" name="proofId"  required />' + ' <label for="proofId" class="input-label">Pan Card No. </label>' + ' <div class="invalid-feedback">' + ' Please provide a valid Id.' + ' </div>' + ' </div>' + '<div></div>';

        $("#renderProof").empty();
        $("#renderProof").append(newRowAdd);
    }
    if (e == "Adhaar Card") {
        newRowAdd = ' <div class="col input" id ="rendered">' + ' <input type="text" class="input-field" id="proofId" name="proofId"  required />' + ' <label for="proofId" class="input-label"> Adhaar Card No.</label>' + ' <div class="invalid-feedback">' + ' Please provide a valid Id.' + ' </div>' + ' </div>' + '<div></div>';
        $("#renderProof").empty();
        $("#renderProof").append(newRowAdd);
    }

    if (e == "Passport") {
        newRowAdd = ' <div class="col input" id ="rendered">' + ' <input type="text" class="input-field" id="proofId" name="proofId"  required />' + ' <label for="proofId" class="input-label">Passport No. </label>' + ' <div class="invalid-feedback">' + ' Please provide a valid Id.' + ' </div>' + ' </div>' + '<div></div>';
        $("#renderProof").empty();
        $("#renderProof").append(newRowAdd);
    }


    if (e == "0") {
        $("#renderProof").empty();
    }

});

function addressFunction() {

    if ($("#same").is(':checked')) {
        $("#permanentAdd\\.street").val($("#currentAdd\\.street").val());
        $("#permanentAdd\\.country").val($("#currentAdd\\.country").val());
        $("#permanentAdd\\.zip").val($("#currentAdd\\.zip").val());
        $("#permanentAdd\\.state").val($("#currentAdd\\.state").val());
        $("#permanentAdd\\.city").val($("#currentAdd\\.city").val());

    } else {
        $("#permanentAdd\\.street").val("");
        $("#permanentAdd\\.country").val("");
        $("#permanentAdd\\.zip").val("");
        $("#permanentAdd\\.state").val("");
        $("#permanentAdd\\.city").val("");
    }
}

function autocomplete(inp, arr) {

    var currentFocus;

    inp.addEventListener("input", function (e) {
        var a,
            b,
            i,
            val = this.value;

        closeAllLists();
        if (! val) {
            return false;
        }
        currentFocus = -1;

        a = document.createElement("DIV");
        a.setAttribute("id", this.id + "autocomplete-list");
        a.setAttribute("class", "autocomplete-items");

        this.parentNode.appendChild(a);

        for (i = 0; i < arr.length; i++) {

            if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {

                b = document.createElement("DIV");

                b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                b.innerHTML += arr[i].substr(val.length);

                b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";

                b.addEventListener("click", function (e) {

                    inp.value = this.getElementsByTagName("input")[0].value;

                    closeAllLists();
                });
                a.appendChild(b);
            }
        }
    });

    inp.addEventListener("keydown", function (e) {
        var x = document.getElementById(this.id + "autocomplete-list");
        if (x) 
            x = x.getElementsByTagName("div");
        
        if (e.keyCode == 40) {

            currentFocus++;

            addActive(x);
        } else if (e.keyCode == 38) { // up

            currentFocus--;

            addActive(x);
        } else if (e.keyCode == 13) {

            e.preventDefault();
            if (currentFocus > -1) {

                if (x) 
                    x[currentFocus].click();
                
            }
        }
    });
    function addActive(x) { /*a function to classify an item as "active":*/
        if (! x) 
            return false;
        
        /*start by removing the "active" class on all items:*/
        removeActive(x);
        if (currentFocus >= x.length) 
            currentFocus = 0;
        
        if (currentFocus < 0) 
            currentFocus = (x.length - 1);
        
        /*add class "autocomplete-active":*/
        x[currentFocus].classList.add("autocomplete-active");
    }
    function removeActive(x) { /*a function to remove the "active" class from all autocomplete items:*/
        for (var i = 0; i < x.length; i++) {
            x[i].classList.remove("autocomplete-active");
        }
    }
    function closeAllLists(elmnt) {

        var x = document.getElementsByClassName("autocomplete-items");
        for (var i = 0; i < x.length; i++) {
            if (elmnt != x[i] && elmnt != inp) {
                x[i].parentNode.removeChild(x[i]);
            }
        }
    }
    /*execute a function when someone clicks in the document:*/
    document.addEventListener("click", function (e) {
        closeAllLists(e.target);
    });
}


var countries = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Anguilla",
    "Antigua & Barbuda",
    "Argentina",
    "Armenia",
    "Aruba",
    "Australia",
    "Austria",
    "Azerbaijan",
    "Bahamas",
    "Bahrain",
    "Bangladesh",
    "Barbados",
    "Belarus",
    "Belgium",
    "Belize",
    "Benin",
    "Bermuda",
    "Bhutan",
    "Bolivia",
    "Bosnia & Herzegovina",
    "Botswana",
    "Brazil",
    "British Virgin Islands",
    "Brunei",
    "Bulgaria",
    "Burkina Faso",
    "Burundi",
    "Cambodia",
    "Cameroon",
    "Canada",
    "Cape Verde",
    "Cayman Islands",
    "Central Arfrican Republic",
    "Chad",
    "Chile",
    "China",
    "Colombia",
    "Congo",
    "Cook Islands",
    "Costa Rica",
    "Cote D Ivoire",
    "Croatia",
    "Cuba",
    "Curacao",
    "Cyprus",
    "Czech Republic",
    "Denmark",
    "Djibouti",
    "Dominica",
    "Dominican Republic",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Equatorial Guinea",
    "Eritrea",
    "Estonia",
    "Ethiopia",
    "Falkland Islands",
    "Faroe Islands",
    "Fiji",
    "Finland",
    "France",
    "French Polynesia",
    "French West Indies",
    "Gabon",
    "Gambia",
    "Georgia",
    "Germany",
    "Ghana",
    "Gibraltar",
    "Greece",
    "Greenland",
    "Grenada",
    "Guam",
    "Guatemala",
    "Guernsey",
    "Guinea",
    "Guinea Bissau",
    "Guyana",
    "Haiti",
    "Honduras",
    "Hong Kong",
    "Hungary",
    "Iceland",
    "India",
    "Indonesia",
    "Iran",
    "Iraq",
    "Ireland",
    "Isle of Man",
    "Israel",
    "Italy",
    "Jamaica",
    "Japan",
    "Jersey",
    "Jordan",
    "Kazakhstan",
    "Kenya",
    "Kiribati",
    "Kosovo",
    "Kuwait",
    "Kyrgyzstan",
    "Laos",
    "Latvia",
    "Lebanon",
    "Lesotho",
    "Liberia",
    "Libya",
    "Liechtenstein",
    "Lithuania",
    "Luxembourg",
    "Macau",
    "Macedonia",
    "Madagascar",
    "Malawi",
    "Malaysia",
    "Maldives",
    "Mali",
    "Malta",
    "Marshall Islands",
    "Mauritania",
    "Mauritius",
    "Mexico",
    "Micronesia",
    "Moldova",
    "Monaco",
    "Mongolia",
    "Montenegro",
    "Montserrat",
    "Morocco",
    "Mozambique",
    "Myanmar",
    "Namibia",
    "Nauro",
    "Nepal",
    "Netherlands",
    "Netherlands Antilles",
    "New Caledonia",
    "New Zealand",
    "Nicaragua",
    "Niger",
    "Nigeria",
    "North Korea",
    "Norway",
    "Oman",
    "Pakistan",
    "Palau",
    "Palestine",
    "Panama",
    "Papua New Guinea",
    "Paraguay",
    "Peru",
    "Philippines",
    "Poland",
    "Portugal",
    "Puerto Rico",
    "Qatar",
    "Reunion",
    "Romania",
    "Russia",
    "Rwanda",
    "Saint Pierre & Miquelon",
    "Samoa",
    "San Marino",
    "Sao Tome and Principe",
    "Saudi Arabia",
    "Senegal",
    "Serbia",
    "Seychelles",
    "Sierra Leone",
    "Singapore",
    "Slovakia",
    "Slovenia",
    "Solomon Islands",
    "Somalia",
    "South Africa",
    "South Korea",
    "South Sudan",
    "Spain",
    "Sri Lanka",
    "St Kitts & Nevis",
    "St Lucia",
    "St Vincent",
    "Sudan",
    "Suriname",
    "Swaziland",
    "Sweden",
    "Switzerland",
    "Syria",
    "Taiwan",
    "Tajikistan",
    "Tanzania",
    "Thailand",
    "Timor L'Este",
    "Togo",
    "Tonga",
    "Trinidad & Tobago",
    "Tunisia",
    "Turkey",
    "Turkmenistan",
    "Turks & Caicos",
    "Tuvalu",
    "Uganda",
    "Ukraine",
    "United Arab Emirates",
    "United Kingdom",
    "United States of America",
    "Uruguay",
    "Uzbekistan",
    "Vanuatu",
    "Vatican City",
    "Venezuela",
    "Vietnam",
    "Virgin Islands (US)",
    "Yemen",
    "Zambia",
    "Zimbabwe"
];

var state = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttarakhand",
    "Uttar Pradesh",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Lakshadweep",
    "Puducherry"
];


autocomplete(document.getElementById("currentAdd.country"), countries);
autocomplete(document.getElementById("currentAdd.state"), state);

</script>
</body>
</html>


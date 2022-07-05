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

<div class="container mt-3">
    <h3>Employee Registration</h3>
    <p>Try to submit the form.</p>
    <br>

    <form action="/add" method="POST" class=" row g-3 needs-validation" novalidate modelAttribute="employee">
        <div class="row">
            <div class="col-md-4">
                <label for="firstName" class="form-label">First name</label>
                <input type="text" class="form-control" id="firstName" name="firstName" value="" required>
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="col-md-4">
                <label for="lastName" class="form-label">Last name</label>
                <input type="text" class="form-control" id="lastName" name="lastName" value="" required>
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
        </div>
        <div></div>
        <div class="row">
            <div class="col-md-4">
                <label for="dob" class="form-label">Date of Birth</label>
                <input type="date" class="form-control" id="dob" name="dob"  required>
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="col-md-4">
                <label for="sex" class="form-label">Sex</label>
                <select class="form-select" aria-label="Default select example" id ="sex" name="sex">
                    <option selected value="0">Select..</option>
                    <option value="1">Male</option>
                    <option value="2">Female</option>
                    <option value="3">Other</option>
                </select>
            </div>
        </div>
        <div></div>
        <div class ="row">
            <div class="col-md-4">
                <label for="religion" class="form-label">Religion</label>
                <input type="text" class="form-control" id="religion" name="religion" required>
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="col-md-4">
                <label for="proofType" class="form-label">Id Proof</label>
                <select class="form-select" aria-label="Default select example" id ="proofType" name="proofType">
                    <option value="0" selected>Select..</option>
                    <option value="1">Pan Card</option>
                    <option value="2">Adhaar Card</option>
                    <option value="3">Other</option>
                </select>
            </div>
        </div>
        <div></div>
        <div class="row" id ="renderProof"> </div>




        <div class = "row">
            <div class="col-md-8" id="current">
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
                                <div class="col-md-4">
                                    <label for="currentAdd.country" class="form-label">Country</label>
                                    <input type="text" class="form-control" id="currentAdd.country" name="currentAdd.country" required>
                                    <div class="invalid-feedback">
                                        Please provide a valid city.
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="currentAdd.zip" class="form-label">Zip</label>
                                    <input type="text" class="form-control" id="currentAdd.zip" name="currentAdd.zip" required>
                                    <div class="invalid-feedback">
                                        Please provide a valid zip.
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="currentAdd.state" class="form-label">State</label>
                                    <select class="form-select" id="currentAdd.state" name="currentAdd.state" required>
                                        <option selected disabled value="">Choose...</option>
                                        <option>...</option>
                                    </select>
                                    <div class="invalid-feedback">
                                        Please select a valid state.
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label for="currentAdd.city" class="form-label">City</label>
                                    <input type="text" class="form-control" id="currentAdd.city" name="currentAdd.city" required>
                                    <div class="invalid-feedback">
                                        Please provide a valid City.
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>


            </div>
        </div>

        <div class = "row">
            <div class="col-md-8" id="permanent">

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
                                <div class="col-md-4">
                                    <label for="permanentAdd.country" class="form-label">Country</label>
                                    <input type="text" class="form-control" id="permanentAdd.country" required>
                                    <div class="invalid-feedback">
                                        Please provide a valid city.
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <label for="permanentAdd.zip" class="form-label">Zip</label>
                                    <input type="text" class="form-control" id="permanentAdd.zip" name="permanentAdd.zip" required>
                                    <div class="invalid-feedback">
                                        Please provide a valid zip.
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="permanentAdd.state" class="form-label">State</label>
                                    <input type="text" class="form-control" id="permanentAdd.state" name="permanentAdd.state" required>
                                    <div class="invalid-feedback">
                                        Please provide a valid State.
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label for="permanentAdd.city" class="form-label">City</label>
                                    <input type="text" class="form-control" id="permanentAdd.city" name="permanentAdd.city" required>
                                    <div class="invalid-feedback">
                                        Please provide a valid City.
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>


            </div>
        </div>
        <div></div>
        <div class="row">
            <div class="col-md-4">
                <label for="mobileNo" class="form-label">Contact No.</label>
                <input type="text" class="form-control" id="mobileNo" name="mobileNo" required>
                <div class="invalid-feedback">
                    Please provide a valid Contact No..
                </div>
            </div>
            <div class="col-4">
                <label for="email" class="form-label">Email </label>
                <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com">
                <div class="invalid-feedback">
                    Please enter a valid email address for shipping updates.
                </div>
            </div>
        </div>

        <div class="col-12">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                <label class="form-check-label" for="invalidCheck">
                    Agree to terms and conditions
                </label>
                <div class="invalid-feedback">
                    You must agree before submitting.
                </div>
            </div>
        </div>
        <div class="col-12">
            <button class="btn btn-primary" type="submit">Submit form</button>
        </div>
    </form>
</div>

<script>

    (function () {
  'use strict'

  // Fetch all the forms we want to apply custom Bootstrap validation styles to
  var forms = document.querySelectorAll('.needs-validation')

  // Loop over them and prevent submission
  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }

        form.classList.add('was-validated')
      }, false)
    })
})()



 $("#proofType").click(function () {
            newRowAdd =
             ' <div class="col-md-3" id ="rendered">'+
           ' <label for="proofText" class="form-label">Proof Id</label>'+
           ' <input type="text" class="form-control" id="proofText" required>'+
           ' <div class="invalid-feedback">'+
               ' Please provide a valid Id.'+
           ' </div>'+
       ' </div>';

        var e = $(this).val();

       if ((e=="1"|| e=='2'|| e=='3' ) && ($("#renderProof").has("#rendered").length==0)){


            $("#renderProof").append(newRowAdd);


       }
       else if (e=="0"){
        $("#renderProof").empty();

       }
    });

    function addressFunction(){

        if($("#same").is(':checked')){

            $("#permanentAdd\\.country").val($("#currentAdd\\.country").val());
            $("#permanentAdd\\.zip").val($("#currentAdd\\.zip").val());
            $("#permanentAdd\\.state").val($("#currentAdd\\.state").val());
            $("#permanentAdd\\.city").val($("#currentAdd\\.city").val());

        }
        else{
            $("#permanentAdd\\.country").val("");
            $("#permanentAdd\\.zip").val("");
            $("#permanentAdd\\.state").val("");
            $("#permanentAdd\\.city").val("");
        }
    }

    function is_int(value){
  if ((parseFloat(value) == parseInt(value)) && !isNaN(value)) {
    return true;
  } else {
    return false;
  }
}

$("#currZip").keyup(function() {
  var el = $(this);

  if ((el.val().length == 6) && (is_int(el.val()))) {

    $.ajax({
  url: "http://zip.elevenbasetwo.com",
  cache: false,
  dataType: "json",
  type: "GET",
  data: "zip=" + el.val(),
  success: function(result, success) {

    // $(".fancy-form div > div").slideDown(); /* Show the fields */

    $("#currCity").val(result.city); /* Fill the data */
    $("#currState").val(result.state);



  },
  error: function(result, success) {

    // $(".zip-error").show(); /* Ruh row */

  }

});

  }

});
$(document).ready(()=>{
alert("hi");
});

</script>
</body>
</html>

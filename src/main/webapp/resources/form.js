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



 $("#proof").click(function () {
            newRowAdd =
             ' <div class="col-md-3">'+
           ' <label for="validationCustom05" class="form-label">Zip</label>'+
           ' <input type="text" class="form-control" id="validationCustom05" required>'+
           ' <div class="invalid-feedback">'+
               ' Please provide a valid zip.'+
           ' </div>'+
       ' </div>';

        var e = $(this).val();
        alert(e);
        if (e=="1"){
          alert(2);
            $("#renderProof").append(newRowAdd);
            }
        });

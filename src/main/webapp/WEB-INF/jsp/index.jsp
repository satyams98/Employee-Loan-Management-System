<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Home</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <style>
        .middle{
       text-align: center;
        margin: 0 0 0 60%;
        }
        .container{
        margin:10% 20% 20% 28%;
        }
        .logo{
            margin:10% 20% 20% 150%;
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
     <b> ${css}</b> ${msg}
     </div>
      <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
  </div>

</c:if>
<div class="container middle">
<div class="center-block">
    <div class="row">
        <div class="col-md-3">
<form method="GET" action="/add">
    <button type="submit" class="btn btn-primary">Add Employee</button>
</form>
    </div>
    <div class="col-md-3">
    <form method="GET" action="/search">
        <button type="submit" class="btn btn-primary">Search Employee</button>
    </form>
    </div>
    </div>
</div>
</div>
<script>
$(document).ready(function(){
  $('.toast').toast('show');
});
</script>
</body>
</html>

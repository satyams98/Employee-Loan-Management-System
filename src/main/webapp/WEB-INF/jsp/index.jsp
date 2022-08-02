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
     <link rel="stylesheet" href="../../resources/home.css">
     
     <link href="https://fonts.googleapis.com/css?family=Montserrat:100" rel="stylesheet">
     <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
     <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-straight/css/uicons-solid-straight.css'>
     <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-bold-rounded/css/uicons-bold-rounded.css'>

    
</head>
<body>


<nav class="navbar navbar-dark bg-transparent ">

    <a href="/" class="navbar-brand text-dark mx-2 order-1  ">
        <img src="../../resources/R.jpg" alt="" width="45" height="45" class="d-inline-block align-top logo">
        <h2 class="d-inline align-middle logo-text "><strong>NSEL Employee Interface</strong></h2>
        <div style="position:absolute;  margin:-7% 0 0 85%">
        <form action="/logout" method="GET">
        <button class="btn btn-danger">Log Out</button>
        </form>
        </div>

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


<div class="container" style="position:absolute">

<div class="row" style="height:50px;position:relative;margin:0% 0 0 5%">
<div class="col" style="height:50px; width:30px">
<form action = "/add" method="GET" >
<button type = "submit" class="btn btn-primary" >Add Employee</button>
</form>

</div>
<div class="col" style="height:50px; margin:0 55% 0 0">

<form action="/search" method ="GET">
<button type = "submit" class="btn btn-primary">Search Employee</button>
<input type="hidden" name="action" value="detail" >
</form>
</div>
</div>

<div class="row" style="height:20px;margin: 2% 0 0 5%">
<div class="col" style="height:50px;">
<form action="/search" method="GET">
<button type = "submit" class="btn btn-primary">Update Employee</button>
<input type="hidden" name="action" value="update" >
</form>
</div>

<div class="col" style="height:50px;margin:0 55% 0 0">

<form action="/search" method="GET">
<button type = "submit" class="btn btn-primary">Delete Employee</button>
<input type="hidden" name="action" value="delete" >
</form>
</div>
</div>
<div  style="height:50px;width:25px;margin:19% 0 0 6%">

    <form action="/loanReq" method="GET">
    <button type = "submit" class="btn btn-primary" >Loan Request</button>
    </form>

</div>


</body>
<script>
$(document).ready(function(){
  $('.toast').toast('show');
});
</script>

</html>
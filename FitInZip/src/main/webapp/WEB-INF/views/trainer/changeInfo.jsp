<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>FITIN.ZIP Mainpage</title>

    <!-- Custom fonts for this template-->
    <link href="../resources/trainer/trainermainvendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../resources/trainer/css/TrainerMain-sb-admin-2.min.css" rel="stylesheet">
    <link href="../resources/trainer/css/form-validation.css" rel="stylesheet">


	<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
    </style>
     
    <script src = "../resources/trainer/ckeditor/ckeditor.js"></script> 
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script>
    	$(function() {
    		$("#memOriName").on('change', function(){
    		readURL(this);
          	});
      	});

      	function readURL(input) {
        	if (input.files && input.files[0]) {
          	var reader = new FileReader();

 	        reader.onload = function (e) {
            	$('#profileImg').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
          	}
      	}
      	
      	function registerForm() {
      		if(document.getElementById("password").value.length == 0) {
      			alert("??????????????? ??????????????????.");	
      			return false;
      		}
      		if(document.getElementById("nickname").value.length == 0) {
      			alert("????????? ??????????????????.");
      			return false;
      		}
      		if(document.getElementById("phone").value.length == 0){
      			alert("??????????????? ??????????????????.");
      			return false;
      		}
      		alert("?????? ????????? ?????????????????????!");
      		location.href="/trainerMainPage";
      	}
      		    	
    </script>
     
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/trainerMainPage">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">FITIN.ZIP TRAINER </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">


            <!-- Heading -->
            <div class="sidebar-heading">
                	
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>????????? ??????</span>
                </a>
               
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                
                        <a class="collapse-item" href="/myClass">?????? ?????????</a>
                        <a class="collapse-item" href="cards.html">????????? ????????????</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>????????????</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                       
                        <a class="collapse-item" href="/myCalculation">?????? ????????????</a>
                        <a class="collapse-item" href="/myWithdraw">???????????? ????????????</a>
          
                    </div>
                </div>
            </li>
            
           
            
            <li class="nav-item">
                <a class="nav-link" href="/changeInfo">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>????????? ??????</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="myReview">
                    <i class="fas fa-fw fa-table"></i>
                    <span>??? ?????? ??????</span></a>
            </li>



            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

           
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - User Information -->
                    	<li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${member.name } ?????????</span>
                                <img class="img-profile rounded-circle"
                                    src="../resources/trainer/img/profile2_trainer.png">
                            </a>
                     <!-- Dropdown - User Information -->
	                     	<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
	                        	aria-labelledby="userDropdown">
	                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
	                            	<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
	                                    Logout
	                            </a>
	                         </div>
                        </li>
                    </ul>
                </nav>
               
                <!-- Begin Page Content -->
                <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row g-3" style= "margin-left: 25%">  
		        <div class="col-md-7 col-lg-8">
		        <h4 class="mb-3" style="text-align: center; padding-bottom: 20px;">?????? ??????</h4>
		        <form class="needs-validation" method="post" name="frm" enctype="multipart/form-data">
		        	<div class="col-12">
		            	<label for="id" class="form-label">?????????(???????????????)</label> ${member.id }              
	            	</div>
          
		           	<div class="col-12">
		            	<label for="password" class="form-label" style="margin-top: 10px">????????????</label>
		              	<input type="password" class="form-control" name="password" id="password" placeholder="" required>
		            </div>
          
		            <div class="col-12">
		            	<label for="name" class="form-label" style="margin-top: 10px">??????</label> ${member.name }
		            </div>
	            
		            <div class="col-12">
		            	<label for="name" class="form-label" style="margin-top: 10px">??????</label>
		              	<input type="text" class="form-control" name="nickname" id="nickname" placeholder="??????" value="" required>
		            </div>
	
		            <div class="col-12">
		            	<label for="phone" class="form-label" style="margin-top: 10px">???????????????</label>
	                	<input type="text" class="form-control" name="phone" id="phone" placeholder="01012345678" required>
		            </div>
         	
         	
         		
         	
         	
          		<div class="file1">
	          	<label for="profile" class="form-label">???????????????</label>
	          	<input type="file" id="memOriName" name="memberOriName" value="??????" accept=".jpg,.jpeg,.png,.gif">
	          		<img id="profileImg" src="${profileImg }" style="width:250px; height:250px;padding-top: 20px; padding-bottom:20px;">
	          	</div> 
	          	
	          	
					
					<div class="mb-3">
						<label for="content" style="margin-top: 10px">????????????</label>
						<textarea id = "editor" name = "trainerIntro">${trainerInfo.trainerIntro }</textarea>
						<script type="text/javascript">CKEDITOR.replace('editor');</script>
					</div>
					
					<div class="mb-3">
						<label for="content" style="margin-top: 10px">?????? ??? ??????</label>
						<textarea id = "editor2" name = "career">${trainerInfo.career }</textarea>
						<script type="text/javascript">CKEDITOR.replace('editor2');</script>
					</div>
					<button class="w-100 btn btn-lg btn-primary" type="submit" value="????????????" id="infoBtn" style="margin-top: 20px" onclick="registerForm()">????????????</button>
         			</div>
         			
         			<input type="hidden" name="profileOriName" value="${member.memOriName } ">
         			<input type="hidden" name="profileFileName" value="${member.memFileName }">
         		
         		</form>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">???????????? ???????????????????</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">??</span>
                    </button>
                </div>
                <div class="modal-body">???????????? ????????? ???????????? ?????? ???????????? ??????????????????.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="/logout">Logout</a>
                </div>
            </div>
        </div>
    </div>

	<script src="../resources/trainer/js/bootstrap.bundle.min.js"></script>
    <script src="../resources/trainer/js/form-validation.js"></script>
	
    <!-- Bootstrap core JavaScript-->
    <script src="../resources/trainer/trainermainvendor/jquery/jquery.min.js"></script>
    <script src="../resources/trainer/trainermainvendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    

    <!-- Core plugin JavaScript-->
    <script src="../resources/trainer/trainermainvendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
   <!--  <script src="js/sb-admin-2.min.js"></script> -->

    <!-- Page level plugins -->
    <!-- <script src="resources/vendor/chart.js/Chart.min.js"></script> -->

    <!-- Page level custom scripts -->
  <!--   <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script> -->

</body>

</html>
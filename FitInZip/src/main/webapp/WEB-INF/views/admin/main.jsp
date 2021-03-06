<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Collapsible sidebar using Bootstrap 4</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	type="text/javascript"></script>

<!-- bbs -->
<link rel="stylesheet" href="../resources/admin/css/bbs.css">
<link href="../resources/admin/js/bbs.js">

<!-- percent bar -->
<link rel="stylesheet" href="../resources/admin/css/percent.css">
<!-- progress bar -->
<link rel="stylesheet" href="../resources/admin/css/progress.css">
<script src="https://rendro.github.io/easy-pie-chart/javascripts/jquery.easy-pie-chart.js"></script>


<!-- MainSidebar -->
<link rel="stylesheet" href="../resources/admin/css/style5.css">

<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<!-- Font Awesome JS -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
	integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
	integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
	crossorigin="anonymous"></script>

<!-- Popper.JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
	integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
	crossorigin="anonymous"></script>
<!-- Bootstrap JS -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
	integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
	crossorigin="anonymous"></script>
<!-- MainSidebar -->
<link rel="stylesheet" href="../resources/admin/css/style5.css">
<!-- chartJS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>

<style type="text/css">
/* 
*{
	font-family: 'Noto Sans KR', sans-serif;
}
 */
.modal-backdrop {
	background-color: transparent !important;
	position: absolute;
	z-index: -1;
}

.theadWidth {
	width: 100px;
}

.title1 {
	text-align: center;
	font-weight: 800;
	font-size: 20px;
	color: black;/* ?????????????????? */
	text-transform: uppercase;
}
.easyPieChart{
	width: 220px !important; 
    height: 220px !important;
    margin : -15px !important;
    line-height: 215px !importan;
    padding-top: 30px !importan;
}

canvas{
	width: 100% !important;
}

</style>



</head>

<body>

	<div class="wrapper">
		<!-- Sidebar Holder -->
		<jsp:include page="mainSideBar.jsp"></jsp:include>

		<!-- Page Content Holder -->
		<div id="content" style='padding-top: 20px' id="navconvert">
			<!-- NavBar -->
			<jsp:include page="mainNavBar.jsp"></jsp:include>

			<!-- ????????????????????? -->
			<div><jsp:include page="bbstest.jsp"></jsp:include></div>
			<div class="line"></div>

			<div><jsp:include page="bbsClass.jsp"></jsp:include></div>
			<div class="line"></div>

			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<h5 style="text-align: center; padding-bottom: 10px;"
							id="chartOnePrice">????????? ?????? ??????</h5>
					</div>
					<div class="col-md-6">
						<h5 style="text-align: center; padding-bottom: 10px;"
							id="chartTwoPrice">????????? ?????? ??????</h5>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<canvas id="myChartOne"></canvas>
					</div>
					<div class="col-md-6">
						<canvas id="myChartTwo"></canvas>
					</div>
				</div>

				<div class="line"></div>
				<div class="row">
					<div class="col-md-12">
						<h5 style="text-align: center; padding-bottom: 10px;"
							id="chartOnePrice">????????? ?????? ?????? ?????????</h5>
					</div>
				</div>

				<div class="row" style="padding-top: 50px;">
					<div class="col-md-8">
						<div class="skillbar clearfix " id="weightData" data-percent="30%">
							<div class="skillbar-title"
								style="background: rgba(247, 67, 54, 0.7);">
								<span>?????????</span>
							</div>
							<div class="skillbar-bar"
								style="background: rgba(247, 67, 54, 0.7)"></div>
							<div class="skill-bar-percent" id="weightPer">120%</div>
						</div>
						<!-- End Skill Bar -->

						<div class="skillbar clearfix " id="fitnessData"
							data-percent="25%">
							<div class="skillbar-title"
								style="background: rgba(33, 150, 243, 0.7);">
								<span>????????????</span>
							</div>
							<div class="skillbar-bar"
								style="background: rgba(33, 150, 243, 0.7);"></div>
							<div class="skill-bar-percent" id="fitnessPer">25%</div>
						</div>
						<!-- End Skill Bar -->

						<div class="skillbar clearfix " id="yogaData" data-percent="50%">
							<div class="skillbar-title"
								style="background: rgba(255, 152, 0, 0.7);">
								<span>??????</span>
							</div>
							<div class="skillbar-bar"
								style="background: rgba(255, 152, 0, 0.7);"></div>
							<div class="skill-bar-percent" id="yogaPer">50%</div>
						</div>
						<!-- End Skill Bar -->

						<div class="skillbar clearfix " id="pilatesData"
							data-percent="40%">
							<div class="skillbar-title"
								style="background: rgba(233, 30, 99, 0.7);">
								<span>????????????</span>
							</div>
							<div class="skillbar-bar"
								style="background: rgba(233, 30, 99, 0.7);"></div>
							<div class="skill-bar-percent" id="pilatesPer">40%</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="chart" id="progress" data-percent="10"
							style="padding-top: 30px; padding-left: 10px;">HTML5</div>
					</div>
				</div>
			<div class="line"></div>
			<div class="row">
				<div class="col-md-12">
					<h5 style="text-align: center; padding-bottom: 10px;"
						id="chartOnePrice">????????? ?????? ?????? ??????</h5>
				</div>
				<div class="row">
					<div class="col-md-12">
						<canvas id="myChartThree"></canvas>
					</div>
				</div>
			</div>
			
			</div>
		</div>
	</div>




	<script type="text/javascript">
        $(document).ready(function () {
        	

            var dataOne = new Array();
            var dataTwo = new Array();
            dataOne = chartOneStart();
            dataTwo = chartTwoStart();
            chartThreeStart();
            
            <!-- ?????? ?????? ????????????  ????????? ??????????????????-->
            let weightPer = (dataTwo[0] / dataOne[0] * 100).toFixed(1);
            let fitnessPer = (dataTwo[1] / dataOne[1] * 100).toFixed(1);
            let yogaPer = (dataTwo[2] / dataOne[2] * 100).toFixed(1);
            let pilatesPer = (dataTwo[3] / dataOne[3] * 100).toFixed(1);
            
            <!-- ?????? ?????? ????????????  ?????????-->
            let weightP = (dataTwo[0] / dataOne[0] * 100).toFixed(0);
            let fitnessP = (dataTwo[1] / dataOne[1] * 100).toFixed(0);
            let yogaP = (dataTwo[2] / dataOne[2] * 100).toFixed(0);
            let pilatesP = (dataTwo[3] / dataOne[3] * 100).toFixed(0);
            
            console.log("???????????????" + weightP+fitnessP+yogaP+pilatesP);
 
            document.getElementById('weightPer').innerHTML = weightPer+'%';
            document.getElementById('fitnessPer').innerHTML = fitnessPer+'%';
            document.getElementById('yogaPer').innerHTML = yogaPer+'%';
            document.getElementById('pilatesPer').innerHTML = pilatesPer+'%';
            
            <!-- ????????? ????????? -->
            if(weightP<=99){
            	document.getElementById('weightData').setAttribute('data-percent',weightP+'%');
            }else if(weightP>=100){
            	document.getElementById('weightData').setAttribute('data-percent','100%');	
            }
            
            if(fitnessP<=99){
            	document.getElementById('fitnessData').setAttribute('data-percent',fitnessP+'%');
            }else if(fitnessP>=100){
            	document.getElementById('fitnessData').setAttribute('data-percent','100%');
            }
            
            if(yogaP<=99){
            	document.getElementById('yogaData').setAttribute('data-percent',yogaP+'%');
            }else if(yogaP>=100){
            	document.getElementById('yogaData').setAttribute('data-percent','100%');	
            }
            
            if(pilatesP<=99){
            	document.getElementById('pilatesData').setAttribute('data-percent',pilatesP+'%');
            }else if(pilatesP>=100){
            	 let e4 = document.getElementById('pilatesData').setAttribute('data-percent','100%');	
            }
            
            <!-- progress ????????? -->
            var one = dataOne[0] + dataOne[1] +dataOne[2] +dataOne[3];
            var two = dataTwo[0] + dataTwo[1] +dataTwo[2] +dataTwo[3];
            
            var avgOneTwo = (one / two *100).toFixed(1);
            console.log("?????????~"+avgOneTwo);
            document.getElementById('progress').setAttribute('data-percent',avgOneTwo);
            document.getElementById('progress').innerHTML = avgOneTwo+'%';

           /* 
            let e1 = document.getElementById('weightData').setAttribute('data-percent',weightPer);
            let e2 = document.getElementById('fitnessData').setAttribute('data-percent',fitnessPer);
            let e3 = document.getElementById('yogaData').setAttribute('data-percent',yogaPer);
            let e4 = document.getElementById('pilatesData').setAttribute('data-percent',pilatesPer);

 */            
            <!-- ???????????? -->
        	jQuery('.skillbar').each(function(){
        		jQuery(this).find('.skillbar-bar').animate({
        			width:jQuery(this).attr('data-percent')
        		},6000);
        	});
        	
        	<!-- ????????? -->
       	 $('.chart').easyPieChart({
       		    scaleColor: "#ecf0f1",
       		    lineWidth: 20,
       		    lineCap: 'butt',
       		    barColor: 'rgba(11,156,49,0.5)',
       		    trackColor:	"#ecf0f1",
       		    size: 160,
       		    animate: 500
       		  });
       	
        	
        });

    </script>
	<script>
	<!--???????????? ?????? modal?????? ?????? ?????? -->
	function changeSt(btn){
		let id = btn.parentElement.parentElement.firstElementChild.textContent;
	
		$.ajax({
			url: "bbs1Modal",
			type: "GET",
			dataType: "json",
			data: {id:id},
			success: function(data){
				data.forEach(function(element){
					makeModalData(element);	
				})
				
			},
			error: function (){
				alert("??????~"+error);
				}
		});
		
		function makeModalData(data){
			$('#exampleModalLabel').html(data.name+" ?????????");
			$('#modalBody').html(data.id);
			$('#modalBody2').html(data.phone);
			$('#modalBody3').html(data.gender);
			$('#modalBody4').html(data.birth);
			$('#modalBody5').html(data.trainerIntro);
			$('#modalBody6').html(data.career);
			$('#modalBody7').html(data.questionFirst);
			$('#modalBody8').html(data.questionSecond);
			$('#modalBody9').html(data.registerDate);
		}
	}
	

	function approveTrainer(){
		let id = document.getElementById('modalBody').innerHTML;
		let btnId = document.getElementById('btnResult1').innerHTML
		alert("id : " + id + "btnId" + btnId);
		
		$.ajax({
			url: "approveTrainer",
			type: "post",
			dataType: "json",
			data: {id:id, btnId:btnId},
			success: function(data){
				alert("????????? ?????? ???????????????.");
				window.location.href="adminMain";
			
			},
			error: function (){
				alert("?????? : "+error);
				}
		});
	}
	
	function rejectTrainer(){
		let id = document.getElementById('modalBody').innerHTML;
		let btnId = document.getElementById('btnResult2').innerHTML
		
		$.ajax({
			url: "rejectTrainer",
			type: "post",
			dataType: "json",
			data: {id:id, btnId:btnId},
			success: function(data){
				alert("????????? ?????? ???????????????.");
				window.location.href="adminMain";
			
			},
			error: function (){
				alert("?????? : "+error);
				}
		});
	}
	
	<!--????????? ?????? modal?????? ?????? ?????? -->
	function changeClsModal(btn){
		let id = btn.parentElement.parentElement.firstElementChild.textContent;
		

		/* let name = document.getElementById('bbsClsName').innerText; */
		/* $('#clsModalLabel').html(name); */
		$.ajax({
			url: "bbsClsModal",
			type: "POST",
			dataType: "json",
			data: {id:id},
			success: function(data){
				data.forEach(function(element){
					console.log(element);
					makeClsModalList(element);
				})
				
			},
			error: function (){
				alert("??????~"+error);
				}
		});
	}
	function makeClsModalList(data){
		$('#clsModalLabel').html(data.name+" ?????????");
		$('#modalClsBody').html(data.clsCode);
		$('#modalClsBody2').html(data.trainerId);
		$('#modalClsBody3').html(data.commonName);
		$('#modalClsBody4').html(data.clsName);
		$('#modalClsBody5').html(data.sumDate);
		/* $('#modalClsBody6').html(data.endDate); */
		$('#modalClsBody7').html(data.sumTime);
		/* $('#modalClsBody8').html(data.endTime); */
		$('#modalClsBody9').html(data.lapse);
		$('#modalClsBody10').html(data.perPrice+" ???");
		$('#modalClsBody11').html(data.clsInfo);
		$('#modalClsBody12').html(data.curriculum);
		$('#modalClsBody13').html(data.maxMem + " ???");
		$('#modalClsBody14').html(data.calorie + " cal");
	}

	function approveClsTrainer(){
		let id = document.getElementById('modalClsBody').innerHTML;
		let btnId = document.getElementById('btnClsResult1').innerHTML
		alert("id : " + id + "btnId : " + btnId);	
		
		$.ajax({
			url: "approveClsTrainer",
			type: "post",
			dataType: "json",
			data: {id:id, btnId:btnId},
			success: function(data){
				alert("?????? ???????????????.");
				window.location.href="adminMain";
			
			},
			error: function (){
				alert("?????? : ");
				}
		});
	}
	
	function rejectClsTrainer(){
		let id = document.getElementById('modalClsBody').innerHTML;
		let btnId = document.getElementById('btnClsResult2').innerHTML
		alert("id : " + id + "btnId : " + btnId);	
		
		$.ajax({
			url: "approveClsTrainer",
			type: "post",
			dataType: "json",
			data: {id:id, btnId:btnId},
			success: function(data){
				alert("?????? ?????? ???????????????.");
				window.location.href="adminMain";
			
			},
			error: function (){
				alert("?????? : ");
				}
		});
	}
	
	
	
</script>
	<script>
	
	function addComma(num) {
	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  return num.toString().replace(regexp, ',');
	}
	<!-- ??????1????????? ??????????????? -->
	function chartOneStart(){
		var dataOne = new Array();
		
		$.ajax({
			url: "chartOne",
			type: "POST",
			async:false,
			dataType: "json",
			success: function(data){
				dataOne = getchartOneData(data)	
			},
			error: function (){
				alert("??????~"+error);
				}
		});
	
		return dataOne;
	}
	
	
	function getchartOneData(data){
 		var weightPrice = 0;
		var fitnessPrice = 0;
		var yogaPrice = 0;
		var pilatesPrice = 0;

		var dateOne = new Array(); 
		data.forEach(function(element){
			switch (element.commonName){
				case '?????????':
					weightPrice += element.originPrice;
				break;
				case '????????????':
					fitnessPrice += element.originPrice;
				break;
				case '??????':
					yogaPrice += element.originPrice;
				break;
				case '????????????':
					pilatesPrice += element.originPrice;
				break;
			}
		})
		
		dateOne[0] = weightPrice;
		dateOne[1] = fitnessPrice;
		dateOne[2] = yogaPrice;
		dateOne[3] = pilatesPrice;
		console.log("????????????? : " + dateOne[0],dateOne[1] ,dateOne[2] ,dateOne[3] );
		
		crateChartOne(weightPrice,fitnessPrice,yogaPrice,pilatesPrice);
		return dateOne;
	}
		function crateChartOne(weightPrice,fitnessPrice,yogaPrice,pilatesPrice){
			console.log("weightPrice : " + weightPrice + " fitnessPrice" + fitnessPrice + " yogaPrice" + yogaPrice + " pilatesPrice" + pilatesPrice);
			
			let myChartOne = document.getElementById('myChartOne').getContext('2d');
			var sumPrice = weightPrice+fitnessPrice+yogaPrice+pilatesPrice;
			console.log(addComma(sumPrice));
			//$('#chartOnePrice').html('????????? ??? ?????? : ' + sumPrice);
			document.getElementById('chartOnePrice').innerHTML = '????????? ??? ?????? : ' + addComma(sumPrice)  + ' ???';
			
			let barChartOne = new Chart(myChartOne, {
				type : 'bar', //pie, line, doughnut, palarArea, bar
				data : {
					labels : ['?????????' ,'????????????', '??????' , '????????????'],
					datasets : [ {
						label : '????????????',
						data : [ weightPrice,fitnessPrice,yogaPrice,pilatesPrice ],
						backgroundColor : [ 'rgba(247,67,54,0.7)','rgba(33,150,243,0.7)' , 'rgba(255,152,0,0.7)' , 'rgba(233,30,99,0.7)' ],
						borderWidth : 3
					} ],
				},
				options: {
				/* 	title : {
						display : true,
						text : '????????? ?????? ?????? : '+addComma(sumPrice) + " ???",
						fontSize : 20,
						fontColor : 'black'
					}, */
					tooltips: {
					      callbacks: {
					        label: function(tooltipItem, data) {
					          var dataLabel = data.labels[tooltipItem.index];
					          var value = ': ' + data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].toLocaleString()+'???';

					          if (Chart.helpers.isArray(dataLabel)) {

					            dataLabel = dataLabel.slice();
					            dataLabel[0] += value;
					          } else {
					            dataLabel += value;
					          }

					          return dataLabel;
					        }
					      }
				   },
				   scales: {
		                yAxes: [{
		                    ticks: {
		                        beginAtZero:true,
		                        callback: function(value, index, values) {
		                            if(parseInt(value) >= 1000){
		                               return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ '???';
		                            } else {
		                               return value+'???';
		                            }
		                       }                            
		                    }
		                }]
		            },
		            legend :{
		            	display: false
		            },
		            animation: {
		                duration: 8000,
		            },
			
				   }// option??? ???
			}); // ?????? ?????? ????????????
				
		}// ?????? funtion??? ???

		<!-- ??????2????????? ??????????????? -->
		function chartTwoStart(){
			var dataTwo = new Array(); 
			
			$.ajax({
				url: "chartTwo",
				type: "POST",
				async:false,
				dataType: "json",
				success: function(data){
					dataTwo = getchartTwoData(data)	
					
				},
				error: function (){
					alert("??????~"+error);
					}
			});
			return dataTwo;
		}
		
		
		function getchartTwoData(data){
			var weightPriceTwo = 0;
			var fitnessPriceTwo = 0;
			var yogaPriceTwo = 0;
			var pilatesPriceTwo = 0;
			
			var dataTwo = new Array(); 
			
			data.forEach(function(element){
				switch (element.commonName){
					case '?????????':
						weightPriceTwo += element.originPrice;
					break;
					case '????????????':
						fitnessPriceTwo += element.originPrice;
					break;
					case '??????':
						yogaPriceTwo += element.originPrice;
					break;
					case '????????????':
						pilatesPriceTwo += element.originPrice;
					break;
				}
			})
				dataTwo[0] = weightPriceTwo;
				dataTwo[1] = fitnessPriceTwo;
				dataTwo[2] = yogaPriceTwo;
				dataTwo[3] = pilatesPriceTwo;
			
			crateChartTwo(weightPriceTwo,fitnessPriceTwo,yogaPriceTwo,pilatesPriceTwo);
			
			return dataTwo;
		}
			function crateChartTwo(weightPriceTwo,fitnessPriceTwo,yogaPriceTwo,pilatesPriceTwo){				
				let myChartTwo = document.getElementById('myChartTwo').getContext('2d');
				var sumPriceTwo = weightPriceTwo+fitnessPriceTwo+yogaPriceTwo+pilatesPriceTwo;
				console.log(addComma(sumPriceTwo));
				document.getElementById('chartTwoPrice').innerHTML = '????????? ??? ?????? : ' + addComma(sumPriceTwo)  + ' ???';
				
				let barChartTwo = new Chart(myChartTwo, {
					type : 'bar', //pie, line, doughnut, palarArea, bar
					data : {
						labels : ['?????????' ,'????????????', '??????' , '????????????'],
						datasets : [ {
							label : '????????????',
							data : [ weightPriceTwo,fitnessPriceTwo,yogaPriceTwo,pilatesPriceTwo ],
							backgroundColor : [ 'rgba(247,67,54,0.7)','rgba(33,150,243,0.7)' , 'rgba(255,152,0,0.7)' , 'rgba(233,30,99,0.7)' ],
							borderWidth : 3
						} ],
					},
					options: {
						tooltips: {
						      callbacks: {
						        label: function(tooltipItem, data) {
						          var dataLabel = data.labels[tooltipItem.index];
						          var value = ': ' + data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].toLocaleString()+'???';

						          if (Chart.helpers.isArray(dataLabel)) {

						            dataLabel = dataLabel.slice();
						            dataLabel[0] += value;
						          } else {
						            dataLabel += value;
						          }

						          return dataLabel;
						        }
						      }
					   },
					   scales: {
			                yAxes: [{
			                    ticks: {
			                        beginAtZero:true,
			                        callback: function(value, index, values) {
			                            if(parseInt(value) >= 1000){
			                               return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ '???';
			                            } else {
			                               return value+'???';
			                            }
			                       }                            
			                    }
			                }]
			            },
			            legend :{
			            	display: false
			            },
			            animation: {
			                duration: 8000,
			            },
				
					   }// option??? ???
				}); // ?????? ?????? ????????????
					
			}// ?????? funtion??? ???
			
			<!-- ??????3????????? ??????????????? -->
			function chartThreeStart(){
				var dataThree = new Array(); 
				
				$.ajax({
					url: "chartThree",
					type: "POST",
					dataType: "json",
					success: function(data){
						crateChartThree(data)	
						console.log("????????????????????????"+data['15']);
					},
					error: function (){
						alert("??????~"+error);
						}
				});
			}
			
		<!-- 	
			function getchartThreeData(data){
			
		
				crateChartThree();
				
			
			}
		-->
				function crateChartThree(data){				
					let myChartThree = document.getElementById('myChartThree').getContext('2d');
					
					let lineChartThree = new Chart(myChartThree, {
						type : 'line', //pie, line, doughnut, palarArea, bar
						data : {
							labels : ['1???' ,'2???', '3???' , '4???','5???','6???','7???','8???','9???','10???','11???','12???','13???','14???','15???','16???','17???','18???','19???','20???','21???','22???','23???','24???','25???','26???','27???','28???','29???','30???','31???'],
							datasets : [ {
								label : '????????????',
								data : [data['01'],data['02'],data['03'],data['04'],data['05'],data['06'],data['07'],data['08'],data['09'],data['10'],data['11'],data['12'],data['13'],data['14'],data['15'],data['16'],data['17'],data['18'],data['19'], data['20'],data['21'],data['22'],data['23'],data['25'],data['26'],data['27'],data['28'],data['29'],data['30'],data['31']],
					            borderColor: 'rgba(247,67,54,0.7)',
					            pointRadius:4,
					            pointHoverRadius:8,
					            pointHoverBackgroundColor:'rgba(247,67,54,0.8)',
					            fill:false
							},{
									label : '????????????',
									data : [data['-01'],data['-02'],data['-03'],data['-04'],data['-05'],data['-06'],data['-07'],data['-08'],data['-09'],data['-10'],data['-11'],data['-12'],data['-13'],data['-14'],data['-15'],data['-16'],data['-17'],data['-18'],data['-19'], data['-20'],data['-21'],data['-22'],data['-23'],data['-25'],data['-26'],data['-27'],data['-28'],data['-29'],data['-30'],data['-31']],
						            borderColor: "rgba(33,150,243,0.7)",
						            pointRadius:4,
						            pointHoverRadius:8,
						            pointHoverBackgroundColor:'rgba(33,150,243,0.8)',
						            fill:false
						      }
					],
						},
						options: {
							tooltips: {
							      callbacks: {
							        label: function(tooltipItem, data) {
							          var dataLabel = data.labels[tooltipItem.index];
							          var value = ': ' + data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].toLocaleString()+'???';

							          if (Chart.helpers.isArray(dataLabel)) {

							            dataLabel = dataLabel.slice();
							            dataLabel[0] += value;
							          } else {
							            dataLabel += value;
							          }

							          return dataLabel;
							        }
							      }
						   },
						   scales: {
							   yAxes: [{
				                    ticks: {
				                        beginAtZero:true,
				                        callback: function(value, index, values) {
				                            if(parseInt(value) >= 1000){
				                               return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ '???';
				                            } else {
				                               return value+'???';
				                            }
				                       }                            
				                    }
				                }]
				            },
				            /* legend :{
				            	display: false
				            }, */
				            animation: {
				                duration: 8000,
				            },
					
						   }// option??? ???
					}); // ?????? ?????? ????????????
						
				}// ?????? funtion??? ???
</script>


	<!-- ?????????????????? modal??? ??????  -->
	<div class="modal fade" id="exampleModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">???</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%@ include file="listModalRM.jsp"%>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnResult1"
						onclick="approveTrainer();">????????????</button>
					<button type="button" class="btn btn-secondary" id="btnResult2"
						onclick="rejectTrainer();">????????????</button>

				</div>
			</div>
		</div>
	</div>
	<!-- ??????????????? modal??? ??????  -->
	<div class="modal fade" id="exampleModal2" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="clsModalLabel"></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%@ include file="listModalCLS.jsp"%>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnClsResult1"
						onclick="approveClsTrainer();">????????????</button>
					<button type="button" class="btn btn-secondary" id="btnClsResult2"
						onclick="rejectClsTrainer();">????????????</button>

				</div>
			</div>
		</div>
	</div>
	<!-- modal??? ?????? ??? -->

</body>
</html>

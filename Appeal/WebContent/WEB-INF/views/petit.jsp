<%@ page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<sec:authentication var="principal" property="principal" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<script type="text/javascript" src="<c:url value="/resources/jquery/1.6/jquery-1.6.1.min.js" />"></script>
	
	
	<c:url var="findTypesURL" value="/types" />
	<c:url var="findCausesURL" value="/causes" />
	<c:url var="findRectifs1URL" value="/rectifs1" />
	<c:url var="findRectifs2URL" value="/rectifs2" />
	<c:url var="findRectifs3URL" value="/rectifs3" />
	<c:url var="findRectifs4URL" value="/rectifs4" />
	
	<script>
	function cancelback() {
		parent.history.back();
		};

		
	function numberone() {
		console.log('@@ '+$('#sel').val());
		if($('#sel').val() != '0'){
			
			$('#addpetit').prop('disabled', false);
		}
		else{
			$('#addpetit').prop('disabled', true);
			}
		
	 }	

	function refreshp() {
		console.log('@@ '+$('#refreshpage').val());
		location.reload();
		
	 }	

		
	$(document).ready(
			
		function() {
			$.getJSON('${findTypesURL}', {
				ajax : 'true'
			}, function(data) {
				var html = '<option value="0"></option>';
				var len = data.length;
				for ( var i = 0; i < len; i++) {
					html += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
				}
				html += '</option>';

				$('#type').html(html);
			});
		}
	)
		
	</script>
	<script type="text/javascript">
	$(document).ready(function() { 
		if(window.location.href.indexOf("refresh") > -1) {
				$('#main').addClass('forrefresh');
		    }

		
		$('#type').change(
				function() {
					$.getJSON('${findCausesURL}', {
						typeName : $(this).val(),
						ajax : 'true'
					}, function(data) {
						var html = '<option value="0"></option>';
						var len = data.length;
						for ( var i = 0; i < len; i++) {
							html += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
						}
						html += '</option>';
	
						$('#cause').html(html);
					});
				});
	});
	</script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#cause").change(onSelectChange);
		});
	
		function onSelectChange() {
			var selected = $("#cause option:selected");		
			var output = "";
			if(selected.val() != 0){
				output = selected.text();
			}
			$("#output").html(output);
		}
	</script>
	
	<script type="text/javascript">
	$(document).ready(function() { 
		$('#cause').change(
			function() {
				$.getJSON('${findRectifs1URL}', {
					causeName : $(this).val(),
					ajax : 'true'
				}, function(data) {
					var html = '<option value="0"></option>';
					var len = data.length;
					for ( var i = 0; i < len; i++) {
						html += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
					}
					html += '</option>';

					$('#rectif1').html(html);
				});
			});
		});
	</script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#rectif1").change(onSelectChange);
		});
	
		function onSelectChange() {
			var selected = $("#rectif1 option:selected");		
			var output = "";
			if(selected.val() != 0){
				output = selected.text();
			}
			$("#output").html(output);
		}
	</script>
	
	<script type="text/javascript">
	$(document).ready(function() { 
		$('#rectif1').change(
			function() {
				$.getJSON('${findRectifs2URL}', {
					rectif1Name : $(this).val(),
					ajax : 'true'
				}, function(data) {
					var html = '<option value="0"></option>';
					var len = data.length;
					for ( var i = 0; i < len; i++) {
						html += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
					}
					html += '</option>';

					$('#rectif2').html(html);
				});
			});
		});
	</script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#rectif2").change(onSelectChange);
		});
	
		function onSelectChange() {
			var selected = $("#rectif2 option:selected");		
			var output = "";
			if(selected.val() != 0){
				output = selected.text();
			}
			$("#output").html(output);
		}
	</script>
	
	<script type="text/javascript">
	$(document).ready(function() { 
		$('#rectif2').change(
			function() {
				$.getJSON('${findRectifs3URL}', {
					rectif2Name : $(this).val(),
					ajax : 'true'
				}, function(data) {
					var html = '<option value="0"></option>';
					var len = data.length;
					for ( var i = 0; i < len; i++) {
						html += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
					}
					html += '</option>';

					$('#rectif3').html(html);
				});
			});
		});
	</script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#rectif3").change(onSelectChange);
		});
	
		function onSelectChange() {
			var selected = $("#rectif3 option:selected");		
			var output = "";
			if(selected.val() != 0){
				output = selected.text();
			}
			$("#output").html(output);
		}
	</script>
	
	<script type="text/javascript">
	$(document).ready(function() { 
		$('#rectif3').change(
			function() {
				$.getJSON('${findRectifs4URL}', {
					rectif3Name : $(this).val(),
					ajax : 'true'
				}, function(data) {
					var html = '<option value="0"></option>';
					var len = data.length;
					for ( var i = 0; i < len; i++) {
						html += '<option value="' + data[i].id + '">' + data[i].name + '</option>';
					}
					html += '</option>';

					$('#rectif4').html(html);
				});
			});
		});
	</script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#rectif4").change(onSelectChange);
		});
	
		function onSelectChange() {
			var selected = $("#rectif4 option:selected");		
			var output = "";
			if(selected.val() != 0){
				output = selected.text();
			}
			$("#output").html(output);
		}
	</script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$(".hide").hide();
			$(".btn-slide").click(function(){
		        $(".hide").slideToggle("slow");
		        $(this).toggleClass("active");
		    });
		});
	</script>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf8">
	<title><spring:message code="label.title" /></title>
	
	<link rel="stylesheet" href="<c:url value="/resources/css/styles.css"/>" type="text/css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/logosheader.css" />
	<link rel="stylesheet" href="<c:url value="/resources/jquery/ui/1.11.2/themes/smoothness/jquery-ui.css"/>">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
	<link rel="stylesheet" href="<c:url value="/resources/css/bliking.css"/>" type="text/css"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/style2.css"/>" type="text/css"/>
	<link rel="stylesheet" href="<c:url value="/resources/css/newform.css"/>" type="text/css"/>
	<script src="<c:url value="/resources/jquery/jquery-1.10.2.js"/>"></script>
	<script src="<c:url value="/resources/jquery/ui/1.11.2/jquery-ui.js"/>"></script>
	<script>
		$(function() {
			$( "#dateInput" ).datepicker({dateFormat:'dd.mm.yy'});
		});
	</script>
	<script>
		//setTimeout ("$('body').animate({opacity: 1}, 3000 );", 10);
		$(document).ready(function() 
		{	
		setInterval(function () {
		
		setTimeout ("$('#tf').removeClass('tfoms').addClass('tfoms2');", 1000);//+4
		setTimeout ("$('#tf').removeClass('tfoms2').addClass('tfoms');", 8000);
		
		setTimeout ("$('#simaz').removeClass('sim').addClass('sim2');", 12000);
		setTimeout ("$('#simaz').removeClass('sim2').addClass('sim');", 19000);
		
		setTimeout ("$('#rosno').removeClass('ro').addClass('ro2');", 23000);
		setTimeout ("$('#rosno').removeClass('ro2').addClass('ro');", 30000);
		
		setTimeout ("$('#ingos').removeClass('in').addClass('in2');", 34000);
		setTimeout ("$('#ingos').removeClass('in2').addClass('in');", 41000);
            
        }, 45000);
		
		
		});
		
		</script>
	
</head>
<body>

<div id = top-menu>

<a href="<c:url value="/logout" />">
	<spring:message code="label.logout" />
</a>
<a href="<c:url value="/index" />">
	<spring:message code="label.index" />
</a>
<a href="<c:url value="/searching" />">
	<spring:message code="label.searching" />
</a>
<a href="<c:url value="/reporting" />">
	<spring:message code="label.report" />
</a>
</div>
<div id ="main-menu">
<div style="float:left; padding: 10px;">
<i style="margin-left:10px;" class="fa fa-heartbeat fa-2x " aria-hidden="true"></i>
<i style="margin-left:5px;" class="fa fa-phone-square fa-2x" aria-hidden="true"></i>
<i style="margin-left:5px;" class="fa fa-headphones fa-2x" aria-hidden="true"></i>
<h2 style="display: -webkit-inline-box; margin-left:10px;"><spring:message code="label.title" /></h2>
</div>


<div style="float:right; margin-right: 75px;">
		<img src="${pageContext.request.contextPath}/resources/images/tf.png"  id="tf" class="tfoms">
        <img src="${pageContext.request.contextPath}/resources/images/simaz.png" id="simaz" class="sim">
		<img src="${pageContext.request.contextPath}/resources/images/rosno.png" id="rosno" class="ro">
		<img src="${pageContext.request.contextPath}/resources/images/ingos.png" id="ingos" class="in">
		</div>
</div>
<div id ="main">

<form:form method="post" action="add" commandName="petit" name='petit_form' class="register">

	<form:errors path="*" cssClass="errorblock" element="div" />
	<form:hidden path="id" name='id'/>
	<form:hidden path="num"/>

<h1>
	<c:if test="${petit.id eq null}">
		<spring:message code="label.petits" />
	</c:if>
	<c:if test="${petit.id ne null}">
		<spring:message code="label.nepetits" />
	</c:if>
</h1>
<fieldset class="row1">
	<legend>Данные обращения</legend>
	  <p>
	  	<c:if test="${petit.id eq null}">
	      <form:label style="font-weight: bold;" path="dateInput"><spring:message code="label.dateInput" /></form:label>
	      <form:input id="dateInput" path="dateInput"/>
	   	</c:if>
	   	<c:if test="${petit.id ne null}">
	   		<form:hidden id="dateInput" path="dateInput"/>
			<spring:message code="label.id" />&nbsp<c:out value="${petit.num}" />&nbsp&nbsp&nbsp&nbsp<spring:message code="label.dateInput" />&nbsp<c:out value="${petit.dateInput}" />
	   	</c:if>
	   	
	 	<form:label path="sourceId"><spring:message code="label.source" /></form:label>
	    <form:select path="sourceId">
			<form:options items="${sourceList}"/>
		</form:select>
	  </p>
	  <p>
		<form:label path="conectId"><spring:message code="label.conect" /></form:label>
		<form:select path="conectId">
			<form:option value="0" label="" />
			<form:options items="${conectList}"/>
		</form:select>  
		
		<form:label path="presentId"><spring:message code="label.present" /></form:label>
		<form:select path="presentId">
	 		<form:options items="${presentList}"/>
		</form:select>
	  </p>
	  <p>
	  	<form:label path="letterNum"><spring:message code="label.letterNum" /></form:label>
		<form:input path="letterNum" />
				
		<form:label path="letterDate"><spring:message code="label.letterDate" /></form:label>
		<form:input path="letterDate" />
	  </p>
</fieldset>
<fieldset class="row2">
	<legend>Персональные данные</legend>
	<p>
		<form:label style="font-weight: bold;" path="surname"><spring:message code="label.surname" /></form:label>
		<form:input class="css-input" path="surname" />

		<form:label style="font-weight: bold;" path="name"><spring:message code="label.name" /></form:label>
		<form:input  path="name"/>

		<form:label style="font-weight: bold;"  path="patrony"><spring:message code="label.patrony" /></form:label>
		<form:input class="css-input" path="patrony" />
	</p>
	<p>
		<form:label  style="font-weight: bold;" path="policy"><spring:message code="label.policy" /></form:label>
		<form:input  path="policy" />

		<form:label  style="font-weight: bold;" path="tel"><spring:message code="label.tel" /></form:label>
		<form:input  path="tel" />

		<form:label  style="font-weight: bold;" path="adress"><spring:message code="label.adress" /></form:label>
		<form:input  path="adress" />	
	</p>
	<p>
		<form:label path="terId"><spring:message code="label.ter" /></form:label>
		<form:select path="terId">
			<form:option value="0" label="" />
   			<form:options items="${terList}"/>
		</form:select>
	
		<form:label path="terAnswerId"><spring:message code="label.terAnswer" /></form:label>
		<form:select path="terAnswerId">
				<form:option value="54" label="54 Новосибирскaя область" />				
    			<form:options items="${terList}"/>
		</form:select>
	</p>
</fieldset>  
<fieldset class="row777">
	<legend>Тип и причина обращения</legend>
	<p>
				<form:label path="typeId"><spring:message code="label.type" /></form:label>
				<span id="typeWarning" style="color:#ff8000">!
					<span style="font-size:8">${petit.type.typeName}</span>
				</span>
			<form:select id="type" path="typeId" onchange="document.getElementById('typeWarning').hidden = true;"></form:select>
	</p>
	<p>
			<form:label path="causeId"><spring:message code="label.cause" /></form:label>
				<span id="causeWarning" style="color:#ff8000">!
					<span style="font-size:8">${petit.cause.causeName}</span>
				</span>
			<form:select id="cause" path="causeId" onchange="document.getElementById('causeWarning').hidden = true;"></form:select>	
	</p>
	<p>			
			<form:label path="rectif1Id"><spring:message code="label.rectif1" /></form:label>
				<span id="rectif1Warning" style="color:#ff8000">!
					<span style="font-size:8">${petit.rectif1.rectif1Name}</span>
				</span>
			<form:select id="rectif1" path="rectif1Id" onchange="document.getElementById('rectif1Warning').hidden = true;"></form:select>
	</p>
</fieldset>
<fieldset class="row777">
                <legend>Подробнее</legend>
                <div class="hide">
                <p>
                	
						<form:label path="rectif2Id"><spring:message code="label.rectif2" /></form:label>
						<span id="rectif2Warning" style="color:#ff8000;font-size:8">${petit.rectif2.rectif2Name}</span>
						<form:select id="rectif2" path="rectif2Id" onchange="document.getElementById('rectif2Warning').hidden = true;"></form:select>
						
						<form:label path="rectif3Id"><spring:message code="label.rectif3" /></form:label>
						<span id="rectif3Warning" style="color:#ff8000;font-size:8">${petit.rectif3.rectif3Name}</span>
						<form:select id="rectif3" path="rectif3Id" onchange="document.getElementById('rectif3Warning').hidden = true;"></form:select>

						<form:label path="rectif4Id"><spring:message code="label.rectif4" /></form:label>
						<span id="rectif4Warning" style="color:#ff8000;font-size:8">${petit.rectif4.rectif4Name}</span>
						<form:select id="rectif4" path="rectif4Id" onchange="document.getElementById('rectif4Warning').hidden = true;" ></form:select>
                	
                </p>
                <p>
							
					<form:label path="hspId"><spring:message code="label.hsp" /></form:label>
					<form:select path="hspId">
						<form:option value="0" label="" />
		    			<form:options items="${hspList}"/>
					</form:select>
                </p>
                <p>
					<form:label path="moId"><spring:message code="label.mo" /></form:label>
					<form:select path="moId">
						<form:option value="0" label="" />
    					<form:options items="${moList}"/>
					</form:select>
			
					<form:label path="insurId"><spring:message code="label.insur" /></form:label>
					<form:select path="insurId">
						<form:option value="0" label="" />
    					<form:options items="${insurList}"/>
					</form:select>
                </p>
                <p>
					<form:label path="validId"><spring:message code="label.valid" /></form:label>
					<form:select path="validId">
						<form:option value="0" label="" />
    					<form:options items="${validList}"/>
					</form:select>
	
					<form:label path="compens"><spring:message code="label.compens" /></form:label>
					<form:input class="css-input" path="compens" />
	
					<form:label path="satisf"><spring:message code="label.satisf" /></form:label>
					<form:input class="css-input" path="satisf" />
	
					<form:label path="compensSource"><spring:message code="label.compensSource" /></form:label>
					<form:input class="css-input" path="compensSource" placeholder="СМО МО или ТФОМС"/>
	
					<form:label path="compensCode"><spring:message code="label.compensCode" /></form:label>
					<form:input class="css-input" path="compensCode" placeholder="Код дефекта"/>
	
					<form:label path="compensSum"><spring:message code="label.compensSum" /></form:label>
					<form:input class="css-input" path="compensSum" />
                </p>
                <p>
					<form:label style="width: 144px;" path="causeNote"><spring:message code="label.causeNote" /></form:label>
					<form:textarea rows="2" cols="100" value="0" path="causeNote" />
                </p>
                </div>
                <p>
                	<input class='btn-slide' type="button" value="<spring:message code="label.more"/>"/>
                </p>
</fieldset>
<fieldset class="row777">
                <legend>Выберите действие</legend>
                <p>
                	<c:if test="${petit.id ne null}">
						<input name="cancel_button" onclick="cancelback()" type="button" value="<spring:message code="label.cancelpetit"/>"/>
						<input name="submit" type="submit" value="<spring:message code="label.editpetit"/>" 
							onclick="document.getElementById('typeWarning').hidden = false;document.getElementById('causeWarning').hidden = false;document.getElementById('rectif1Warning').hidden = false;"
						/>
						
						<c:set var="gu" value="${petit.blockger2016.state}"/>
						<c:if test="${(gu < 3)}">	
							<input name="submit" type="submit" value="<spring:message code="label.endpetit"/>" 
								onclick="document.getElementById('typeWarning').hidden = false;document.getElementById('causeWarning').hidden = false;document.getElementById('rectif1Warning').hidden = false;"
							/>
						</c:if>	
					</c:if>
					
					<c:if test="${petit.id eq null}">
					<form:select  id="sel" path="username" onclick="numberone()">
						<form:option label="Назначить"  value="0" />
						<form:options items="${listassign}"/>
					</form:select>
					
						<input type="submit"  id="addpetit" name="submit" value="<spring:message code="label.addpetit"/>" disabled="disabled" 
							onclick="document.getElementById('typeWarning').hidden = false;document.getElementById('causeWarning').hidden = false;document.getElementById('rectif1Warning').hidden = false;"
						/>
						
						<input name="submit"  type="submit" value="<spring:message code="label.endpetit"/>" 
							onclick="document.getElementById('typeWarning').hidden = false;document.getElementById('causeWarning').hidden = false;document.getElementById('rectif1Warning').hidden = false;"
						/>
					</c:if>
                </p>
</fieldset>

                
  
<!-- ============================================================================================  -->
  
  <c:if test="${petit.id eq null}">
	<form:hidden path="blockger2016.state" value="${1}" />
	
	<sec:authorize access="hasRole('ROLE_TFOMS')">
		<form:hidden path="blockger2016.regsource_id" value="${1}" />
		<form:hidden path="blockger2016.regname" value="${principal.username}" />
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_SMO')">
		<form:hidden path="blockger2016.regsource_id" value="${2}" />
		<form:hidden path="blockger2016.regname" value="${principal.username}" />
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_ER')">
		<form:hidden path="blockger2016.regsource_id" value="${3}" />
		<form:hidden path="blockger2016.regname" value="${principal.username}" />
	</sec:authorize>
	</c:if>
	
<!-- ============================================================================================  -->

<c:if test="${petit.id ne null}">
	<c:set var="statec2" value="${petit.blockger2016.state}"/>
	<c:if test="${(statec2 == 3)}">
		&nbsp<spring:message code="label.dateand" />&nbsp<c:out value="${petit.blockger2016.date_end}" />
	</c:if>				
				
	<form:hidden path="blockger2016.idblockger2016"/>
	<form:hidden path="blockger2016.state" value="${2}" />
	<form:hidden path="blockger2016.regsource_id"/>
	<form:hidden path="blockger2016.regname"/>
				
	<!-- Если пользователь проваливается в форму редактирования  при state =3 (завершен)
	то передаем тот же самый date_end по новой и в базе срабатывает триггер иначе в базу добавить пустая date_end-->
	<input type="hidden" name="fil" value="${petit.blockger2016.date_end}"/>
</c:if>  
	
<!-- ============================================================================================  -->
</form:form>


<hr>
<c:if test="${petit.id eq null}">
<section> <!--for demo wrap-->
<div  class="tbl-header">
<input type="button" id="refreshpage" onclick="refreshp()" value="Обновить" style="    float: right; margin-bottom: 10px;"></input>

<table class="tabmy" cellpadding="0" cellspacing="0" border="0">
  <thead>
  <tr>
			<th><spring:message code="label.id" /></th>      
		    <!-- <th><spring:message code="label.dateInput" /></th> --> <th>Дата поступления</th>
		    <!-- <th><spring:message code="label.dateBegin" /></th>
		    <th><spring:message code="label.dateEnd" /></th>-->         
		    <th><spring:message code="label.source" /></th>
		    <th><spring:message code="label.present" /></th>
		    <th><spring:message code="label.letterNum" /></th>
		    <th><spring:message code="label.mo" /></th>
		    <!--<th><spring:message code="label.letterDate" /></th>
		    <th><spring:message code="label.conect" /></th>
		    <th><spring:message code="label.intermed" /></th>-->
		    <th><spring:message code="label.type" /></th>
		    <!-- <th><spring:message code="label.surname" /></th> --><th>Фамилия</th>
		    <!-- <th><spring:message code="label.name" /></th> --><th>Имя</th>
			    <!--<th><spring:message code="label.patrony" /></th>
			    <th><spring:message code="label.policy" /></th>
			    <th><spring:message code="label.tel" /></th>
			    <th><spring:message code="label.adress" /></th> -->
		    <th><spring:message code="label.ter" /></th>
			    <!--<th><spring:message code="label.terAnswer" /></th>
			    <th><spring:message code="label.last1" /></th>
			    <th><spring:message code="label.last2" /></th>
			    <th><spring:message code="label.hsp" /></th>
			    <th><spring:message code="label.insur" /></th>
			    <th><spring:message code="label.place" /></th>-->
		    <th><spring:message code="label.cause" /></th>
			    <!--<th><spring:message code="label.rectif1" /></th>
			    <th><spring:message code="label.rectif2" /></th>
			    <th><spring:message code="label.rectif3" /></th>
			    <th><spring:message code="label.rectif4" /></th>
			    <th><spring:message code="label.valid" /></th>
			    <th><spring:message code="label.compens" /></th>
			    <th><spring:message code="label.satisf" /></th>
			    <th><spring:message code="label.compensSource" /></th>
			    <th><spring:message code="label.compensCode" /></th>
			    <th><spring:message code="label.compensSum" /></th>
			    <th><spring:message code="label.propos" /></th>-->
		    <!-- <th><spring:message code="label.username" /></th> --><th>Пользователь</th>
			<th>&nbsp;</th>
			<th>&nbsp;</th>
    </tr>
      
  </thead>
</table>
</div>
<div  class="tbl-content">
<table class="tabmy" cellpadding="0" cellspacing="0" border="0">
  <tbody>
  <c:forEach items="${petitList}" var="petit">
  <c:set var="statecl" value="${petit.blockger2016.state}"/>
		<c:if test="${(statecl == 1)}">
	  		<c:set value="someclass blink" var="cssClass"></c:set>
		</c:if>
		<c:if test="${(statecl == 2)}">
	  		<c:set value="someclass2" var="cssClass"></c:set>
		</c:if> 
		<c:if test="${(statecl != 1 && statecl != 2 )}">
	  		<c:set value="someclass3" var="cssClass"></c:set>
		</c:if> 
    <tr class="${cssClass}">
      			<td>${petit.id}</td>
				<td>${petit.num}</td>      
			    <td>${petit.dateInput}</td>         
			    <!-- <td>${petit.dateBegin}</td>
			    <td>${petit.dateEnd}</td>-->
			    <td>${petit.source.sourceName}</td>
			    <td>${petit.present.presentName}</td>
			    <td>${petit.letterNum}</td>
			    <td>${petit.mo.moName}</td>
			    <!--<td>${petit.letterDate}</td>
			    <td>${petit.conect.conectName}</td>
			    <td>${petit.intermedId}</td>-->
			    <td>${petit.type.typeName}</td>
			    <td>${petit.surname}</td>
			    <td>${petit.name}</td>
			    <!--<td>${petit.patrony}</td>
			    <td>${petit.policy}</td>
			    <td>${petit.tel}</td>
			    <td>${petit.adress}</td> -->
			    <td>${petit.ter.terName}</td>
			    <!--<td>${petit.terAnswer.terName}</td>
			    <td>${petit.last1}</td>
			    <td>${petit.last2}</td>
			    <td>${petit.hspId}</td>
			    <td>${petit.insurId}</td>	
			    <td>${petit.placeId}</td>-->
			    <td>${petit.cause.causeName}</td>
			    <td>${petit.rectif1.rectif1Name}</td>
			    <!--<td>${petit.rectif2.rectif2Name}</td>
			    <td>${petit.rectif3.rectif3Name}</td>
			    <td>${petit.rectif4.rectif4Name}</td>-->
			    <td>${petit.valid.validName}</td>
			    <!-- <td>${petit.compens}</td>-->
			    <td>${petit.satisf}</td>
			    <!-- <td>${petit.compensSource}</td>
			    <td>${petit.compensCode}</td>
			    <!--<td>${petit.compensSum}</td>-->
			    <!-- <td>${petit.propos}</td>-->
			    <td>${petit.username}</td>
				<td><a id="iddel" href="delete/${petit.id}" title="Удалить"><i class="fa fa-trash-o fa-3x"></i></a></td>
				<td><a id="iddel" href="refresh/${petit.id}" title="Редактировать"><i class="fa fa-pencil-square-o  fa-3x" aria-hidden="true"></i></a></td>

			    
			    
    </tr>
  </c:forEach>  
  </tbody>
</table>
</div>
</section>
</c:if>
</body>
</html>
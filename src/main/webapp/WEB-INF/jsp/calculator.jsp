<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en">
<head>
    <script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>

</head>


<script>

    function calculate(){
        var i1 = $("#input1").val();
        var i2 = $("#input2").val();

        var result = parseInt(i1) + parseInt(i2);

        $("#result").text(result);
    }
</script>
<body>
<h1>Calculator</h1>

<p>Simple add of numbers</p>

<input id="input1" type="text"/> + <input id="input2" type="text"> = <span id="result"/>
<br>
<input type="button" value="calculate" onclick="calculate()"/>
</body>

</html>
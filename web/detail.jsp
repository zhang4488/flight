<%@ page import="data.Flight" %>
<%@ page import="data.RoteDate" %><%--
  Created by IntelliJ IDEA.
  User: 张松林
  Date: 2020/12/21
  Time: 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <style type="text/css">
        *{
            padding: 0;
            margin: 0;
        }
        .big{
            width: 860px;
            height:700px;
            margin: 50px auto;
            border:1px black solid;
        }
        .info{
            width: 200px;
            height:30 px;
            margin-left: 30px;
            text-align: center;
            font-family: 隶书;
            font-size: 20px;
            float: left;
            margin-top: 33px;
        }
        .add{
            width: 150px;
            height:30 px;
            margin-left: 400px;
            text-align: center;
            font-family: 隶书;
            font-size: 20px;
            float: left;
            border-radius: 20px;
            color: darkgreen;
            border:1px #006400 solid;
            margin-top: 8px;
        }
        .idcar{
            width: 300px;
            height:30px;
            margin-left: 30px;
            text-align: center;
            font-family: 隶书;
            font-size: 20px;
            float: left;
            margin-top: 20px;
        }
        .tel{
            width: 280px;
            height:30px;
            margin-left: 550px;
            text-align: center;
            font-family: 隶书;
            font-size: 20px;
            float: left;
            margin-top: -25px;
        }
        .content{
            width: 860px;
            height:100px;
            float: left;
            margin-top: 10px;
            /* border:1px red solid; */
        }
        .head{
            width: 860px;
            height:100px;
            text-align: center;
            margin-top: 10px;
            /* border:1px red solid; */
        }
        .head span{
            font-family: 隶书;
            font-size: 30px;
        }
        .www{
            margin-top: -20px;
        }
        #hide{
            display: none;
        }
        #hide2{
            display: none;
        }

    </style>
    <script type="text/javascript">
        window.onload = function() {
            document.getElementById("show").onclick = function() {
                document.getElementById("hide").style.display = "block";
            }
            document.getElementById("nshow").onclick = function() {
                document.getElementById("hide").style.display = "none";
            }

            document.getElementById("show2").onclick = function() {
                document.getElementById("hide2").style.display = "block";
            }
            document.getElementById("nshow2").onclick = function() {
                document.getElementById("hide2").style.display = "none";
            }
            document.getElementById("show3").onclick = function() {
                document.getElementById("hide3").style.display = "block";
            }
            document.getElementById("nshow3").onclick = function() {
                document.getElementById("hide3").style.display = "none";
            }
        }
    </script>
</head>
<body>
<%
    Flight flight = (Flight) request.getAttribute("flight");
    RoteDate roteDate = (RoteDate) request.getAttribute("roteDate");
%>
<div class="big">
    <div class="head">
        <span><%=flight.getCompany()%><%=flight.getFlightnumber()%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=roteDate.getRiqi()%> </span><br>
        <p><%=flight.getDuration()%></p>
        <p class="www"><span><%=flight.getDeparturetime()%></span><img src="img/xianduan.png"><span><%=flight.getLandingtime()%></span></p>
        <p class="sss"><%=flight.getAirportofdeparture()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=flight.getLandingAirport()%></p>
    </div>
    <hr width="100%">
    <div class="info">乘机人：<input type="text" name="cjr1" id="cjr1" value="" /></div>
    <a href="#"><div class="add"><input type="button" id="show" value="添加乘机人"/></div></a>
    <div class="idcar">身份证号：<input type="text" name="ic1" id="ic1" value="" /></div>
    <div class="tel">联系电话：<input type="tel" name="tel1" id="tel1" value="" /></div>

    <div id='hide'>
        <div class="info">乘机人：<input type="text" name="cjr1" id="cjr2" value="" /></div>
        <a href="#"><div class="add"><input type="button" id="show2" value="添加乘机人"/><input type="button" id="nshow" value="删除" /></div></a>
        <div class="idcar">身份证号：<input type="text" name="ic1" id="ic2" value="" /></div>
        <div class="tel">联系电话：<input type="tel" name="tel1" id="tel2" value="" /></div>
    </div>
    <div id='hide2'>
        <div class="info">乘机人：<input type="text" name="cjr1" id="cjr3" value="" /></div>
        <a href="#"><div class="add"><input type="button" id="nshow2" value="删除" /></div></a>
        <div class="idcar">身份证号：<input type="text" name="ic1" id="ic3" value="" /></div>
        <div class="tel">联系电话：<input type="tel" name="tel1" id="tel3" value="" /></div>
    </div>

    <hr width="100%">
    <div class="content">
        <form action="PayServlet?flag=<%=roteDate.getFlag()%>&flightnumber=<%=flight.getFlightnumber()%>&money=<%=flight.getPrice()%>&method=gopay" method="post">
            <table class="content" border="0" cellspacing="0" cellpadding="0" frame="void" rules="rows">
                <tr height="20px" style="font-family: 隶书;">
                    <th colspan="4" align="center" valign="top">
                        <font size="5" >安全保障费</font>
                    </th>
                </tr>

                <tr height="80" style="border-top:solid 1.5px #006393;font-family: 隶书;">
                    <td align="center" width="30%">
                        <font size="4">航班意外组合险<img src="img/worn.png"><br></font>
                        <font size="3" color="gray">安全保障|自动理赔<br>
                            500万意外保险</font>
                    </td>
                    <td align="center" width="20%">
                        <font size="4">￥40/人<input type="checkbox" name="checkbox1" value="checkbox1"><br></font>
                    </td>
                    <td align="center" width="30%">
                        <font size="4">国内旅行险<img src="img/worn.png"><br></font>
                        <font size="3" color="gray">意外、医疗、行李全保险</font>
                    </td>
                    <td align="center" width="20%">
                        <font size="4">￥48/人起<input type="checkbox" name="checkbox1" value="checkbox1"><br></font>
                    </td>
                </tr>

                <tr height="80" style="border-top:solid 1.5px #006393;font-family: 隶书;">
                    <td align="center" width="30%">
                        <font size="4">退改无忧险<img src="img/worn.png"><br></font>
                        <font size="3" color="gray">节省50%退改手续费</font>
                    </td>
                    <td align="center" width="20%">
                        <font size="4">￥60/人<input type="checkbox" name="checkbox1" value="checkbox1"><br></font>
                    </td>
                    <td align="center" width="30%">
                        <font size="4">行李丢失险<img src="img/worn.png"><br></font>
                        <font size="3" color="gray">行李丢失、损坏最高可赔5000元</font>
                    </td>
                    <td align="center" width="20%">
                        <font size="4">￥10/人起<input type="checkbox" name="checkbox1" value="checkbox1"><br></font>
                    </td>
                </tr>

                <tr height="80" style="border-top:solid 1.5px #006393;font-family: 隶书;">
                    <td align="center" width="30%">
                        <font size="4">尊享航延险<img src="img/worn.png"><br></font>
                        <font size="3" color="gray">自动理赔|延误60分钟即赔</font>
                    </td>
                    <td align="center" width="20%">
                        <font size="4">￥20/人<input type="checkbox" name="checkbox1" value="checkbox1"><br></font>
                    </td>
                    <td align="center" width="30%" colspan="2"></td>
                </tr>

                <tr height="50px" style="font-family: 隶书;border-top:solid 1.5px #006393;" >
                    <th colspan="4" align="center" valign="bottom">
                        <font size="5" >尊享服务</font>
                    </th>
                </tr>

                <tr height="80" style="border-top:solid 1.5px #006393;font-family: 隶书;">
                    <td align="center" width="30%">
                        <font size="4">幸运赢免单<img src="img/worn.png"><br></font>
                        <font size="3" color="gray">100%中将，最高享免单</font>
                    </td>
                    <td align="center" width="20%">
                        <font size="4">￥60<input type="checkbox" name="checkbox1" value="checkbox1"><br></font>
                    </td>
                    <td align="center" width="30%">
                        <font size="4">接送机券<img src="img/worn.png"><br></font>
                        <font size="3" color="gray">满110减70</font>
                    </td>
                    <td align="center" width="20%">
                        <font size="4">￥40/份<input type="checkbox" name="checkbox1" value="checkbox1"><br></font>
                    </td>
                </tr>

                <tr height="80" style="border-top:solid 1.5px #006393;font-family: 隶书;">
                    <td align="center" width="30%">
                        <font size="4">酒店券<img src="img/worn.png"><br></font>
                        <font size="3" color="gray">满400减100</font>
                    </td>
                    <td align="center" width="20%">
                        <font size="4">￥54/份<input type="checkbox" name="checkbox1" value="checkbox1"><br></font>
                    </td>
                    <td align="center" width="30%" colspan="2"></td>
                </tr>

                <tr height="60" style="font-family: 隶书;" >
                    <th colspan="4" align="left" style="margin-left:20px;">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="checkbox9" value="checkbox9">点击“去支付”按钮表示我已阅读且同意以上协议和产品说明
                    </th>
                </tr>

                <tr height="70px">
                    <td align="center" colspan="4">
                        <input type="submit"  style="width: 100px;height: 40px;background-color: #f08503;border-radius: 10px;" name="submit" value="去支付">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>

<%@ page import="data.Flight" %>
<%@ page import="java.util.List" %>
<%@ page import="data.User" %><%--
  Created by IntelliJ IDEA.
  User: 张松林
  Date: 2020/12/19
  Time: 10:13
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
            margin: 150px auto;
        }
        .head{
            width: 860px;
            height:50px;

        }
        .city1{
            width: 100px;
            height:30px;
            float: left;
            margin-left: 180px;
        }
        .city1 span{
            font-size: 35px;
            font-weight: bold;
            font-family: 隶书;
        }
        .jiantou{
            float: left;
            margin-left: 20px;
        }
        .city2{
            width: 100px;
            height:30px;
            float: left;
            margin-left: 50px;
        }
        .city2 span{
            font-size: 35px;
            font-weight: bold;
            font-family: 隶书;
        }
        .time{
            width: 150px;
            height:20px;
            margin-top:-350px;
            margin: 0 auto;
        }
        .content{
            width: 860px;
            height:100px;
            margin-top: 20px;
            padding-bottom: 10px;
        }
        .ssss{
            height: 30px;
        }

    </style>
</head>
<body background="img/bg5.jpg" style="background-repeat:no-repeat ;background-size:100% 100%;">
<%
    request.setCharacterEncoding("UTF-8");
    List<Flight> flights= (List<Flight>) request.getAttribute("flights");
    String flighttp = (String) request.getAttribute("flighttp");
    String flightlp = (String) request.getAttribute("flightlp");
    String flighttt = (String) request.getAttribute("flighttt");
    String flag = (String) request.getAttribute("flag");
    String level = (String) request.getAttribute("level");

    String logininfo = (String) request.getAttribute("logininfo");

%>

    <%if (logininfo!=null){%>
        <script type="text/javascript" language="javascript">
            alert("<%=logininfo%>");
        </script>
    <%}%>

<div class="big">
    <div class="head">
        <div class="city1"><span><%=flighttp%></span></div>
        <div class="jiantou"><img src="img/jiantou.png"></div>
        <div class="city2"><span><%=flightlp%></span></div>
        <div class="time"><%=flighttt%></div>
    </div>

    <div class="content">
        <%
            for (Flight flight : flights) {
        %>
        <form action="GoDetailServlet?flag=<%=flag%>&flightnumber=<%=flight.getFlightnumber()%>" method="post">
            <table width="860" border="0" cellspacing="0" cellpadding="0" >
                <tr height="20px">
                    <td align="center" valign="bottom" width="23%">
                        <font color="black" size="5" ><%=flight.getDeparturetime()%></font>
                    </td>
                    <td align="center" valign="buttom"  width="20%">
                        <img src="img/jiantou1.png">
                    </td>
                    <td align="center" valign="buttom"  width="20%">
                        <font color="black" size="5" ><%=flight.getLandingtime()%></font>
                    </td>
                    <td align="center" valign="buttom">
                        <font color="#f5720a" size="5" >￥<%=flight.getPrice()%></font>
                    </td>
                </tr>

                <tr height="10px">
                    <td align="center" valign="top" width="23%">
                        <font color="#999999" size="2" ><%=flight.getAirportofdeparture()%></font>
                    </td>
                    <td align="center" valign="top"  width="20%"></td>
                    <td align="center" valign="top"  width="20%">
                        <font color="#f5720a" size="2" ><%=flight.getLandingAirport()%></font>
                    </td>
                    <td align="center" valign="top">
                        <font color="#999999" size="2" ><%=level.equals("0") ? "经济舱" : "公务舱"%>
                    </td>
                </tr>
                <tr height="20px">
                    <td align="center" valign="top" width="23%"></td>
                    <td align="center" valign="top"  width="20%"></td>
                    <td align="center" valign="top"  width="20%"></td>
                    <td align="center" valign="top"></td>
                </tr>
                <tr height="10px">
                    <td align="center" valign="buttom" width="23%" style="border-right:1px solid #999999;">
                        <font color="#999999" size="2" ><%=flight.getCompany()%></font>
                    </td>
                    <td align="center" valign="buttom"  width="20%" style="border-right:1px solid #999999;">
                        <font color="#999999" size="2" ><%=flight.getAircraftmodel()%></font>
                    </td>
                    <td align="center" valign="buttom"  width="20%" padding-top="15px">
                        <img src="img/time.png">
                        <font color="#999999" size="2" ><%=flight.getDuration()%></font>
                    </td>
                    <td align="center" valign="buttom"><button type="submit"><img src="img/dinggou.png" height="40px"  width="40px"></button></td>
                </tr>
            </table>
            <div class="ssss"></div>
        </form>
        <%}%>
    </div>
</div>
</body>
</html>

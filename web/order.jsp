<%@ page import="dao.FlightDao" %>
<%@ page import="dao.FlightDaolmpl" %>
<%@ page import="data.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="data.Flight" %>
<%@ page import="data.RoteDate" %><%--
  Created by IntelliJ IDEA.
  User: 张松林
  Date: 2020/12/25
  Time: 22:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>订单</title>
    <style type="text/css">
        *{
            padding: 0;
            margin: 0;
        }
        .big{
            width: 860px;
            height:700px;
            margin: 50px auto;
            /* border:1px solid red; */
        }
        .top{
            width: 860px;
            height:30px;
            font-family: 楷体;
            font-size: 30px;
            margin-top: 10px;
            padding-bottom: 10px;
            text-align: center;
        }
        .content{
            width: 860px;
            height:140px;
            margin-top: 10px;
            /* padding-bottom: 10px; */
            border:1px solid black;
            background-color: ghostwhite;
            border-radius: 10px;
        }
    </style>
</head>
<body>
<%
    String userid = "18784708417";
    FlightDao flightDao = new FlightDaolmpl();
    ArrayList<Order> orders = flightDao.getorder(userid);
%>
<div class="big">
    <div class="top">全部订单</div>
    <hr width="100%">
    <div class="content">
        <form>
            <%
                for (Order order : orders) {
                    Flight flight = flightDao.findflight(order.getFlightnumber());
                    RoteDate roteDate = flightDao.getrotedate(order.getFlag());
            %>
            <table class="content" border="0" cellspacing="0" cellpadding="0">
                <tr height="40px" style="font-family: 隶书;">
                    <th align="center" width="30%">
                        &nbsp;&nbsp;&nbsp;&nbsp;<img src="img/feiji.png">&nbsp;&nbsp;&nbsp;
                        <font color="black" size="5" ><%=roteDate.getTakeofpoint()%>——<%=roteDate.getLandingpoint()%></font>
                    </th>
                    <td align="center"><font color="black" size="4" >订单号：C13250</font></td>
                    <td></td>
                    <td align="center" width="25%">
                        <font color="#f5720a" size="5" ><%=order.getFlightprice()%></font>
                    </td>
                </tr>

                <tr height="40" style="font-family: 隶书;">
                    <td width="30%" align="center">
                        <font color="black" size="4" ><%=order.getFlightnumber()%> &nbsp;&nbsp;&nbsp;&nbsp;<%=roteDate.getRiqi()%></font>
                    </td>
                    <td align="left" colspan="3">
                        <font color="black" size="4" ><%=flight.getDeparturetime()%>出发 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            乘机人：<%=order.getPeople1()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系方式：<%=order.getPhone1()%></font>
                    </td>
                </tr>

                <tr height="60" style="font-family: 隶书;">
                    <td width="30%" ></td>
                    <td align="center">
                        <a href="seat.jsp"><input type="button" name="find" value="值机" style="width: 80px; height: 40px;border-radius: 10px;"></a>
                    </td>
                    <td align="center">
                        <input type="submit" name="xuigai" value="退改" style="width: 80px; height: 40px;border-radius: 10px;">
                    </td>
                    <td align="center">
                        <input type="submit" name="delete" value="删除订单" style="width: 80px; height: 40px;border-radius: 10px;">
                    </td>
                </tr>
            </table>
            <%}%>
        </form>
        <div><a href="index.jsp">返回</a></div>
    </div>

</div>
</body>
</html>


<%--
  Created by IntelliJ IDEA.
  User: 张松林
  Date: 2020/12/21
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang=en>
<head>
    <meta charset="utf-8">
    <title>pay</title>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            font: 16px/20px microsft yahei;
        }
        .top{
            width: 100%;
            height: 60px;
            background-color: #50A3A2;
            margin: 0 auto;
        }
        .top li{
            display: inline;
            height: 60px;
        }
        .top li a{display:inline-block;
            padding:0 20px;
            height:60px;
            line-height:60px;
            color:#FFF;
            font-family:"\5FAE\8F6F\96C5\9ED1";
            font-size:16px;
            text-decoration: none;
        }
        .top li a:hover{
            background: #53E3A6;
        }
        .wrap {
            width: 100%;
            height: 100%;
            padding: 10% 0;
            position: fixed;
            opacity: 0.8;
            background: linear-gradient(to bottom right,#000000, #55aaff);

        }
        .container{
            width: 60%;
            margin: 0 auto;
        }
        .container h1 {
            text-align: center;
            color: #FFFFFF;
            font-weight: 500;
        }
        .container input {
            width: 320px;
            display: block;
            height: 36px;
            border: 0;
            outline: 0;
            padding: 6px 10px;
            line-height: 24px;
            margin: 32px auto;
            -webkit-transition: all 0s ease-in 0.1ms;
            -moz-transition: all 0s ease-in 0.1ms;
            transition: all 0s ease-in 0.1ms;
        }
        .container input[type="text"] , .container input[type="password"]  {
            background-color: #FFFFFF;
            font-size: 16px;
            color: #50a3a2;
        }
        .container input[type='submit'] {
            font-size: 16px;
            letter-spacing: 2px;
            color: #666666;
            background-color: #FFFFFF;
        }
        .airplane{
            display: block;
        }


    </style>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String money = (String) request.getAttribute("money");
%>
    <div class="top">
        <li><a href="">首页 </a></li>
        <li><a href="">关于</a></li>
        <li><a href="">联系我们</a></li>
    </div>
    <div class="wrap">
        <div class="container">
            <h1 style="color: white; margin:0px; text-align: center">一共<%=money%>元，请用信用卡支付</h1>
            <form>
                <label><input type="text" placeholder="卡号"/></label>
                <label><input type="password" placeholder="密码" /></label>
                <input type="submit" value="购买"/>
            </form>

        </div>
    </div>
</body>
</html>

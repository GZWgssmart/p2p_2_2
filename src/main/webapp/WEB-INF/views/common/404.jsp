<%--
  Created by IntelliJ IDEA.
  User: qiu
  Date: 2017/12/4
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>404</title>
    <style>
        /* latin-ext */
        @font-face {
            font-family: 'Lato';
            font-style: italic;
            font-weight: 400;
            src: local('Lato Italic'), local('Lato-Italic'), url(https://fonts.gstatic.com/s/lato/v14/YMOYVM-eg6Qs9YzV9OSqZfesZW2xOQ-xsNqO47m55DA.woff2) format('woff2');
            unicode-range: U+0100-024F, U+1E00-1EFF, U+20A0-20AB, U+20AD-20CF, U+2C60-2C7F, U+A720-A7FF;
        }
        /* latin */
        @font-face {
            font-family: 'Lato';
            font-style: italic;
            font-weight: 400;
            src: local('Lato Italic'), local('Lato-Italic'), url(https://fonts.gstatic.com/s/lato/v14/PLygLKRVCQnA5fhu3qk5fQ.woff2) format('woff2');
            unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2212, U+2215;
        }
        /* latin-ext */
        @font-face {
            font-family: 'Lato';
            font-style: normal;
            font-weight: 400;
            src: local('Lato Regular'), local('Lato-Regular'), url(https://fonts.gstatic.com/s/lato/v14/UyBMtLsHKBKXelqf4x7VRQ.woff2) format('woff2');
            unicode-range: U+0100-024F, U+1E00-1EFF, U+20A0-20AB, U+20AD-20CF, U+2C60-2C7F, U+A720-A7FF;
        }
        /* latin */
        @font-face {
            font-family: 'Lato';
            font-style: normal;
            font-weight: 400;
            src: local('Lato Regular'), local('Lato-Regular'), url(https://fonts.gstatic.com/s/lato/v14/1YwB1sO8YE1Lyjf12WNiUA.woff2) format('woff2');
            unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2212, U+2215;
        }
        /* latin-ext */
        @font-face {
            font-family: 'Lato';
            font-style: normal;
            font-weight: 700;
            src: local('Lato Bold'), local('Lato-Bold'), url(https://fonts.gstatic.com/s/lato/v14/ObQr5XYcoH0WBoUxiaYK3_Y6323mHUZFJMgTvxaG2iE.woff2) format('woff2');
            unicode-range: U+0100-024F, U+1E00-1EFF, U+20A0-20AB, U+20AD-20CF, U+2C60-2C7F, U+A720-A7FF;
        }
        /* latin */
        @font-face {
            font-family: 'Lato';
            font-style: normal;
            font-weight: 700;
            src: local('Lato Bold'), local('Lato-Bold'), url(https://fonts.gstatic.com/s/lato/v14/H2DMvhDLycM56KNuAtbJYA.woff2) format('woff2');
            unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02C6, U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2212, U+2215;
        }

        * {
            padding: 0;
            margin: 0;
        }

        .closed-signboard {
            width: 400px;
            height: 300px;
            margin: 75px auto;
            position: relative;
            transform: scale(1) rotatez(7deg) translate(-17px, 1px);
            animation: 1s init, 0.7s aa 1s, 3s ab 1.7s infinite;
        }

        @keyframes aa {
            0% {
                transform: scale(1);
            }
            100% {
                transform: scale(1) rotatez(7deg) translate(-17px, 1px);
            }
        }

        @keyframes ab {
            0% {
                transform: rotatez(7deg) translate(-17px, 1px);
            }
            50% {
                transform: rotatez(-7deg) translate(17px, 1px);
            }
            100% {
                transform: rotatez(7deg) translate(-17px, 1px);
            }
        }

        .sign {
            color: white;
            font-family: "Lato", sans-serif;
            font-size: 80px;
            font-weight: bold;
            text-align: center;
            background: #e00909;
            width: 100%;
            height: 200px;
            line-height: 200px;
            position: absolute;
            bottom: 0;
            border-radius: 15px / 20px;
            text-shadow: 0 2px #700a03;
        }

        .strings {
            width: 150px;
            height: 150px;
            border: solid 5px #ad5700;
            border-bottom: none;
            border-right: none;
            position: absolute;
            top: 38px;
            left: 122px;
            transform: rotatez(45deg);
        }

        .pin {
            width: 25px;
            height: 25px;
            position: absolute;
            border-radius: 25px;
        }

        .pin.pin1 {
            background: #9f9f9f;
            top: 0;
            left: 187px;
        }

        .pin.pin2, .pin.pin3 {
            background: #9c0a00;
        }

        .pin.pin2 {
            top: 110px;
            left: 80px;
        }

        .pin.pin3 {
            top: 110px;
            right: 80px;
        }

        @keyframes init {
            from {
                transform: scale(0);
            }
            to {
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
<div class="closed-signboard">
    <div class="sign"> <a  href="javascript:history.go(-1)" style="text-decoration:none; color:#ffffff;">404</a> </div>
    <div class="strings"></div>
    <div class="pin pin1"></div>
    <div class="pin pin2"></div>
    <div class="pin pin3"></div>
</div>
</body>
</html>

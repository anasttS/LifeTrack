<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Profile</title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="msapplication-TileColor" content="#00aba9">
    <meta name="theme-color" content="#ffffff">


    <link href="css/font_open_sans.css?2" rel="stylesheet"/>
    <!--    <link rel="stylesheet" href="css/bbootstrap.min.css?2">-->
    <link rel="stylesheet" href="css/font-awesome.min.css?2"/>
    <link rel="stylesheet" href="css/common.css?2">
    <link rel="stylesheet" href="css/lte.css?2">
    <link rel="stylesheet" href="css/skin.css?2">
    <link rel="stylesheet" href="css/cabinet.css?2">

    <link rel="stylesheet" href="css/ui.fancytree.css?2">
    <link rel="stylesheet" href="css/jquery.jgrowl.min.css?2">

    <link rel="stylesheet" href="css/checkbox-titatoggle-dist-min.css?2">

    <link rel="stylesheet" href="css/fullcalendar.css?2">
    <link rel="stylesheet" href="css/jquery.jgrowl.min.css?2">

    <link rel="stylesheet" href="css/jquery.simplecolorpicker.css?2">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css?2">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <#--<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"-->
            <#--integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"-->
            <#--crossorigin="anonymous"></script>-->
    <#--<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"-->
            <#--integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"-->
            <#--crossorigin="anonymous"></script>-->
    <#--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"-->
            <#--integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"-->
            <#--crossorigin="anonymous"></script>-->
    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>

<style>
    * {
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }

    html,body {
        height: 100%;
        overflow: hidden;
    }

    body {
        margin: 0;
        padding: 0;
        font-weight: 400;
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        font-size: 1rem;
        line-height: 1.58;
        color: #333;
        background-color: #f4f4f4;
        height: 100%;
    }

    body:before {
        height: 50%;
        width: 100%;
        position: absolute;
        top: 0;
        left: 0;
        background: #e2cece;
        content: "";
        z-index: 0;
    }

    .clearfix:after {
        display: block;
        content: "";
        clear: both;
    }

    .hidden {
        display: none;
    }

    .form-control {
        width: 100%;
        min-height: 38px;
        font-size: 15px;
        border: 1px solid #c8c8c8;
    }

    .form-group {
        margin-bottom: 15px;
    }

    input {
        padding-left: 10px;
        outline: none;
    }

    h1, h2, h3, h4, h5, h6 {
        margin-top: 20px;
        margin-bottom: 20px;
    }

    h1 {
        font-size: 1.7em;
    }

    a {
        color: #128ff2;
    }

    button {
        box-shadow: none;
        border: 1px solid transparent;
        font-size: 14px;
        outline: none;
        line-height: 100%;
        white-space: nowrap;
        vertical-align: middle;
        padding: 0.6rem 1rem;
        border-radius: 2px;
        transition: all 0.2s ease-in-out;
        cursor: pointer;
        min-height: 38px;
    }

    button.default {
        background-color: #e8e8e8;
        color: #333;
        box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.12);
    }

    button.primary {
        background-color: #128ff2;
        box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.12);
        color: #fff;
    }

    button.accent {
        background-color: #ff4743;
        box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.12);
        color: #fff;
    }

    #username-page {
        text-align: center;
    }

    .username-page-container {
        background: #fff;
        box-shadow: 0 1px 11px rgba(0, 0, 0, 0.27);
        border-radius: 2px;
        width: 100%;
        max-width: 500px;
        display: inline-block;
        margin-top: 42px;
        vertical-align: middle;
        position: relative;
        padding: 35px 55px 35px;
        min-height: 250px;
        position: absolute;
        top: 50%;
        left: 0;
        right: 0;
        margin: 0 auto;
        margin-top: -160px;
    }

    .username-page-container .username-submit {
        margin-top: 10px;
    }


    #chat-page {
        position: relative;
        height: 100%;
    }

    .chat-container {
        max-width: 700px;
        margin-left: auto;
        margin-right: auto;
        background-color: #fff;
        box-shadow: 0 1px 11px rgba(0, 0, 0, 0.27);
        margin-top: 30px;
        height: calc(100% - 60px);
        max-height: 600px;
        position: relative;
    }

    #chat-page ul {
        list-style-type: none;
        background-color: #FFF;
        margin: 0;
        overflow: auto;
        overflow-y: scroll;
        padding: 0 20px 0px 20px;
        height: calc(100% - 150px);
    }

    #chat-page #messageForm {
        padding: 20px;
    }

    #chat-page ul li {
        line-height: 1.5rem;
        padding: 10px 20px;
        margin: 0;
        border-bottom: 1px solid #f4f4f4;
    }

    #chat-page ul li p {
        margin: 0;
    }

    #chat-page .event-message {
        width: 100%;
        text-align: center;
        clear: both;
    }

    #chat-page .event-message p {
        color: #777;
        font-size: 14px;
        word-wrap: break-word;
    }

    #chat-page .chat-message {
        padding-left: 68px;
        position: relative;
    }

    #chat-page .chat-message i {
        position: absolute;
        width: 42px;
        height: 42px;
        overflow: hidden;
        left: 10px;
        display: inline-block;
        vertical-align: middle;
        font-size: 18px;
        line-height: 42px;
        color: #fff;
        text-align: center;
        border-radius: 50%;
        font-style: normal;
        text-transform: uppercase;
    }

    #chat-page .chat-message span {
        color: #333;
        font-weight: 600;
    }

    #chat-page .chat-message p {
        color: #43464b;
    }

    #messageForm .input-group input {
        float: left;
        width: calc(100% - 85px);
    }

    #messageForm .input-group button {
        float: left;
        width: 80px;
        height: 38px;
        margin-left: 5px;
    }

    .chat-header {
        text-align: center;
        padding: 15px;
        border-bottom: 1px solid #ececec;
    }

    .chat-header h2 {
        margin: 0;
        font-weight: 500;
    }

    .connecting {
        padding-top: 5px;
        text-align: center;
        color: #777;
        position: absolute;
        top: 65px;
        width: 100%;
    }


    @media screen and (max-width: 730px) {

        .chat-container {
            margin-left: 10px;
            margin-right: 10px;
            margin-top: 10px;
        }
    }

    @media screen and (max-width: 480px) {
        .chat-container {
            height: calc(100% - 30px);
        }

        .username-page-container {
            width: auto;
            margin-left: 15px;
            margin-right: 15px;
            padding: 25px;
        }

        #chat-page ul {
            height: calc(100% - 120px);
        }

        #messageForm .input-group button {
            width: 65px;
        }

        #messageForm .input-group input {
            width: calc(100% - 70px);
        }

        .chat-header {
            padding: 10px;
        }

        .connecting {
            top: 60px;
        }

        .chat-header h2 {
            font-size: 1.1em;
        }
    }
</style>

</head>
<body  class="hold-transition skin-red-light layout-boxed sidebar-mini body-index">
<header class="main-header">
    <div class="wrapper-header">
        <!-- Logo -->
        <a href="/main" class="logo">

            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><img class="logo-nav" alt="logo" src="assets/img/logo2.png"/></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><img class="logo-nav" alt="logo" src="assets/img/logo2.png" width="160px"
                                       height="45px" style="padding-top: 5%"/></span>

        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Навигация</span>
            </a>

            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown nav-item user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa " aria-hidden="true"></i>
                            <span class="hidden-xs">${user.username}</span>
                        </a>
                        <ul class="dropdown-menu">

                            <li class="user-body">
                                <a href="/logout">
                                    <span>Выйти</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>
<!-- Site wrapper -->
<div class="wrapper">
    <!-- =============================================== -->



    <!-- =============================================== -->
    <!-- Content Wrapper. Contains page content -->
    <br><br><br>
    <noscript>
        <h2>Sorry! Your browser doesn't support Javascript</h2>
    </noscript>
    <div id="username-page">
        <div class="username-page-container">
            <h1 class="title">Type your username</h1>
            <form id="usernameForm" name="usernameForm">
                <div class="form-group">
                    <input type="text" id="name"  value="${user.username}" autocomplete="off" class="form-control" />
                </div>
                <div class="form-group">
                    <button type="submit" class="accent username-submit">Start Chatting</button>
                </div>
            </form>
        </div>
    </div>
    <div id="chat-page" class="hidden">
        <div class="chat-container">
            <div class="chat-header">
                <h2>Chat</h2>
            </div>
            <div class="connecting">
                Connecting...
            </div>
            <ul id="messageArea">
            </ul>
            <form id="messageForm" name="messageForm">
                <div class="form-group">
                    <div class="input-group clearfix">
                        <input type="text" id="message" placeholder="Type a message..." autocomplete="off" class="form-control"/>
                        <button type="submit" class="primary">Send</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script>
        'use strict';

        var usernamePage = document.querySelector('#username-page');
        var chatPage = document.querySelector('#chat-page');
        var usernameForm = document.querySelector('#usernameForm');
        var messageForm = document.querySelector('#messageForm');
        var messageInput = document.querySelector('#message');
        var messageArea = document.querySelector('#messageArea');
        var connectingElement = document.querySelector('.connecting');

        var stompClient = null;
        var username = null;

        var colors = [
            '#2196F3', '#32c787', '#00BCD4', '#ff5652',
            '#ffc107', '#ff85af', '#FF9800', '#39bbb0'
        ];

        function connect(event) {
            username = document.querySelector('#name').value.trim();

            if(username) {
                usernamePage.classList.add('hidden');
                chatPage.classList.remove('hidden');

                var socket = new SockJS('/ws');
                stompClient = Stomp.over(socket);

                stompClient.connect({}, onConnected, onError);
            }
            event.preventDefault();
        }


        function onConnected() {
            // Subscribe to the Public Topic
            stompClient.subscribe('/topic/public', onMessageReceived);

            // Tell your username to the server
            stompClient.send("/app/chat.addUser",
                    {},
                    JSON.stringify({sender: username, type: 'JOIN'})
            )

            connectingElement.classList.add('hidden');
        }


        function onError(error) {
            connectingElement.textContent = 'Could not connect to WebSocket server. Please refresh this page to try again!';
            connectingElement.style.color = 'red';
        }


        function sendMessage(event) {
            var messageContent = messageInput.value.trim();
            if(messageContent && stompClient) {
                var chatMessage = {
                    sender: username,
                    content: messageInput.value,
                    type: 'CHAT'
                };
                stompClient.send("/app/chat.sendMessage", {}, JSON.stringify(chatMessage));
                messageInput.value = '';
            }
            event.preventDefault();
        }


        function onMessageReceived(payload) {
            var message = JSON.parse(payload.body);

            var messageElement = document.createElement('li');

            if(message.type === 'JOIN') {
                messageElement.classList.add('event-message');
                message.content = message.sender + ' joined!';
            } else if (message.type === 'LEAVE') {
                messageElement.classList.add('event-message');
                message.content = message.sender + ' left!';
            } else {
                messageElement.classList.add('chat-message');

                var avatarElement = document.createElement('i');
                var avatarText = document.createTextNode(message.sender[0]);
                avatarElement.appendChild(avatarText);
                avatarElement.style['background-color'] = getAvatarColor(message.sender);

                messageElement.appendChild(avatarElement);

                var usernameElement = document.createElement('span');
                var usernameText = document.createTextNode(message.sender);
                usernameElement.appendChild(usernameText);
                messageElement.appendChild(usernameElement);
            }

            var textElement = document.createElement('p');
            var messageText = document.createTextNode(message.content);
            textElement.appendChild(messageText);

            messageElement.appendChild(textElement);

            messageArea.appendChild(messageElement);
            messageArea.scrollTop = messageArea.scrollHeight;
        }


        function getAvatarColor(messageSender) {
            var hash = 0;
            for (var i = 0; i < messageSender.length; i++) {
                hash = 31 * hash + messageSender.charCodeAt(i);
            }
            var index = Math.abs(hash % colors.length);
            return colors[index];
        }

        usernameForm.addEventListener('submit', connect, true)
        messageForm.addEventListener('submit', sendMessage, true)
    </script>
    <!-- /.content-wrapper -->

    <#--<!--site-footer&ndash;&gt;-->
    <#--<footer class="site-footer section-spacing text-center">-->
        <#--<div class="container">-->
            <#--<div class="row">-->
                <#--<div class="col-md-12">-->
                    <#--<small>&copy; 2020 Lifetrack</small>-->
                <#--</div>-->
            <#--</div>-->
        <#--</div>-->
    <#--</footer>-->
    <#--<!--site-footer end&ndash;&gt;-->

</body>
</html>

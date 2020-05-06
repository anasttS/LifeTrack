<!DOCTYPE html>
<html lang="en" class="mdl-js">
<head>
    <meta charset="UTF-8"/>
    <title>Sign Up</title>


    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="yandex-verification" content="191311c0833838be"/>
    <meta name="google-site-verification" content="RjF-x__xD0_mMGjLhctmbB0uQ8vzYvyRbtomcHhQt7U"/>
    <meta name="msapplication-TileColor" content="#00aba9">
    <meta name="theme-color" content="#ffffff">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aclonica">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Aldrich">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Alfa+Slab+One">
    <!--    <link href="css/bootstrap.min.css" rel="stylesheet"/>-->
    <link href="css/font-awesome.min.css" rel="stylesheet"/>
    <link href="css/font_open_sans.css" rel="stylesheet"/>
    <link href="css/lp.css" rel="stylesheet"/>
    <link href="css/main.css" rel="stylesheet"/>
    <link href="css/common.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
            crossorigin="anonymous"></script>
</head>
<body>

<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">

            <a class="navbar-brand" href="/main">
                <!--                LifeTrack-->
                <img class="logo-nav" alt="logo" src="assets/img/logo6.png" width="160px"
                     height="45px"/>
                <img class="logo-head" alt="logo" src="assets/img/logo2.png" width="160px"
                     height="45px"/>
            </a>
        </div>
        <!--        <div class="navbar-right">-->
        <!--            <a href="index.ftlh">-->
        <!--                <i class="fa " aria-hidden="true"></i>-->
        <!--                <span>Регистрация</span>-->
        <!--            </a>-->


        <!--            <button type="button" class="btn btn-warning btn" data-toggle="modal"-->
        <!--                    data-target="#modal_bs_auth"> Вход-->
        <!--            </button>-->
        <!--        </div>-->
        <ul class="nav navbar-nav navbar-right">
            <li>
                <button type="button" class="btn btn-warning btn" data-toggle="modal">
                    <a href="/signIn">Вход </a>
                </button>
            </li>
        </ul>
    </div>
</nav>

<br>
<section class="container">
    <div class="row">
        <div class="col-12 cabinet-pgin_and_registration justify-content-center" style="padding-left: 350px">
            <div class="row">
                <div class="col-sm-7">
                    <h1>Регистрация</h1>
                ${message?ifExists}
                    <div class="">
                        <form method="post" action="/signUp">
                            <input type="hidden" name="type" value="0">
                            <div class="col-sm-12">
                                <div class="_error_messages"></div>
                            </div>
                            <div class="form-group">
                                <label>Ваш email *</label>
                                <input type="text" class="form-control" id="email" placeholder="Ваш email" name="email"
                                       onchange="checkEmail()"required>
                            </div>
                            <div class="form-group">
                                <label>Пароль *</label>
                                <input type="password" ONINPUT="checkPassword()" class="form-control"
                                       placeholder="Придумайте пароль"
                                       name="password" id="password1" required>
                            </div>
                            <div class="form-group">
                                <label>Повторите пароль *</label>
                                <input type="password" class="form-control"
                                       placeholder="Повторите пароль"
                                       name="password2" id="password2" onchange="checkPasswords()" required>
                            </div>

                            <div class="form-group">
                                <label>Имя *</label>
                                <input type="text" class="form-control" placeholder="Ваше имя" name="username"
                                       required>
                            </div>

                            <div class="form-group">
                                <label>Дата рождения *</label>
                                <input type="date" class="form-control" placeholder="Ваш день рождения" name="birthday">
                            </div>
                            <input hidden="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            <div class="form-group">
                                <div class="col-12" style="color: #000000; font-size: 16px">
                                    Пароль должен удовлетворять требованиям:
                                    <ul class="col-10">
                                        <li id="passwordLengthError">
                                            Длина - 8 символов
                                        </li>
                                        <li id="passwordContainUpperCaseLetterError">
                                            Наличие не менее одной буквы
                                        </li>
                                        <li id="passwordContainNumberError">
                                            Наличие не менее одной цифры
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <div class="form-group">
                                <br>
                                <button type="submit"  class="btn">
                                    Зарегистрироваться
                                </button>
                            </div>

                        </form>
                    </div>
                </div>
                <div class="col-sm-1 hidden-sm hidden-xs">
                    <div class="_divider"></div>
                </div>

            </div>
        </div>
    </div>
</section>
<script>

    function checkPasswords() {
        var password1 = document.getElementById('password1');
        var password2 = document.getElementById('password2');
        if (password1.value !== password2.value) {
            alert('Проверьте пароли!');
            return false;
        }
    }

    function checkEmail() {
        var email = document.getElementById('email');
        var email_regexp = /[0-9a-zа-я_A-ZА-Я]+@[0-9a-zа-я_A-ZА-Я^.]+\.[a-zа-яА-ЯA-Z]{2,4}/i;
        if (!email_regexp.test(email.value)) {
            alert('Проверьте email');
            return false;
        }
    }

    function checkPassword() {
        var password = document.getElementById('password1').value;
        var passwordLengthError = document.getElementById('passwordLengthError');
        var passwordContainUpperCaseLetterError = document.getElementById('passwordContainUpperCaseLetterError');
        var passwordContainNumberError = document.getElementById('passwordContainNumberError');
        var cond1 = false;
        var cond2 = false;
        var cond3 = false;
        if (password.length < 8) {
            passwordLengthError.style.color = "red";
            cond1 = false;
        } else {
            passwordLengthError.style.color = "green";
            cond1 = true;
        }
        if (password.toString().search(/[A-Za-z]/) === -1) {
            passwordContainUpperCaseLetterError.style.color = "red";
            cond2 = false;
        } else {
            passwordContainUpperCaseLetterError.style.color = "green";
            cond2 = true;
        }
        if (password.toString().search(/\d/) === -1) {
            passwordContainNumberError.style.color = "red";
            cond3 = false;
        } else {
            passwordContainNumberError.style.color = "green";
            cond3 = true;
        }

        if (!(cond1 && cond2 && cond3)) {
            return false;
        }

    }

</script>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script src="js/lp/waypoints.min.js"></script>
<script src="js/lp/jquery.animateNumber.min.js"></script>
<script src="js/lp/waypoints-sticky.min.js"></script>
<script src="js/lp/retina.min.js"></script>
<script src="js/lp/tweetie.min.js"></script>

<script src="js/jquery.cookie.js"></script>
<script src="js/ava/ava.modal.bs.js"></script>
<script src="js/ava/ava.sender.js"></script>
<script src="js/lib.cabinet.js"></script>
<script src="js/lp/lp.js"></script>

<!-- Yandex.Metrika counter -->
<script type="text/javascript">
    (function (d, w, c) {
        (w[c] = w[c] || []).push(function () {
            try {
                w.yaCounter50640868 = new Ya.Metrika({
                    id: 50640868,
                    clickmap: true,
                    trackLinks: true,
                    accurateTrackBounce: true,
                    webvisor: true
                });
            } catch (e) {
            }
        });

        var n = d.getElementsByTagName("script")[0],
                s = d.createElement("script"),
                f = function () {
                    n.parentNode.insertBefore(s, n);
                };
        s.type = "text/javascript";
        s.async = true;
        s.src = "https://mc.yandex.ru/metrika/watch.js";

        if (w.opera == "[object Opera]") {
            d.addEventListener("DOMContentLoaded", f, false);
        } else {
            f();
        }
    })(document, window, "yandex_metrika_callbacks");
</script>

<!--AvaStat counter-->
<script type="text/javascript">
    var u = '';
    if (document.cookie) {
        new Image().src = "/ava/statistic/dot?rf=" +
                myescape(document.referrer) + ((typeof (screen) == "undefined") ? "" :
                        "&sw=" + screen.width + "&sh=" + screen.height + "&sd=" + (screen.colorDepth ?
                        screen.colorDepth : screen.pixelDepth)) + "&url=" + myescape(document.URL)
                + "&u=" + u
                + "&r=" + Math.random();
    }

    function myescape(str) {
        str = str.replace(/https:\/\//, "");
        str = str.replace(/http:\/\//, "");
        return escape(str.replace(/\//g, "*"));
    }
</script>

<noscript>
    <div><img src="https://mc.yandex.ru/watch/50640868" style="position:absolute; left:-9999px;" alt=""/></div>
</noscript>
<!-- /Yandex.Metrika counter -->


</body>
</html>
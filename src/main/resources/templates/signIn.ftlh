<!DOCTYPE html>
<html lang="en" class="mdl-js">
<head>
    <meta charset="UTF-8"/>
    <title>Sign In</title>


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
    <style>
        .google {
            min-width: 170px;
        }

        .google {
            background-color: white;
            color: red;
        }

        .google:hover {
            color: #fff;
        }
    </style>
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
        <div class="navbar-right">


            <button type="button" class="btn btn-warning btn" >
                <a href = "/signUp">Регистрация</a>
            </button>
        </div>
    <#--<ul class="nav navbar-nav navbar-right">-->
    <#--<li>-->
    <#--<a data-href="#modal_bs_auth"  class="btn open_modal">-->
    <#--Вход-->
    <#--</a>-->
    <#--</li>-->
    <#--</ul>-->
    </div>
</nav>


<section class="container">
    <div class="row">
        <div class="col-12 cabinet-pgin_and_registration justify-content-center" style="padding-left: 350px">
            <div class="row">
                <div class="col-sm-7">
                    <h1>Вход</h1>
                    <div class="">
                        <form method="post" action="/signIn">
                            <input type="hidden" name="type" value="0">
                            <div class="col-sm-12">
                                <div class="_error_messages"></div>
                            </div>
                            <div class="form-group">
                                <label>Ваш email *</label>
                                <input type="email" class="form-control" placeholder="Ваш email" name="email"
                                       required>
                            </div>
                            <div class="form-group">
                                <label>Пароль *</label>
                                <input type="password" class="form-control" placeholder="Придумайте пароль"
                                       name="password" id="password" required>
                            </div>
                            <label>
                                <input type="checkbox" value="Remember">
                                Запомнить меня
                            </label>
                            <div class="form-group">
                                <br>
                                <button type="submit" class="btn">Войти</button>
                            </div>
                            <div class="form-group">

                                <h6> Еще не зарегистрированы? <a href="/signUp">Регистрация</a></h6>
                            </div>
                        </form>
                    </div>
                    <a href="#" class="btn google btn-block" role="button">Войти с помощью Google</a>
                </div>
                <div class="col-sm-1 hidden-sm hidden-xs">
                    <div class="_divider"></div>
                </div>


            </div>
        </div>
    </div>
</section>


<!— footer —>
<!--site-footer-->
<footer class="site-footer section-spacing text-center">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <small>LifeTrack 2020</small>
            </div>
        </div>
    </div>
</footer>


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
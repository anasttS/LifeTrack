<#import "/spring.ftl" as spring />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Profile</title>

    <meta http-equiv="Refresh" content="10"/>
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
        .round {
            border-radius: 100px; /* Радиус скругления */
            border: 1px solid whitesmoke; /* Параметры рамки */
            box-shadow: 0 0 2px #666; /* Параметры тени */
        }</style>


</head>
<body class="hold-transition skin-red-light layout-boxed sidebar-mini body-index">
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
<div class="wrapper" style="margin: 0">
    <!-- =============================================== -->

    <!-- Left side column. contains the sidebar -->
    <aside class="main-sidebar" style="margin: 0; background-color: whitesmoke; width: 300px">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu" data-widget="tree">

                <li>

                </li>
                <li>
                    <a href="/profile">
                        <i class="fa " aria-hidden="true"></i>
                        <span>Профиль</span>
                    </a>
                </li>
                <li>
                    <a href="/events">
                        <i class="fa " aria-hidden="true"></i>
                        <span>События</span>
                    </a>
                </li>
                <li>
                    <a href="/notes">
                        <i class="fa " aria-hidden="true"></i>
                        <span>Записи</span>
                    </a>
                </li>
                <li>
                    <a href="/support">
                        <i class="fa " aria-hidden="true"></i>
                        <span>Чат</span>
                    </a>
                </li>
            <#--<li>-->
            <#--<a href="/habits">-->
            <#--<i class="fa " aria-hidden="true"></i>-->
            <#--<span>Трекер привычек</span>-->
            <#--</a>-->
            <#--</li>-->


            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- =============================================== -->
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper" style="padding-left: 100px">

        <section class="content">
            <h1>Здравствуйте, ${user.username} </h1>

            <!-- Main content -->
            <div class="container">
                <div class="row">
                    <div class="col-5">
                        <div class="row-2">
                            <form method="post" action="/updateProfile" name="updateProfile"
                                  enctype="multipart/form-data">
                        <#if user.img?has_content>
    <img src="files/${user.img.storageFileName}" class="img-thumbnail2 round" alt="..."
         width="300px"
         height="300px">
                        <div class="row" id="media">
                            <input name="img" placeholder="photo" type="file"/>
                        </div>
    <p></p>
                        </#if>

                            <#if !(user.img?has_content)>
                                <img src="assets/img/images.png" class="img-thumbnail2 round" alt="..."
                                     width="300px"
                                     height="300px">
    <div class="row" id="media">
        <input name="img" placeholder="photo" type="file"/>
    </div>
                            </#if>


                        </div>
                    </div>
                    <div class="col-7">
                        <div class="row-10">
                            <br> <br>
                            <div class="form-group">
                                <label for="inputUsername"></label>
                                <input type="text" class="form-control" id="inputUsername"
                                       placeholder="Enter username"
                                       name="username" value="${user.username}">
                            </div>
                            <div class="form-group">
                                <label for="inputEmail"></label>
                                <input type="email" class="form-control" id="inputEmail" placeholder="Enter email"
                                       name="email" value="${user.email}">
                            </div>
                            <br> <br>

                            <br>
                            <button type="submit" class="btn btn_red" name="save">Save Changes</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        <#--<p><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><> </p>-->
            <br><br>
            <div class="raw justify-content-start">

                <p>
                <h1> Немного информации о Вас </h1></p>
            </div>

            <!-- block activity graph -->
            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="row">
                    <div class="box-header with-border1">
                        <h3 class="box-title">Ваша активность — количество записей по месяцам</h3>
                    </div>
                <#--<div class="box-body">-->
                <#--<div class="chart">-->
                    <img src="${img}" class="img-thumbnail2" alt="..." width="946px"
                         height="200px">
                <#--</div>-->
                <#--</div>-->
                </div>
            </div>
            <!-- /block activity graph -->


            <h1> Воспоминания </h1>
<#if message?exists>
              <h1 style="color:grey;">${message} </h1>
</#if>

<#if notesMonthAgo?exists>
    <#list notesMonthAgo as note>
     <h1 style="color: grey"> Месяц назад </h1>
                     <div class="card" style="width: 17rem;">
                         <img src="files/${note.photo.storageFileName}" class="card-img-top" alt="...">
                         <div class="card-body" style="height: 185px;">
                             <h5 class="card-title">${note.name}</h5>
                             <p class="card-text">${note.date}</p>
                             <br>
                             <form action="/notes" method="get">
                                 <button type="button" class="btn btn_red " style="margin-left: 50px" name="id"
                                         data-toggle="modal"
                                         data-target="#note${note.id_note}">
                                     Посмотреть
                                 </button>
                             </form>
                         </div>
                     </div>

                     <div class="modal fade" id="note${note.id_note}" tabindex="-1" role="dialog"
                          aria-labelledby="exampleModalLabel" aria-hidden="true">
                         <div class="modal-dialog" role="document">
                             <div class="modal-content">
                                 <div class="modal-header">
                                     <h5 class="modal-title" id="exampleModalLabel">${note.name}</h5>
                                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                         <span aria-hidden="true">&times;</span>
                                     </button>
                                 </div>
                                 <div class="modal-body">
                                     <div id="sliderBigImages${note.id_note}" class="carousel slide"
                                          data-ride="carousel">
                                         <div class="carousel-inner">
                                             <div class="carousel-item active">
                                                 <img src="files/${note.photo.storageFileName}" class="card-img-top"
                                                      alt="...">
                                             </div>
                                             <div class="carousel-item">
                                                 <video controls width="450" height="300" preload="none">
                                                     <source src="files/${note.video.getStorageFileName()}"
                                                             type="video/mp4">
                                                 </video>
                                             </div>
                                         </div>
                                         <a class="carousel-control-prev" href="#sliderBigImages${note.id_note}"
                                            role="button" data-slide="prev">
                                             <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                             <span class="sr-only">Previous</span>
                                         </a>
                                         <a class="carousel-control-next" href="#sliderBigImages${note.id_note}"
                                            role="button" data-slide="next">
                                             <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                             <span class="sr-only">Next</span>
                                         </a>
                                     </div>
                                     <br>
                                     <label>
                                         <textarea style="width: 468px"> ${note.text} </textarea>
                                     </label>

                                 </div>
                             </div>
                         </div>
                     </div>
    </#list>
</#if>

            <#if messageYear?exists>
              <h1 style="color:grey;">${messageYear} </h1>
            </#if>
            <#if notesYearAgo?exists>
                <#list notesYearAgo as note>
     <h1 style="color: grey"> Год назад </h1>
                     <div class="card" style="width: 17rem;">
                         <img src="files/${note.photo.storageFileName}" class="card-img-top" alt="...">
                         <div class="card-body" style="height: 185px;">
                             <h5 class="card-title">${note.name}</h5>
                             <p class="card-text">${note.date}</p>
                             <br>
                             <form action="/notes" method="get">
                                 <button type="button" class="btn btn_red " style="margin-left: 50px" name="id"
                                         data-toggle="modal"
                                         data-target="#note${note.id_note}">
                                     Посмотреть
                                 </button>
                             </form>
                         </div>
                     </div>

                     <div class="modal fade" id="note${note.id_note}" tabindex="-1" role="dialog"
                          aria-labelledby="exampleModalLabel" aria-hidden="true">
                         <div class="modal-dialog" role="document">
                             <div class="modal-content">
                                 <div class="modal-header">
                                     <h5 class="modal-title" id="exampleModalLabel">${note.name}</h5>
                                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                         <span aria-hidden="true">&times;</span>
                                     </button>
                                 </div>
                                 <div class="modal-body">
                                     <div id="sliderBigImages${note.id_note}" class="carousel slide"
                                          data-ride="carousel">
                                         <div class="carousel-inner">
                                             <div class="carousel-item active">
                                                 <img src="files/${note.photo.storageFileName}" class="card-img-top"
                                                      alt="...">
                                             </div>
                                             <div class="carousel-item">
                                                 <video controls width="450" height="300" preload="none">
                                                     <source src="files/${note.video.getStorageFileName()}"
                                                             type="video/mp4">
                                                 </video>
                                             </div>
                                         </div>
                                         <a class="carousel-control-prev" href="#sliderBigImages${note.id_note}"
                                            role="button" data-slide="prev">
                                             <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                             <span class="sr-only">Previous</span>
                                         </a>
                                         <a class="carousel-control-next" href="#sliderBigImages${note.id_note}"
                                            role="button" data-slide="next">
                                             <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                             <span class="sr-only">Next</span>
                                         </a>
                                     </div>
                                     <br>
                                     <label>
                                         <textarea style="width: 468px"> ${note.text} </textarea>
                                     </label>

                                 </div>
                             </div>
                         </div>
                     </div>
                </#list>
            </#if>

        </section>
    </div>
    <!-- /.content-wrapper -->

    <!--site-footer-->
    <footer class="site-footer section-spacing text-center">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <small>&copy; 2020 Lifetrack</small>
                </div>
            </div>
        </div>
    </footer>
    <!--site-footer end-->

<#--<div class="modal fade" id="event" tabindex="-1" role="dialog"-->
<#--aria-labelledby="exampleModalLabel" aria-hidden="true">-->
<#--<div class="modal-dialog" role="document">-->
<#--<div class="modal-content">-->
<#--<div class="modal-header">-->
<#--<h5 class="modal-title" id="exampleModalLabel">Лучший день!</h5>-->
<#--<button type="button" class="close" data-dismiss="modal" aria-label="Close">-->
<#--<span aria-hidden="true">&times;</span>-->
<#--</button>-->
<#--</div>-->
<#--<div class="modal-body">-->
<#--<img src="assets/img/loft.jpg" class="card-img-top" alt="...">-->
<#--<br>-->
<#--<br>-->
<#--<label>-->
<#--<textarea style="width: 468px">-->
<#--</textarea>-->
<#--</label>-->
<#--</div>-->

<#--</div>-->
<#--</div>-->
<#--</div>-->


<#--<!--AvaStat counter&ndash;&gt;-->
<#--<script type="text/javascript">-->
<#--var u = '';-->
<#--u = 'Настя ';-->
<#--if (document.cookie) {-->
<#--new Image().src = "/ava/statistic/dot?rf=" +-->
<#--myescape(document.referrer) + ((typeof (screen) == "undefined") ? "" :-->
<#--"&sw=" + screen.width + "&sh=" + screen.height + "&sd=" + (screen.colorDepth ?-->
<#--screen.colorDepth : screen.pixelDepth)) + "&url=" + myescape(document.URL)-->
<#--+ "&u=" + u-->
<#--+ "&r=" + Math.random();-->
<#--}-->

<#--function myescape(str) {-->
<#--str = str.replace(/https:\/\//, "");-->
<#--str = str.replace(/http:\/\//, "");-->
<#--return escape(str.replace(/\//g, "*"));-->
<#--}-->
<#--</script>-->
<#--<!--/AvaStat&ndash;&gt;-->


</div>
<!-- ./wrapper -->
<script src="js/jquery-2.1.4.min.js"></script>
<!--<script src="js/bootstrap.min.js"></script>-->
<script src="js/bootstrap-datepicker.min.js?2"></script>
<script src="js/ava/ava.modal.bs.js?2"></script>
<script src="js/ava/ava.helper.js?2"></script>
<script src="js/lte.js?2"></script>
<script src="js/lib.cabinet.js?2"></script>
<script src="js/lib.diary.js?2"></script>
<script src="js/lib.diary.calendar.js?2"></script>

<script src="js/moment.js?2"></script>
<script src="js/_ru.js?2"></script>
<script src="js/fullcalendar.min.js?2"></script>
<script src="js/jquery.jgrowl.min.js?2"></script>

<script src="js/jquery.simplecolorpicker.js?2"></script>
<script src="js/bootstrap-datepicker.min.js?2"></script>
<!--<script src="/assets/frontend/libs/bootstrap-datepicker/locales/bootstrap-datepicker.ru.min.js?2"></script>-->

<script src="js/main.common.js"></script>


<#--<!-- Yandex.Metrika counter &ndash;&gt;-->
<#--<script type="text/javascript">-->
<#--(function (d, w, c) {-->
<#--(w[c] = w[c] || []).push(function () {-->
<#--try {-->
<#--w.yaCounter50640868 = new Ya.Metrika({-->
<#--id: 50640868,-->
<#--clickmap: true,-->
<#--trackLinks: true,-->
<#--accurateTrackBounce: true,-->
<#--webvisor: true-->
<#--});-->
<#--} catch (e) {-->
<#--}-->
<#--});-->

<#--var n = d.getElementsByTagName("script")[0],-->
<#--s = d.createElement("script"),-->
<#--f = function () {-->
<#--n.parentNode.insertBefore(s, n);-->
<#--};-->
<#--s.type = "text/javascript";-->
<#--s.async = true;-->
<#--s.src = "https://mc.yandex.ru/metrika/watch.js";-->

<#--if (w.opera == "[object Opera]") {-->
<#--d.addEventListener("DOMContentLoaded", f, false);-->
<#--} else {-->
<#--f();-->
<#--}-->
<#--})(document, window, "yandex_metrika_callbacks");-->
<#--</script>-->
<noscript>
    <div><img src="https://mc.yandex.ru/watch/50640868" style="position:absolute; left:-9999px;" alt=""/></div>
</noscript>
<!-- /Yandex.Metrika counter -->


<script src="js/lib.diary.summary.js"></script>
<script src="js/chart.min.js"></script>
<script src="js/main.index.js"></script>
</body>
</html>

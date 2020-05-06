<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Habits</title>


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
                            <!-- Menu Body -->
                            <li class="user-body">

                            </li>
                            <li class="user-body">
                                <a href="/logout">
                                    <i class="fa " aria-hidden="true"></i>
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

    <!-- Left side column. contains the sidebar -->
    <aside class="main-sidebar">
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
                    <a href="/habits">
                        <i class="fa " aria-hidden="true"></i>
                        <span>Трекер привычек</span>
                    </a>
                </li>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>


    <!-- =============================================== -->
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!--                <div class="loading">-->
        <!--                    <div></div>-->
        <!--                </div>-->
        <section class="content">
            <br>
            <div class="container">
                <div class="row">
                    <div class="col-10" style="justify-content: left"><h5>
                        Сделай жизнь лучше! Создай привычку
                        <br>
                    </h5>
                    </div>
                    <div class="col-2" style="justify-content: right">
                        <button type="button" class="btn btn_red " style="margin-right: 5%" name="id"
                                data-toggle="modal"
                                data-target="#habit">
                            Создать
                        </button>
                    </div>
                </div>

                <br> <br>
                <!--            циклом перечислены привычки -->
                <div class="row">
                    <!--                    <img src="assets/img/loft.jpg" class="card-img-top" alt="...">-->
                    <!--                    <div class="card-body" style="height: 185px;">-->
                    <div class="col-5">
                        <h5>Пить воду </h5>
                    </div>
                    <div class="col-7">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c1" value="option1">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c2" value="option2">

                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c3" value="option3">

                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c4" value="option3">

                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c5" value="option3">

                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c6" value="option3">

                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c7" value="option3">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c8" value="option3">

                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c9" value="option3">

                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c10" value="option3">

                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c11" value="option3">

                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c12" value="option3">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c13" value="option3">

                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c14" value="option3">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c15" value="option3">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c16" value="option3">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c17" value="option3">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c18" value="option3">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c19" value="option3">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c20" value="option3">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c21" value="option3">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c22" value="option3">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c23" value="option3">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c24" value="option3">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c25" value="option3">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c26" value="option3">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c27" value="option3">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c28" value="option3">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c29" value="option3">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c30" value="option3">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c31" value="option3">
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="c32" value="option3">
                        </div>
                    </div>
                </div>


                <div class="modal fade" id="habit" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Привычка</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="../../../../../../projects/LifeTrack/calendar.html" method="post">

                                    <label> Что хотите развить?
                                        <input type="text" class="form-control" name="habit"
                                               value="" style="width: 468px"/>
                                    </label>

                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn_red" name="edit">
                                        <#--value="${habit.id}">-->
                                    Подтвердить
                                </button>

                            </div>

                        </div>


                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- /.content-wrapper -->
    <br><br> <br>
    <!--site-footer-->
    <footer class="site-footer section-spacing text-center">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <small> LifeTrack 2020</small>
                </div>
            </div>
        </div>
    </footer>
    <!--site-footer end-->

</div>
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

</body>
</html>
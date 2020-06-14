<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Notes</title>


    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="msapplication-TileColor" content="#00aba9">
    <meta name="theme-color" content="#ffffff">


    <link href="css/font_open_sans.css?2" rel="stylesheet"/>
    <!--    <link rel="stylesheet" href="css/bootstrap.min.css?2">-->
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

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
            integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>


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
<div class="wrapper" style="margin: 0; background-color: whitesmoke" >
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
        <!--<div class="loading">-->
        <!--                    <div></div>-->
        <!--                </div>-->
        <section class="content">
            <br>
            <div class="container">
                <div class="row">
                    <div class="col-10" style="justify-content: left">
                        <h5>
                            Оставьте запись о сегодняшнем дне!
                            <br>
                        </h5>
                        <h6 style="text-decoration-color: grey; color: grey">
                            Загрузите фото и видео, чтобы ваши моменты остались в памяти
                        </h6>
                    </div>
                    <div class="col-2" style="justify-content: right">
                        <button type="button" class="btn btn_red " style="margin-right: 5%" name="id"
                                data-toggle="modal"
                                data-target="#add">
                            Добавить
                        </button>
                    </div>
                </div>

                <br> <br>
                <div class="container-fluid">
                    <div class="row">
                 <#list notes as note>
                     <div class="card" style="width: 17rem;">
                         <img src="files/${note.photo.storageFileName}" class="card-img-top" alt="...">
                         <div class="card-body" style="height: 185px;">
                             <h5 class="card-title">${note.name}</h5>
                             <p class="card-text">${note.date}</p>
                             <br>
                             <form action="/notes" method="get">
                                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
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
                    </div>
                </div>

                <!--            циклом перечислены события -->

            </div>
        </section>
    </div>
    <script>
        $(function () {
            $('#carousel').carousel({
                interval: 10000,
                keyboard: false,
                pause: 'hover',
                ride: 'carousel',
                wrap: false
            });
        });
    </script>
    <!-- /.content-wrapper -->
    <br><br> <br>
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

    <div class="modal fade" id="add" tabindex="-1" role="dialog"
         aria-labelledby="addLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addLabel">Добавить заметку</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form method="post" action="/addNote" enctype="multipart/form-data">
                        <h6 style="text-decoration-color: grey; color: grey">
                            Опишите день одной фразой
                        </h6>
                        <input name="name" type="text"/>
                        <br><br>
                        <h6 style="text-decoration-color: grey; color: grey">
                            Загрузите фото или видео, связанное с сегодняшним днем
                        </h6>
                        <input name="photo"  type="file"/> Фото
                        <input name="video"  type="file"/> Видео
                        <br><br>
                        <h6 style="text-decoration-color: grey; color: grey">
                            Расскажите, как прошел Ваш день
                        </h6>
                        <label>
                            <textarea name="text" style="width: 468px"></textarea>
                        </label>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <div class="modal-footer">
                            <button type="submit" class="btn btn_red" name="add">
                                Добавить
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Main</title>


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

<body class="page-index">
<!--hero section-->
<header class="hero-section">
    <!--
    navigation
    -->
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

                <a href="/profile" class="btn" style= "color: gainsboro; text-decoration: none">
                    Профиль
                </a>
            </div>
        </div>
    </nav>

    <!--    navigation end-->

    <!--welcome message-->
    <section class="container text-center welcome-message">
        <div class="row">
            <div class="col-md-12">
                <h1>Запомни каждый день!</h1>
                <h1>   </h1>
                <!-- <div class="play-btn">
                    <a href="https://vimeo.com/109054393" class="play litebox-hero">
                        <img src="/assets/frontend/img/play-btn.png" alt="play"/>
                    </a>
                </div> -->
                <br>
                <div class="cta-btn">
                    <a href="/signUp" class="btn">создать дневник</a>
                    <p>
                        <span class="total-number-1">0</span>
                        K дневников
                    </p>
                </div>
            </div>
        </div>
    </section>
    <!--welcome message end-->
</header>
<!--hero section end-->
<!--benefits-->
<section class="benefits section-spacing text-center" id="features">
    <div class="container">
        <header class="section-header">
            <h2>Преимущества нашего сервиса</h2>
            <h3>Почему наши онлайн дневники так хороши</h3>
        </header>
        <div class="row">
            <div class="col-sm-4">
                <img src="assets/img/benefits-1.png" alt="benefits of product"/>
                <h4>Максимальная защищенность</h4>
                <p>Все дневники шифруются по технологии <b>OpenSSL</b> по индивидуальному ключу, что дает Вам 100%
                    гарантию того, что Ваши записи никто, кроме Вас, не прочитает.<br>Даже наши администраторы не могут
                    прочесть Ваши данные!</p>
            </div>
            <div class="col-sm-4">
                <img src="assets/img/benefits-2.png" alt="benefits of product"/>
                <h4>Доступность из любого места</h4>
                <p>Бумажный дневник не всегда может быть с Вами, в момент, когда приходит вдохновение добавить в него
                    какую-нибудь важную информацию. И тут выручит наш сервис — в любой точке планеты Вы всегда имеете
                    доступ к Вашим дневникам! Заполняйте дневник тогда, когда Вам удобно!</p>
            </div>
            <div class="col-sm-4">
                <img src="assets/img/benefits-3.png" alt="benefits of product"/>
                <h4>Надежность</h4>
                <p>Всем мы знаем, что обычные бумажные дневники теряются. Жесткие диски на компьютере могут так же выйти
                    из строя, приводя к потере всех Ваших данных. Поэтому мы рекомендуем хранить личные записи у нас на
                    сервере! Мы постоянно резервируем все данные и можем дать гарантию сохранности Ваших данных!</p>
            </div>
        </div>
    </div>
</section>
<!--benefits end-->
<!--
Featured on
-->
<section class="featured-on section-spacing text-center" id="fivereasons">
    <div class="container">
        <header class="section-header">
            <h2>5 причин завести личный дневник</h2>
        </header>
        <div class="row">
            <div class="col-md-12">
                <ol class="featured-reasons">
                    <li><span>1</span>
                        <p>В первую очередь, личный онлайн дневник необходим людям, стремящимся упорядочить свою жизнь,
                            проанализировать свое существование. Записывая каждый день свои мысли, идеи, вы учитесь
                            думать, замечать что-то важное в своем поведении. Со временем, перечитав свой дневник,
                            вспомнив то, что вы делали или говорили когда-то, можно найти и понять причину некоторых
                            проблем, свалившихся вам на голову.&nbsp;</p></li>
                    <li><span>2</span>
                        <p>Спортсменам настоятельно рекомендуют завести дневник. Это необходимо сделать, чтобы следить
                            за прогрессом или его отсутствием в тренировках. Например, человек решил изменить свой
                            внешний вид, накачать мышцы, и с этой целью начал ходить в тренажерный зал. Занимаясь там
                            регулярно и целенаправленно, он, конечно же, будет меняться, но не так быстро и заметно, как
                            ему хотелось бы. Отсюда пропадает интерес к тренировкам.</p>
                        <p>Как это исправить? Завести дневник. Туда начинающий, а затем и уже опытный спортсмен будет
                            записывать результаты своих успехов, вес, который он сейчас поднимает, общее физическое
                            состояние, аппетит, сон и т.д. Вдумчиво перечитав свой дневник через месяц-другой, спортсмен
                            сразу увидит изменения в результатах. Это даст ему желание заниматься дальше.</p></li>
                    <li><span>3</span>
                        <p>Людям, желающим что-то изменить в своей жизни также будет полезен наш сервис. Записывая в
                            дневник свои задачи на какой-то промежуток времени, а затем просматривая их и фиксируя их
                            выполнение, человек учится добиваться своего. Ставя себе цели и выполняя их, мы не только
                            решаем какие-то проблемы, мы дисциплинируем себя, повышаем самооценку. А это, согласитесь,
                            тоже немаловажно.</p></li>
                    <li><span>4</span>
                        <p>Забывчивые люди, записав с вечера свои дела на бумагу, а утром посмотрев туда, выполнят то,
                            что планировали, не подставив себя, своих коллег или близких людей.</p></li>
                    <li><span>5</span>
                        <p>Сентиментальным людям мы бы тоже рекомендовали завести свой личный дневник (или, как сказали
                            бы в Украине, Щоденник). События и люди забываются, а сделанная однажды запись всегда
                            поможет вспомнить те эмоции, те события и тех людей, которые возможно что-то изменили в
                            вашей жизни. Перечитывая написанное вами когда-то, вы вернетесь в своей памяти к тому, что,
                            казалось, давно забыто&hellip;</p></li>
                </ol>
            </div>
        </div>
    </div>
</section>
<!--Featured on end-->

<!--
Features
-->
<!--<div class="features section-spacing">-->
<!--    <div class="container">-->
<!--        &lt;!&ndash;feature 1&ndash;&gt;-->
<!--        <div class="row">-->
<!--            <div class="col-md-7 text-center">-->
<!--                <img src="assets/img/feature-1.png" alt="feature"/>-->
<!--            </div>-->
<!--            <div class="col-md-5">-->
<!--                <article>-->
<!--                    <h2>Удобный интерфейс</h2>-->
<!--                    <p>Продвинутый интерфейс управления Вашими событиями. Вы с легкостью можете создавать,-->
<!--                        редактировать, перемещать Ваши записи прямо на календаре.</p>-->

<!--                </article>-->
<!--            </div>-->
<!--        </div>-->
<!--        &lt;!&ndash;feature 1 end&ndash;&gt;-->
<!--        &lt;!&ndash;feature 2&ndash;&gt;-->
<!--        <div class="row">-->
<!--            <div class="col-md-7 text-center">-->
<!--                <img src="assets/img/feature-2.png" alt="feature"/>-->
<!--            </div>-->
<!--            <div class="col-md-5">-->
<!--                <article>-->
<!--                    <h2>Расширенная статистика</h2>-->
<!--                    <p>Сервис показывает статистику Вашей активности и много дополнительной интересной информации о Вас.-->
<!--                        Возможно, текущая неделя у Вас юбилейная!</p>-->
<!--                    <p>А еще всегда интересно узнать что произошло в этот день в предыдущие года!</p>-->

<!--                </article>-->
<!--            </div>-->
<!--        </div>-->
<!--        &lt;!&ndash;feature 2 end&ndash;&gt;-->
<!--        &lt;!&ndash;feature 3&ndash;&gt;-->
<!--        <div class="row">-->
<!--            <div class="col-md-7 text-center">-->
<!--                <img src="assets/img/feature-3.png" alt="feature"/>-->
<!--            </div>-->
<!--            <div class="col-md-5">-->
<!--                <article>-->
<!--                    <h2>Лента жизни</h2>-->
<!--                    <p>Сложив все записанные события в единое полотно, получим Ленту жизни — Мемуарник!</p>-->

<!--                </article>-->
<!--            </div>-->
<!--        </div>-->
<!--        &lt;!&ndash;feature 3 end&ndash;&gt;-->
<!--    </div>-->
<!--</div>-->
<!--&lt;!&ndash;Features end&ndash;&gt;-->

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
<!--site-footer end-->


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

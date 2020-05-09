<!DOCTYPE html>
<html lang="en" class="mdl-js">
<head>
    <meta charset="UTF-8"/>
    <title>Admin</title>


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

<div class="col-8 justify-content-center">
    <table>
        <tr>
            <th>Имя</th>
            <th>Email</th>
        </tr>
    <#list users as user>
        <tr>
            <td>${user.username}</td>
            <td>${user.email}</td>
            <td>${user.role}</td>

            <#--<#if !(user.role == "ADMIN")>-->
                <form method="get" action="/changeRole">
                    <td>
                        <button name="id" value="${user.id}">Change role</button>
                    </td>
                </form>

            <form method="get" action="/delete">
                <td>
                    <button name="id" value="${user.id}">Delete</button>
                </td>
            </form>
            <#--</#if>-->

        </tr>
    </#list>
    </table>
</div>


</body>
</html>
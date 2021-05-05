<#import "/spring.ftl" as spring/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>O-Tasks</title>
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/fullcalendar.min.css">
    <link rel="stylesheet" href="../../css/fullcalendar.custom-styles.css">
</head>
<body class="d-flex flex-column">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
    <div class="container">
        <a class="navbar-brand" href="/">
            <img class="align-top mr-auto" src="https://o.kg/local/templates/main/img/content/top-logo-min.png"
                 alt="brand">
        </a>
    </div>
</nav>
<div class="page-container">
    <div class="content-wrapper">
        <div class="ui main container">
            <div class="row col-md-12">
                <#------------------------------------------------------------------------------------------------------------>
                <div class="panel panel-info mx-auto border border-dark">
                    <div class="panel-body p-5 m-5">
                        <form action="/login" method="post">
                            <div class="text-center">
                                <div class="row text-center" style="color: white; text-align: center">
                                    <div class="panel-login-form">
                                        <div class="text-center" style="padding-bottom: 20px; color: white">
                                            <small class="panel-small-fonts-min" style="font-size: 16px;">
                                                <@spring.message 'auth.input-login-pass'/>
                                            </small>
                                        </div>
                                        <div class="form-group has-feedback has-feedback-left">
                                            <input id="username" type="text" name="username" class="form-control"
                                                   placeholder="<@spring.message 'auth.login'/>">
                                        </div>

                                        <div class="form-group has-feedback has-feedback-left">
                                            <input type="password" name="password" class="form-control"
                                                   placeholder="<@spring.message 'auth.pass'/>">
                                        </div>


                                        <#if Session.SPRING_SECURITY_LAST_EXCEPTION?? && Session.SPRING_SECURITY_LAST_EXCEPTION.message?has_content>
                                            <@spring.message 'auth.login-error'/>
                                        </#if>

                                        <div class="form-group">
                                            <button type="submit" class="btn btn-auth btn-block"
                                                    style="border-radius: 20px; background-color: lightgrey; color: black;">
                                                <@spring.message 'auth.login-submit'/>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <#------------------------------------------------------------------------------------------------------------>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<footer class="footer-bs mt-auto">
    <div class="container">
        <div class="col-md-3 footer-brand animated fadeInLeft">
        </div>
        <div class="col-md-4 footer-nav animated fadeInUp">
        </div>
        <div class="col-md-2 footer-social animated fadeInDown">
        </div>
        <div class="col-md-3 footer-ns animated fadeInRight">
        </div>
    </div>
</footer>
</body>
</html>
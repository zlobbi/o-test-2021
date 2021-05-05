<#import "/spring.ftl" as spring/>

<#macro head styles=[] scripts=[]>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>O-Tasks</title>
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/fullcalendar.min.css">
    <link rel="stylesheet" href="../../css/fullcalendar.custom-styles.css">
    <#list styles as styleSource>
        <link rel="stylesheet" href="${styleSource}">
    </#list>
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/script.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <script src="../../js/moment.min.js"></script>
    <script src="../../js/fullcalendar.min.js"></script>
    <#list scripts as scriptSource>
        <script src="${scriptSource}"></script>
    </#list>

</#macro>

<#macro userbar>
    <div class="userbar"></div>
</#macro>

<#macro navbar>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
        <div class="container">
            <a class="navbar-brand" href="/">
                <img class="align-top" src="https://o.kg/local/templates/main/img/content/top-logo-min.png" alt="brand">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                    aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav">
                    <#if navigationBar?? && navigationBar?has_content>
                        <#list navigationBar.getNavbarItems() as navs>
                            <li class="nav-item">
                                <a class="nav-link active"
                                   href="${navs.href!''}"><@spring.message '${navs.title!""}'/></a>
                                <span class="sr-only">(current)</span>
                            </li>
                        </#list>
                    </#if>
                </ul>
            </div>
            <form class="form-inline mx-auto" action="/search" method="post">
                <input class="form-control mr-sm-2" type="search" name="search" placeholder="Search"
                       aria-label="Search">
            </form>
            <ul class="nav navbar-nav navbar-right">
                <#if user??>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-user"></span> 
                            <strong>${user.username}</strong>
                            <span class="glyphicon glyphicon-chevron-down"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <div class="navbar-login">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <p class="text-center">
                                                <span class="glyphicon glyphicon-user icon-size"></span>
                                            </p>
                                        </div>
                                        <div class="col-lg-8">
                                            <p class="text-left"><strong>${user.username}</strong></p>
                                            <p class="text-left">
                                                <a href="/change-password"
                                                   class="btn btn-info btn-block"><@spring.message "user.change-password"/></a>
                                                <a href="/logout"
                                                   class="btn btn-danger btn-block btn-sm"><@spring.message "user.logout" /></a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                <#else >
                    <a href="/login" class="btn btn-info"><@spring.message "user.login"/></a>
                </#if>
            </ul>
        </div>
    </nav>
    <#if indev??>
        <div class="alert alert-warning text-center container" role="alert">
            <@spring.message "message.indev"/>
        </div>
    </#if>
</#macro>

<#macro pageHeader>
</#macro>

<#macro content>
    <div class="page-container">
        <div class="content-wrapper">
            <div class="ui main container">
                <#nested />
            </div>
        </div>
    </div>
</#macro>

<#macro footer>
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
</#macro>

<#macro render breadcrumb={} scripts=[]>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <@head />
    </head>
    <body class="d-flex flex-column">
    <@userbar/>
    <@navbar/>
    <@pageHeader />
    <@content>
        <#nested/>
    </@content>
    <@footer/>
    </body>
    </html>
</#macro>

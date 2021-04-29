<#import "/spring.ftl" as spring/>

<#macro head styles=[] scripts=[]>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>O-Tasks</title>
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/bootstrap.css">
    <link rel="stylesheet" href="../../css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/icons/icomoon/styles.css">
    <link rel="stylesheet" href="../../css/icons/fontawesome/styles.min.css">

    <link rel="stylesheet" href="../../css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../../css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="../../css/fullcalendar.min.css">
    <link rel="stylesheet" href="../../css/fullcalendar.custom-styles.css">
    <link rel="stylesheet" href="../../css/anytime.min.css">
    <link rel="stylesheet" href="../../css/colors.css">
    <#list styles as styleSource>
        <link rel="stylesheet" href="${styleSource}">
    </#list>
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/script.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <script src="../../js/jquery.mask.min.js"></script>
    <script src="../../js/moment.min.js"></script>
    <script src="../../js/fullcalendar.min.js"></script>
    <script src="../../js/anytime.min.js"></script>
    <script src="../../js/datepicker.js"></script>
    <script src="../../js/datepaginator.min.js"></script>
    <script src="../../js/spectrum.js"></script>
    <script src="../../js/jquery.spectrum-ru.js"></script>
    <#list scripts as scriptSource>
        <script src="${scriptSource}"></script>
    </#list>

</#macro>

<#macro userbar>
<#--    TODO userbar-->
    <div class="userbar"></div>
</#macro>

<#macro navbar>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
        <div class="container">
            <a class="navbar-brand" href="#">
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
        </div>
    </nav>
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

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
    <link rel="stylesheet" href="../../css/semantic.min.css">
    <link rel="stylesheet" href="../../css/fullcalendar.min.css">
    <link rel="stylesheet" href="../../css/fullcalendar.custom-styles.css">
    <link rel="stylesheet" href="../../css/anytime.min.css">
    <link rel="stylesheet" href="../../css/colors.css">
    <#list styles as styleSource>
        <link rel="stylesheet" href="${styleSource}">
    </#list>
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/script.js"></script>
    <script src="../../js/semantic-customization.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <script src="../../js/jquery.mask.min.js"></script>
    <script src="../../js/semantic.min.js"></script>
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
<#--    TODO navbar-->
    <div class="navbar"></div>
</#macro>

<#macro pageHeader arr>
    <div class="ui fixed inverted menu">
        <div class="ui container">
            <a href="#" class="header item">
                <img class="logo" src="https://media-exp1.licdn.com/dms/image/C510BAQHK3RC_mgjfFA/company-logo_200_200/0/1519909986609?e=1627516800&v=beta&t=GZCr9aNf9wKz6w_l2oDqJvouT5n-bUTZW1L8zgMyCUs">
            </a>
            <a href="#" class="item"><i class="home"></i>Home</a>
            <a href="#" class="item"><i class="mail"></i> Contact</a>
            <a class="item" href="#"><i class="mail"></i>Link Item</a>
            <div class="right menu">
                <div class="item">
                    <a class="ui basic teal button" href="#"><i class="sign in"></i>Войти</a>
                </div>
            </div>
        </div>
    </div>
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
    <div class="ui inverted footer segment p-3 mt-auto">
        <div class="container text-right">
            <div class="ui horizontal inverted small divided link list">
                <a class="item" href="#">Kadyrbek Mavlyanov</a>
                <a class="item" href="#">kadyrbek.mavlyanov@gmail.com</a>
                <a class="item" href="#">2021 year.</a>
            </div>
        </div>
    </div>
</#macro>

<#macro render breadcrumb={} scripts=[]>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <@head />
    </head>
    <body class="d-flex flex-column">
        <@userbar/>
    <#--    <@navbar/>-->
    <@pageHeader breadcrumb/>
    <@content>
        <#nested/>
    </@content>
    <@footer/>
    </body>
    </html>
</#macro>

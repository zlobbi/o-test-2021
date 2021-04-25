<#import "/spring.ftl" as spring/>

<#macro head styles=[] scripts=[]>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>O-Tasks</title>
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/bootstrap.css">
    <link rel="stylesheet" href="../../css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../../css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="../../css/semantic.min.css">
    <link rel="stylesheet" href="../../css/fullcalendar.min.css">
    <#list styles as styleSource>
        <link rel="stylesheet" href="${styleSource}">
    </#list>
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/script.js"></script>
    <script src="../../js/bootstrap.bundle.min.js"></script>
    <script src="../../js/popper.min.js"></script>
    <script src="../../js/semantic.min.js"></script>
    <script src="../../js/moment.min.js"></script>
    <script src="../../js/fullcalendar.min.js"></script>
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
<#--    TODO header-->
    <div class="page-header">
    </div>
</#macro>

<#macro content>
    <div class="content-wrapper">
        <#nested />
    </div>
</#macro>

<#macro footer>
<#--    TODO footer-->
    <div class="page-footer">
    </div>
</#macro>

<#macro render breadcrumb={} scripts=[]>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <@head />
    </head>
    <body>
    <@userbar/>
    <@navbar/>
    <@pageHeader breadcrumb/>
    <@content>
        <#nested/>
    </@content>
    <@footer/>
    </body>
    </html>
</#macro>

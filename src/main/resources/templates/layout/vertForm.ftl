<#import "/spring.ftl" as spring>

<#macro label path required=false info=false>
    <#assign replacedPath = path?replace("\\[\\d\\]", "[]", "r") />
    <label class="control-label">${springMacroRequestContext.getMessage(replacedPath)} ${required?then("<span style='color:red'>*</span>","")}
        ${info?then("<span style='font-weight:normal;'>"+springMacroRequestContext.getMessage(path+"Info")+"</span>","")}
        :</label>
</#macro>

<#macro inputText path fieldType="text" required=false class="" attributes=" " allowed=true >
    <#assign replacedPath = path?replace("\\[\\d\\]", "[]", "r") />
    <div class="form-group<#if required> required</#if>">
        <@spring.bind path />
        <#assign attributesOverride = attributes + required?string(" required ","")/>
        <#assign attributesOverride = attributesOverride + ' placeholder="${springMacroRequestContext.getMessage(replacedPath)}" '/>
        <@label path required/>
        <@spring.formInput path 'class="form-control'+(class??)?then(" "+class,"")+'" '+attributesOverride fieldType/>
        <@spring.showErrors "<br>" "text-danger" />
    </div>
</#macro>

<#macro inputTextWithTooltip path fieldType="text" required=false class="" attributes=" " allowed=true >
    <#assign replacedPath = path?replace("\\[\\d\\]", "[]", "r") />
    <div class="form-group<#if required> required</#if>">
        <@spring.bind path />
        <#assign attributesOverride = attributes + required?string(" required ","")/>
        <#assign attributesOverride = attributesOverride + ' placeholder="${springMacroRequestContext.getMessage(replacedPath)}" '/>
        <#assign attributesOverride = attributesOverride + ' data-popup="tooltip" data-trigger="focus" data-original-title="${springMacroRequestContext.getMessage(replacedPath + ".tooltip")}" '/>
        <@label path required/>
        <@spring.formInput path 'class="form-control'+(class??)?then(" "+class,"")+'" '+attributesOverride fieldType/>
        <@spring.showErrors "<br>" "text-danger" />
    </div>
</#macro>

<#macro hiddenField path>
    <@spring.formHiddenInput path/>
</#macro>

<#macro inputTextWithButton path btnTitle fieldType="text" required=false class="" attributes=" " allowed=true >
    <div class="form-group<#if required> required</#if>">
        <@spring.bind path />
        <#assign btnPath = path?replace(".", "-") + "-btn" />
        <#assign attributesOverride = attributes + required?string(" required ","")/>
        <#assign attributesOverride = attributesOverride + ' placeholder="${springMacroRequestContext.getMessage(path)}" '/>
        <@label path required/>
        <div class="input-group">
            <@spring.formInput path 'class="form-control'+(class??)?then(" "+class,"")+'" '+attributesOverride fieldType/>
            <span class="input-group-btn">
            <button class="btn bg-blue ${btnPath}" type="button" id="${btnPath}">${btnTitle}</button>
        </span>
        </div>
        <@spring.showErrors "<br>" "text-danger" />
    </div>
</#macro>

<#macro inputDateTime path required=false attributes="">
    <div class="form-group">
        <@spring.bind path />
        <#assign replacedPath = path?replace(".", "-") />
        <#assign dateId = "anytime-month-numeric-${replacedPath}" />
        <@label path required/>
        <div class="input-group">
        <span id="${dateId}-button"
              class="input-group-addon">
            <i class="icon-calendar3"></i>
        </span>
            <input type="text" name="${spring.status.expression}"
                    ${required?string("required","")}
                   id="${dateId}"
                   class="form-control anytime-both"
                    <#if spring.stringStatusValue?? && spring.stringStatusValue?has_content>value="${spring.stringStatusValue?string}"</#if>
                   placeholder="${springMacroRequestContext.getMessage(path)}"
                    ${attributes}>

            <span id="${dateId}-clear"
                  class="input-group-addon">
            <i class="icon-close2"></i>
        </span>
        </div>
        <@spring.showErrors "<br>" "text-danger" />
    </div>
    <script>
        $("#${dateId}").mask('00.00.0000 00:00', {placeholder: "__.__.____ __:__"});

        $("#${dateId}").focusin(function () {

        });

        $("#${dateId}-button").click(function () {
            $("#${dateId}")
                .AnyTime_noPicker()
                .AnyTime_picker({
                    labelTitle: "Выберите дату/время",
                    labelYear: "Год",
                    labelMonth: "Месяц",
                    labelDayOfMonth: "День",
                    labelHour: "Часы",
                    labelMinute: "Минуты",
                    labelSecond: "Секунды",
                    dayNames: ["Воскресенье", "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"],
                    dayAbbreviations: ["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"],
                    monthAbbreviations: ["Янв", "Фев", "Мар", "Апр", "Май", "Июн", "Июл", "Авг", "Сен", "Окт", "Ноя", "Дек"],
                    monthNames: ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"],
                    format: "%d.%m.%Z %H:%i",
                    firstDOW: 1,
                    beforeShow: function () {
                        setTimeout(function () {
                            $('.ui-datepicker').css('z-index', 99999999999999);
                        }, 0);
                    }
                })
                .focus();
        });

        $("#${dateId}-clear").click(function () {
            $("#${dateId}").AnyTime_noPicker();
            $("#${dateId}").val("").change();
        });
    </script>
</#macro>

<#macro inputDate path required=false attributes="">
    <div class="form-group">
        <@spring.bind path />
        <#assign replacedPath = path?replace(".", "-") />
        <#assign dateId = "anytime-month-numeric-${replacedPath}" />
        <@label path required/>
        <div class="input-group">
        <span id="${dateId}-button"
              class="input-group-addon">
            <i class="icon-calendar3"></i>
        </span>
            <input type="text" name="${spring.status.expression}"
                    ${required?string("required","")}
                   id="${dateId}"
                   class="form-control anytime-both"
                    <#if spring.stringStatusValue?? && spring.stringStatusValue?has_content>value="${spring.stringStatusValue?string}"</#if>
                   placeholder="${springMacroRequestContext.getMessage(path)}"
                    ${attributes}>
            <span id="${dateId}-clear"
                  class="input-group-addon">
            <i class="icon-close2"></i>
        </span>
        </div>
        <@spring.showErrors "<br>" "text-danger" />
    </div>
    <script>
        $("#${dateId}").mask('00.00.0000', {placeholder: "__.__.____"});

        $("#${dateId}-button").click(function () {
            $("#${dateId}")
                .AnyTime_noPicker()
                .AnyTime_picker({
                    labelTitle: "Выберите дату",
                    labelYear: "Год",
                    labelMonth: "Месяц",
                    labelDayOfMonth: "День",
                    dayNames: ["Воскресенье", "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"],
                    dayAbbreviations: ["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"],
                    monthAbbreviations: ["Янв", "Фев", "Мар", "Апр", "Май", "Июн", "Июл", "Авг", "Сен", "Окт", "Ноя", "Дек"],
                    monthNames: ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"],
                    format: "%d.%m.%Z",
                    firstDOW: 1,
                    beforeShow: function () {
                        setTimeout(function () {
                            $('.ui-datepicker').css('z-index', 99999999999999);
                        }, 0);
                    }
                })
                .focus();
        });

        $("#${dateId}-clear").click(function () {
            $("#${dateId}").AnyTime_noPicker();
            $("#${dateId}").val("").change();
        });
    </script>
</#macro>

<#macro simpleSelect path options required=false>
    <div class="form-group">
        <@spring.bind path />
        <@label path/>
        <#assign replacedPath = path?replace(".", "-") />
        <#assign selectId = "select-id-${replacedPath}" />
        <div class="col-sm-8">
            <select id="${selectId}" name="position" class="form-control">
                <@enumSelect "positionsSelectName" positions/>
            </select>
        </div>
    </div>

    <script type="application/javascript">
        $("#${selectId}").select2({
            width: "100%",
            minimumResultsForSearch: Infinity
        });
    </script>
</#macro>


<#macro emailSendButton task templates>

    <#if templates?? && templates?has_content>
        <#list templates as template>
            <div align="center">
                <button type="button" class="btn btn-${template.getColor()} send-mail"
                        data-toggle='tooltip' data-placement='right'
                        <#if !(task.getClient().getEmail()?has_content)>title="<@spring.message 'noemail' />"
                        <#else>title="${template.getTitle()} - ${task.getClient().getEmail()}"</#if>
                        <#if !(task.getClient().getEmail()?has_content)>disabled</#if>
                        data-id="${template.getId()}"
                        data-task="#{task.getId()}">
                    ${template.getShortTitle()}
                    <#if task.getEmailTemplateLogs()?? && task.getEmailTemplateLogs()?has_content>
                        <#list task.getEmailTemplateLogs() as templ>
                            <#if templ.isContainStatus(task.getClient(),template)>
                                <@spring.message '${templ.getStatus()}' />
                            </#if>
                        </#list>
                    <#else>
                        <@spring.message 'send.mail' />
                    </#if>
                </button>
            </div>
            <br>
        </#list>
    </#if>
    <script>
        var sendMailButton = $(".send-mail");
        /**
         * Подсказки при наведении на кнопку "Отправить письмо"
         */
        sendMailButton
            .on('mouseover', function () {
                $(this).tooltip('show');
            })
            .on('mouseout', function () {
                $(this).tooltip('hide');
            });

        /**
         * Ajax при клике на кнопку "Отправить письмо"
         */
        sendMailButton
            .on("click", function () {
                var thisHolder = $(this);
                var id = $(this).attr("data-id");
                var task = $(this).attr("data-task");
                thisHolder.prop('disabled', true);

                $.ajax({
                    url: "/api/email-templates/send-mail?id=" + id + "&task=" + task,
                    type: 'POST',
                    contentType: "application/json",
                    success: function (data) {
                        thisHolder.prop('disabled', false);
                        thisHolder.html("<@spring.message 'processed'/> <@spring.message 'send.again'/> <span class='icon-mail-read'></span>");
                        sweetAlert({
                            title: data.data.title,
                            text: data.data.message,
                            type: data.data.type
                        });
                    }
                });
            });
    </script>
</#macro>

<#macro select2list path options value="" nullValue=false multiple=false attributes="">
    <@spring.bind path/>
    <#assign replacedPath = path?replace(".", "-") />
    <#assign selectId = "select-id-${replacedPath}" />

    <div class="form-group">
        <@label path/>
        <select id="${selectId}" ${multiple?then("multiple","")} class="form-control"
                name="${spring.status.expression}" ${attributes}>
            <#list options as option>
                <#if nullValue>
                    <option></option>
                </#if>
                <#assign selected = value?has_content && value.getSelectorId() == option.getSelectorId()>
                <option value="${option.getSelectorId()}" ${selected?then('selected="selected"','')}>${option.getSelectorTitle()}</option>
            </#list>
        </select>
        <@spring.showErrors "<br>" "text-danger" />
    </div>

    <script type="application/javascript">
        $("#${selectId}").select2({
            width: "100%",
            minimumResultsForSearch: Infinity,
            <#if nullValue>
            placeholder: "",
            allowClear: true
            </#if>
        });
    </script>
</#macro>

<#macro select2enum path options value="">
    <@spring.bind path/>
    <#assign replacedPath = path?replace(".", "-") />
    <#assign selectId = "select-id-${replacedPath}" />
    <div class="form-group">
        <@label path/>
        <div class="col-sm-8">
            <select id="${selectId}" class="form-control" name="${spring.status.expression}">
                <#list options as option>
                    <#assign selected = value?has_content && value.getCode() == option.getCode()>
                    <option value="${option.getCode()}"${selected?then(' selected="selected','')}><@spring.message option.name() /></option>
                </#list>
            </select>
            <@spring.showErrors "<br>" "text-danger" />
        </div>
    </div>

    <script type="application/javascript">
        $("#${selectId}").select2({
            width: "100%",
            minimumResultsForSearch: Infinity
        });
    </script>
</#macro>

<#macro fileInput path required=false attributes="">
    <div class="form-group">
        <#assign replacedPath = path?replace("[\\d]", "[]") />
        <#assign replacedId = path?replace("[", "") />
        <#assign replacedId = replacedId?replace("]", "") />
        <#assign replacedId = replacedId?replace(".", "-") />
        <@label path required/>
        <div class="col-sm-12">
            <input id="${replacedId}" name="${replacedPath}" type="file" class="file-styled" ${attributes}/>
        </div>
    </div>
    <script>
        $('input[type=file]').bind('change', function () {
            if ($(this).val().indexOf("..") > 0) {
                swal({
                    title: "<@spring.message "error.title"/>",
                    text: "<@spring.message "error.file-not-contain-double-dot"/>",
                    type: "error"
                });
                $(this).val('');
            } else {
                var sizeOfFiles = 0;
                var inputFiles = $("form :input[type=file]");
                for (var key in inputFiles) {
                    if (inputFiles[key].files && inputFiles[key].files[0]) {
                        sizeOfFiles += inputFiles[key].files[0].size;
                    }
                }
                if (sizeOfFiles > maxFileSizeInBytes) {
                    swal({
                        title: "<@spring.message "error.title"/>",
                        text: "<@spring.message "error.file-more-than-required"/>",
                        type: "error"
                    });
                    $(this).val('');
                }
            }
        });
    </script>
</#macro>

<#macro select2 path url selected attributes="" required=false allowClear=true placeholder="">
    <@spring.bind path/>
    <#assign replacedPath = path?replace(".", "-") />
    <#assign replacedPath = replacedPath?replace("[", "") />
    <#assign replacedPath = replacedPath?replace("]", "") />
    <#assign placeholderPath = path?replace("\\[\\d\\]", "[]", "r") />
    <#assign selectId = "select-id-${replacedPath}" />
    <#assign varId = path?replace(".", "")?replace("[", "")?replace("]", "") />
    <div class="form-group">
        <@label path required/>
        <div class="">
            <select id="${selectId}" name="${spring.status.expression}" ${attributes} ${required?then("required","")}>
                <#if selected?? && selected?has_content>
                    <option value="${selected.getSelectorId()}"
                            selected="selected">${selected.getSelectorTitle()}</option>
                </#if>
            </select>
            <@spring.showErrors "<br>" "text-danger" />
        </div>
    </div>

    <script type="application/javascript">
        var select2${varId} = "${url}";
        $(function () {
            $("#${selectId}").select2({
                width: "100%",
                placeholder: "<@spring.message placeholderPath />",
                allowClear: ${allowClear?c},
                ajax: {
                    url: function () {
                        return select2${varId};
                    },
                    dataType: 'json',
                    delay: 250,
                    data: function (params) {
                        return {
                            q: params.term, // search term
                            page: isNaN(params.page) ? 0 : params.page - 1
                        };
                    },
                    processResults: function (data, params) {
                        return {
                            results: data._embedded ? data._embedded.list : [],
                            pagination: {
                                more: ((data.page.number + 1) * data.page.size) < data.page.totalElements
                            }
                        };
                    },
                    cache: true
                },
                templateSelection: function (data) {
                    return data.selectorTitle || data.title || data.text;
                },
                templateResult: function (data, container) {
                    if (data.className != null)
                        $(container).addClass(data.className);
                    return data.selectorTitle || data.title;
                }
            });
        });
    </script>
</#macro>

<#macro select2WithoutBinding path url selected attributes="" required=false allowClear=false placeholder="">
    <#assign replacedPath = path?replace(".", "-")?replace("[", "")?replace("]", "") />
    <#assign placeholderPath = path?replace("\\[\\d\\]", "[]", "r") />
    <#assign selectId = "select-id-${replacedPath}" />
    <#assign varId = path?replace(".", "")?replace("[", "")?replace("]", "") />
    <div class="">
        <@label path required/>
        <div class="">
            <select id="${selectId}" ${attributes} ${required?then("required","")}>
                <#if selected?? && selected?has_content>
                    <option value="${selected.getSelectorId()}"
                            selected="selected">${selected.getSelectorTitle()}</option>
                </#if>
            </select>
        </div>
    </div>

    <script type="application/javascript">
        var select2${varId} = "${url}";
        $(function () {
            $("#${selectId}").select2({
                width: "100%",
                placeholder: "<@spring.message placeholderPath />",
                allowClear: ${allowClear?c},
                ajax: {
                    url: function () {
                        return select2${varId};
                    },
                    dataType: 'json',
                    delay: 250,
                    data: function (params) {
                        return {
                            q: params.term, // search term
                            page: params.page
                        };
                    },
                    processResults: function (data, params) {
                        console.log("processResults", data);
                        return {
                            results: data._embedded ? data._embedded.list : [],
                            pagination: {
                                more: ((data.page.number + 1) * data.page.size) < data.page.totalElements
                            }
                        };
                    },
                    cache: true
                },
                templateSelection: function (data) {
                    return data.selectorTitle || data.title || data.text;
                },
                templateResult: function (data, container) {
                    if (data.className != null)
                        $(container).addClass(data.className);
                    return data.selectorTitle || data.title;
                }
            });
        });
    </script>
</#macro>

<#macro select2Multiple path url selected required=false attributes="">
    <@spring.bind path/>
    <#assign replacedPath = path?replace(".", "-") />
    <#assign selectId = "select-id-${replacedPath}" />

    <div class="form-group">
        <@label path required/>
        <div class="">
            <select id="${selectId}" multiple="multiple"
                    name="${spring.status.expression}" ${required?then("required","")} ${attributes}>
                <#if selected?has_content>
                    <#if selected?is_enumerable>
                        <#list selected as selectedItem>
                            <option value="${selectedItem.getSelectorId()}"
                                    selected="selected">${selectedItem.getSelectorTitle()}</option>
                        </#list>
                    <#else>
                        <option value="${selected.getSelectorId()}"
                                selected="selected">${selected.getSelectorTitle()}</option>
                    </#if>
                </#if>
            </select>
            <@spring.showErrors "<br>" "text-danger" />
        </div>
    </div>

    <script type="application/javascript">
        $(function () {
            $("#${selectId}").select2({
                width: "100%",
                ajax: {
                    url: "${url}",
                    dataType: 'json',
                    delay: 250,
                    data: function (params) {
                        return {
                            q: params.term, // search term
                            page: isNaN(params.page) ? 0 : params.page - 1
                        };
                    },
                    processResults: function (data, params) {
                        // parse the results into the format expected by Select2
                        // since we are using custom formatting functions we do not need to
                        // alter the remote JSON data, except to indicate that infinite
                        // scrolling can be used

                        return {
                            results: data._embedded ? data._embedded.list : [],
                            pagination: {
                                more: ((data.page.number + 1) * data.page.size) < data.page.totalElements
                            }
                        };
                    },
                    cache: true
                },
                templateSelection: function (data) {
                    return data.title || data.text;
                },
                templateResult: function (data) {
                    return data.title;
                }
            });
        });
    </script>
</#macro>

<#macro printUpdateControl path title="" lastUpdatedAt="">
    <@print path title "icon-pencil" true lastUpdatedAt>
        <#nested />
        <@correctionActionDate />
    </@print>
</#macro>

<#macro print path title="" icon="icon-pencil" showSubmit=true lastUpdatedAt="">
    <@noSubmitPrint path>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h6 class="panel-title">
                    <i class="${icon}"></i>
                    <@spring.message title />
                </h6>
            </div>
            <div class="panel-body">

                <#nested />

                <#if showSubmit>
                    <div class="form-actions text-right">
                        <input type="hidden" name="lastUpdatedAt" value="${lastUpdatedAt}"/>
                        <@inputSubmit />
                        <@inputCancel />
                    </div>
                </#if>
            </div>
        </div>
        <@singleSubmitScript/>
    </@noSubmitPrint>
</#macro>

<#macro correctionActionDate>
    <#if erpp?has_content && erpp.currentCorrection?has_content && erpp.currentCorrection.createdBy.id=user.id>
        <#assign lastActionDate = erpp.actionDate!erpp.updatedAt />
    <#elseif erppSuspect?has_content && erppSuspect.currentCorrection?has_content && erppSuspect.currentCorrection.createdBy.id=user.id>
        <#assign lastActionDate = erppSuspect.actionDate!erppSuspect.updatedAt />
    <#elseif domainActionDate?has_content>
        <#assign lastActionDate = domainActionDate />
    </#if>
    <#if lastActionDate?has_content>
        <div class="action-date-group">
            <div class="form-group">
                <#assign dateId = "anytime-month-numeric-actionDate" />
                <label class="control-label">Дата принятия решения <span style="color:red">*</span> : </label>
                <div class="input-group">
                    <span id="${dateId}-button"
                          class="input-group-addon">
                        <i class="icon-calendar3"></i>
                    </span>
                    <input type="text" name="actionDate" id="${dateId}" class="form-control anytime-both" required/>
                    <span id="${dateId}-clear" class="input-group-addon"><i class="icon-close2"></i></span>
                </div>
            </div>
            <script>
                $("#${dateId}").mask('00.00.0000 00:00', {placeholder: "__.__.____ __:__"});
                $("#${dateId}-button").click(function () {
                    $("#${dateId}")
                        .AnyTime_noPicker()
                        .AnyTime_picker({
                            labelTitle: "Выберите дату/время",
                            labelYear: "Год",
                            labelMonth: "Месяц",
                            labelDayOfMonth: "День",
                            labelHour: "Часы",
                            labelMinute: "Минуты",
                            labelSecond: "Секунды",
                            dayNames: ["Воскресенье", "Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"],
                            dayAbbreviations: ["Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб"],
                            monthAbbreviations: ["Янв", "Фев", "Мар", "Апр", "Май", "Июн", "Июл", "Авг", "Сен", "Окт", "Ноя", "Дек"],
                            monthNames: ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"],
                            format: "%d.%m.%Z %H:%i",
                            firstDOW: 1,
                            beforeShow: function () {
                                setTimeout(function () {
                                    $('.ui-datepicker').css('z-index', 99999999999999);
                                }, 0);
                            }
                        })
                        .focus();
                });

                $("#${dateId}-clear").click(function () {
                    $("#${dateId}").AnyTime_noPicker();
                    $("#${dateId}").val("").change();
                });
            </script>
        </div>
    </#if>
</#macro>

<#macro singleSubmitScript>
    <script>
        $(function () {
            let $form = $("form");
            let requestSent = false;
            $("button[type=submit]").click(function (e) {
                if ($form.valid() && !requestSent) {
                    requestSent = true;
                    $(this).attr("disabled", true);
                    $form.submit();
                }
            });
        });
    </script>
</#macro>

<#macro pdfPreviewScript>
    <script type="text/javascript" src="/assets/js/plugins/pdf/pdfobject.min.js"></script>
    <script>
        $(function () {
            let $form = $("form");

            let requestSent = false;
            $("#submit").click(function (e) {
                if ($form.valid() && !requestSent) {
                    requestSent = true;
                    $(this).attr("disabled", true);
                    $form.submit();
                }
            });

            $("button[type=submit]").unbind("click").bind("click", function (e) {
                e.preventDefault();
                if ($form.valid()) {
                    var formData = new FormData(jQuery('form')[0]);
                    var xhr = new XMLHttpRequest();
                    xhr.open('POST', window.location.href.replace('?', '-preview?'), true);
                    xhr.responseType = "blob";
                    xhr.onload = function () {
                        var fileURL = URL.createObjectURL(xhr.response);
                        PDFObject.embed(fileURL, "#embed");
                        $("#modal_preview").modal('show');
                    };
                    xhr.send(formData);
                }
            });
        });
    </script>
    <div id="modal_preview" class="modal fade">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h5 class="modal-title">Предварительный просмотр</h5>
                </div>

                <div class="modal-body">
                    <div id="embed" style="height: 700px"></div>
                </div>

                <div class="modal-footer">
                    <button id="submit" type="button" class="btn btn-primary">Отправить</button>
                    <button type="button" class="btn btn-link" data-dismiss="modal">Закрыть</button>
                </div>
            </div>
        </div>
    </div>
</#macro>

<#macro printSimple path action>
    <form id="${path}" action="${action}" role="form" method="POST" class="form">
        <#nested />
    </form>
</#macro>

<#macro printFile path edit=true>
    <@noSubmitPrintFile path>
        <div class="panel panel-default">
            <div class="panel-heading"><h6 class="panel-title"><i
                            class="icon-menu"></i> <@spring.message edit?then("edit","new") /></h6></div>
            <div class="panel-body">

                <#nested />

                <div class="form-actions text-right">
                    <@inputSubmit />
                </div>

            </div>
        </div>
    </@noSubmitPrintFile>
</#macro>

<#macro flat path>
    <@noSubmitPrint path>
        <#nested />
        <div class="form-actions text-right">
            <@inputSubmit />
        </div>
    </@noSubmitPrint>
</#macro>

<#macro noSubmitPrint path>
    <form class="form" action="${path}" role="form" method="POST" enctype="multipart/form-data">
        <#nested />
    </form>
</#macro>

<#macro noSubmitPrintFile path>
    <form class="form-horizontal form" action="${path}" role="form" method="POST" enctype="multipart/form-data">
        <#nested />
    </form>
</#macro>

<#macro inputSubmit text="action.accept" class="primary">
    <button type="submit" class="btn btn-${class}"><@spring.message text /></button>
</#macro>

<#macro inputRefresh text="action.cancel" class="default">
    <button type="button" onclick="window.location.reload()" class="btn btn-${class}"><@spring.message text /></button>
</#macro>

<#macro inputResetForm text="action.cancel" class="default">
    <button type="button" onclick="document.querySelector('form').reset()" class="btn btn-${class}"><@spring.message text /></button>
</#macro>

<#macro inputCancel text="action.cancel" class="default">
    <button type="button" onclick="history.back()" class="btn btn-${class}"><@spring.message text /></button>
</#macro>

<#macro textArea path required=false attributes="" info=false>
    <@spring.bind path />
    <div class="form-group">
        <@label path required info/>
        <div class="">
            <#assign attributesOverride = attributes + ' rows="5" cols="5" class="elastic form-control" style="overflow: scroll; word-wrap: break-word; resize: vertical; height: 80px;"'/>
            <#assign attributesOverride = attributesOverride + ' placeholder="${springMacroRequestContext.getMessage(path)}" '/>
            <#if required>
                <#assign attributesOverride = attributesOverride + ' required '/>
            </#if>
            <@spring.formTextarea path attributesOverride/>
        </div>
        <@spring.showErrors "<br>" "text-danger" />
    </div>
</#macro>

<#macro textAreaCustomPlaceholder path placeholder required=false attributes="" info=false>
    <@spring.bind path />
    <div class="form-group">
        <@label path required info/>
        <div class="">
            <#assign attributesOverride = attributes + ' rows="5" cols="5" class="elastic form-control" style="overflow: scroll; word-wrap: break-word; resize: vertical; height: 80px;"'/>
            <#assign attributesOverride = attributesOverride + ' placeholder="${springMacroRequestContext.getMessage(placeholder)}" '/>
            <#if required>
                <#assign attributesOverride = attributesOverride + ' required '/>
            </#if>
            <@spring.formTextarea path attributesOverride/>
        </div>
        <@spring.showErrors "<br>" "text-danger" />
    </div>
</#macro>

<#macro textAreaSimple path required=false>
    <@spring.bind path />
    <div class="form-group">
        <@label path/>
        <@spring.formTextarea path 'rows="5" cols="5" class="elastic form-control" style="overflow: scroll; word-wrap: break-word; resize: horizontal; height: 80px;" ${required?then("required","")}' />
        <@spring.showErrors "<br>" "text-danger" />
    </div>
</#macro>

<#macro radioButtonLabled path values required=false>
    <@spring.bind path />
    <@spring.showErrors "<br>" "text-danger" />
    <@label path required/>
    <div class="form-group">
        <@spring.formRadioButtons path values "&nbsp;" 'class="styled"'/>
    </div>
</#macro>

<#macro radioButtonAsButton path options required=false>
    <@spring.bind path/>
    <@spring.showErrors "<br>" "text-danger" />
    <div class="form-group">
        <div class="btn-group d-flex flex-wrap mb-2">
            <#list options?keys as value>
                <#assign id="${spring.status.expression?replace('[','')?replace(']','')}${value_index}">
                <input type="radio" class="btn-check" autocomplete="off" hidden id="${id}"
                       name="${spring.status.expression}" value="${value}"/>
                <label class="btn type-btn" style="background-color: ${value};" for="${id}"><@spring.message '${options[value]}'/></label>
            </#list>
        </div>
    </div>
</#macro>

<#macro radioButton path values required=false>
    <@spring.bind path />
    <@spring.showErrors "<br>" "text-danger" />
    <div class="form-group">
        <@spring.formRadioButtons path values "&nbsp;" 'class="styled" ${required?then("required","")}' />
    </div>
</#macro>

<#macro radioButtonConference path values>
    <@spring.bind path />
    <@spring.showErrors "<br>" "text-danger" />
    <div class="form-group">
        <@spring.formRadioButtons path values "" 'class="styled"' />
    </div>
</#macro>

<#macro checkBox path required=false >
    <@spring.bind path />
    <#assign replacedPath = path?replace("\\[\\d\\]", "[]", "r") />
    <div class="form-group">
        <div>
            <@spring.formCheckbox path 'class="styled" ${required?then("required","")}'/>
            <label class="control-label">${springMacroRequestContext.getMessage(replacedPath)}</label>
        </div>
        <div>
            <@spring.showErrors "<br>" "text-danger" />
        </div>
    </div>
</#macro>

<#macro select2listExpanded path options selected required=false attribute="">
    <@spring.bind path/>
    <#assign replacedPath = path?replace(".", "-") />
    <#assign selectId = "select-expanded-id-${replacedPath}" />
    <div class="form-group">
        <div class="col-sm-12">
            <@label path required/>
            <br>
            <select id="${selectId}" ${required?then("required","")}
                    name="${spring.status.expression}"
                    ${attribute}
                    class="form-control">
                <#if options?? && options?has_content>
                    <#list options as option>
                        <option value="${option.getSelectorId()}"
                                <#if selected?? && selected?has_content && selected.getSelectorId() ==option.getSelectorId()>selected</#if>>
                            ${option.getSelectorTitle()}
                        </option>
                    </#list>
                </#if>
            </select>
            <@spring.showErrors "<br>" "text-danger" />
        </div>
    </div>
</#macro>

<#macro photoView path photoPath="/" altText="photo" width=300 height=400>
    <div class="form-group">
        <@label path/>
        <div class="col-md-12">
            <img src="${photoPath}" alt="${altText}" width="#{width}" height="#{height}" id="${path?replace(".", "-")}">
        </div>
    </div>
</#macro>

<#macro phycicalApplicantInput path >
    <@inputText "${path}.applicantInn" "text" false "" " minlength='14' maxlength='14' "/>
    <@inputText "${path}.applicantName"/>
    <@inputText "${path}.applicantSurname"/>
    <@inputText "${path}.applicantMiddleName"/>
    <@inputDate "${path}.applicantDateOfBirth"/>
    <@inputText "${path}.applicantAddress"/>
    <@inputText "${path}.applicantPhone"/>
    <script>
        var applicantInn = $("#applicantInn");
        var applicantName = $("#applicantName");
        var applicantSurname = $("#applicantSurname");
        var applicantMiddleName = $("#applicantMiddleName");
        var applicantDateOfBirth = $("#anytime-month-numeric-KuzspFromPhysicalForm-applicantDateOfBirth");
        var applicantAddress = $("#applicantAddress");

        applicantInn.keyup(function () {
            if ($(this).val().length < 14)
                return;
            applicantName.val("");
            applicantSurname.val("");
            applicantMiddleName.val("");
            applicantDateOfBirth.val("");
            applicantAddress.val("");
            $.ajax({
                url: "/api/inn/general/%d".replace("%d", $(this).val()),
                success: function (response) {
                    console.log(response);
                    if (response.error != null)
                        return;
                    applicantName.val(response.name);
                    applicantSurname.val(response.surname);
                    applicantMiddleName.val(response.patronymic);
                    applicantDateOfBirth.val(response.dateOfBirth);
                    applicantAddress.val(response.address);
                    new PNotify({
                        title: 'Внимание!',
                        text: 'Данные по ПИН загружены',
                        icon: 'icon-check',
                        addclass: 'bg-success',
                        type: 'success'
                    });
                },
                error: function (e1, e2, e3) {
                    new PNotify({
                        title: 'Внимание!',
                        text: e1.responseJSON.message,
                        icon: 'icon-blocked',
                        addclass: 'bg-danger',
                        type: 'error'
                    });
                }
            });
        });

    </script>
</#macro>


<#macro inputTextWithHint path fieldType="text" required=false hintText="" class="" attributes=" " allowed=true>
    <div class="form-group">
        <div class="row">
            <div class="col-md-12">
                <@inputText path fieldType required class attributes+"onfocus='hint(this)' onblur='unhint(this)'" allowed />
                <div class="hint form-control">
                    <span><@spring.message "${hintText}"/></span>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function hint(elem) {
            $("div.hint").css("display", "block");
        }

        function unhint(elem) {
            $("div.hint").css("display", "none");
        }
    </script>
</#macro>

<#macro select2MultipleWithHint path url selected required=false hintText="">
    <#assign replacedPathBegin = path?replace(".", "-") />
    <#assign replacedPathEnd = "select-id-${replacedPathBegin}" />
    <div class="form-group">
        <@select2Multiple path url selected required />
        <div class="hint form-control">
            <span><@spring.message "${hintText}"/></span>
        </div>
    </div>
    <script type="text/javascript">
        $('#${replacedPathEnd}').on("select2:open", function (e) {
            $("div.hint").css("display", "block");
        });

        $('#${replacedPathEnd}').on("select2:close", function (e) {
            $("div.hint").css("display", "none");
        });
    </script>
</#macro>

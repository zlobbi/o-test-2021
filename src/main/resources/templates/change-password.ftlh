<#import "/spring.ftl" as spring/>

<form action="/change-password" id="change-pwd" name="change-pwd" method="post">
    <div class="row col-md-12">
        <#------------------------------------------------------------------------------------------------------------>
        <div class="text-center">
            <div class="row text-center" style="color: white; text-align: center">
                <div class="panel-login-form">
                    <div class="text-center" style="padding-bottom: 20px; color: white">
                        <div class="text-center">
                                <span class="glyphicon glyphicon-user panel-login-form-border"
                                      style="font-size: 50px"></span>
                        </div>
                        <small class="panel-small-fonts-min" style="font-size: 16px;">
                            ${user.username}
                        </small>
                        <small class="panel-small-fonts-min" style="font-size: 16px;">
                            <@spring.message 'auth.change-pass'/>
                        </small>
                    </div>

                    <input name="username" value="${user.username!""}" hidden>

                    <div class="form-group has-feedback has-feedback-left">
                        <@spring.bind 'form.oldPassword'/>
                        <input type="password" name="${spring.status.expression}" id="${spring.status.expression}"
                               class="form-control" value="${spring.status.value!''}"
                               placeholder="<@spring.message 'auth.old-pass'/>">
                        <#list spring.status.errorMessages as error>
                            <span class="error">${error}</span>
                            <br>
                        </#list>
                        <div class="form-control-feedback">
                            <i class="icon-lock2 text-muted"></i>
                        </div>
                    </div>
                    <div class="form-group has-feedback has-feedback-left">
                        <@spring.bind 'form.newPassword'/>
                        <input type="password" name="${spring.status.expression}" id="${spring.status.expression}"
                               value="${spring.status.value!''}"
                               class="form-control"
                               placeholder="<@spring.message 'auth.new-pass'/>">
                        <#list spring.status.errorMessages as error>
                            <span class="error">${error}</span>
                            <br>
                        </#list>
                        <div class="form-control-feedback">
                            <i class="icon-lock2 text-muted"></i>
                        </div>
                    </div>
                    <div class="form-group has-feedback has-feedback-left">
                        <@spring.bind 'form.confirmPassword'/>
                        <input type="password" name="confirmPassword" id="confirmPassword"
                               value="${form.confirmPassword!''}"
                               class="form-control"
                               placeholder="<@spring.message 'auth.confirm-pass'/>">
                        <#list spring.status.errorMessages as error>
                            <span class="error">${error}</span>
                            <br>
                        </#list>
                        <div class="form-control-feedback">
                            <i class="icon-lock2 text-muted"></i>
                        </div>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-auth btn-block"
                                style="border-radius: 20px; background-color: lightgrey; color: black;">
                            <@spring.message 'auth.pass-change'/>
                            <i class="icon-circle-right2 position-right"></i>
                        </button>
                        <a href="/" class="btn btn-auth btn-block"
                           style="border-radius: 20px; background-color: lightgrey; color: black;">
                            <@spring.message 'auth.change-back'/>
                            <i class="icon-circle-right2 position-right"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <#------------------------------------------------------------------------------------------------------------>
    </div>
</form>
<script>
    $("#change-pwd").validate({
        rules: {
            newPassword: {
                minlength: 3
            },
            confirmPassword: {
                equalTo: "#newPassword"
            }
        },
        messages: {
            password: {
                minlength: "<@spring.message 'auth.change-pass.min-length'/>",
                equalTo: "<@spring.message 'auth.change-pass.equal-to'/>"
            }
        },
        submitHandler: function (form) {
            form.submit();
        }
    });
</script>
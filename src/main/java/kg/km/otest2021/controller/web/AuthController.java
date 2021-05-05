/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */

package kg.km.otest2021.controller.web;


import kg.km.otest2021.form.user.ChangePasswordForm;
import kg.km.otest2021.service.user.UserDetailsServiceImpl;
import kg.km.otest2021.util.RedirectUtil;
import kg.km.otest2021.validator.PasswordFormValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class AuthController {

    private UserDetailsServiceImpl userService;
    private PasswordFormValidator validator;

    @Autowired
    public AuthController
            (
                    UserDetailsServiceImpl userService,
                    PasswordFormValidator validator
            ) {
        this.userService = userService;
        this.validator = validator;
    }

    @GetMapping("/login")
    public ModelAndView loginPage(
            @RequestParam(required = false, defaultValue = "false") Boolean error
    ) {
        return new ModelAndView("login")
                .addObject("error", error);
    }

    @GetMapping("/change-password")
    public ModelAndView changePassword() {

        return new ModelAndView("change-password")
                .addObject("form", new ChangePasswordForm());
    }

    @PostMapping("/change-password")
    public ModelAndView changePassword
            (
                    @ModelAttribute("form") @Valid ChangePasswordForm form,
                    BindingResult result
            ) {

        validator.validate(form, result);

        if (result.hasErrors())
            return new ModelAndView("change-password")
                    .addObject("form", form);

        userService.changePassword(form);

        return RedirectUtil.redirect("/login");
    }
}

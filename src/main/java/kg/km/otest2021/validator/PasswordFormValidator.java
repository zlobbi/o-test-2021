/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */

package kg.km.otest2021.validator;


import kg.km.otest2021.form.user.ChangePasswordForm;
import kg.km.otest2021.service.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import javax.validation.constraints.NotNull;

@Component
public class PasswordFormValidator implements Validator {

    private final UserDetailsService userDetailsService;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public PasswordFormValidator(
            UserDetailsServiceImpl userDetailsService,
            PasswordEncoder passwordEncoder
    ) {
        this.userDetailsService = userDetailsService;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public boolean supports(@NotNull Class<?> aClass) {
        return ChangePasswordForm.class.isAssignableFrom(aClass);
    }

    @Override
    public void validate(Object o, @NotNull Errors errors) {
        ChangePasswordForm form = (ChangePasswordForm) o;

        UserDetails user = userDetailsService.loadUserByUsername(form.getUsername());
        if (user == null) {
            errors.rejectValue("username", "not-found");
        } else {
            if (!passwordEncoder.matches(form.getOldPassword(), user.getPassword())) {
                errors.rejectValue("oldPassword", "not-matches");
            }

            if (!form.getNewPassword().equals(form.getConfirmPassword())) {
                errors.rejectValue("confirmPassword", "not-matches");
            }
        }
    }

}

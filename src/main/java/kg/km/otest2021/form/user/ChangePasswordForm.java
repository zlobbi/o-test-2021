/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */

package kg.km.otest2021.form.user;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Data
@NoArgsConstructor
public class ChangePasswordForm {

    @NotEmpty
    private String username;

    private String oldPassword;

    @Size(min = 3, max = 12)
    private String newPassword;

    @Size(min = 3, max = 12)
    private String confirmPassword;

    public boolean hasErrors() {
        return newPassword.equals(confirmPassword);
    }
}

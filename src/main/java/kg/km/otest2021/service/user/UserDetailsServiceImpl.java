/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */

package kg.km.otest2021.service.user;

import kg.km.otest2021.entity.user.User;
import kg.km.otest2021.form.user.ChangePasswordForm;
import kg.km.otest2021.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    private final UserRepository userRepository;
    private final PasswordEncoder encoder;

    @Autowired
    public UserDetailsServiceImpl(
            UserRepository userRepository,
            PasswordEncoder encoder
    ) {
        this.userRepository = userRepository;
        this.encoder = encoder;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        if (user == null)
            throw new UsernameNotFoundException(username);
        return user;
    }

    public void changePassword(ChangePasswordForm form) {
        User user = userRepository.findByUsername(form.getUsername());
        user.setPassword(encoder.encode(form.getNewPassword()));
        userRepository.save(user);
    }
}

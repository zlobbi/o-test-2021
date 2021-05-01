/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.service;

import kg.km.otest2021.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleService {

    private final RoleRepository repository;

    @Autowired
    public RoleService(
            RoleRepository repository
    ) {
        this.repository = repository;
    }
}

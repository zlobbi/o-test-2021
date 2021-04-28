/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.service;

import kg.km.otest2021.entity.link.NavbarLink;
import kg.km.otest2021.repository.NavbarLinkRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NavbarLinkService {

    private final NavbarLinkRepository repository;

    @Autowired
    public NavbarLinkService(NavbarLinkRepository repository) {
        this.repository = repository;
    }

    public List<NavbarLink> getActiveLinks() {
        return repository.findAll();
    }
}

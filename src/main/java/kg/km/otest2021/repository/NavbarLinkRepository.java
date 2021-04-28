/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.repository;

import kg.km.otest2021.entity.link.NavbarLink;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NavbarLinkRepository extends JpaRepository<NavbarLink, Long> {
}

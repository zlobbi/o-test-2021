/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */

package kg.km.otest2021.component.navbar;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.List;

@Component
@Scope("prototype")
public class Navbar implements Serializable {

    private static final long serialVersionUID = -7501831494476476374L;

    private List<NavbarItem> navbarItems;

    public Navbar() {
    }

    public List<NavbarItem> getNavbarItems() {
        return navbarItems;
    }

    public Navbar setNavbarItems(List<NavbarItem> navbarItems) {
        this.navbarItems = navbarItems;
        return this;
    }
}

package kg.km.otest2021.component.navbar;

import kg.km.otest2021.entity.link.NavbarLink;
import kg.km.otest2021.service.NavbarLinkService;
import org.springframework.beans.factory.ObjectFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class NavbarBuilder {

    private final NavbarLinkService navbarLinkService;
    private final ObjectFactory<Navbar> sidebarFactory;

    @Autowired
    public NavbarBuilder(
            NavbarLinkService navbarLinkService,
            ObjectFactory<Navbar> sidebarFactory
    ) {
        this.navbarLinkService = navbarLinkService;
        this.sidebarFactory = sidebarFactory;
    }

    public Navbar getNavbar(
    ) {
        List<NavbarLink> navbarLinks = navbarLinkService.getActiveLinks();
        return sidebarFactory
                .getObject().setNavbarItems(navbarLinks
                        .stream().filter(NavbarLink::isActive)
                        .map(navbarLink -> NavbarItem.of(navbarLink.getTitle(), navbarLink.getHref(), navbarLink.getOrder()))
                        .sorted(Comparator.comparingInt(NavbarItem::getOrder))
                        .collect(Collectors.toList())
                );
    }

}

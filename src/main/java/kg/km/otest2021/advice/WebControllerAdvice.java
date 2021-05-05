/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */

package kg.km.otest2021.advice;


import kg.km.otest2021.component.navbar.Navbar;
import kg.km.otest2021.component.navbar.NavbarBuilder;
import kg.km.otest2021.entity.user.User;
import kg.km.otest2021.service.event.EventTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

@ControllerAdvice(basePackages = {"kg.km.otest2021.controller.web"})
public class WebControllerAdvice {

    public static final Logger LOGGER = LoggerFactory.getLogger(WebControllerAdvice.class);

    private final NavbarBuilder navbarBuilder;
    private final EventTypeService eventTypeService;

    @Autowired
    public WebControllerAdvice(
            NavbarBuilder navbarBuilder,
            EventTypeService eventTypeService
    ) {
        this.navbarBuilder = navbarBuilder;
        this.eventTypeService = eventTypeService;
    }

    @ModelAttribute("navigationBar")
    public Navbar navigationBar(
    ) {
        return navbarBuilder.getNavbar();
    }

    @ModelAttribute("eventTypes")
    public Map<String, String> eventTypes(
    ) {
        Map<String, String> types = new HashMap<>();
        eventTypeService.getAll().forEach(e ->
                types.put(e.getColor(), e.getTitle()));
        return types;
    }

    @ModelAttribute("user")
    public User user(@AuthenticationPrincipal User user) {
        return user;
    }

    @ModelAttribute("error")
    public String error(@RequestParam(value = "error", required = false) String error) {
        return error;
    }
}

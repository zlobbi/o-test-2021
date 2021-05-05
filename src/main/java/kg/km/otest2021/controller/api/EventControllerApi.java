/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.controller.api;

import kg.km.otest2021.entity.user.User;
import kg.km.otest2021.service.event.EventService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/event")
public class EventControllerApi {

    private final EventService service;

    public EventControllerApi(EventService service) {
        this.service = service;
    }

    @GetMapping("/all")
    public String getEvents(
            @AuthenticationPrincipal User user
    ) {
        return service.getEventsJsonString(user);
    }

    @GetMapping("/selected-day")
    public String getSelectedDayEvents(
            @AuthenticationPrincipal User user,
            @RequestParam("start") String start,
            @RequestParam("end") String end
    ) {
        return service.getSelectedDayEvents(start, end, user);
    }
}

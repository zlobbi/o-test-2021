/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.controller.api;

import kg.km.otest2021.entity.user.User;
import kg.km.otest2021.service.EventService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

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

    @PostMapping("/selected-day")
    public String getSelectedDayEvents(
            @AuthenticationPrincipal User user,
            @RequestBody Map<String, String> map
    ) {
        return service.getSelectedDayEvents(map, user);
    }
}

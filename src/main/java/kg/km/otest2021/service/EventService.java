/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import kg.km.otest2021.entity.event.Event;
import kg.km.otest2021.entity.event.EventType;
import kg.km.otest2021.form.event.EventForm;
import kg.km.otest2021.form.event.EventResponse;
import kg.km.otest2021.repository.EventRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class EventService {

    private final EventRepository eventRepository;
    private final EventTypeService eventTypeService;

    @Autowired
    public EventService(
            EventRepository eventRepository,
            EventTypeService eventTypeService
    ) {
        this.eventRepository = eventRepository;
        this.eventTypeService = eventTypeService;
    }

    public Event create(EventForm form) {
        Event event = form.toEvent();
        EventType type = eventTypeService.getByColor(form.getType());
        event.setEventType(type);
        return eventRepository.save(event);
    }

    public String getEventsJsonString() {
        List<EventResponse> tasks = eventRepository.findAll()
                .stream()
                .map(e -> new EventResponse().from(e))
                .collect(Collectors.toList());
        ObjectMapper om = new ObjectMapper();
        String eventsJsonString = "";

        try {
            eventsJsonString = om.writeValueAsString(tasks);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        return eventsJsonString;
    }
}

/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.service.event;

import kg.km.otest2021.entity.event.EventType;
import kg.km.otest2021.repository.EventTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventTypeService {

    private final EventTypeRepository eventTypeRepository;

    @Autowired
    public EventTypeService(EventTypeRepository eventTypeRepository) {
        this.eventTypeRepository = eventTypeRepository;
    }

    public List<EventType> getAll() {
        return eventTypeRepository.findAll();
    }

    public EventType getByColor(String type) {
        return eventTypeRepository.findByColor(type);
    }
}

/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.form.event;

import kg.km.otest2021.entity.event.Event;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
public class EventResponse {

    private Long id;

    private String title;

    private String start;

    private String end;

    private String type;

    private String description;

    private String color;

    private String bgColor;

    private boolean expired;

    public EventResponse from(Event task) {
        this.id = task.getId();
        this.title = task.getTitle();
        this.end = task.getEnd().toString();
        this.start = task.getStart().toString();
        this.color = task.getEventType().getColor();
        this.description = task.getDescription();
        this.type = task.getEventType().getTitle();
        this.bgColor = this.type.substring(this.type.indexOf(".") + 1);
        this.expired = LocalDateTime.now().isAfter(task.getEnd());
        return this;
    }
}

/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.form.event;

import kg.km.otest2021.entity.event.Event;
import kg.km.otest2021.util.TimeHelper;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

public class EventForm {

    private Long id;

    @NotBlank
    private String title;

    private String description;

    @NotNull
    @DateTimeFormat(pattern = TimeHelper.DATE_TIME_REVERSE_FORMAT)
    private LocalDateTime start;

    @NotNull
    @DateTimeFormat(pattern = TimeHelper.DATE_TIME_REVERSE_FORMAT)
    private LocalDateTime end;

    private String type = "#f5c6cb";

    public EventForm() {
    }

    public String getTitle() {
        return title;
    }

    public EventForm setTitle(String title) {
        this.title = title;
        return this;
    }

    public LocalDateTime getStart() {
        return start;
    }

    public EventForm setStart(LocalDateTime start) {
        this.start = start;
        return this;
    }

    public LocalDateTime getEnd() {
        return end;
    }

    public EventForm setEnd(LocalDateTime end) {
        this.end = end;
        return this;
    }

    public String getDescription() {
        return description;
    }

    public EventForm setDescription(String description) {
        this.description = description;
        return this;
    }

    public Long getId() {
        return id;
    }

    public EventForm setId(Long id) {
        this.id = id;
        return this;
    }

    public String getType() {
        return type;
    }

    public EventForm setType(String type) {
        this.type = type;
        return this;
    }

    public Event toEvent() {
        return new Event()
                .setTitle(this.title)
                .setDescription(this.description)
                .setStart(this.start)
                .setEnd(this.end);
    }
}

/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.form.response;

import kg.km.otest2021.entity.event.Event;

import java.time.LocalDateTime;

public class EventResponse {

    private Long id;

    private String title;

    private LocalDateTime start;

    private LocalDateTime end;

    private String type;

    private String color;

    public EventResponse() {
    }

    public EventResponse from(Event task) {
        this.id = task.getId();
        this.title = task.getTitle();
        this.end = task.getEnd();
        this.start = task.getStart();
        this.color = task.getEventType().getColor();
        this.type = task.getEventType().getTitle();
        return this;
    }

    public Long getId() {
        return id;
    }

    public EventResponse setId(Long id) {
        this.id = id;
        return this;
    }

    public String getTitle() {
        return title;
    }

    public EventResponse setTitle(String title) {
        this.title = title;
        return this;
    }

    public LocalDateTime getStart() {
        return start;
    }

    public void setStart(LocalDateTime start) {
        this.start = start;
    }

    public LocalDateTime getEnd() {
        return end;
    }

    public void setEnd(LocalDateTime end) {
        this.end = end;
    }

    public String getType() {
        return type;
    }

    public EventResponse setType(String type) {
        this.type = type;
        return this;
    }

    public String getColor() {
        return color;
    }

    public EventResponse setColor(String color) {
        this.color = color;
        return this;
    }
}

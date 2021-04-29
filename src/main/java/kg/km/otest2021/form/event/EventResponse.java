/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.form.event;

import kg.km.otest2021.entity.event.Event;

public class EventResponse {

    private Long id;

    private String title;

    private String start;

    private String end;

    private String type;

    private String color;

    public EventResponse() {
    }

    public EventResponse from(Event task) {
        this.id = task.getId();
        this.title = task.getTitle();
        this.end = task.getEnd().toString();
        this.start = task.getStart().toString();
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

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
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

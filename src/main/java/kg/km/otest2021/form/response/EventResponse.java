/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */

package kg.km.otest2021.form.response;

import kg.km.otest2021.entity.Task;
import kg.km.otest2021.util.TimeHelper;

import java.time.LocalDateTime;

public class EventResponse {

    private Long id;

    private String title;

    private String start;

    private String end;

    private String color;

    public EventResponse() {
    }

    public EventResponse from(Task task) {
        this.id = task.getId();
        this.title = task.getTitle();
        this.end = task.getEnd().toString();
        this.start = task.getStart().toString();
        this.color = "#f5c6cb";
//        this.start = task.getStart().getHour() + task.getEnd().getMinute() == 0 ?
//                task.getStart().format(TimeHelper.DATE_REVERSE_FORMATTER) : getDateString(task.getStart());
        return this;
    }

    private String getDateString(LocalDateTime dateTime) {
        return dateTime.format(TimeHelper.DATE_TIME_PIN_FORMATTER).replace(" ", "T");
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

    public EventResponse setStart(String start) {
        this.start = start;
        return this;
    }

    public String getEnd() {
        return end;
    }

    public EventResponse setEnd(String end) {
        this.end = end;
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

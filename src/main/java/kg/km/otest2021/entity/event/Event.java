/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.entity.event;

import kg.km.otest2021.entity.base.BaseEntity;
import kg.km.otest2021.entity.user.User;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
public class Event extends BaseEntity {

    @Column(name = "title")
    private String title;

    @Column(name = "description")
    private String description;

    @Column(name = "start")
    private LocalDateTime start;

    @Column(name = "end_time")
    private LocalDateTime end;

    @OneToOne
    @JoinColumn(name = "event_type")
    private EventType eventType;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    public String getTitle() {
        return title;
    }

    public Event setTitle(String title) {
        this.title = title;
        return this;
    }

    public String getDescription() {
        return description;
    }

    public Event setDescription(String description) {
        this.description = description;
        return this;
    }

    public LocalDateTime getStart() {
        return start;
    }

    public Event setStart(LocalDateTime start) {
        this.start = start;
        return this;
    }

    public LocalDateTime getEnd() {
        return end;
    }

    public Event setEnd(LocalDateTime end) {
        this.end = end;
        return this;
    }

    public EventType getEventType() {
        return eventType;
    }

    public Event setEventType(EventType eventType) {
        this.eventType = eventType;
        return this;
    }

    public User getUser() {
        return user;
    }

    public Event setUser(User user) {
        this.user = user;
        return this;
    }
}

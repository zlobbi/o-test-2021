/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.entity;

import kg.km.otest2021.entity.base.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import java.time.LocalDateTime;

@Entity
public class Task extends BaseEntity {

    @Column(name = "title")
    private String title;

    @Column(name = "start")
    private LocalDateTime start;

    @Column(name = "end_time")
    private LocalDateTime end;

    public String getTitle() {
        return title;
    }

    public Task setTitle(String title) {
        this.title = title;
        return this;
    }

    public LocalDateTime getStart() {
        return start;
    }

    public Task setStart(LocalDateTime start) {
        this.start = start;
        return this;
    }

    public LocalDateTime getEnd() {
        return end;
    }

    public Task setEnd(LocalDateTime end) {
        this.end = end;
        return this;
    }
}

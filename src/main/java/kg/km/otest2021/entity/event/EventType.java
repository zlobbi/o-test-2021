/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.entity.event;

import kg.km.otest2021.entity.base.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class EventType extends BaseEntity {

    @Column(name = "title")
    private String title;

    @Column(name = "color", unique = true)
    private String color;

    public String getTitle() {
        return title;
    }

    public EventType setTitle(String title) {
        this.title = title;
        return this;
    }

    public String getColor() {
        return color;
    }

    public EventType setColor(String color) {
        this.color = color;
        return this;
    }
}

/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */

package kg.km.otest2021.entity.link;

import kg.km.otest2021.entity.base.BaseEntity;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

@Entity
public class NavbarLink extends BaseEntity {

    @NotNull
    private String title;

    @NotNull
    private String href;

    private boolean active;

    private String color;

    private int order;

    public String getTitle() {
        return title;
    }

    public NavbarLink setTitle(String title) {
        this.title = title;
        return this;
    }

    public int getOrder() {
        return order;
    }

    public NavbarLink setOrder(int order) {
        this.order = order;
        return this;
    }

    public String getHref() {
        return href;
    }

    public NavbarLink setHref(String href) {
        this.href = href;
        return this;
    }

    public boolean isActive() {
        return active;
    }

    public NavbarLink setActive(boolean active) {
        this.active = active;
        return this;
    }

    public String getColor() {
        return color;
    }

    public NavbarLink setColor(String color) {
        this.color = color;
        return this;
    }
}

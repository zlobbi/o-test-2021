/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.component.navbar;


import javax.validation.constraints.NotNull;
import java.io.Serializable;

public class NavbarItem implements Serializable {

    private static final long serialVersionUID = -2953843755539266311L;

    private String title;

    @NotNull
    private String href;

    private boolean active;

    private String color;

    private int order;

    public static NavbarItem of(String title, String href, int order) {
        return new NavbarItem()
                .setTitle(title)
                .setHref(href)
                .setOrder(order);
    }

    private NavbarItem() {
    }

    public String getTitle() {
        return title;
    }

    public NavbarItem setTitle(String title) {
        this.title = title;
        return this;
    }

    public String getHref() {
        return href;
    }

    public NavbarItem setHref(String href) {
        this.href = href;
        return this;
    }

    public boolean isActive() {
        return active;
    }

    public NavbarItem setActive(boolean active) {
        this.active = active;
        return this;
    }

    public String getColor() {
        return color;
    }

    public NavbarItem setColor(String color) {
        this.color = color;
        return this;
    }

    public int getOrder() {
        return order;
    }

    public NavbarItem setOrder(int order) {
        this.order = order;
        return this;
    }
}
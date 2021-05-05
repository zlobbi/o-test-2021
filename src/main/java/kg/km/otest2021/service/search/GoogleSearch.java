/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.service.search;

import kg.km.otest2021.form.search.SearchResponse;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Service
public class GoogleSearch extends SearchService<SearchResponse> {

    private String url = "https://www.google.com/search?q=XSPX";

    private final String parentTag = "a";

    private final String titleTag = "h3";

    @Override
    public String getUrl(String searchParam) throws UnsupportedEncodingException {
        String sp = URLEncoder.encode(String.format("intitle:\"%s\"", searchParam), "UTF-8");
        return url.replaceAll("XSPX", sp);
    }

    @Override
    public String getParentTag() {
        return parentTag;
    }

    @Override
    public String getTitleTag() {
        return titleTag;
    }
}

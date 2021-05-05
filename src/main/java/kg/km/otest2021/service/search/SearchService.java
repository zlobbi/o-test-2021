/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.service.search;

import com.fasterxml.jackson.core.JsonProcessingException;
import kg.km.otest2021.form.search.SearchResponse;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

@Service
public abstract class SearchService<R> {

    @Value("user.agent")
    private String uAgent;

    public SearchService() {
    }

    public abstract String getUrl(String searchParam) throws UnsupportedEncodingException;

    public abstract String getParentTag();

    public abstract String getTitleTag();

    public List<SearchResponse> sendRequest(String searchParam) {
        List<SearchResponse> responses = new ArrayList<>();
        try {
            String requestQuery = getUrl(searchParam);
            Document doc = Jsoup.connect(requestQuery).userAgent(uAgent).get();
            Elements elements = doc.getElementsByTag(getParentTag());

            SearchResponse response = new SearchResponse();

            int counter = 0;

            for (Element e : elements) {
                String href = e.absUrl("href");
                String txt = e.getElementsByTag(getTitleTag()).text();

                if (!txt.isBlank()) {
                    response.setHref(href);
                    response.setTitle(txt);
                    responses.add(response);
                    counter++;
                }

                if (counter == 4)
                    break;
            }

        } catch (UnsupportedEncodingException | JsonProcessingException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return responses;
    }
}

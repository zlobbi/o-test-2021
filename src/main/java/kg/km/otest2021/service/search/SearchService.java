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
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.function.ServerResponse;

import java.io.UnsupportedEncodingException;
import java.util.LinkedList;
import java.util.List;

@Service
public abstract class SearchService<R> {

    private final RestTemplate restTemplate = new RestTemplate();

    @Value("user.agent")
    private String uAgent;

    public SearchService() {
    }

    public abstract String getUrl(String searchParam) throws UnsupportedEncodingException;

    public abstract String getParentTag();

    public abstract String getTitleTag();

    public abstract R getResponseInstance();

    public List<SearchResponse> sendRequest(String searchParam) {
        R response = getResponseInstance();
        try {

            String requestQuery = getUrl(searchParam);
            Document doc = Jsoup.connect(requestQuery).userAgent(uAgent).get();
            Elements elements = doc.getElementsByTag(getParentTag());

            List<SearchResponse> responses = new LinkedList<>();
            int counter = 0;
            for (Element res : elements) {
                if (res.children().size() > 0) {
                    String txt = res.getElementsByTag(getTitleTag()).text();
                    if (!txt.isEmpty()) {

                        counter++;
                    }
                }
                if (counter == 6)
                    break;
            }

        } catch (UnsupportedEncodingException | JsonProcessingException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}

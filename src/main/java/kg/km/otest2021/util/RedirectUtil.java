package kg.km.otest2021.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class RedirectUtil {
    public static final Logger LOGGER = LoggerFactory.getLogger(RedirectUtil.class);

    public static ModelAndView redirect(String path) {
        RedirectView view = new RedirectView();
        view.setUrl(path);
        view.setExposeModelAttributes(false);
        return new ModelAndView(view);
    }

    public static ModelAndView redirect(String path, Map<String, String> params) {
        RedirectView view = new RedirectView();
        view.setUrl(handleParams(path, params));
        view.setExposeModelAttributes(false);
        return new ModelAndView(view);
    }

    private static String handleParams(String path, Map<String, String> params) {
        if (params != null) {
            path += "?";
            StringBuilder pathBuilder = new StringBuilder(path);
            for (Map.Entry<String, String> entry : params.entrySet()) {
                pathBuilder.append(entry.getKey());
                pathBuilder.append("=");
                try {
                    pathBuilder.append(URLEncoder.encode(entry.getValue(), "UTF-8"));
                } catch (UnsupportedEncodingException e) {
                    LOGGER.error(e.getMessage(), e);
                }
                pathBuilder.append("&");
            }
            path = pathBuilder.toString().substring(0, pathBuilder.toString().length() - 1);
        }
        return path;
    }

    public static RedirectView redirect
            (
                    String path,
                    String message,
                    Long selector,
                    RedirectAttributes attributes
            ) {

        RedirectView redirectView = new RedirectView(path, true);
        Map<String, String> params = new HashMap<>();
        params.put("message", message);
        params.put("selector", String.valueOf(selector));
        attributes.addFlashAttribute("params", params);

        return redirectView;
    }

}

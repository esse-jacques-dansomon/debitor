package me.essejacques.shop_api.dtos;

import org.springframework.http.HttpStatus;

import java.util.HashMap;
import java.util.Map;

public class RestResponse {
    public static Map<Object, Object> response(Object data, Object pages, Object currentPage, Object totalItems,
            Object totalPages, HttpStatus status) {
        Map<Object, Object> response = response(data, status);
        response.put("status", status.value());
        response.put("data", data);
        response.put("pages", pages);
        response.put("currentPage", currentPage);
        response.put("totalItems", totalItems);
        response.put("totalPages", totalPages);
        return response;
    }

    public static Map<Object, Object> response(Object data, HttpStatus status) {
        Map<Object, Object> response = new HashMap<Object, Object>();
        response.put("status", status.value());
        response.put("data", data);
        return response;
    }
}
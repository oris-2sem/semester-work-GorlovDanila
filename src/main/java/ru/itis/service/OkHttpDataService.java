package ru.itis.service;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import okhttp3.HttpUrl;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.springframework.stereotype.Service;
import ru.itis.controller.config.ExternalApiConfigurationProperties;

import java.io.IOException;
import java.util.Objects;

@RequiredArgsConstructor
@Slf4j
@Service
public class OkHttpDataService {
    private final ExternalApiConfigurationProperties properties;

    public boolean checkValidNumber(String number) {

        if (number.startsWith("+"))
            number = number.replace("+", "");

        OkHttpClient client = new OkHttpClient();

        HttpUrl.Builder urlBuilder = Objects.requireNonNull(HttpUrl.parse("https://api.apilayer.com/number_verification/validate"))
                .newBuilder();
        urlBuilder.addQueryParameter("number", number);

        String url = urlBuilder.build().toString();
        String apiKey = properties.getNumberToken();

        Request request = new Request.Builder()
                .url(url)
                .header("apikey", apiKey)
                .build();

        try(Response response = client.newCall(request).execute()) {
            if (response.isSuccessful()) {
                JsonObject jsonObject = JsonParser.parseString(Objects.requireNonNull(response.body()).string()).getAsJsonObject();
                boolean result = jsonObject.get("valid").getAsBoolean();
                System.out.println(result);
                if (result)
                    return true;
            }
        } catch (IOException e) {
            log.error(String.valueOf(e));
        }
        return false;
    }
}

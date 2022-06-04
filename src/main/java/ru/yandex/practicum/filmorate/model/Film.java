package ru.yandex.practicum.filmorate.model;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import ru.yandex.practicum.filmorate.validator.ReleaseDate;

import javax.validation.constraints.*;

@Data
public class Film {
//    @Positive(message = "Film ID should be positive")
    private int id;
    @NotNull(message = "Name can't be null")
    @NotBlank(message = "Name can't be blanc")
    private String name;
    @Size(max=200, message = "Description size can't be more than 200 symbols")
    private String description;
    @ReleaseDate(message = "Release date should be after 28.12.1895")
    private LocalDate releaseDate;
    @Positive(message = "Duration in seconds should be positive number")
    private int duration;
    private Set<Integer> usersLikedIds = new HashSet<>();
    public int countUsersLiked() { return usersLikedIds.size(); }
}



import 'dart:convert';

SearchFilmModel searchFilmModelFromJson(String str) => SearchFilmModel.fromJson(json.decode(str));

String searchFilmModelToJson(SearchFilmModel data) => json.encode(data.toJson());

class SearchFilmModel {
    List<Doc> docs;
    int total;
    int limit;
    int page;
    int pages;

    SearchFilmModel({
        required this.docs,
        required this.total,
        required this.limit,
        required this.page,
        required this.pages,
    });

    factory SearchFilmModel.fromJson(Map<String, dynamic> json) => SearchFilmModel(
        docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
        total: json["total"],
        limit: json["limit"],
        page: json["page"],
        pages: json["pages"],
    );

    Map<String, dynamic> toJson() => {
        "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
        "total": total,
        "limit": limit,
        "page": page,
        "pages": pages,
    };
}

class Doc {
    int id;
    NameEnum name;
    String alternativeName;
    String enName;
    Type type;
    int year;
    String description;
    String shortDescription;
    int movieLength;
    bool isSeries;
    bool ticketsOnSale;
    int? totalSeriesLength;
    int? seriesLength;
    String? ratingMpaa;
    int? ageRating;
    dynamic top10;
    dynamic top250;
    int typeNumber;
    String? status;
    List<NameElement> names;
    ExternalId externalId;
    Logo logo;
    Backdrop poster;
    Backdrop backdrop;
    Rating rating;
    Rating votes;
    List<Country> genres;
    List<Country> countries;
    List<ReleaseYear> releaseYears;

    Doc({
        required this.id,
        required this.name,
        required this.alternativeName,
        required this.enName,
        required this.type,
        required this.year,
        required this.description,
        required this.shortDescription,
        required this.movieLength,
        required this.isSeries,
        required this.ticketsOnSale,
        required this.totalSeriesLength,
        required this.seriesLength,
        required this.ratingMpaa,
        required this.ageRating,
        required this.top10,
        required this.top250,
        required this.typeNumber,
        required this.status,
        required this.names,
        required this.externalId,
        required this.logo,
        required this.poster,
        required this.backdrop,
        required this.rating,
        required this.votes,
        required this.genres,
        required this.countries,
        required this.releaseYears,
    });

    factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        id: json["id"],
        name: nameEnumValues.map[json["name"]]!,
        alternativeName: json["alternativeName"],
        enName: json["enName"],
        type: typeValues.map[json["type"]]!,
        year: json["year"],
        description: json["description"],
        shortDescription: json["shortDescription"],
        movieLength: json["movieLength"],
        isSeries: json["isSeries"],
        ticketsOnSale: json["ticketsOnSale"],
        totalSeriesLength: json["totalSeriesLength"],
        seriesLength: json["seriesLength"],
        ratingMpaa: json["ratingMpaa"],
        ageRating: json["ageRating"],
        top10: json["top10"],
        top250: json["top250"],
        typeNumber: json["typeNumber"],
        status: json["status"],
        names: List<NameElement>.from(json["names"].map((x) => NameElement.fromJson(x))),
        externalId: ExternalId.fromJson(json["externalId"]),
        logo: Logo.fromJson(json["logo"]),
        poster: Backdrop.fromJson(json["poster"]),
        backdrop: Backdrop.fromJson(json["backdrop"]),
        rating: Rating.fromJson(json["rating"]),
        votes: Rating.fromJson(json["votes"]),
        genres: List<Country>.from(json["genres"].map((x) => Country.fromJson(x))),
        countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
        releaseYears: List<ReleaseYear>.from(json["releaseYears"].map((x) => ReleaseYear.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameEnumValues.reverse[name],
        "alternativeName": alternativeName,
        "enName": enName,
        "type": typeValues.reverse[type],
        "year": year,
        "description": description,
        "shortDescription": shortDescription,
        "movieLength": movieLength,
        "isSeries": isSeries,
        "ticketsOnSale": ticketsOnSale,
        "totalSeriesLength": totalSeriesLength,
        "seriesLength": seriesLength,
        "ratingMpaa": ratingMpaa,
        "ageRating": ageRating,
        "top10": top10,
        "top250": top250,
        "typeNumber": typeNumber,
        "status": status,
        "names": List<dynamic>.from(names.map((x) => x.toJson())),
        "externalId": externalId.toJson(),
        "logo": logo.toJson(),
        "poster": poster.toJson(),
        "backdrop": backdrop.toJson(),
        "rating": rating.toJson(),
        "votes": votes.toJson(),
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
        "releaseYears": List<dynamic>.from(releaseYears.map((x) => x.toJson())),
    };
}

class Backdrop {
    String? url;
    String? previewUrl;

    Backdrop({
        required this.url,
        required this.previewUrl,
    });

    factory Backdrop.fromJson(Map<String, dynamic> json) => Backdrop(
        url: json["url"],
        previewUrl: json["previewUrl"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "previewUrl": previewUrl,
    };
}

class Country {
    String name;

    Country({
        required this.name,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}

class ExternalId {
    int? tmdb;
    String? imdb;
    String? kpHd;

    ExternalId({
        this.tmdb,
        this.imdb,
        this.kpHd,
    });

    factory ExternalId.fromJson(Map<String, dynamic> json) => ExternalId(
        tmdb: json["tmdb"],
        imdb: json["imdb"],
        kpHd: json["kpHD"],
    );

    Map<String, dynamic> toJson() => {
        "tmdb": tmdb,
        "imdb": imdb,
        "kpHD": kpHd,
    };
}

class Logo {
    String? url;

    Logo({
        required this.url,
    });

    factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}

enum NameEnum {
    EMPTY
}

final nameEnumValues = EnumValues({
    "Джокер": NameEnum.EMPTY
});

class NameElement {
    String name;
    String? language;
    dynamic type;

    NameElement({
        required this.name,
        this.language,
        this.type,
    });

    factory NameElement.fromJson(Map<String, dynamic> json) => NameElement(
        name: json["name"],
        language: json["language"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "language": language,
        "type": type,
    };
}

class Rating {
    double kp;
    double imdb;
    double filmCritics;
    double russianFilmCritics;
    int? ratingAwait;

    Rating({
        required this.kp,
        required this.imdb,
        required this.filmCritics,
        required this.russianFilmCritics,
        required this.ratingAwait,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        kp: json["kp"]?.toDouble(),
        imdb: json["imdb"]?.toDouble(),
        filmCritics: json["filmCritics"]?.toDouble(),
        russianFilmCritics: json["russianFilmCritics"]?.toDouble(),
        ratingAwait: json["await"],
    );

    Map<String, dynamic> toJson() => {
        "kp": kp,
        "imdb": imdb,
        "filmCritics": filmCritics,
        "russianFilmCritics": russianFilmCritics,
        "await": ratingAwait,
    };
}

class ReleaseYear {
    int start;
    int end;

    ReleaseYear({
        required this.start,
        required this.end,
    });

    factory ReleaseYear.fromJson(Map<String, dynamic> json) => ReleaseYear(
        start: json["start"],
        end: json["end"],
    );

    Map<String, dynamic> toJson() => {
        "start": start,
        "end": end,
    };
}

enum Type {
    MOVIE,
    TV_SERIES
}

final typeValues = EnumValues({
    "movie": Type.MOVIE,
    "tv-series": Type.TV_SERIES
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}

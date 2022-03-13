class MovieModel {
  MovieModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  final int? page;
  final List<Result>? results;
  final int? totalPages;
  final int? totalResults;

  static MovieModel? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return MovieModel(
      page: json["page"],
      results:
          List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      totalPages: json["total_pages"],
      totalResults: json["total_results"],
    );
  }
}

class Result {
  Result({
    this.video,
    this.voteAverage,
    this.title,
    this.overview,
    this.releaseDate,
    this.adult,
    this.backdropPath,
    this.voteCount,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.popularity,
    this.mediaType,
    this.originalName,
    this.firstAirDate,
    this.name,
    this.originCountry,
  });

  final bool? video;
  final double? voteAverage;
  final String? title;
  final String? overview;
  final String? releaseDate;
  final bool? adult;
  final String? backdropPath;
  final int? voteCount;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? posterPath;
  final double? popularity;
  final String? mediaType;
  final String? originalName;
  final String? firstAirDate;
  final String? name;
  final List<String>? originCountry;

  static Result? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;

    return Result(
      video: json["video"] == null ? null : json["video"],
      voteAverage: json["vote_average"].toDouble(),
      title: json["title"] == null ? null : json["title"],
      overview: json["overview"],
      releaseDate: json["release_date"] == null ? null : json["release_date"],
      adult: json["adult"] == null ? null : json["adult"],
      backdropPath: json["backdrop_path"],
      voteCount: json["vote_count"],
      genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
      id: json["id"],
      originalLanguage: json["original_language"],
      originalTitle:
          json["original_title"] == null ? null : json["original_title"],
      posterPath: json["poster_path"],
      popularity: json["popularity"].toDouble(),
      mediaType: json["media_type"],
      originalName:
          json["original_name"] == null ? null : json["original_name"],
      firstAirDate:
          json["first_air_date"] == null ? null : json["first_air_date"],
      name: json["name"] == null ? null : json["name"],
      originCountry: json["origin_country"] == null
          ? null
          : List<String>.from(json["origin_country"].map((x) => x)),
    );
  }
}

class Movie {
  int? _id;

  String? _overview;

  String? _posterPath;

  String? _title;

  double? _voteAverage;

  Movie({
    int? id,
    String? overview,
    String? posterPath,
    String? title,
    double? voteAverage,
  }) {
    if (id != null) {
      this._id = id;
    }

    if (overview != null) {
      this._overview = overview;
    }

    if (posterPath != null) {
      this._posterPath = posterPath;
    }

    if (title != null) {
      this._title = title;
    }

    if (voteAverage != null) {
      this._voteAverage = voteAverage;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;

  String? get overview => _overview;
  set overview(String? overview) => _overview = overview;

  String? get posterPath => _posterPath;
  set posterPath(String? posterPath) => _posterPath = posterPath;

  String? get title => _title;
  set title(String? title) => _title = title;

  double? get voteAverage => _voteAverage;
  set voteAverage(double? voteAverage) => _voteAverage = voteAverage;

  Movie.fromJson(Map<String, dynamic> json) {
    _id = json['id'];

    _overview = json['overview'];

    _posterPath = json['poster_path'];

    _title = json['title'];

    _voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this._id;

    data['overview'] = this._overview;

    data['poster_path'] = this._posterPath;

    data['title'] = this._title;

    data['vote_average'] = this._voteAverage;

    return data;
  }
}

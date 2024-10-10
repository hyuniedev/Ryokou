class Rate {
  String? _id;
  late final String _tour; // YK8pRRMNdJEYqRO5W616
  late final String _user; // 95pOm9s2gVZtOU2TMrKykzXmsPt1
  late final int _star; // 4
  late final String _comment; //

  set id(String? value) => _id = value;
  set tour(String value) => _tour = value;
  set user(String value) => _user = value;
  set comment(String value) => _comment = value;

  String? get id => _id;
  String get tour => _tour;
  String get user => _user;
  int get star => _star;
  String get comment => _comment;

  Rate({
    required String user,
    required String tour,
    required int star,
    required String comment,
  })  : _user = user,
        _tour = tour,
        _star = star,
        _comment = comment;

  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'user': _user,
      'tour': _tour,
      'star': _star,
      'comment': _comment
    };
  }

  factory Rate.fromJson(Map<String, dynamic> json) {
    return Rate(
        user: json['user'],
        tour: json['tour'],
        star: json['star'],
        comment: json['comment']);
  }
}

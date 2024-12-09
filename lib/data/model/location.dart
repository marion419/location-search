class Location {
  String title;
  String category;
  String roadAddress;
  String link;
  String latitude;
  String longitude;

  Location({
    required this.title,
    required this.category,
    required this.roadAddress,
    required this.link,
    required this.latitude,
    required this.longitude,
  });

  Location.fromJson(Map<String, dynamic> map)
      : this(
          title: map['title'],
          category: map['category'],
          roadAddress: map['roadAddress'],
          link: map['link'],
          latitude: map['mapx'],
          longitude: map['mapy'],
        );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'roadAddress': roadAddress,
      'link': link,
      'mapx': latitude,
      'mapy': longitude,
    };
  }
}

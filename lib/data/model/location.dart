class Location {
  String title;
  String category;
  String address;

  Location({
    required this.title,
    required this.category,
    required this.address,
  });

  Location.fromJson(Map<String, dynamic> map)
      : this(
          title: map['title'],
          category: map['category'],
          address: map['address'],
        );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'address': address,
    };
  }
}

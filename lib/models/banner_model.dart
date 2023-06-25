class Banner {
  String key;
  String value;

  Banner({required this.key, required this.value});

  factory Banner.fromJson(Map<String, dynamic> json) {
    print(json);
    return Banner(
      key: json['key'],
      value: json['value'],
    );
  }
}
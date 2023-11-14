class YesNoEntity {
  final String answer;
  final bool forced;
  final String image;
  YesNoEntity(
      {required this.answer, required this.forced, required this.image});

  factory YesNoEntity.fromJsonMap(Map<String, dynamic> json) => YesNoEntity(
      answer: json['answer'], forced: json['forced'], image: json['image']);
}

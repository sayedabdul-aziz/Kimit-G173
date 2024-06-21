class Doctor {
  final String name;
  final String imageUrl;
  final String specialization;
  final int rating;
  final String email;
  final String startHour;
  final String endHour;
  final String location;

  Doctor(
      {required this.name,
      required this.imageUrl,
      required this.specialization,
      required this.rating,
      required this.email,
      required this.startHour,
      required this.endHour,
      required this.location});

  // factory Doctor.fromJson(Map<String, dynamic> json) {
  //   return Doctor(
  //       name: json['name'],
  //       imageUrl: json['image'],
  //       specialization: json['specialization'],
  //       rating: json['rating'],
  //       email: json['email'],
  //       startHour: json['startHour'],
  //       endHour: json['endHour'],
  //       location: json['location']);
  // }
}

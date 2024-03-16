class UserModel {
  final String name;
  final String image;
  final String lastMsg;
  final String time;

  UserModel(
      {required this.name,
      required this.image,
      required this.lastMsg,
      required this.time});
}

List<UserModel> users = [
  UserModel(
      name: 'Mohammed Salah',
      image:
          'https://ichef.bbci.co.uk/news/976/cpsprodpb/12DB/production/_104172840_gettyimages-923757862.jpg',
      lastMsg: 'Hi Mo!',
      time: '12:00 PM'),
  UserModel(
      name: 'Ahmed Sayed Zizo',
      image:
          'https://upload.wikimedia.org/wikipedia/commons/4/43/Ahmed_Mostafa_Zizo.jpg',
      lastMsg: 'Hi Zizo!',
      time: '11:00 PM'),
  UserModel(
      name: 'Shika',
      image:
          'https://ichef.bbci.co.uk/news/976/cpsprodpb/12DB/production/_104172840_gettyimages-923757862.jpg',
      lastMsg: 'Hi Shika!',
      time: '11:00 PM'),
  UserModel(
      name: 'Elshenawy',
      image:
          'https://ichef.bbci.co.uk/news/976/cpsprodpb/12DB/production/_104172840_gettyimages-923757862.jpg',
      lastMsg: 'Hi ElShenawy!',
      time: '9:00 PM'),
];

class OnboardingModel {
  final String title;
  final String description;
  final String image;

  OnboardingModel(
      {required this.title, required this.description, required this.image});
}

List<OnboardingModel> pages = [
  OnboardingModel(
      image: 'assets/on1.svg',
      title: 'ابحث عن دكتور متخصص',
      description:
          'اكتشف مجموعة واسعة من الأطباء الخبراء والمتخصصين في مختلف المجالات.'),
  OnboardingModel(
      image: 'assets/on2.svg',
      title: 'سهولة الحجز',
      description: 'احجز المواعيد بضغطة زرار في أي وقت وفي أي مكان.'),
  OnboardingModel(
      image: 'assets/on3.svg',
      title: 'آمن وسري',
      description: 'كن مطمئنًا لأن خصوصيتك وأمانك هما أهم أولوياتنا.')
];

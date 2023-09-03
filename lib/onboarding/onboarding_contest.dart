class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Say No to Sexual Harrasment",
    image: "assets/images/image-home1.png",
    desc: "",
  ),
  OnboardingContents(
    title: "Video dan Artikel",
    image: "assets/images/home4.png",
    desc: "Yuk Jaga Diri dengan Edukasi",
  ),
  OnboardingContents(
    title: "QUIZ",
    image: "assets/images/home3.png",
    desc: "Yuk Refleksikan Pemahamanmu",
  ),
  OnboardingContents(
    title: "Lapor Aksi",
    image: "assets/images/home3.png",
    desc: "Kerahasiaan Terjamin di Bawah Perlindungan TESAGA",
  ),
];

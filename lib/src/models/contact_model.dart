part of 'models.dart';

class ContactModel {
  final String name;
  final String imageAssets;
  final String message;

  ContactModel(this.name, this.imageAssets, this.message);
}

List<ContactModel> contacts = [
  ContactModel(
      'Maudy Ayunda', 'assets/images/Maudy Ayunda.jpg', 'Kangen nih..'),
  ContactModel('Mawar Eva De Jongh', 'assets/images/Mawar Eva De Jongh.jpg',
      'Hi, apa kabar?'),
  ContactModel(
      'Keisya Levronka', 'assets/images/Keisya Levronka.jpg', 'Balikan Yuk'),
  ContactModel(
      'Kimberly', 'assets/images/Kimberly.jpg', 'Angkat telfon aku please...'),
  ContactModel(
      'Pevita Pearce', 'assets/images/Pevita Pearce.jpg', 'Beb kamu dimana??'),
  ContactModel(
      'Wulan Guritno', 'assets/images/Wulan Guritno.jpg', 'Merindumu...'),
  ContactModel(
      'Aril Tatum', 'assets/images/Aril Tatum.png', 'Plase balikan sama aku..'),
  ContactModel(
      'Yuki Kato', 'assets/images/Yuki Kato.jpg', 'Tiba2 ingat kamu..'),
  ContactModel('Mikha Tambahyong', 'assets/images/Mikha Tambahyong.jpeg',
      'Kenangan terindah...'),
  ContactModel('Michelle Ziudith', 'assets/images/Michelle Ziudith.jpg',
      'Sulit untuk dilupakan'),
];

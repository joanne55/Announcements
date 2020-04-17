import 'package:announcement_test/models/announcement_question.dart';

class Announcement{

  int id;
  String title;
  String description;
  List<String> acknowledgeMembers = ['0 Acknowledged'];
  List<String> notes = ['0 Notes'];
  List<Question> questions = [];

  Announcement({this.id, this.title, this.description});
}

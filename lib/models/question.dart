import 'dart:io';

class Question {
   String question;
   String answer;
   String option1;
   String option2;
   String option3;
   String option4;
   String explanation;

  //This 2 variables are optional
  //Image is the data you store inside firebase
  String image;
  //This is used for picking images from gallery
  File imageFile;
  String firebaseImgDownloadURL;

  Question({this.question,this.answer,this.option1,this.option2,this.option3,this.option4,this.explanation,this.image,this.imageFile, this.firebaseImgDownloadURL});
}
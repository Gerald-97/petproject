import 'package:rgproject/extras/strings.dart';

class Slides {
  final String headline;
  final String title;
  final String image;

  Slides(this.headline, this.title, this.image);
}

List<Slides> slidesList = [
  Slides(
    Strings.slide_heading_1,
    Strings.slide_title_1,
    Strings.blank,
  ),
  Slides(
    Strings.slide_heading_2,
    Strings.slide_title_2,
    Strings.image_slide_1,
  ),
  Slides(
    Strings.slide_heading_3,
    Strings.slide_title_3,
    Strings.image_slide_2,
  ),
];

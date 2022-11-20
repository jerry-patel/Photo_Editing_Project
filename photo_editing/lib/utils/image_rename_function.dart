String imageNameRenameFunction() {
  String imageName = '';
  DateTime time = DateTime.now();
  String imgDateAndTime = "${time.hour}_${time.minute}_${time.second}_${time.day}_${time.month}_${time.year}";

  imageName = "photoEditing_$imgDateAndTime";

  return imageName;
}
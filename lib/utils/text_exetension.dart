extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }

  String capitalizeEach() {
    var wordsArr = this.split(' ');
    for (var i = 0; i < wordsArr.length; i++) {
      wordsArr[i] = wordsArr[i][0].toUpperCase() + wordsArr[i].substring(1);
    }
    return wordsArr.join(' ');
  }
}
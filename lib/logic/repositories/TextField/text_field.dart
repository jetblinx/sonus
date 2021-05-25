import 'dart:async';

class TextBloc {
  var _textController = StreamController<String>();
  Stream<String> get textStream => _textController.stream;

  updateText(String text) {
    (text == null || text == "")
        ? _textController.sink.addError("Invalid value entered!")
        : _textController.sink.add(text);
  }

  dispose() {
    _textController.close();
  }
}

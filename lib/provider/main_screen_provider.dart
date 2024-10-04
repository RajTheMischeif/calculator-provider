import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MainScreenProvider extends ChangeNotifier {
  late String _displayText = '';
  double first = 0;
  double second = 0;
  String numberHolder = '';
  String opp = '';

  String get displayTxt => _displayText;

  void addBtnVal(String btnVal) {
    print(_displayText);
    print(_displayText.length);
    print(opp);
    print(numberHolder);
    if (_displayText.startsWith('0')) {
      _displayText = _displayText.substring(1);
    } else if (_displayText.startsWith('+') ||
        _displayText.startsWith('x') ||
        _displayText.startsWith('/')) {
      _displayText = '';
      notifyListeners();
      numberHolder = '';
      opp = '';
    } else if (_displayText.startsWith('-') && _displayText.length < 2) {
      // numberHolder.value = '';
      opp = '';
    }
    if (btnVal == 'AC') {
      opp = '';
      first = 0;
      numberHolder = '';
      _displayText = '';
      notifyListeners();
    } else if (btnVal == '/' ||
        btnVal == 'x' ||
        btnVal == '-' ||
        btnVal == '+') {
      if (first == 0) {
        if (_displayText.length >= 1) {
          first = double.parse(numberHolder);
          opp = btnVal;
          _displayText += btnVal;
          notifyListeners();
          numberHolder = '';
        } else if (btnVal == '-') {
          _displayText += btnVal;
          notifyListeners();
          numberHolder = btnVal;
        }
      } else if (first != 0) {
        if (opp == '+' || opp == 'x' || opp == '/') {
          if (btnVal == '-' && numberHolder == '') {
            _displayText += btnVal;
            notifyListeners();
            numberHolder = btnVal;
          }
        } else if (opp == '-' && btnVal == '-') {
          _displayText = _displayText.substring(0, _displayText.length - 1);
          _displayText += '+';
          notifyListeners();
          numberHolder = btnVal;
        }
      }
    } else if (btnVal == '=') {
      if (opp == '+') {
        second = double.parse(numberHolder);
        _displayText = (first + second).toString();
        notifyListeners();
        if (_displayText.endsWith('.0')) {
          _displayText = _displayText.substring(0, _displayText.length - 2);
          notifyListeners();
          first = 0;
          opp = '';
          numberHolder = _displayText;
        } else {
          opp = '';
          first = 0;
          numberHolder = _displayText;
        }
      } else if (opp == '-') {
        second = double.parse(numberHolder);
        _displayText = (first - second).toString();
        notifyListeners();
        if (_displayText.endsWith('.0')) {
          _displayText = _displayText.substring(0, _displayText.length - 2);
          notifyListeners();
          first = 0;
          opp = '';
          numberHolder = _displayText;
        } else {
          opp = '';
          first = 0;
          numberHolder = _displayText;
        }
      } else if (opp == 'x') {
        second = double.parse(numberHolder);
        _displayText = (first * second).toString();
        notifyListeners();
        if (_displayText.endsWith('.0')) {
          _displayText = _displayText.substring(0, _displayText.length - 2);
          notifyListeners();
          first = 0;
          opp = '';
          numberHolder = _displayText;
        } else {
          opp = '';
          first = 0;
          numberHolder = _displayText;
        }
      } else if (opp == '') {
        _displayText = '';
      } else {
        second = double.parse(numberHolder);
        _displayText = (first / second).toString();
        notifyListeners();
        if (_displayText.endsWith('.0')) {
          _displayText = _displayText.substring(0, _displayText.length - 2);
          notifyListeners();
          first = 0;
          opp = '';
          numberHolder = _displayText;
        } else {
          opp = '';
          first = 0;
          numberHolder = _displayText;
        }
      }
    } else if (btnVal == ".") {
      if (numberHolder.contains('.')) {
        return;
      } else {
        _displayText += '.';
        notifyListeners();
        numberHolder += '.';
      }
    } else {
      _displayText += btnVal;
      notifyListeners();
      numberHolder += btnVal;
      notifyListeners();
    }
  }
}

@HtmlImport('my_element.html')
library my_element;

import 'dart:html';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'package:trix_editor/trix_editor.dart';

@PolymerRegister('my-element')
class MyElement extends PolymerElement {
  MyElement.created() : super.created();
  ready() {

  }
}

library trix_editor;

@HtmlImport('trix_editor.html')
import 'dart:html';
import 'dart:js';
import 'dart:async';
import 'package:web_components/web_components.dart' show HtmlImport;
import 'package:polymer/polymer.dart';
import 'x-thumbnail.dart';

@PolymerRegister('x-trix-editor')
class XTrixEditor extends PolymerElement {
  XTrixEditor.created() : super.created();
  JsObject editor;
  bool get isBold => editor.callMethod("attributeIsActive", ["bold"]);

  attached() {
    document.addEventListener('trix-initialize', (e) {
      editor = context.callMethod("getTrixEditor", []);
      // editor.callMethod("insertHTML", ["<img src='http://lorempixel.com/100/100/cats/'></img>"]);
      this.querySelector('trix-editor').focus();
    });

    document.addEventListener('trix-selection-change', (_) {
      setToolbarFromSelection();
    });
  }

  setToolbarFromSelection() {
      var bold = this.querySelector(".bold");
      bold.classes.remove("active");
      if (isBold) bold.classes.add("active");
  }

  @reflectable
  boldClicked([_,__]) {
    if (!isBold) editor.callMethod("activateAttribute", ["bold"]);
    else editor.callMethod("deactivateAttribute", ["bold"]);
    setToolbarFromSelection();
    this.querySelector('trix-editor').focus();
  }

  @reflectable
  addClicked([_,__]) {
      // editor.callMethod("insertHTML", ["<img src='http://lorempixel.com/100/100/cats/'></img>"]);
      editor.callMethod("insertHTML", ["<x-thumbnail></x-thumbnail>"]);
  }
}

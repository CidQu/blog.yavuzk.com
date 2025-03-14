// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as dom;

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

class ElipsisText extends StatefulWidget {
  const ElipsisText({
    super.key,
    this.width,
    this.height,
    required this.input,
    required this.textColor,
  });

  final double? width;
  final double? height;
  final String input;
  final Color textColor;

  @override
  State<ElipsisText> createState() => _ElipsisTextState();
}

class _ElipsisTextState extends State<ElipsisText> {
  String parsePContent(String htmlString) {
    dom.Document document = html_parser.parse(htmlString);
    List<dom.Element> paragraphs = document.getElementsByTagName('p');

    return paragraphs.map((p) => p?.text).join('\n');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Text(
        parsePContent(widget.input),
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: widget.textColor,
        ),
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

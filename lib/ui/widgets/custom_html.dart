import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class CustomHtml extends StatelessWidget {
  final String? content;
  const CustomHtml({Key? key,required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Html(
      data: content,
      style: {
        "body": Style(
        color: Colors.black
        ),
        "table": Style(
        backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
        ),
        "tr": Style(
        border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        "th": Style(
        padding: EdgeInsets.all(6),
        backgroundColor: Colors.grey,
        ),
        "td": Style(
        padding: EdgeInsets.all(6),
        alignment: Alignment.topLeft,
        ),
        'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
        },
    );
  }
}

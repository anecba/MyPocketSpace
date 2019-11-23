import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AnnotationWidget extends StatelessWidget {
  const AnnotationWidget(
      {this.title,
      this.content,
      this.date,
      this.onTap,
      this.onLongPress,
      this.select});
  final String title;
  final String content;
  final DateTime date;
  final bool select;
  final Function() onTap;
  final Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '$title',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        if (content != null)
                          Text(
                            content,
                            maxLines: 4,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 15),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "${DateFormat.yMd(Localizations.localeOf(context).languageCode).add_Hm().format(date)}",
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              if (select)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: const CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.check,
                      size: 17,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

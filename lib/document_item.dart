import 'package:flutter/material.dart';
import 'package:myapp/models/document.dart';
class DocumentItem extends StatelessWidget {
  final Document document;
  const DocumentItem({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(document.title),
      Row(
        children: [
          const Icon(Icons.person, size: 16),
          const SizedBox(width: 4),
          Text(document.author),
          const SizedBox(width: 10),
          const Icon(Icons.pages, size: 16),
          const SizedBox(width: 4),
          Text('${document.pages} trang'),
        ],
      ),
    ]);
  }
}

import 'package:flutter/material.dart';
import '../constants/mock_data.dart';
import '../widgets/document_item.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: DocumentItem(document: documents[index]));
            },
            separatorBuilder: (context, index) => const SizedBox(height: 5),
            itemCount: documents.length));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class Job {
  final String category;
  final String title;
  final List<String> specs;
  final String applyLink;

  Job({
    required this.category,
    required this.title,
    required this.specs,
    required this.applyLink,
  });

  Map<String, dynamic> toMap() {
    return {
      'category':category,
      'title':title,
      'specs':specs,
      'applyLink':'applyLink',
    };
  }
}

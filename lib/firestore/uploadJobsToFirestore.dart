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
      'category': category,
      'title': title,
      'specs': specs,
      'applyLink': 'applyLink',
    };
  }
}

final dummyJobs = [
  Job(
    category: 'Remote',
    title: 'Flutter Developer',
    specs: [
      '3+ years Flutter experience',
      'Firebase & REST APIs',
      'Competitive salary',
    ],
    applyLink: 'https://example.com/apply/flutter-dev',
  ),
  Job(
    category: 'On-site',
    title: 'UX Designer',
    specs: ['Figma mastery', 'Portfolio required', '5 days in NYC office'],
    applyLink: 'https://example.com/apply/ux-designer',
  ),
  Job(
    category: 'Part-time',
    title: 'Content Writer',
    specs: ['SEO knowledge', '10 hrs/week flexible', '₹30k/month'],
    applyLink: 'https://example.com/apply/content-writer',
  ),
];

Future<void> uploadJobsToFirestore() async {
  final CollectionReference jobs = FirebaseFirestore.instance.collection(
    'jobs',
  );

  for (var job in dummyJobs) {
    await jobs.add(job.toMap());
  }
  print('Jobs uploaded to firestore successfully');
}

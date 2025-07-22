import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexi_hire/homepage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UserHomepage extends StatefulWidget {
  const UserHomepage({super.key});

  @override
  State<UserHomepage> createState() => _UserHomepageState();
}

class _UserHomepageState extends State<UserHomepage> {
  final TextEditingController _search = TextEditingController();
  List<Job> _jobs = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchJobs();
  }

  Future<void> fetchJobs() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('jobs').get();
      final jobList = snapshot.docs.map((doc) {
        return Job.fromFirestore(doc.data());
      }).toList();

      setState(() {
        _jobs = jobList;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching jobs: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  List<Job> get _filtered => _jobs
      .where((j) => j.title.toLowerCase().contains(_search.text.toLowerCase()))
      .toList();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome back to FlexiHire'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: _search,
                    decoration: InputDecoration(
                      hintText: 'Search jobs...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                ),
                Expanded(
                  child: _filtered.isEmpty
                      ? const Center(child: Text('No jobs found'))
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          itemCount: _filtered.length,
                          itemBuilder: (_, i) => JobCard(job: _filtered[i]),
                        ),
                ),
              ],
            ),
    );
  }
}

class JobCard extends StatelessWidget {
  final Job job;
  const JobCard({super.key, required this.job});

  Future<void> _launch() async {
    final uri = Uri.parse(job.applyLink);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Chip(
              label: Text(job.category),
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            ),
            const SizedBox(height: 8),
            Text(
              job.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            ...job.specs.map(
              (s) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.circle, size: 6, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(child: Text(s)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: _launch,
                icon: const Icon(Icons.open_in_new, size: 18),
                label: const Text('Apply'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Job {
  final String category;
  final String title;
  final List<String> specs;
  final String applyLink;

  const Job({
    required this.category,
    required this.title,
    required this.specs,
    required this.applyLink,
  });

  factory Job.fromFirestore(Map<String, dynamic> data) {
    return Job(
      category: data['category'] ?? '',
      title: data['title'] ?? '',
      specs: List<String>.from(data['specs'] ?? []),
      applyLink: data['applyLink'] ?? '',
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/jobpost_controller.dart';

class ListJobPost extends StatelessWidget {
  const ListJobPost({super.key});

  @override
  Widget build(BuildContext context) {
    final JobPostController jobPostController =
        Get.put(JobPostController()); // Récupérer le contrôleur GetX

    return Obx(() {
      if (jobPostController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (jobPostController.errorMessage.isNotEmpty) {
        return Center(child: Text(jobPostController.errorMessage.value));
      }

      // Vérifier si la liste des offres d'emploi est vide
      if (jobPostController.jobPosts.isEmpty) {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Aucune offre d\'emploi disponible.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      }

      return Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: jobPostController.jobPosts.length,
          itemBuilder: (context, index) {
            final jobPost = jobPostController.jobPosts[index];
            return Card(
              elevation: 8,
              child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jobPost.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Description : ${jobPost.description}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Text(
                      "Exigences : ${jobPost.requirements}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Text(
                      "Date de publication : ${jobPost.postDate.toLocal().toString().split(' ')[0]}",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    if (jobPost.applicationDeadline != null) ...[
                      Text(
                        "Date limite de candidature : ${jobPost.applicationDeadline!.toLocal().toString().split(' ')[0]}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                    if (jobPost.salaryRange != null) ...[
                      Text(
                        "Salaire : ${jobPost.salaryRange}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                    if (jobPost.jobType != null) ...[
                      Text(
                        "Type de poste : ${jobPost.jobType}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                    if (jobPost.location != null) ...[
                      Text(
                        "Lieu : ${jobPost.location}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                    if (jobPost.contactPerson != null) ...[
                      Text(
                        "Contact : ${jobPost.contactPerson}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                    if (jobPost.benefits != null &&
                        jobPost.benefits!.isNotEmpty) ...[
                      Text(
                        "Avantages : ${jobPost.benefits!.join(', ')}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}

output "repository_url" {
  description = "URL of the created GitHub repository"
  value       = github_repository.tf_lab_repo.html_url
}
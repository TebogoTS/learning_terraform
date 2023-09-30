# Provider Setup

provider "github" {
    token = "00000000"
    owner = "TebogoTS"
}

# List of Repositories

module "github_repo_template" {
  source = "./github-repo-module"

  repo_name                   = "my-repo"
  #dismissal_users             = ["tebogots"]
  require_code_owner_reviews  = true
  required_approving_review_count = 1
  strict_status_checks        = true
  status_check_contexts       = ["continuous-integration"]
}

# resource "github_repository_file" "foo" {
#   repository          = github_repository.tf_tebogo_repo_personal.name
#   branch              = "main"
#   file                = ".gitignore"
#   content             = "**/*.tfstate"
#   commit_message      = "Managed by Terraform"
#   commit_author       = "Terraform User"
#   commit_email        = "terraform@example.com"
#   overwrite_on_create = true
# }

# resource "github_repository_file" "readme" {
#   repository          = github_repository.tf_tebogo_repo_personal.name
#   branch              = "main"
#   file                = "README.md"
#   content             = "Test repo"
#   commit_message      = "Managed by Terraform"
#   commit_author       = "Terraform User"
#   commit_email        = "terraform@example.com"
#   overwrite_on_create = true
# }
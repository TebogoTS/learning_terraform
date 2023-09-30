resource "github_repository" "tf_lab_repo" {
  name   = var.repo_name
  auto_init = var.repository_init
  visibility = "public"
}

resource "github_branch" "main" {
  repository = github_repository.tf_lab_repo.name
  branch     = "main"
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.tf_lab_repo.name
  pattern = "main"

  enforce_admins = true

  required_pull_request_reviews {
    dismiss_stale_reviews            = true
    #dismissal_restrictions           = var.dismissal_users
    require_code_owner_reviews       = var.require_code_owner_reviews
    required_approving_review_count  = var.required_approving_review_count
  }

  required_status_checks {
    strict   = var.strict_status_checks
    contexts = var.status_check_contexts
  }
}
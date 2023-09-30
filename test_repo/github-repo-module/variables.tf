variable "repo_name" {
  description = "Name of the GitHub repository"
  type        = string
}

variable "repository_init" {
  description = "Initialize the newly created repository"
  type = bool
  default = true
}

variable "dismissal_users" {
  description = "List of users who can dismiss reviews"
  type        = list(string)
  default     = []
}

variable "require_code_owner_reviews" {
  description = "Whether code owner reviews are required"
  type        = bool
  default     = true
}

variable "required_approving_review_count" {
  description = "Number of required approving reviews"
  type        = number
  default     = 1
}

variable "strict_status_checks" {
  description = "Whether strict status checks are required"
  type        = bool
  default     = true
}

variable "status_check_contexts" {
  description = "List of status check contexts"
  type        = list(string)
  default     = []
}
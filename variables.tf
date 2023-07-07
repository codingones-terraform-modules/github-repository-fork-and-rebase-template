variable "project" {
  description = "The project name in the Project-Service-Layer architecture"
  nullable    = false
  default     = false
}

variable "service" {
  description = "The service name in the Project-Service-Layer architecture"
  nullable    = false
  default     = false
}

variable "github_organization" {
  description = "The github organization name"
  nullable    = false
  default     = false
}

variable "github_repository" {
  description = "The repository which host the code within the organization"
  nullable    = false
  default     = false
}

variable "github_repository_visibility" {
  description = "The repository visibility host the code within the organization"
  nullable    = true
  default     = "public"
}

variable "commit_author" {
  description = "The commit author name for generated files"
  nullable    = false
  default     = false
}

variable "commit_email" {
  description = "The commit author email for generated files"
  nullable    = false
  default     = false
}

variable "template_repositories" {
  type        = list(string)
  description = "The repositories which host the template to fork / sync"
  nullable    = false
  default     = []
}

variable "templated_files_variables" {
  type        = map(string)
  description = "The variables to replace in the merged templates repository files"
  nullable    = false
  default     = {}
}

variable "github_repository_topics" {
  type        = list(string)
  description = "The topics present on the repository"
  nullable    = true
  default     = []
}

variable "allow_force_pushes_to_default_branch" {
  type        = bool
  description = "Allows to push directly on default branch, if false a PR is mandatory"
  nullable    = true
  default     = false
}

variable "template_fork" {
  type        = bool
  description = "If true will replace all repository content from template, this is a destructive operation"
  nullable    = false
}
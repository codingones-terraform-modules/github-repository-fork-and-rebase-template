
# We only apply this if the repository was not existing at all
resource "github_repository_file" "autofork_workflow" {
  count = var.template_fork ? 1 : 0

  repository          = module.repository.repository_name
  branch              = module.repository.default_branch_name
  file                = ".github/workflows/auto-merge-templates.yml"
  content             = module.workflow_template.rendered
  commit_message      = "feat: adding auto-merge-templates"
  commit_author       = var.commit_author
  commit_email        = var.commit_email
  overwrite_on_create = true

  lifecycle {
    ignore_changes = all
  }
}

module "workflow_template" {
  source       = "github.com/codingones-terraform-modules/terraform-remote-template-renderer"
  template_url = "https://raw.githubusercontent.com/codingones-github-templates/files-templates/main/github-actions/auto-merge-templates.yml"
  template_variables = {
    __TEMPLATE_REPOSITORY_1     = var.template_repositories[0]
    __TEMPLATE_REPOSITORY_2     = var.template_repositories[1]
    __TEMPLATED_FILES_VARIABLES = join(",", formatlist("%s/%s", keys(var.templated_files_variables), values(var.templated_files_variables)))
  }
}
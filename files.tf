resource "github_repository_file" "auto_fork_and_merge_templates_workflow" {
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
    TEMPLATE_REPOSITORY_1 = var.template_repositories[0]
    TEMPLATE_REPOSITORY_2 = var.template_repositories[1]
  }
}
data "terraform_remote_state" "aks" {
  backend = "kubernetes"
  config = {
    secret_suffix    = "state"
    load_config_file = true
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "flask" {
  name  = "python-flask-mysql"
  chart = "aksexperiements.azurecr.io/helm/python-flask-mysql:v1"
  repository = "https://aksexperiements.azurecr.io/helm/"

  values = [
    file("../charts/values.yaml")
  ]

}
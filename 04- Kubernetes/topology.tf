resource "kubernetes_pod" "web" {
    "metadata" {
        name = "my-pod"
        labels {
            app = "myapp"
        }
    }
    "spec" {
        container {
            name = "httpd"
            image = "httpd:2.4"
        }
    }
}

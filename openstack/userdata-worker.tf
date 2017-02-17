data "template_file" "userdata-worker" {
  template = "${file("${path.module}/userdata-worker.yml")}"

  vars {
    kube_config      = "${base64encode(file("${path.root}/../assets/auth/kubeconfig"))}"
    tectonic_version = "${var.tectonic_version}"
    etcd_fqdn        = "${aws_route53_record.etcd.fqdn}"
    ca               = "${base64encode(file("${path.root}/../assets/tls/ca.crt"))}"
    client_crt       = "${base64encode(file("${path.root}/../assets/tls/kubelet.crt"))}"
    client_crt_key   = "${base64encode(file("${path.root}/../assets/tls/kubelet.key"))}"
  }
}

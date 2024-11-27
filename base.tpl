{% if request.target == "clash" or request.target == "clashr" %}

port: {{ default(global.clash.http_port, "7890") }}
socks-port: {{ default(global.clash.socks_port, "7891") }}
mode: Rule
log-level: {{ default(global.clash.log_level, "info") }}
external-controller: {{ default(global.clash.external_controller, "0.0.0.0:9090") }}

{% if default(request.clash.dns, "") == "1" %}
dns:
    enable: true
    listen: :5450
{% endif %}

{% if local.clash.new_field_name == "true" %}
proxies: ~
proxy-groups: ~
rules: ~
{% else %}
Proxy: ~
Proxy Group: ~
Rule: ~
{% endif %}

{% endif %}

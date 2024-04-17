helm_list=$(helm list -o json)

if [ "$helm_list" = "[]" ]; then
    echo "No deployments found"
    echo "Setting color variable to blue"
    echo "##vso[task.setvariable variable=color]blue
else
    echo "Deployments found"
    deployment_name=$(kubectl get deploy -o jsonpath='{.items[0].metadata.name}')
    echo "Deployment name: $deployment_name"
    color=$(kubectl get deployment/$deployment_name -o jsonpath='{.spec.template.spec.containers[0].env[?(@.name=="color")].value}')
    echo "Color: $color"
    echo "##vso[task.setvariable variable=color]$color"
fi
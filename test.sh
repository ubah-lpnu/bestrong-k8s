helm_list=$(helm list -o json)

if [ "$helm_list" = "[]" ]; then
    echo "No deployments found"
    echo "Setting color variable to blue"
    export color="blue"  # Set environment variable
else
    echo "Deployments found"
    deployment_name=$(kubectl get deploy -o jsonpath='{.items[0].metadata.name}')
    echo "Deployment name: $deployment_name"
    deploymentColor=$(kubectl get deployment/$deployment_name -o jsonpath='{.spec.template.spec.containers[0].env[?(@.name=="color")].value}')
    echo "Color: $deploymentColor"

    # Logic to set color variable based on deploymentColor
    if [ "$deploymentColor" = "blue" ]; then
        echo "Setting color variable to green"
        export color="green"  # Set environment variable
        export deleteDeployment="blue"  # Set environment variable for deletion
    else
        echo "Setting color variable to blue"
        export color="blue"  # Set environment variable
        export deleteDeployment="green"  # Set environment variable for deletion
    fi
fi

echo "Color: $color"

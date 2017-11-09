#!/bin/bash -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
name="${name:-demo1}"
version=$(git rev-parse HEAD 2>/dev/null | cut -c 1-7)
image="${image:-127.0.0.1:30400/$name:$version}"

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Service
metadata:
  name: $name
  labels:
    app: $name
spec:
  ports:
    - port: 80
      targetPort: 80
  selector:
    app: $name
    tier: $name
  type: NodePort

---
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: $name
  labels:
    app: $name
spec:
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        app: $name
        tier: $name
    spec:
      containers:
      - image: $image
        name: $name
        ports:
        - containerPort: 80
          name: $name
EOF
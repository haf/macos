for TOOL in kubectl kustomize helm terraform; do
    asdf plugin-add $TOOL
done

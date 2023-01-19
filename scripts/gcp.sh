# gcloud installed via homebrew

gcloud components --quiet install core gsutil kubectl
gcloud init

# authenticate
gcloud auth login
gcloud auth application-default login

# set up docker credential helpers for it
gcloud auth configure-docker

# set default GCP project and region
echo -ne "Do you want to set defaults for gcloud? "
echo -ne  "[y,N]: "
read -p "" -n 1 YESNO
case $YESNO in
  [Yy]* )
    echo -n "What GCP project would you like to work in? "
    read GCLOUD_PROJECT
    gcloud config set project "$GCLOUD_PROJECT"

    echo -n "What compute region? "
    read GCLOUD_REGION
    gcloud config set compute/region "$GCLOUD_REGION"
  ;;
  [Nn]* )
    echo
    exit
  ;;
  * )
    echo
    echo "Please answer [Y]es or [N]o."
;;
esac

echo -ne "Do you want to configure access to a k8s cluster in this region/project? "
echo -ne  "[y,N]: "
read -p "" -n 1 YESNO
case $YESNO in
  [Yy]* )
    echo -n "What GKE cluster name is it? "
    read GCLOUD_GKE_CLUSTER
    gcloud container clusters get-credentials $GCLOUD_GKE_CLUSTER --region $GCLOUD_REGION --project $GCLOUD_PROJECT

    echo
    echo "You can study the name of the context created from this, by running 'kubectl config get-contexts'."
    echo "Done."
    echo
  ;;
  [Nn]* )
    echo
    exit
  ;;
  * )
    echo
    echo "Please answer [Y]es or [N]o."
;;
esac

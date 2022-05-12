while (( "$#" )); do
  case "$1" in
    -r|--region)
      region=$2
      shift 2
      ;;
    -n|--name)
      appName=$2
      shift 2
      ;;
    -h|--help)
      echo "Usage: ./deploy.sh -r {region}  --domain {domain name} [-n {Application Name} -r {secondary region}]
        --region(r)  - The Azure Region to deploy to
        --name(n)    - The name for the Application. Will be auto-generated if not supplied (Optional)
      "
      exit 0
      ;;
    --) 
      shift
      break
      ;;
    -*|--*=) 
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
  esac
done

today=`date +"%y%m%d"`
uuid=`uuidgen | sed 's/-//g'`

if [[ -z "${appName}" ]]; then
  appName=`cat /dev/urandom | tr -dc 'a-z' | fold -w 8 | head -n 1`
fi

rgName=${appName}_rg

az group create -n ${rgName} -l ${region}
az deployment group create -n ${appName} -g ${rgName} -f ./main.bicep
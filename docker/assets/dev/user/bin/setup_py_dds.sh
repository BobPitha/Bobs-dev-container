CONNEXTDDS_LOCATION="${HOME}"
TARGETENV="x64Linux4gcc7.3.0"

# Handle options
while getopts ':c:t:' OPTION; do
    case "${OPTION}" in 
        c)
            CONNEXTDDS_LOCATION=${OPTARG}
            ;;
        t)
            TARGETENV=${OPTARG}
            ;;
    esac
done

# Check options
if [ ! -d ${CONNEXTDDS_LOCATION}/connextdds-py ]; then
    if [ -e ${CONNEXTDDS_LOCATION}/connextdds-py.zip ]; then
        echo "found ${HOME}/connextdds-py.zip; extracting..."
        cd ${CONNEXTDDS_LOCATION}
        unzip -q ${CONNEXTDDS_LOCATION}/connextdds-py.zip -d ${CONNEXTDDS_LOCATION}
    else
        echo "Can't find connextdds-py/ or connetdds-py.zip in ${CONNEXTDDS_LOCATION}. Exiting."
        exit 1
    fi
fi

if [ ! -e ${NDDSHOME}/lib/${TARGETENV} ]; then
    echo "Target environment ${TARGETENV} doesn't seem to be installed. Exiting."
    exit 1
fi

pip install pysimplegui
cd /${CONNEXTDDS_LOCATION}/connextdds-py/
echo "Configuring Connext DDS Python API... may take a while"
python3 configure.py --jobs 4 ${TARGETENV}
pip install .

jetbrainsintellijidea2026|\
jetbrainsintellijidea20263)
    name="IntelliJ IDEA"
    type="dmg"
    if [[ $(arch) == arm64 ]]; then
        jetbrainsdistribution="macM1"
    else
        jetbrainsdistribution="mac"
    fi
    case $label in
        jetbrainsintellijidea20263) jetbrainsrelease='IIU.find(r => r.version === "2026.3" || r.version.startsWith("2026.3."))' ;;
        *) jetbrainsrelease='IIU.find(r => r.version.startsWith("2026."))' ;;
    esac
    jetbrainsreleases=$(curl -fsL "https://data.services.jetbrains.com/products/releases?code=IIU&type=release")
    appNewVersion=$(getJSONValue "$jetbrainsreleases" "${jetbrainsrelease}.version")
    downloadURL=$(getJSONValue "$jetbrainsreleases" "${jetbrainsrelease}.downloads.${jetbrainsdistribution}.link")
    blockingProcesses=( "idea" )
    expectedTeamID="2ZEFAR8TH3"
    ;;

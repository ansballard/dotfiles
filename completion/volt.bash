get_profile() {
	volt list -f '{{ .CurrentProfileName }}'
}

get_profiles() {
	volt profile list | sed 's/[* ] //'
}

get_plugs() {
	local profile=$1
	if [ -z $(comm -13 <(get_profiles | sort) <(echo $profile)) ] ; then
		case "$2" in
			all) all_plugs ;;
			this) this_plug "$profile" ;;
			not) comm -23 <(all_plugs) <(this_plug "$profile") ;;
			*) echo ;;
		esac
	fi
}

all_plugs() {
	volt list -f "{{ range .Repos }}{{ println .Path }}{{ end }}" | sed -E 's@^(www\.)?github\.com/@@' | sort -u
}

this_plug() {
	volt list -f "{{ range .Profiles }}{{ if eq \"$1\" .Name }}{{ range .ReposPath }}{{ println . }}{{ end }}{{ end }}{{ end }}" | sed -E 's@^(www\.)?github\.com/@@' | sort -u
}

CMDS="get rm list enable disable profile build migrate self-upgrade version"
PROFILE_CMDS="set show list new destroy rename add rm"
MIGRATE_CMDS="lockjson plugconf/config-func"

_volt() {
	COMPREPLY=()
	local cur="${COMP_WORDS[COMP_CWORD]}"
	local last="${COMP_WORDS[COMP_CWORD - 1]}"
	local first="${COMP_WORDS[1]}"
	local second="${COMP_WORDS[2]}"
	local third="${COMP_WORDS[3]}"

	if [[ "${first}" == "profile" && "${second}" =~ ^(set|show|destroy|rename|add|rm)$ && "${last}" =~ ^(set|show|destroy|rename|add|rm)$ ]] ; then
		local profiles=$(get_profiles)
		COMPREPLY=( $(compgen -W "${profiles}" -- ${cur}) )

	elif [[ "${first}" == "profile" && "${second}" =~ ^(add|rm)$ && "${third}" ]] ; then
		local profile=$third
		case "$second" in
			add) plugs=$(get_plugs "${profile}" "not") ;;
			rm) plugs=$(get_plugs "${profile}" "this") ;;
		esac
		COMPREPLY=( $(compgen -W "${plugs}" -- ${cur}) )

	elif [[ "${first}" == "profile" && "${last}" == "profile" ]] ; then
		COMPREPLY=( $(compgen -W "${PROFILE_CMDS}" -- ${cur}) )

	elif [[ "${first}" =~ ^(rm|disable)$ ]] ; then
		local profile=$(get_profile)
		plugs=$(get_plugs "$profile" "this")
		COMPREPLY=( $(compgen -W "${plugs}" -- ${cur}) )

	elif [[ "${first}" == "get" ]] ; then
		if [[ "${second}" == "-l" || "${third}" == "-l" ]] ; then :

		elif [[ "${second}" == "-u" ]] ; then
			local profile=$(get_profile)
			plugs=$(get_plugs "$profile" "all")
			COMPREPLY=( $(compgen -W "${plugs}" -- ${cur}) )
		else
			local profile=$(get_profile)
			plugs=$(get_plugs "$profile" "not")
			COMPREPLY=( $(compgen -W "${plugs}" -- ${cur}) )
		fi

	elif [[ "${first}" == "enable" ]] ; then
		local profile=$(get_profile)
		plugs=$(get_plugs "$profile" "not")
		COMPREPLY=( $(compgen -W "${plugs}" -- ${cur}) )

	elif [[ "${first}" == "migrate"  && "${last}" == "migrate" ]] ; then
		COMPREPLY=( $(compgen -W "${MIGRATE_CMDS}" -- ${cur}) )

	elif [[ "${first}" == "build"  && "${last}" == "build" ]] ; then
		COMPREPLY=( $(compgen -W "-full" -- ${cur}) )

	elif [[ "${second}" == "" && "${first}" != "${last}" ]] ; then
		COMPREPLY=( $(compgen -W "${CMDS}" -- ${cur}) )
	fi
	return 0
}
complete -F _volt volt


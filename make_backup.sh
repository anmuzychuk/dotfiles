
backup_dir="${HOME}/.backups"

mkdir -p $backup_dir

for filename in $(ls -a $HOME); do
    if [[ $filename == .* ]] && [[ ${#filename} -gt 2 ]] && [[ $filename != .backups ]]; then 
        echo "${HOME}/$filename -> $backup_dir/$filename"
        cp ${HOME}/$filename $backup_dir/$filename
    fi
done


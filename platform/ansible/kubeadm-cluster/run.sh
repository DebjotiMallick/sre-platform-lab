#!/bin/bash
set -e

help() {
    cat << EOF
Usage: ./run.sh [OPTIONS]

OPTIONS:
    -i, --inventory FILE    Inventory file (default: inventory/hosts.ini)
    -p, --playbook FILE     Playbook to run (default: playbooks/site.yaml)
    -v, --verbose           Verbose output
    -c, --check             Dry run (check mode)
    -h, --help              Show this help message
EOF
    exit 0
}

INVENTORY="inventory/hosts.ini"
PLAYBOOK="playbooks/site.yaml"
VERBOSE=""
CHECK=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -i|--inventory) INVENTORY="$2"; shift 2 ;;
        -p|--playbook) PLAYBOOK="$2"; shift 2 ;;
        -v|--verbose) VERBOSE="-vvv"; shift ;;
        -c|--check) CHECK="--check"; shift ;;
        -h|--help) help ;;
        *) echo "Unknown option: $1"; help ;;
    esac
done

echo "Running ansible-playbook..."
echo "Inventory: $INVENTORY"
echo "Playbook: $PLAYBOOK"

ansible-playbook \
    -i "$INVENTORY" \
    "$PLAYBOOK" \
    $VERBOSE \
    $CHECK

echo "Done!"
{
home.file."Scripts/set_gamma.sh" = {
    text = ''
    #!/usr/bin/env bash

    PRIMARY_MONITOR=$(xrandr --query | grep " primary" | awk '{print $1}')

    if [ -z "$PRIMARY_MONITOR" ]; then
        echo "Error: Could not detect a primary monitor."
        exit 1
    fi

    echo "Detected Primary Monitor: $PRIMARY_MONITOR"

    echo -n "Enter gamma value (default=1.0): "
    read GAMMA_VAL

    if [[ ! $GAMMA_VAL =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        echo "Error: Please enter a valid number (e.g., 0.9 or 1)."
        exit 1
    fi

    xrandr --output "$PRIMARY_MONITOR" --gamma "$GAMMA_VAL":"$GAMMA_VAL":"$GAMMA_VAL"

    echo "Gamma set to $GAMMA_VAL on $PRIMARY_MONITOR."
    exit 0
    '';
    executable = true;
    };
}

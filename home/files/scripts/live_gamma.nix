{
home.file."Scripts/live_gamma.sh" = {
    text = ''
    #!/bin/bash

    PRIMARY=$(xrandr --query | grep " primary" | awk '{print $1}')

    if [ -z "$PRIMARY" ]; then
        echo "Error: Could not detect a primary monitor."
        exit 1
    fi

    echo "Detected Primary Monitor: $PRIMARY"

    echo "--- Gamma Preset Setup ---"
    echo -n "Enter value for Low Profile (fx. 0.5): "
    read LOW_VAL
    echo -n "Enter value for High Profile (fx. 1.5): "
    read HIGH_VAL
    echo "--------------------------"
    echo "Controls:"
    echo "[1] - Set to Low ($LOW_VAL)"
    echo "[2] - Set to High ($HIGH_VAL)"
    echo "[3] - Reset (1.0)"
    echo "[4] - Quit"
    echo "--------------------------"

    if [[ ! $LOW_VAL =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        echo "Error: Please enter a valid number (e.g., 0.9 or 1)."
        exit 1
    fi

    if [[ ! $HIGH_VAL =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
        echo "Error: Please enter a valid number (e.g., 0.9 or 1)."
        exit 1
    fi

    while true; do
        read -rsn1 key

        case $key in
            1)
                xrandr --output "$PRIMARY" --gamma "$LOW_VAL:$LOW_VAL:$LOW_VAL"
                echo -ne "Applied: Low ($LOW_VAL)    \r"
                ;;
            2)
                xrandr --output "$PRIMARY" --gamma "$HIGH_VAL:$HIGH_VAL:$HIGH_VAL"
                echo -ne "Applied: High ($HIGH_VAL)   \r"
                ;;
            3)
                xrandr --output "$PRIMARY" --gamma 1:1:1
                echo -ne "Applied: Reset (1.0)     \r"
                ;;
            4)
                echo -e "\nExiting..."
                break
                ;;
        esac
    done
    '';
    executable = true;
    };
}

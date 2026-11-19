#!/usr/bin/env bash
# ===================================================
#     DEEPROADVISION: AUTONOMOUS SCENE PERCEPTION
#           Developed by Hasib ur Rahman
# ===================================================

set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

echo "==================================================="
echo "    DEEPROADVISION: AUTONOMOUS SCENE PERCEPTION    "
echo "          Developed by Hasib ur Rahman             "
echo "==================================================="
echo ""

# 1. Resolve Python interpreter
if [ -f ".venv/bin/python" ]; then
    PYTHON_BIN=".venv/bin/python"
    PIP_BIN=".venv/bin/pip"
    STREAMLIT_BIN=".venv/bin/streamlit"
elif command -v python3 &>/dev/null; then
    PYTHON_BIN="python3"
    PIP_BIN="pip3"
    STREAMLIT_BIN="streamlit"
else
    echo "[ERROR] Python 3 not found! Please install Python 3.10+."
    exit 1
fi

# 2. Check if dependencies are installed
if ! $PYTHON_BIN -c "import cv2, ultralytics" &>/dev/null; then
    echo "⚠️  Dependencies (OpenCV, Ultralytics, PyTorch) are not installed yet in ($PYTHON_BIN)!"
    echo ""
    echo "Setting up dependencies..."
    if [ ! -d ".venv" ]; then
        echo "Creating isolated virtual environment (.venv)..."
        python3 -m venv .venv
        PYTHON_BIN=".venv/bin/python"
        PIP_BIN=".venv/bin/pip"
        STREAMLIT_BIN=".venv/bin/streamlit"
    fi
    echo "Installing requirements from requirements.txt (this may take a couple of minutes)..."
    $PIP_BIN install --upgrade pip
    $PIP_BIN install -r requirements.txt
    echo "✅ Dependencies installed successfully!"
    echo ""
fi

# 3. Main Menu
echo "Select Mode:"
echo "[1] Run Standard Video Analysis (sample_traffic.mp4)"
echo "[2] Run LinkedIn Format Video (1:1 1080x1080 with Telemetry Cards)"
echo "[3] Run Image Analysis on sample_road.jpg"
echo "[4] Launch Interactive Web Dashboard (Streamlit)"
echo "[5] Run on Live Webcam (Camera 0)"
echo "[6] Exit"
echo ""
read -p "Enter option [1-6]: " choice

case "$choice" in
    1)
        echo "Running standard video road analysis..."
        $PYTHON_BIN main.py --source sample_traffic.mp4 --view
        ;;
    2)
        echo "Generating LinkedIn showcase video (1080x1080)..."
        $PYTHON_BIN main.py --source sample_traffic.mp4 --linkedin --view
        ;;
    3)
        echo "Running road analysis on sample_road.jpg..."
        $PYTHON_BIN main.py --source sample_road.jpg --view
        ;;
    4)
        echo "Launching Streamlit Web App..."
        $PYTHON_BIN -m streamlit run app.py
        ;;
    5)
        echo "Launching Live Webcam Analysis..."
        $PYTHON_BIN main.py --source 0 --view
        ;;
    *)
        echo "Exiting."
        exit 0
        ;;
esac

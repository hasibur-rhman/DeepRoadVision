# DeepRoadVision 🚗🛣️

**Real-Time Autonomous Road Scene Perception, Multi-Object Tracking & Collision Risk Analytics**

Developed by **[Hasib ur Rahman](https://github.com/hasibur-rhman)**

---

## 📌 Executive Overview

**DeepRoadVision** is an end-to-end Computer Vision perception pipeline designed for autonomous driving and intelligent transportation systems (ITS). Built on a custom fine-tuned YOLO model trained on the Berkeley DeepDrive (BDD100K) dataset, this system delivers real-time road participant detection, temporal tracking, ego-vehicle trajectory corridor calculation, and collision hazard evaluation.

---

## 🎯 Model & Perception Capabilities

The model performs inference on 10 critical road categories:

- **Vehicles:** Passenger cars, buses, cargo trucks
- **Two-Wheelers:** Bicycles, motorcycles
- **Vulnerable Road Users (VRU):** Pedestrians, riders
- **Traffic Infrastructure:** Traffic lights, traffic signs
- **Rail Transit:** Trains

---

## 🧠 Scene Intelligence Features

1. **Multi-Object Tracking (MOT):** Integrates ByteTrack for stable track identity persistence across frames.
2. **Ego-Vehicle Hazard Corridor:** Calculates a projected forward trajectory corridor to evaluate spatial intersection risks.
3. **Collision Proximity Warnings:** Analyzes bounding box scale and ground-contact depth to categorize hazards into **NORMAL**, **CAUTION**, or **CRITICAL**.
4. **Traffic Flow Index:** Automatically classifies road conditions into *Free Flow*, *Moderate*, *Heavy*, or *Congested*.
5. **Road Safety Score:** Real-time scoring index (0–100) dynamically derived from proximity threats and traffic density.
6. **Tesla-Style HUD & Social Media Canvas:** Renders modern glassmorphism telemetry overlays, cyber corner brackets, and 1:1 LinkedIn video formats.

---

## 🚀 Quick Setup & Installation

### 1. Clone the Repository
```bash
git clone https://github.com/hasibur-rhman/DeepRoadVision.git
cd DeepRoadVision
```

### 2. Set Up Virtual Environment
```bash
python3 -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

---

## 💻 Usage Guide

### Interactive Launchers
- **macOS / Linux:**
  ```bash
  ./run.sh
  ```
- **Windows:**
  ```bat
  run.bat
  ```

### Command Line Interface (`main.py`)

- **Analyze sample road image:**
  ```bash
  python main.py --source sample_road.jpg --view
  ```

- **Process a video with object tracking:**
  ```bash
  python main.py --source sample_traffic.mp4 --view
  ```

- **Generate 1080x1080 Social Media Showcase Video:**
  ```bash
  python main.py --source sample_traffic.mp4 --linkedin
  ```

- **Run inference on live webcam:**
  ```bash
  python main.py --source 0 --view
  ```

### Interactive Streamlit Web Dashboard
```bash
streamlit run app.py
```
Or:
```bash
python main.py --web
```

---

## 📊 Output Deliverables

All inference outputs are automatically stored in the `output/` directory:
- `output/<name>_analyzed.mp4` / `.jpg`: Video/image with HUD telemetry and tracking overlays.
- `output/<name>_analytics.json`: Structured report with frame-by-frame KPI telemetry, counts, and hazard warnings.

---

## 👨‍💻 Developer & Attribution

- **Engineer:** Hasib ur Rahman
- **GitHub:** [@hasibur-rhman](https://github.com/hasibur-rhman)
- **Domain:** Computer Vision & Deep Learning Engineering

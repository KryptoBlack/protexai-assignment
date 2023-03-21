# ProtexAI Assignment

The goal of the assignment is split into two parts:
1. Visualization (.mp4 file)
2. Event Detection (slack message)

An event should trigger every time a Person and a Car are inside a Region of Interest at the same time.

## Directory Structure
```
├── out/                        # stores the output *.mp4 files
│   ├── output.mp4              
├── main.py                     # contains the main source code and rule logic
├── annotations.json            # annotations for all the detections
├── requirements.txt            # python dependencies
├── docker-run.sh               # handicap for using docker run
├── example.env                 # example of how .env file should look
├── README.md  
├── .env                        # copy of example.env with actual values
└── .gitignore
```

## Installation
### Prerequisites
1. Python 3.10
2. pip
3. Slack Bot with access to a channel and permission to send message in that channel

Note: (Linux Only) *ffmpeg, libsm6, libxext6* are dependencies for **opencv**. These are found in mostly all OS but if they are missing it is necessary to fulfill these dependencies for opencv to work. Either install them manually or use the docker build as given below.

### Steps
1. Copy example.env as .env
2. Poplulate .env with valid `SLACK_TOKEN` and `SLACK_CHANNEL` values
3. Install dependencies `pip install -r requirements.txt`
4. Run program `python main.py`

## Docker
### Prerequisites
1. Docker Engine

### Steps
1. With bash `./docker-run.sh`
2. Without bash
    ```
    mkdir out/ && docker run --rm --mount type=volume,dst=/app/out,volume-driver=local,volume-opt=type=none,volume-opt=o=bind,volume-opt=device=$(pwd)/out --env-file .env kryptoblack/protexai:latest
    ```



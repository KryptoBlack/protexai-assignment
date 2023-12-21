# Sight Alert

SightAlert is a pragmatic project with a dual emphasis on Visualization and 
Event Detection, designed to offer practical insights into the observed 
environment. The .mp4 video output, although minimalist with a simple 
box-and-dot representation for entities, provides a functional visual overview 
of the surroundings.

In the realm of Event Detection, the project utilizes Slack messaging for 
instantaneous notifications. The distinctive feature lies in its ability to 
trigger an event when both a Person and a Car coexist within a designated 
Region of Interest. This straightforward yet effective approach enhances 
situational awareness, alerting users to specific occurrences in the monitored 
area.

SightAlert, while not boasting vivid imagery or cutting-edge features, is a 
reliable solution that pragmatically combines visualization and event-driven 
insights. Its simplicity ensures practical functionality for environmental 
monitoring and timely response.

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
You can find the docker image [here](https://hub.docker.com/repository/docker/kryptoblack/sight-alert/general)

### Prerequisites
1. Docker Engine

### Steps
1. Copy example.env as .env
2. Poplulate .env with valid `SLACK_TOKEN` and `SLACK_CHANNEL` values.
3. The docker handicap shell script is written in bash. So there is a very minute chance that the shell script can fail if bash is not used to run it. So there are two methods to run docker
    1. With bash 
       ```
       ./docker-run.sh
       ```
        
    3. Without bash
        ```
        mkdir out/ && docker run --rm --mount type=volume,dst=/app/out,volume-driver=local,volume-opt=type=none,volume-opt=o=bind,volume-opt=device=$(pwd)/out --env-file .env kryptoblack/sight-alert:latest
        ```

WARNING: Do not use quotes for values in .env file as the file is passed through *--env-file* flag and it will parse the values with the quotes making your values invalid.

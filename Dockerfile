FROM python:3-alpine
ENV COUNT 0
ENV POLL_TIME 60
ENV MQTT_BROKER 127.0.0.1
ENV MQTT_PORT 1883
ENV MQTT_USER none
ENV MQTT_PASSWORD none
ENV MQTT_TOPIC openhab/sensors
ENV HOUSE_ID None
ENV CLIENT_ID None
ENV CLIENT_SECRET None
RUN apk update
RUN apk update
RUN pip install paho-mqtt
RUN pip install git+git://github.com/flair-systems/flair-api-client-py.git
RUN git clone https://github.com/mlebaugh/Flair-Vents-MQTT-Interface.git
CMD python /Flair-Vents-MQTT-Interface/vents_bridge.py -id ${HOUSE_ID} -cid ${CLIENT_ID} -cs ${CLIENT_SECRET} -n ${COUNT} -t ${POLL_TIME} -b ${MQTT_BROKER} -p ${MQTT_PORT} -u ${MQTT_USER} -pw ${MQTT_PASSWORD} -m ${MQTT_TOPIC} -l /Flair-Vents-MQTT-Interface/flair_vents.log

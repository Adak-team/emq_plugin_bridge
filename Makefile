PROJECT = emq_plugin_rabbitmq_bridge
PROJECT_DESCRIPTION = RabbitMQ bridge for EMQTT
PROJECT_VERSION = 0.0

BUILD_DEPS = emqttd cuttlefish
dep_emqttd = git https://github.com/emqtt/emqttd master
dep_cuttlefish = git https://github.com/emqtt/cuttlefish

ERLC_OPTS += +debug_info
ERLC_OPTS += +'{parse_transform, lager_transform}'

NO_AUTOPATCH = cuttlefish

COVER = true

include erlang.mk

app:: rebar.config

app.config::
	./deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emq_plugin_rabbitmq_bridge.conf -i priv/emq_plugin_rabbitmq_bridge.schema -d data

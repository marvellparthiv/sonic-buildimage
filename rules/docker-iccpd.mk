# docker image for iccpd agent

DOCKER_ICCPD_STEM = docker-iccpd
DOCKER_ICCPD = $(DOCKER_ICCPD_STEM).gz
DOCKER_ICCPD_DBG = $(DOCKER_ICCPD_STEM)-$(DBG_IMAGE_MARK).gz
$(DOCKER_ICCPD)_PATH = $(DOCKERS_PATH)/$(DOCKER_ICCPD_STEM)
$(DOCKER_ICCPD)_DEPENDS += $(ICCPD)
$(DOCKER_ICCPD)_DBG_DEPENDS = $($(DOCKER_SWSS_LAYER_BOOKWORM)_DBG_DEPENDS)
$(DOCKER_ICCPD)_DBG_DEPENDS += $(ICCPD_DBG)
$(DOCKER_ICCPD)_DBG_IMAGE_PACKAGES = $($(DOCKER_SWSS_LAYER_BOOKWORM)_DBG_IMAGE_PACKAGES)
$(DOCKER_ICCPD)_LOAD_DOCKERS += $(DOCKER_SWSS_LAYER_BOOKWORM)

$(DOCKER_ICCPD)_VERSION = 1.0.0
$(DOCKER_ICCPD)_ICCPD = iccpd

ifeq ($(INCLUDE_ICCPD), y)
SONIC_DOCKER_IMAGES += $(DOCKER_ICCPD)
SONIC_INSTALL_DOCKER_IMAGES += $(DOCKER_ICCPD)
SONIC_DOCKER_DBG_IMAGES += $(DOCKER_ICCPD_DBG)
SONIC_INSTALL_DOCKER_DBG_IMAGES += $(DOCKER_ICCPD_DBG)
endif

$(DOCKER_ICCPD)_CONTAINER_NAME = iccpd
$(DOCKER_ICCPD)_RUN_OPT += -t --cap-add=NET_ADMIN
$(DOCKER_ICCPD)_RUN_OPT += -v /etc/sonic:/etc/sonic:ro
$(DOCKER_ICCPD)_RUN_OPT += -v /etc/localtime:/etc/localtime:ro 

$(DOCKER_ICCPD)_BASE_IMAGE_FILES += mclagdctl:/usr/bin/mclagdctl

SONIC_BOOKWORM_DOCKERS += $(DOCKER_ICCPD)
SONIC_BOOKWORM_DBG_DOCKERS += $(DOCKER_ICCPD_DBG)

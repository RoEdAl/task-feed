include $(TOPDIR)/rules.mk

PKG_NAME:=go-task
PKG_VERSION:=3.44.1
PKG_RELEASE:=2

PKG_MAINTAINER:=Edmunt Pienkowsky <roed@onet.eu>
PKG_LICENSE:=MIT

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_BUILD_FLAGS:=no-mips16

GO_PKG:=github.com/go-task/task/v3
GO_PKG_TAGS:=timetzdata

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/go-task
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=A task runner written in Go
	URL:=https://taskfile.dev/
	DEPENDS:=$(GO_ARCH_DEPENDS) +ca-bundle
endef

define Package/go-task/description
A task runner / simpler Make alternative written in Go.
endef

define Package/go-task/install
	$(call GoPackage/Package/Install/Bin,$(1))
endef

define Build/Compile
	$(GO_GENERAL_BUILD_CONFIG_VARS) \
	$(GO_PKG_BUILD_CONFIG_VARS) \
	$(GO_PKG_VARS) \
	GOWORK=off \
	go install \
		$(GO_MOD_ARGS) \
		$(GO_PKG_INSTALL_ARGS) \
		$(GO_PKG)/cmd/task@v$(PKG_VERSION)
endef

define Build/Install
endef

define Build/InstallDev
endef

$(eval $(call GoBinPackage,go-task))
$(eval $(call BuildPackage,go-task))

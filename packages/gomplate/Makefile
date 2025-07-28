include $(TOPDIR)/rules.mk

PKG_NAME:=gomplate
PKG_VERSION:=4.3.3
PKG_RELEASE:=2

PKG_MAINTAINER:=Edmunt Pienkowsky <roed@onet.eu>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_BUILD_FLAGS:=no-mips16

GO_PKG:=github.com/hairyhenderson/gomplate/v4
GO_PKG_TAGS:=timetzdata

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/gomplate
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=A flexible commandline tool for template rendering
	URL:=https://docs.gomplate.ca/
	DEPENDS:=$(GO_ARCH_DEPENDS) +ca-bundle
endef

define Package/gomplate/description
A flexible commandline tool for template rendering. Supports lots of local and remote datasources.
endef

define Package/gomplate/install
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
		$(GO_PKG)/cmd/$(PKG_NAME)@v$(PKG_VERSION)
endef

define Build/Install
endef

define Build/InstallDev
endef

$(eval $(call GoBinPackage,gomplate))
$(eval $(call BuildPackage,gomplate))

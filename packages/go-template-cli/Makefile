include $(TOPDIR)/rules.mk

PKG_NAME:=go-template-cli
PKG_VERSION:=0.3.2
PKG_RELEASE:=2

PKG_MAINTAINER:=Edmunt Pienkowsky <roed@onet.eu>
PKG_LICENSE:=OBSD

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_BUILD_FLAGS:=no-mips16

GO_PKG:=github.com/bluebrown/go-template-cli
GO_PKG_LDFLAGS_X:=main.version=$(PKG_VERSION)
GO_PKG_TAGS:=timetzdata

include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/golang/golang-package.mk

define Package/go-template-cli
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Render json, yaml & toml with go templates, from the command line
	URL:=https://github.com/bluebrown/go-template-cli
	DEPENDS:=$(GO_ARCH_DEPENDS) +ca-bundle
endef

define Package/go-template-cli/description
Render json, yaml & toml with go templates, from the command line.
endef

define Package/go-template-cli/install
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
		$(GO_PKG)/cmd/tpl@v$(PKG_VERSION)
endef

define Build/Install
endef

define Build/InstallDev
endef

$(eval $(call GoBinPackage,go-template-cli))
$(eval $(call BuildPackage,go-template-cli))

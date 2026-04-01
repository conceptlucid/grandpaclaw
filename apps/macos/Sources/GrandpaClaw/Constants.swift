import Foundation

// Stable identifier used for both the macOS LaunchAgent label and Nix-managed defaults suite.
// nix-grandpaclaw writes app defaults into this suite to survive app bundle identifier churn.
let launchdLabel = "ai.grandpaclaw.mac"
let gatewayLaunchdLabel = "ai.grandpaclaw.gateway"
let onboardingVersionKey = "grandpaclaw.onboardingVersion"
let onboardingSeenKey = "grandpaclaw.onboardingSeen"
let currentOnboardingVersion = 7
let pauseDefaultsKey = "grandpaclaw.pauseEnabled"
let iconAnimationsEnabledKey = "grandpaclaw.iconAnimationsEnabled"
let swabbleEnabledKey = "grandpaclaw.swabbleEnabled"
let swabbleTriggersKey = "grandpaclaw.swabbleTriggers"
let voiceWakeTriggerChimeKey = "grandpaclaw.voiceWakeTriggerChime"
let voiceWakeSendChimeKey = "grandpaclaw.voiceWakeSendChime"
let showDockIconKey = "grandpaclaw.showDockIcon"
let defaultVoiceWakeTriggers = ["grandpaclaw"]
let voiceWakeMaxWords = 32
let voiceWakeMaxWordLength = 64
let voiceWakeMicKey = "grandpaclaw.voiceWakeMicID"
let voiceWakeMicNameKey = "grandpaclaw.voiceWakeMicName"
let voiceWakeLocaleKey = "grandpaclaw.voiceWakeLocaleID"
let voiceWakeAdditionalLocalesKey = "grandpaclaw.voiceWakeAdditionalLocaleIDs"
let voicePushToTalkEnabledKey = "grandpaclaw.voicePushToTalkEnabled"
let talkEnabledKey = "grandpaclaw.talkEnabled"
let iconOverrideKey = "grandpaclaw.iconOverride"
let connectionModeKey = "grandpaclaw.connectionMode"
let remoteTargetKey = "grandpaclaw.remoteTarget"
let remoteIdentityKey = "grandpaclaw.remoteIdentity"
let remoteProjectRootKey = "grandpaclaw.remoteProjectRoot"
let remoteCliPathKey = "grandpaclaw.remoteCliPath"
let canvasEnabledKey = "grandpaclaw.canvasEnabled"
let cameraEnabledKey = "grandpaclaw.cameraEnabled"
let systemRunPolicyKey = "grandpaclaw.systemRunPolicy"
let systemRunAllowlistKey = "grandpaclaw.systemRunAllowlist"
let systemRunEnabledKey = "grandpaclaw.systemRunEnabled"
let locationModeKey = "grandpaclaw.locationMode"
let locationPreciseKey = "grandpaclaw.locationPreciseEnabled"
let peekabooBridgeEnabledKey = "grandpaclaw.peekabooBridgeEnabled"
let deepLinkKeyKey = "grandpaclaw.deepLinkKey"
let modelCatalogPathKey = "grandpaclaw.modelCatalogPath"
let modelCatalogReloadKey = "grandpaclaw.modelCatalogReload"
let cliInstallPromptedVersionKey = "grandpaclaw.cliInstallPromptedVersion"
let heartbeatsEnabledKey = "grandpaclaw.heartbeatsEnabled"
let debugPaneEnabledKey = "grandpaclaw.debugPaneEnabled"
let debugFileLogEnabledKey = "grandpaclaw.debug.fileLogEnabled"
let appLogLevelKey = "grandpaclaw.debug.appLogLevel"
let voiceWakeSupported: Bool = ProcessInfo.processInfo.operatingSystemVersion.majorVersion >= 26

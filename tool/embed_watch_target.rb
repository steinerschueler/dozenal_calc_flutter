# Embeds the native SwiftUI watchOS app (sources in watch/Sources/) as a
# "DozenalWatch" application target inside ios/Runner.xcodeproj, so it ships
# bundled in the iOS app's IPA (one App Store record, one review).
#
# Idempotent: re-running detects the existing target and exits without change.
# Run with the CocoaPods/Homebrew ruby that has the xcodeproj gem:
#   /opt/homebrew/opt/ruby/bin/ruby tool/embed_watch_target.rb
#
# Source of truth for the Swift code stays watch/Sources/*.swift (shared with
# the standalone xcodegen project used for quick simulator testing). The
# embedded target uses its own companion Info.plist (ios/watch/Info.plist,
# WKCompanionAppBundleIdentifier) and icon catalog (ios/watch/Assets.xcassets).
require 'xcodeproj'

PROJECT  = File.expand_path('../ios/Runner.xcodeproj', __dir__)
ROOT     = File.expand_path('..', __dir__)
TARGET   = 'DozenalWatch'
WATCH_ID = 'app.weltanschauung.dozenal.watch'
APP_ID   = 'app.weltanschauung.dozenal'

# Watch version mirrors pubspec.yaml (single source of truth) so a re-embed
# never regresses it — the embedded watch's CFBundle versions must match the
# host iOS app, which itself derives from pubspec via FLUTTER_BUILD_*.
_v = File.read(File.join(ROOT, 'pubspec.yaml')).match(/^version:\s*([\d.]+)\+(\d+)/m)
abort 'version (X.Y.Z+N) not found in pubspec.yaml' unless _v
MARKETING = _v[1]
BUILD_NUM = _v[2]

project = Xcodeproj::Project.open(PROJECT)
runner  = project.targets.find { |t| t.name == 'Runner' }
abort 'Runner target not found' unless runner

if project.targets.any? { |t| t.name == TARGET }
  puts "Target '#{TARGET}' already present — nothing to do."
  exit 0
end

# watchOS application target (gets Debug/Release/Profile configs matching the project)
watch = project.new_target(:application, TARGET, :watchos, '10.0')

swift = %w[App Calculator Glyph].map { |f| File.join(ROOT, 'watch', 'Sources', "#{f}.swift") }
assets = File.join(ROOT, 'ios', 'watch', 'Assets.xcassets')

group = project.main_group.new_group(TARGET)
swift.each { |abs| watch.source_build_phase.add_file_reference(group.new_file(abs)) }
watch.resources_build_phase.add_file_reference(group.new_file(assets))
group.new_file(File.join(ROOT, 'ios', 'watch', 'Info.plist')) # visible in navigator

watch.build_configurations.each do |c|
  s = c.build_settings
  s['PRODUCT_BUNDLE_IDENTIFIER']          = WATCH_ID
  s['PRODUCT_NAME']                       = TARGET
  s['INFOPLIST_FILE']                     = 'watch/Info.plist'
  s['GENERATE_INFOPLIST_FILE']            = 'NO'
  s['ASSETCATALOG_COMPILER_APPICON_NAME'] = 'AppIcon'
  s['WATCHOS_DEPLOYMENT_TARGET']          = '10.0'
  s['TARGETED_DEVICE_FAMILY']             = '4'
  s['SDKROOT']                            = 'watchos'
  s['SUPPORTED_PLATFORMS']                = 'watchsimulator watchos'
  s['SWIFT_VERSION']                      = '5.0'
  s['MARKETING_VERSION']                  = MARKETING
  s['CURRENT_PROJECT_VERSION']            = BUILD_NUM
  s['CODE_SIGN_STYLE']                    = 'Automatic'
  s['SKIP_INSTALL']                       = 'YES'
  s['ENABLE_BITCODE']                     = 'NO'
  s['CLANG_ENABLE_MODULES']               = 'YES'
  s['SWIFT_EMIT_LOC_STRINGS']             = 'YES'
end

# Runner depends on the watch app and embeds it into <App>.app/Watch/.
runner.add_dependency(watch)
embed = runner.new_copy_files_build_phase('Embed Watch Content')
embed.symbol_dst_subfolder_spec = :products_directory       # spec 16
embed.dst_path = '$(CONTENTS_FOLDER_PATH)/Watch'
bf = embed.add_file_reference(watch.product_reference)
bf.settings = { 'ATTRIBUTES' => ['RemoveHeadersOnCopy'] }

# new_copy_files_build_phase appends to the end — AFTER Flutter's "Thin Binary"
# and "[CP] Embed Pods Frameworks" run-script phases. That produces a build
# cycle ("Cycle inside Runner") because those scripts also rewrite the app
# bundle the embed phase copies into. Move the embed phase to just before
# "Thin Binary" to break it.
phases  = runner.build_phases
thin_ix = phases.index { |ph| ph.respond_to?(:display_name) && ph.display_name == 'Thin Binary' }
if thin_ix
  phases.delete(embed)
  phases.insert(thin_ix, embed)
end

project.save
puts "Embedded '#{TARGET}' (#{WATCH_ID}) into Runner. Watch product real path:"
puts "  swift sources:"
swift.each { |abs| puts "    #{File.exist?(abs) ? 'OK' : 'MISSING'}  #{abs}" }

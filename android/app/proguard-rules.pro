# Flutter Wrapper & Plugins
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }

# AndroidX WorkManager & Room Database (Fixes Failed to create an instance of androidx.work.impl.WorkDatabase)
-keep class androidx.work.impl.WorkDatabase** { *; }
-keep class androidx.work.impl.** { *; }
-keep class androidx.work.** { *; }
-keep class androidx.room.** { *; }
-keep class androidx.startup.** { *; }
-dontwarn androidx.work.impl.**

# Suppress Play Store Deferred Components warnings for Flutter Engine
-dontwarn com.google.android.play.core.**
-keep class com.google.android.play.core.** { *; }

# Google Mobile Ads SDK
-keep class com.google.android.gms.ads.** { *; }
-keep class com.google.ads.** { *; }

# Native Plugins (Mobile Scanner, SharePlus, PathProvider)
-keep class dev.mobile.scanner.** { *; }
-keep class dev.fluttercommunity.plus.share.** { *; }
-keep class io.flutter.plugins.** { *; }

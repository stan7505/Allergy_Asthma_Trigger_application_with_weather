# Suppress warnings about GpuDelegateFactory$Options
-dontwarn org.tensorflow.lite.gpu.GpuDelegateFactory$Options

# Keep TensorFlow Lite classes
-keep class org.tensorflow.** { *; }

# Keep GPU delegate classes (if you are using GPU acceleration)
-keep class org.tensorflow.lite.gpu.** { *; }

# Keep class members annotated with TensorFlow Lite annotations
-keepclassmembers class * {
    @org.tensorflow.lite.annotations.* <fields>;
    @org.tensorflow.lite.annotations.* <methods>;
}

# Keep annotations
-keepattributes *Annotation*
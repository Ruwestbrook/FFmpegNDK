


#include <jni.h>
#include <string>

extern "C" {
//编码
#include "libavcodec/avcodec.h"
//封装格式处理
#include "libavformat/avformat.h"
//过滤器
#include "libavfilter/avfilter.h"
}
extern "C" JNIEXPORT jstring JNICALL
Java_com_russell_ffmpeg_ndk_MainActivity_stringFromJNI(
        JNIEnv* env,
        jobject /* this */) {
    char strBuffer[1024 * 4] = {0};
    strcat(strBuffer, "libavcodec : ");
    strcat(strBuffer, AV_STRINGIFY(LIBAVCODEC_VERSION));
    strcat(strBuffer, "\nlibavformat : ");
    strcat(strBuffer, AV_STRINGIFY(LIBAVFORMAT_VERSION));
    strcat(strBuffer, "\nlibavutil : ");
    strcat(strBuffer, AV_STRINGIFY(LIBAVUTIL_VERSION));
    strcat(strBuffer, "\nlibavfilter : ");
    strcat(strBuffer, AV_STRINGIFY(LIBAVFILTER_VERSION));
    strcat(strBuffer, "\nlibswresample : ");
    strcat(strBuffer, AV_STRINGIFY(LIBSWRESAMPLE_VERSION));
    strcat(strBuffer, "\nlibswscale : ");
    strcat(strBuffer, AV_STRINGIFY(LIBSWSCALE_VERSION));
    strcat(strBuffer, "\navcodec_configure : \n");
    strcat(strBuffer, avcodec_configuration());
    strcat(strBuffer, "\navcodec_license : ");
    strcat(strBuffer, avcodec_license());
    return env->NewStringUTF(strBuffer);
}
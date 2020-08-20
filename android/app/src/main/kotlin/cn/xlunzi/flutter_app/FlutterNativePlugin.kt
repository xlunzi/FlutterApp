package cn.xlunzi.flutter_app

import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/**
 * @author xlunzi
 * @date 2020/8/20 17:12
 */
class FlutterNativePlugin : MethodChannel.MethodCallHandler {

    companion object {
        private const val CHANNEL = "cn.xlunzi.flutter/native_method"

        fun registerWith(messenger: BinaryMessenger) {
            val methodChannel = MethodChannel(messenger, CHANNEL)
            val instance = FlutterNativePlugin()
            methodChannel.setMethodCallHandler(instance)
        }

        fun re() {

        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "get_sign_id") {
            result.success("20200820")
        } else {
            result.notImplemented()
        }
    }

}
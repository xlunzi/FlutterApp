package cn.xlunzi.flutter_app

import io.flutter.Log
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/**
 * @author xlunzi
 * @date 2020/8/20 17:12
 */
class FlutterNativePlugin private constructor() {

    companion object {
        private const val CHANNEL = "cn.xlunzi.flutter/native_method"
        private const val GET_SIGN_ID = "get_sign_id"

        const val FLUTTER_METHOD_HELLO = "flutter_method_hello"

        private var methodChannel: MethodChannel? = null

        fun registerWith(messenger: BinaryMessenger) {
            methodChannel = MethodChannel(messenger, CHANNEL)
            methodChannel!!.setMethodCallHandler(this::onMethodCall)
        }

        private fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
            when (call.method) {
                GET_SIGN_ID -> getSignId(result)
                else -> result.notImplemented()
            }
        }

        private fun getSignId(result: MethodChannel.Result) {
            result.success("20200820")
            invokeMethod()
        }

        fun invokeMethod(methodId: String, args: Any?, result: MethodChannel.Result) {
            methodChannel?.invokeMethod(methodId, args, result)
        }

        private fun invokeMethod() {
            invokeMethod(FLUTTER_METHOD_HELLO, null, object : MethodChannel.Result {
                override fun success(result: Any?) {
                    Log.d("flutter_app", "result = $result")
                }

                override fun error(errorCode: String?, errorMessage: String?, errorDetails: Any?) {
                    Log.d("flutter_app", "code=$errorCode -- msg=$errorMessage -- details=$errorDetails")
                }

                override fun notImplemented() {
                    Log.d("flutter_app", "notImplemented")
                }

            })
        }
    }
}
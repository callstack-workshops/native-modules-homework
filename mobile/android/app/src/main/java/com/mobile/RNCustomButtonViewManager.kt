package com.mobile

import android.util.Log
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp

class RNCustomButtonViewManager : SimpleViewManager<RNCustomButton>() {
    override fun getName(): String {
        return "RNCustomButton"
    }

    override fun createViewInstance(reactContext: ThemedReactContext): RNCustomButton {
        return RNCustomButton(reactContext)
    }

    override fun getExportedCustomBubblingEventTypeConstants(): Map<String, Any>? {
        return mapOf(
            "press" to mapOf(
                "phasedRegistrationNames" to mapOf(
                    "bubbled" to "press"
                )
            )
        )
    }

    @ReactProp(name = "disabled") // handler for "disabled" prop
    fun setEnabled(button: RNCustomButton, disabled: Boolean?) {
        button.isEnabled = !disabled!!
    }

    @ReactProp(name = "text") // handler for "text" prop
    fun setText(button: RNCustomButton, text: String?) {
        button.text = text
    }
}
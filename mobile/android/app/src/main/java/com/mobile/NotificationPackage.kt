package com.mobile;

import com.facebook.react.ReactPackage
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.ViewManager
import javax.annotation.Nonnull

class NotificationPackage : ReactPackage {
    @Nonnull
    override fun createNativeModules(@Nonnull reactContext: ReactApplicationContext): List<NativeModule> {
        // returning a list of new API that can be used
        val modules: MutableList<NativeModule> = ArrayList()
        modules.add(NotificationModule(reactContext))
        return modules
    }

    @Nonnull
    override fun createViewManagers(@Nonnull reactContext: ReactApplicationContext): List<ViewManager<*, *>> {
        // no native views for now
        return emptyList()
    }
}
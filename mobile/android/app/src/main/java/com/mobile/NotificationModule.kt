package com.mobile;

import android.R
import android.app.NotificationChannel
import android.app.NotificationManager
import android.os.Build
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod

class NotificationModule(context: ReactApplicationContext?) : ReactContextBaseJavaModule(context) {
    var notificationChannelId = "MyChannel"

    init {
        createNotificationChannel()
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val name: CharSequence = "Our channel name"
            val description = "Channel description"
            val importance = NotificationManager.IMPORTANCE_DEFAULT
            val channel = NotificationChannel(notificationChannelId, name, importance)
            channel.description = description
            val notificationManager = reactApplicationContext.getSystemService(NotificationManager::class.java)
            notificationManager.createNotificationChannel(channel)
        }
    }

    override fun getName(): String {
        // We will access this module as "Notification" in Javascript
        return "Notification"
    }

    // Annotated functions that will be accessible from JS, with the same name and signature
    @ReactMethod
    fun showNotification(title: String?, content: String?) {
        // implementation detail of this method
        val builder = NotificationCompat.Builder(reactApplicationContext, notificationChannelId)
            .setSmallIcon(R.drawable.arrow_up_float)
            .setContentTitle(title)
            .setContentText(content)
            .setPriority(NotificationCompat.PRIORITY_DEFAULT)
        val notificationManager = NotificationManagerCompat.from(reactApplicationContext)
        notificationManager.notify(666, builder.build()) // Show notification
    }
}
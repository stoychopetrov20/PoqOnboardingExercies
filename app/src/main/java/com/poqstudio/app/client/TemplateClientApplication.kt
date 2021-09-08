package com.poqstudio.app.client

import com.poqstudio.app.client.di.module.network.networkModule
import com.poqstudio.app.platform.PoqApplication
import com.poqstudio.app.platform.di.extraKoinModules
import com.poqstudio.platform.settings.CoreSettings
import com.poqstudio.platform.settings.coreSettings

class TemplateClientApplication : PoqApplication() {

    override fun onCreate() {
        extraKoinModules.addAll(
            listOf(
                networkModule
            )
        )
        coreSettings = {
            CoreSettings(isDebugMode = BuildConfig.DEBUG)
        }
        super.onCreate()
    }
}

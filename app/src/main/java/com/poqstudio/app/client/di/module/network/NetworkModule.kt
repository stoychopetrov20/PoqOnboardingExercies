package com.poqstudio.app.client.di.module.network

import com.poqstudio.app.platform.di.getPoq
import com.poqstudio.app.platform.di.listInterceptorName
import com.readystatesoftware.chuck.ChuckInterceptor
import okhttp3.Interceptor
import org.koin.android.ext.koin.androidApplication
import org.koin.core.qualifier.named
import org.koin.dsl.module

val networkModule = module {
    single(named(listInterceptorName), override = true) { getPoq<List<Interceptor>>(named(listInterceptorName)) + get<ChuckInterceptor>() }
    single { ChuckInterceptor(androidApplication()) }
}

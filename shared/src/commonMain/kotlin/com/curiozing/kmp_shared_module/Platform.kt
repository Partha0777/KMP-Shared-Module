package com.curiozing.kmp_shared_module

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform